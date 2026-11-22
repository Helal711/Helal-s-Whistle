package com.helal711.whistle;

import android.Manifest;
import android.app.Service;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.IBinder;
import androidx.core.content.ContextCompat;

/**
 * Lightweight watchdog service preserved for legacy compatibility.
 * Respects Android 12+ background foreground service restrictions and always terminates cleanly.
 */
public class AndroidWhistlerServiceAlarm extends Service {
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S
                && WhistlePreferences.isDetectionEnabled(this)
                && !AndroidWhistlerService.isServiceRunning
                && ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO)
                == PackageManager.PERMISSION_GRANTED) {
            Intent serviceIntent = new Intent(this, AndroidWhistlerService.class);
            serviceIntent.setAction(AndroidWhistlerService.ACTION_START);
            try {
                ContextCompat.startForegroundService(this, serviceIntent);
            } catch (Exception ignored) {
            }
        }
        stopSelf(startId);
        return START_NOT_STICKY;
    }
}
