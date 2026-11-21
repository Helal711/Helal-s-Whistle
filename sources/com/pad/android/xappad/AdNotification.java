package com.pad.android.xappad;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import com.pad.android.util.AdLog;

/* JADX INFO: loaded from: classes.dex */
public class AdNotification extends BroadcastReceiver {
    NotificationManager nm;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Bundle bundle = intent.getExtras();
        String sectionid = bundle.getString("sectionid");
        AdController myController = new AdController(context, sectionid);
        SharedPreferences pref = context.getSharedPreferences("Preference", 2);
        String str = pref.getString("SD_ADSTATUS_" + sectionid, "default");
        if (!str.equals("hidden")) {
            AdWakeLock.acquire(context);
            try {
                AdLog.i("LBAdController", "Alarm triggered with sectionid - " + sectionid);
                if (!sectionid.equals("0")) {
                    try {
                        Thread.sleep(5000L);
                    } catch (Exception e) {
                    }
                    myController.loadNotificationOnRequest("Alarm");
                }
                return;
            } catch (Exception e2) {
                AdLog.printStackTrace("LBAdController", e2);
                AdLog.d("LBAdController", "Exception AdNotification.class - " + e2.getMessage());
                return;
            } finally {
                AdWakeLock.release();
            }
        }
        myController.setPauseAlarm();
    }
}
