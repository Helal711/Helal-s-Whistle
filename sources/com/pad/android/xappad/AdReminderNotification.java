package com.pad.android.xappad;

import android.R;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.pad.android.util.AdLog;

/* JADX INFO: loaded from: classes.dex */
public class AdReminderNotification extends BroadcastReceiver {
    NotificationManager nm;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Notification notification;
        Bundle bundle = intent.getExtras();
        String sectionid = bundle.getString("sectionid");
        AdLog.i("LBAdController", "onReceived called AdReminderNotification - " + sectionid);
        AdLog.i("LBAdController", "alarmType - " + bundle.getString("alarmtype"));
        String reminderType = bundle.getString("alarmtype");
        if (reminderType.equals("cancel")) {
            this.nm = (NotificationManager) context.getSystemService("notification");
            this.nm.cancel(1002);
            return;
        }
        if (reminderType.equals("reminder")) {
            AdLog.i("LBAdController", "Reminder Alarm triggered with sectionid - " + sectionid);
            this.nm = (NotificationManager) context.getSystemService("notification");
            int[] iconArray = {R.drawable.star_on, R.drawable.ic_input_add, R.drawable.btn_star_big_on, R.drawable.btn_star, R.drawable.star_big_on};
            int icon = 0;
            String title = "";
            String text = "";
            try {
                AdLog.i("LBAdController", "get values from bundle");
                icon = Integer.valueOf(bundle.getString("remindericon")).intValue();
                title = bundle.getString("remindertitle");
                text = bundle.getString("remindertext");
            } catch (Exception e) {
                AdLog.e("LBAdController", "Error with getting values from bundle - " + e.getMessage());
                icon = 0;
            } finally {
                AdLog.e("LBAdController", "into finally statement");
                notification = new Notification(iconArray[icon], title, System.currentTimeMillis());
                notification.flags |= 16;
                notification.setLatestEventInfo(context, title, text, PendingIntent.getActivity(context, 0, new Intent(), 0));
                try {
                    AdLog.e("LBAdController", "trigger the reminder notification");
                    AdWakeLock.acquire(context);
                    this.nm.notify(1002, notification);
                    AdWakeLock.release();
                } catch (Exception e2) {
                    AdLog.printStackTrace("LBAdController", e2);
                    AdLog.e("LBAdController", "Error in reminder notification - " + e2.getMessage());
                }
            }
        }
    }
}
