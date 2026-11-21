package com.WhistlePhoneLocator;

import android.app.Service;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.IBinder;
import android.preference.PreferenceManager;

/* JADX INFO: loaded from: classes.dex */
public class AndroidWhistlerServiceAlarm extends Service {
    private Boolean DetectorEnabledFromPrefs = false;
    long mStartTime;

    @Override // android.app.Service
    public void onCreate() {
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onDestroy() {
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        ReadDetectorState();
        if (AndroidWhistlerApp.basicCounter == AndroidWhistlerService.ServiceCounter && this.DetectorEnabledFromPrefs.booleanValue() && !AndroidWhistlerServiceManager.CallInProgress) {
            Intent intentS = new Intent(getApplicationContext(), (Class<?>) AndroidWhistlerService.class);
            intentS.putExtra("com.WhistlePhoneLocator.Service", true);
            startService(intentS);
        }
        AndroidWhistlerApp.basicCounter = AndroidWhistlerService.ServiceCounter;
        return 1;
    }

    @Override // android.app.Service
    public boolean onUnbind(Intent intent) {
        return super.onUnbind(intent);
    }

    void ReadDetectorState() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        this.DetectorEnabledFromPrefs = Boolean.valueOf(prefs.getBoolean("detectionEnable", false));
    }
}
