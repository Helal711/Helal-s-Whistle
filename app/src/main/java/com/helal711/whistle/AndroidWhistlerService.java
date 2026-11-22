package com.helal711.whistle;

import android.Manifest;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioRecordingConfiguration;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.PowerManager;
import android.widget.Toast;
import androidx.core.app.NotificationCompat;
import androidx.core.app.ServiceCompat;
import androidx.core.content.ContextCompat;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Foreground microphone service running continuous pure-Java FFT whistle detection.
 * Compatible with Android 7 (API 24) through Android 16 (API 36), handling microphone
 * foreground service types (API 30+), phone-call pause/resume without killing the FGS,
 * bounded renewable wake locks, and configurable alert volume & duration.
 */
public class AndroidWhistlerService extends Service {
    public static final String CHANNEL_ID = "whistle_detector_channel";
    public static final int NOTIFICATION_ID = 1001;

    public static final String ACTION_START = "com.helal711.whistle.action.START";
    public static final String ACTION_STOP = "com.helal711.whistle.action.STOP";
    public static final String ACTION_PAUSE_FOR_CALL = "com.helal711.whistle.action.PAUSE_FOR_CALL";
    public static final String ACTION_RESUME_FROM_CALL = "com.helal711.whistle.action.RESUME_FROM_CALL";
    public static final String ACTION_REFRESH_NOTIFICATION = "com.helal711.whistle.action.REFRESH_NOTIFICATION";

    public static final String BROADCAST_STATE_CHANGED = "com.helal711.whistle.broadcast.STATE_CHANGED";
    public static final String BROADCAST_WHISTLE_DETECTED = "com.helal711.whistle.broadcast.WHISTLE_DETECTED";
    public static final String EXTRA_IS_RUNNING = "is_running";
    public static final String EXTRA_IS_PAUSED_CALL = "is_paused_call";

    public static volatile boolean isServiceRunning = false;
    public static volatile boolean isPausedForCall = false;
    public static volatile long ServiceCounter = 0L;

    private static final long PARTIAL_WAKELOCK_TIMEOUT_MS = 10 * 60 * 1000L;
    private static final long WAKELOCK_RENEW_INTERVAL_MS = 5 * 60 * 1000L;

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private PowerManager powerManager;
    private PowerManager.WakeLock partialWakeLock;
    private PowerManager.WakeLock screenWakeLock;
    private AudioManager audioManager;
    private AudioManager.AudioRecordingCallback recordingCallback;

    private volatile boolean isRecording = false;
    private volatile boolean isPlaying = false;
    private volatile short sensitivity = 3;
    private volatile long lastWakeLockRenewMs = 0L;

    private Thread audioThread;
    private volatile Thread alertThread;
    private volatile MediaPlayer mediaPlayer;
    private volatile CountDownLatch playbackLatch;

    @Override
    public void onCreate() {
        super.onCreate();
        powerManager = (PowerManager) getSystemService(Context.POWER_SERVICE);
        audioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);

        if (powerManager != null) {
            partialWakeLock = powerManager.newWakeLock(
                    PowerManager.PARTIAL_WAKE_LOCK,
                    "HelalsWhistle:DetectorWakeLock"
            );
            partialWakeLock.setReferenceCounted(false);

            @SuppressWarnings("deprecation")
            int screenFlags = PowerManager.SCREEN_BRIGHT_WAKE_LOCK | PowerManager.ACQUIRE_CAUSES_WAKEUP;
            screenWakeLock = powerManager.newWakeLock(
                    screenFlags,
                    "HelalsWhistle:AlertWakeLock"
            );
            screenWakeLock.setReferenceCounted(false);
        }

        createNotificationChannel();
        registerAudioRecordingMonitor();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = intent != null ? intent.getAction() : ACTION_START;

        if (ACTION_STOP.equals(action)) {
            WhistlePreferences.setDetectionEnabled(this, false);
            stopSelf();
            return START_NOT_STICKY;
        }

        if (ACTION_PAUSE_FOR_CALL.equals(action)) {
            if (isServiceRunning) {
                isPausedForCall = true;
                updateForegroundNotification();
                broadcastStateChanged();
            }
            return START_STICKY;
        }

        if (ACTION_RESUME_FROM_CALL.equals(action)) {
            if (isServiceRunning) {
                isPausedForCall = false;
                updateForegroundNotification();
                broadcastStateChanged();
            }
            return START_STICKY;
        }

        if (ACTION_REFRESH_NOTIFICATION.equals(action)) {
            sensitivity = WhistlePreferences.getSensitivity(this);
            if (isServiceRunning) {
                updateForegroundNotification();
            }
            return START_STICKY;
        }

        boolean enabledInPrefs = WhistlePreferences.isDetectionEnabled(this);
        if (!enabledInPrefs) {
            stopSelf();
            return START_NOT_STICKY;
        }

        if (ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO)
                != PackageManager.PERMISSION_GRANTED) {
            WhistlePreferences.setDetectionEnabled(this, false);
            stopSelf();
            return START_NOT_STICKY;
        }

        sensitivity = WhistlePreferences.getSensitivity(this);

        try {
            Notification notification = buildForegroundNotification();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                startForeground(
                        NOTIFICATION_ID,
                        notification,
                        ServiceInfo.FOREGROUND_SERVICE_TYPE_MICROPHONE
                );
            } else {
                startForeground(NOTIFICATION_ID, notification);
            }
        } catch (Exception e) {
            isServiceRunning = false;
            isRecording = false;
            broadcastStateChanged();
            stopSelf();
            return START_NOT_STICKY;
        }

        isServiceRunning = true;
        isPausedForCall = false;

        if (!isRecording) {
            renewPartialWakeLock();
            isRecording = true;
            audioThread = new Thread(this::audioProcessor, "HelalsWhistleAudioThread");
            audioThread.start();
        } else {
            updateForegroundNotification();
        }

        broadcastStateChanged();
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        isRecording = false;
        isServiceRunning = false;
        isPausedForCall = false;

        unregisterAudioRecordingMonitor();

        CountDownLatch latch = playbackLatch;
        if (latch != null) {
            latch.countDown();
        }

        Thread activeAlert = alertThread;
        if (activeAlert != null) {
            activeAlert.interrupt();
            alertThread = null;
        }

        stopActiveMediaPlayer();

        Thread activeAudio = audioThread;
        if (activeAudio != null) {
            activeAudio.interrupt();
            try {
                activeAudio.join(400L);
            } catch (InterruptedException ignored) {
                Thread.currentThread().interrupt();
            }
            audioThread = null;
        }

        releaseWakeLockSafely(screenWakeLock);
        releaseWakeLockSafely(partialWakeLock);
        ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE);
        broadcastStateChanged();
        super.onDestroy();
    }

    private void registerAudioRecordingMonitor() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && audioManager != null) {
            recordingCallback = new AudioManager.AudioRecordingCallback() {
                @Override
                public void onRecordingConfigChanged(List<AudioRecordingConfiguration> configs) {
                    if (configs == null || !isServiceRunning) {
                        return;
                    }
                    boolean silencedBySystem = false;
                    for (AudioRecordingConfiguration config : configs) {
                        if (config.isClientSilenced()) {
                            silencedBySystem = true;
                            break;
                        }
                    }
                    if (silencedBySystem && !isPausedForCall) {
                        // Another high-priority audio client (e.g., VoIP/phone call) owns the mic
                        updateForegroundNotification();
                    }
                }
            };
            try {
                audioManager.registerAudioRecordingCallback(recordingCallback, mainHandler);
            } catch (Exception ignored) {
            }
        }
    }

    private void unregisterAudioRecordingMonitor() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q
                && audioManager != null
                && recordingCallback != null) {
            try {
                audioManager.unregisterAudioRecordingCallback(recordingCallback);
            } catch (Exception ignored) {
            }
            recordingCallback = null;
        }
    }

    public static void ensureNotificationChannel(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager != null) {
                NotificationChannel channel = new NotificationChannel(
                        CHANNEL_ID,
                        context.getString(R.string.notification_channel_name),
                        NotificationManager.IMPORTANCE_LOW
                );
                channel.setDescription(context.getString(R.string.notification_channel_description));
                channel.setShowBadge(false);
                manager.createNotificationChannel(channel);
            }
        }
    }

    private void createNotificationChannel() {
        ensureNotificationChannel(this);
    }

    private Notification buildForegroundNotification() {
        Intent openIntent = new Intent(this, AndroidWhistlerApp.class);
        openIntent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent contentPendingIntent = PendingIntent.getActivity(
                this,
                0,
                openIntent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );

        Intent stopIntent = new Intent(this, AndroidWhistlerService.class);
        stopIntent.setAction(ACTION_STOP);
        PendingIntent stopPendingIntent = PendingIntent.getService(
                this,
                1,
                stopIntent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );

        String contentText = isPausedForCall
                ? getString(R.string.notification_paused_call_text)
                : getString(
                        R.string.notification_listening_text,
                        WhistlePreferences.getSensitivityLabel(this, sensitivity)
                );

        return new NotificationCompat.Builder(this, CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_stat_whistle)
                .setContentTitle(getString(R.string.notification_listening_title))
                .setContentText(contentText)
                .setContentIntent(contentPendingIntent)
                .setOngoing(true)
                .setOnlyAlertOnce(true)
                .setPriority(NotificationCompat.PRIORITY_LOW)
                .setCategory(NotificationCompat.CATEGORY_SERVICE)
                .addAction(0, getString(R.string.notification_action_stop), stopPendingIntent)
                .build();
    }

    private void updateForegroundNotification() {
        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager != null && isServiceRunning) {
            try {
                manager.notify(NOTIFICATION_ID, buildForegroundNotification());
            } catch (SecurityException ignored) {
            }
        }
    }

    private void audioProcessor() {
        WhistleDetectorEngine detectorEngine = new WhistleDetectorEngine();
        short[] buffer = new short[8192];
        AudioRecord audioRecord = null;
        int localCounter = 0;

        try {
            while (isRecording && !Thread.currentThread().isInterrupted()) {
                if (isPausedForCall) {
                    if (audioRecord != null) {
                        releaseAudioRecord(audioRecord);
                        audioRecord = null;
                        detectorEngine.reset();
                    }
                    try {
                        Thread.sleep(300L);
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                    continue;
                }

                if (audioRecord == null) {
                    audioRecord = createAndStartAudioRecord();
                    if (audioRecord == null) {
                        isRecording = false;
                        stopSelf();
                        return;
                    }
                }

                int samplesRead = audioRecord.read(buffer, 0, 4410);
                if (samplesRead <= 0) {
                    continue;
                }

                if (!isPlaying) {
                    int detected = detectorEngine.WhistleProcessAndDetect(buffer, samplesRead, sensitivity);
                    if (detected == 1 && !isPlaying && isRecording) {
                        isPlaying = true;
                        final int detectedHz = detectorEngine.getLastDetectedFrequencyHz();
                        final short detectedSens = sensitivity;
                        Thread runner = new Thread(
                                () -> triggerWhistleAlert(detectedSens, detectedHz),
                                "HelalsWhistleAlertThread"
                        );
                        alertThread = runner;
                        runner.start();
                    }
                }

                localCounter++;
                if (localCounter >= 10) {
                    ServiceCounter++;
                    localCounter = 0;
                    sensitivity = WhistlePreferences.getSensitivity(this);
                    maybeRenewPartialWakeLock();
                }
            }
        } catch (SecurityException | IllegalStateException e) {
            isRecording = false;
        } finally {
            releaseAudioRecord(audioRecord);
        }
    }

    private AudioRecord createAndStartAudioRecord() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO)
                != PackageManager.PERMISSION_GRANTED) {
            return null;
        }
        int minBufferSize = AudioRecord.getMinBufferSize(
                WhistleDetectorEngine.SAMPLE_RATE,
                AudioFormat.CHANNEL_IN_MONO,
                AudioFormat.ENCODING_PCM_16BIT
        );
        int bufferSize = Math.max(minBufferSize, 20480);
        AudioRecord record = new AudioRecord(
                MediaRecorder.AudioSource.MIC,
                WhistleDetectorEngine.SAMPLE_RATE,
                AudioFormat.CHANNEL_IN_MONO,
                AudioFormat.ENCODING_PCM_16BIT,
                bufferSize
        );
        if (record.getState() != AudioRecord.STATE_INITIALIZED) {
            record.release();
            return null;
        }
        record.startRecording();
        return record;
    }

    private void releaseAudioRecord(AudioRecord record) {
        if (record == null) {
            return;
        }
        try {
            if (record.getRecordingState() == AudioRecord.RECORDSTATE_RECORDING) {
                record.stop();
            }
        } catch (IllegalStateException ignored) {
        }
        try {
            record.release();
        } catch (Exception ignored) {
        }
    }

    private void triggerWhistleAlert(int detectedSensitivity, int detectedHz) {
        boolean modifiedVolume = false;
        int previousVolume = 0;

        try {
            if (!isRecording) {
                return;
            }

            boolean audioEnabled = WhistlePreferences.isAudioEnabled(this);
            boolean visualEnabled = WhistlePreferences.isVisualWakeEnabled(this);
            boolean maxVolumeEnabled = WhistlePreferences.isMaxVolumeEnabled(this);
            boolean toastEnabled = WhistlePreferences.isToastEnabled(this);
            String soundKey = WhistlePreferences.getSelectedAudioKey(this);
            int volumePercent = WhistlePreferences.getAlertVolumePercent(this);
            int durationSec = WhistlePreferences.getAlertDurationSec(this);

            // Record detection history and notify UI
            WhistlePreferences.recordDetectionEvent(this, soundKey, detectedSensitivity, detectedHz);
            broadcastWhistleDetected();

            if (toastEnabled) {
                mainHandler.post(() -> Toast.makeText(
                        getApplicationContext(),
                        getString(R.string.toast_whistle_detected),
                        Toast.LENGTH_LONG
                ).show());
            }

            if (visualEnabled && isRecording && screenWakeLock != null) {
                screenWakeLock.acquire(30_000L);
            }

            if (audioEnabled && isRecording) {
                if (audioManager != null) {
                    int maxStreamVol = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                    previousVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
                    double ratio = maxVolumeEnabled ? 0.95d : (volumePercent / 100.0d);
                    int targetVolume = Math.max(1, Math.min(maxStreamVol, (int) Math.round(ratio * maxStreamVol)));
                    try {
                        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, targetVolume, 0);
                        modifiedVolume = true;
                    } catch (SecurityException ignored) {
                    }
                }

                int audioResId = WhistlePreferences.resolveAudioResource(soundKey);
                MediaPlayer player = MediaPlayer.create(this, audioResId);
                if (player != null && isRecording) {
                    mediaPlayer = player;
                    CountDownLatch latch = new CountDownLatch(1);
                    playbackLatch = latch;

                    if (durationSec > 0) {
                        player.setLooping(true);
                    }

                    player.setOnCompletionListener(mp -> latch.countDown());
                    player.setOnErrorListener((mp, what, extra) -> {
                        latch.countDown();
                        return true;
                    });

                    player.start();
                    long waitSeconds = durationSec > 0 ? durationSec : 35L;
                    latch.await(waitSeconds, TimeUnit.SECONDS);
                } else if (player != null) {
                    player.release();
                }
            } else {
                Thread.sleep(4000L);
            }
        } catch (InterruptedException ignored) {
            Thread.currentThread().interrupt();
        } finally {
            stopActiveMediaPlayer();
            if (modifiedVolume && audioManager != null) {
                try {
                    audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, previousVolume, 0);
                } catch (Exception ignored) {
                }
            }
            releaseWakeLockSafely(screenWakeLock);
            isPlaying = false;
            alertThread = null;
        }
    }

    private void stopActiveMediaPlayer() {
        MediaPlayer player = mediaPlayer;
        mediaPlayer = null;
        if (player != null) {
            try {
                if (player.isPlaying()) {
                    player.stop();
                }
            } catch (IllegalStateException ignored) {
            }
            try {
                player.release();
            } catch (Exception ignored) {
            }
        }
    }

    private void renewPartialWakeLock() {
        if (partialWakeLock != null) {
            try {
                partialWakeLock.acquire(PARTIAL_WAKELOCK_TIMEOUT_MS);
                lastWakeLockRenewMs = System.currentTimeMillis();
            } catch (Exception ignored) {
            }
        }
    }

    private void maybeRenewPartialWakeLock() {
        long now = System.currentTimeMillis();
        if (now - lastWakeLockRenewMs >= WAKELOCK_RENEW_INTERVAL_MS) {
            renewPartialWakeLock();
        }
    }

    private void releaseWakeLockSafely(PowerManager.WakeLock lock) {
        if (lock != null && lock.isHeld()) {
            try {
                lock.release();
            } catch (Exception ignored) {
            }
        }
    }

    private void broadcastStateChanged() {
        Intent intent = new Intent(BROADCAST_STATE_CHANGED);
        intent.setPackage(getPackageName());
        intent.putExtra(EXTRA_IS_RUNNING, isServiceRunning);
        intent.putExtra(EXTRA_IS_PAUSED_CALL, isPausedForCall);
        sendBroadcast(intent);
    }

    private void broadcastWhistleDetected() {
        Intent intent = new Intent(BROADCAST_WHISTLE_DETECTED);
        intent.setPackage(getPackageName());
        sendBroadcast(intent);
    }
}
