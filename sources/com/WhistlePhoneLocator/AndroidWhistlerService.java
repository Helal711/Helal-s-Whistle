package com.WhistlePhoneLocator;

import android.annotation.SuppressLint;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.PowerManager;
import android.preference.PreferenceManager;
import android.widget.Toast;

/* JADX INFO: loaded from: classes.dex */
@SuppressLint({"HandlerLeak"})
public class AndroidWhistlerService extends Service {
    public static long ServiceCounter = 0;
    private int MediaVolume;
    WhistleDetectorEngine WDE;
    private AudioManager audio;
    private int flags;
    MediaPlayer mPlayer;
    private PowerManager pm;
    private PowerManager.WakeLock wl;
    private PowerManager.WakeLock wl1;
    private boolean isRecording = false;
    private boolean isPlaying = false;
    private int ToastSelector = 0;
    private int WDEresult = 0;
    private int PowerStatusAcquired = 0;
    private Boolean AudioNotification = true;
    private Boolean VisualNotification = true;
    private Boolean maxMediaVolumeFlag = false;
    private Boolean DetectorEnabledFromPrefs = false;
    private Boolean ToastEnabledFromPrefs = false;
    private String SelectedAudio = "3";
    private String SelectedSensitivity = "3";
    private short sensitivity = 3;
    private Handler handler = new Handler() { // from class: com.WhistlePhoneLocator.AndroidWhistlerService.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            Context context = AndroidWhistlerService.this.getApplicationContext();
            if (AndroidWhistlerService.this.ToastSelector == 3 && AndroidWhistlerService.this.ToastEnabledFromPrefs.booleanValue()) {
                Toast.makeText(context, "Whistle Locator PRO message:\n      WHISTLE DETECTED!!", 1).show();
            }
        }
    };

    @Override // android.app.Service
    public void onCreate() {
        this.pm = (PowerManager) getSystemService("power");
        this.wl1 = this.pm.newWakeLock(1, "AndroidWhistlerService");
        this.wl1.acquire();
        this.mPlayer = new MediaPlayer();
    }

    @Override // android.app.Service
    public IBinder onBind(Intent arg0) {
        return null;
    }

    @Override // android.app.Service
    public void onDestroy() {
        this.isRecording = false;
        this.ToastSelector = 2;
        this.handler.sendEmptyMessage(0);
        this.mPlayer.release();
        if (this.isPlaying) {
            this.isPlaying = false;
        }
        if (this.PowerStatusAcquired == 1) {
            this.PowerStatusAcquired = 0;
            this.wl.release();
        } else {
            this.wl1.release();
        }
    }

    /* JADX WARN: Type inference failed for: r0v10, types: [com.WhistlePhoneLocator.AndroidWhistlerService$2] */
    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null) {
            try {
                ReadDetectorState();
                if (intent.getBooleanExtra("com.WhistlePhoneLocator.Service", true) && this.DetectorEnabledFromPrefs.booleanValue() && !this.isRecording) {
                    this.isRecording = true;
                    this.ToastSelector = 1;
                    this.handler.sendEmptyMessage(0);
                    new Thread() { // from class: com.WhistlePhoneLocator.AndroidWhistlerService.2
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            AndroidWhistlerService.this.AudioProcessor();
                        }
                    }.start();
                } else {
                    this.isRecording = false;
                    stopSelf();
                }
            } catch (Exception e) {
            }
        }
        return 1;
    }

    /* JADX WARN: Type inference failed for: r1v15, types: [com.WhistlePhoneLocator.AndroidWhistlerService$3] */
    public void AudioProcessor() {
        int LocalCounter = 0;
        this.WDE = new WhistleDetectorEngine();
        this.flags = 268435482;
        this.wl = this.pm.newWakeLock(this.flags, "AndroidWhistlerService");
        short[] buffer = new short[8192];
        try {
            int bufferSizeRecord = AudioRecord.getMinBufferSize(44100, 16, 2);
            if (bufferSizeRecord < 1280) {
            }
            AudioRecord audioRecord = new AudioRecord(1, 44100, 16, 2, 20480);
            audioRecord.startRecording();
            int toggle = 0;
            while (this.isRecording) {
                audioRecord.read(buffer, 0, 4410);
                if (toggle == 0) {
                    this.WDEresult = this.WDE.WhistleProcessAndDetect(buffer, this.sensitivity);
                    if (this.WDEresult == 1 && !this.isPlaying) {
                        this.WDEresult = 0;
                        new Thread() { // from class: com.WhistlePhoneLocator.AndroidWhistlerService.3
                            @Override // java.lang.Thread, java.lang.Runnable
                            public void run() {
                                AndroidWhistlerService.this.NotificationFunctionality();
                            }
                        }.start();
                    }
                    toggle = 1;
                } else {
                    toggle = 0;
                }
                LocalCounter++;
                if (LocalCounter == 10) {
                    ServiceCounter++;
                    LocalCounter = 0;
                    ReadSensitivity();
                }
            }
            audioRecord.stop();
            audioRecord.release();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
    }

    public void NotificationFunctionality() {
        this.isPlaying = true;
        ReadPreferences();
        this.ToastSelector = 3;
        this.handler.sendEmptyMessage(0);
        if (this.VisualNotification.booleanValue() && this.PowerStatusAcquired == 0) {
            this.wl1.release();
            this.wl.acquire();
            this.PowerStatusAcquired = 1;
        }
        if (this.AudioNotification.booleanValue()) {
            if (this.maxMediaVolumeFlag.booleanValue()) {
                this.audio = (AudioManager) getSystemService("audio");
                this.MediaVolume = this.audio.getStreamVolume(3);
                this.audio.setStreamVolume(3, (int) (0.95d * ((double) this.audio.getStreamMaxVolume(3))), 16);
            }
            if (this.SelectedAudio.equals("1")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio1);
            } else if (this.SelectedAudio.equals("2")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio2);
            } else if (this.SelectedAudio.equals("3")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio3);
            } else if (this.SelectedAudio.equals("4")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio4);
            } else if (this.SelectedAudio.equals("5")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio5);
            } else if (this.SelectedAudio.equals("6")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio6);
            } else if (this.SelectedAudio.equals("7")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio7);
            } else if (this.SelectedAudio.equals("8")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio8);
            } else if (this.SelectedAudio.equals("9")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio9);
            } else if (this.SelectedAudio.equals("10")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio10);
            } else if (this.SelectedAudio.equals("11")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio11);
            } else if (this.SelectedAudio.equals("12")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio12);
            } else if (this.SelectedAudio.equals("13")) {
                this.mPlayer = MediaPlayer.create(this, R.raw.audio13);
            }
            this.mPlayer.start();
            try {
                if (this.SelectedAudio.equals("1")) {
                    Thread.sleep(5200L);
                } else if (this.SelectedAudio.equals("2")) {
                    Thread.sleep(5300L);
                } else if (this.SelectedAudio.equals("3")) {
                    Thread.sleep(15750L);
                } else if (this.SelectedAudio.equals("4")) {
                    Thread.sleep(16850L);
                } else if (this.SelectedAudio.equals("5")) {
                    Thread.sleep(27890L);
                } else if (this.SelectedAudio.equals("6")) {
                    Thread.sleep(13760L);
                } else if (this.SelectedAudio.equals("7")) {
                    Thread.sleep(26640L);
                } else if (this.SelectedAudio.equals("8")) {
                    Thread.sleep(12900L);
                } else if (this.SelectedAudio.equals("9")) {
                    Thread.sleep(16790L);
                } else if (this.SelectedAudio.equals("10")) {
                    Thread.sleep(22670L);
                } else if (this.SelectedAudio.equals("11")) {
                    Thread.sleep(20660L);
                } else if (this.SelectedAudio.equals("12")) {
                    Thread.sleep(30300L);
                } else if (this.SelectedAudio.equals("13")) {
                    Thread.sleep(14500L);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (this.isPlaying) {
                this.mPlayer.stop();
                this.mPlayer.release();
                if (this.maxMediaVolumeFlag.booleanValue()) {
                    this.audio.setStreamVolume(3, this.MediaVolume, 16);
                }
                this.isPlaying = false;
            }
        } else {
            try {
                Thread.sleep(6000L);
            } catch (InterruptedException e2) {
                e2.printStackTrace();
            }
        }
        if (this.PowerStatusAcquired == 1) {
            this.PowerStatusAcquired = 0;
            this.wl.release();
            this.wl1.acquire();
        }
        this.isPlaying = false;
    }

    void ReadPreferences() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        this.AudioNotification = Boolean.valueOf(prefs.getBoolean("audioNotification", true));
        this.VisualNotification = Boolean.valueOf(prefs.getBoolean("visualNotification", true));
        this.maxMediaVolumeFlag = Boolean.valueOf(prefs.getBoolean("maxVolume", false));
        this.SelectedAudio = prefs.getString("selectAudio", "6");
        this.ToastEnabledFromPrefs = Boolean.valueOf(prefs.getBoolean("toastNotification", false));
        if (!this.AudioNotification.booleanValue()) {
            this.maxMediaVolumeFlag = false;
        }
    }

    void ReadDetectorState() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        this.DetectorEnabledFromPrefs = Boolean.valueOf(prefs.getBoolean("detectionEnable", false));
    }

    void ReadSensitivity() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        this.SelectedSensitivity = prefs.getString("selectSensitivity", "3");
        if (this.SelectedSensitivity.equals("1")) {
            this.sensitivity = (short) 1;
            return;
        }
        if (this.SelectedSensitivity.equals("2")) {
            this.sensitivity = (short) 2;
            return;
        }
        if (this.SelectedSensitivity.equals("3")) {
            this.sensitivity = (short) 3;
        } else if (this.SelectedSensitivity.equals("4")) {
            this.sensitivity = (short) 4;
        } else if (this.SelectedSensitivity.equals("5")) {
            this.sensitivity = (short) 5;
        }
    }
}
