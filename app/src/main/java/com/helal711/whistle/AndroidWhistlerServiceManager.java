package com.helal711.whistle;

import android.Manifest;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.telephony.TelephonyManager;
import androidx.core.app.NotificationCompat;
import androidx.core.content.ContextCompat;

/**
 * BroadcastReceiver managing device boot resumption (Android 14-16 compliant)
 * and clean microphone pause/resume during active phone calls without stopping
 * the foreground service.
 */
public class AndroidWhistlerServiceManager extends BroadcastReceiver {
    private static final int BOOT_RESUME_NOTIFICATION_ID = 1002;

    @Override
    public void onReceive(Context context, Intent intent) {
        if (context == null || intent == null) {
            return;
        }
        String action = intent.getAction();
        if (Intent.ACTION_BOOT_COMPLETED.equals(action)) {
            handleBootCompleted(context);
        } else if (TelephonyManager.ACTION_PHONE_STATE_CHANGED.equals(action)) {
            handlePhoneStateChanged(context, intent);
        }
    }

    private void handleBootCompleted(Context context) {
        if (!WhistlePreferences.isDetectionEnabled(context)) {
            return;
        }

        // Android 14+ prohibits starting a microphone foreground service directly from BOOT_COMPLETED.
        // Post a clickable resume prompt notification instead of failing silently.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            postBootResumeNotification(context);
            return;
        }

        if (ContextCompat.checkSelfPermission(context, Manifest.permission.RECORD_AUDIO)
                != PackageManager.PERMISSION_GRANTED) {
            return;
        }

        Intent serviceIntent = new Intent(context, AndroidWhistlerService.class);
        serviceIntent.setAction(AndroidWhistlerService.ACTION_START);
        try {
            ContextCompat.startForegroundService(context, serviceIntent);
        } catch (Exception ignored) {
            postBootResumeNotification(context);
        }
    }

    private void handlePhoneStateChanged(Context context, Intent intent) {
        if (!AndroidWhistlerService.isServiceRunning) {
            return;
        }
        String state = intent.getStringExtra(TelephonyManager.EXTRA_STATE);
        if (state == null) {
            return;
        }

        Intent serviceIntent = new Intent(context, AndroidWhistlerService.class);
        if (TelephonyManager.EXTRA_STATE_RINGING.equals(state)
                || TelephonyManager.EXTRA_STATE_OFFHOOK.equals(state)) {
            serviceIntent.setAction(AndroidWhistlerService.ACTION_PAUSE_FOR_CALL);
            try {
                context.startService(serviceIntent);
            } catch (Exception ignored) {
            }
        } else if (TelephonyManager.EXTRA_STATE_IDLE.equals(state)) {
            serviceIntent.setAction(AndroidWhistlerService.ACTION_RESUME_FROM_CALL);
            try {
                context.startService(serviceIntent);
            } catch (Exception ignored) {
            }
        }
    }

    private void postBootResumeNotification(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                && ContextCompat.checkSelfPermission(context, Manifest.permission.POST_NOTIFICATIONS)
                != PackageManager.PERMISSION_GRANTED) {
            return;
        }

        AndroidWhistlerService.ensureNotificationChannel(context);

        Intent launchIntent = new Intent(context, AndroidWhistlerApp.class);
        launchIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        launchIntent.putExtra(AndroidWhistlerApp.EXTRA_AUTO_RESUME_AFTER_BOOT, true);

        PendingIntent pendingIntent = PendingIntent.getActivity(
                context,
                BOOT_RESUME_NOTIFICATION_ID,
                launchIntent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );

        NotificationCompat.Builder builder = new NotificationCompat.Builder(
                context,
                AndroidWhistlerService.CHANNEL_ID
        )
                .setSmallIcon(R.drawable.ic_stat_whistle)
                .setContentTitle(context.getString(R.string.notification_boot_resume_title))
                .setContentText(context.getString(R.string.notification_boot_resume_text))
                .setContentIntent(pendingIntent)
                .setAutoCancel(true)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT);

        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager != null) {
            try {
                manager.notify(BOOT_RESUME_NOTIFICATION_ID, builder.build());
            } catch (SecurityException ignored) {
            }
        }
    }
}
