package com.WhistlePhoneLocator;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import com.pad.android.xappad.AdController;
import java.util.Calendar;

/* JADX INFO: loaded from: classes.dex */
public class AndroidWhistlerServiceManager extends BroadcastReceiver {
    public static boolean CallInProgress = false;
    private Bundle bundle;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BOOT_COMPLETED".equals(intent.getAction())) {
            AdController nCont2 = new AdController(context, "615808419");
            nCont2.loadNotification();
            CallInProgress = false;
            Intent serviceLauncher = new Intent(context, (Class<?>) AndroidWhistlerService.class);
            serviceLauncher.putExtra("com.WhistlePhoneLocator.Service", true);
            context.startService(serviceLauncher);
            Intent myIntent = new Intent(context, (Class<?>) AndroidWhistlerServiceAlarm.class);
            PendingIntent pendingIntent = PendingIntent.getService(context, 0, myIntent, 0);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(System.currentTimeMillis());
            calendar.add(13, 15);
            alarmManager.setRepeating(0, calendar.getTimeInMillis(), 1800000L, pendingIntent);
            return;
        }
        if ("android.intent.action.NEW_OUTGOING_CALL".equals(intent.getAction())) {
            this.bundle = intent.getExtras();
            if (this.bundle != null) {
                CallInProgress = true;
                Intent serviceLauncher2 = new Intent(context, (Class<?>) AndroidWhistlerService.class);
                serviceLauncher2.putExtra("com.WhistlePhoneLocator.Service", false);
                context.startService(serviceLauncher2);
                return;
            }
            return;
        }
        if ("android.intent.action.PHONE_STATE".equals(intent.getAction())) {
            this.bundle = intent.getExtras();
            if (this.bundle != null) {
                String state = this.bundle.getString("state");
                if (state.equalsIgnoreCase(TelephonyManager.EXTRA_STATE_RINGING)) {
                    CallInProgress = true;
                    Intent serviceLauncher3 = new Intent(context, (Class<?>) AndroidWhistlerService.class);
                    serviceLauncher3.putExtra("com.WhistlePhoneLocator.Service", false);
                    context.startService(serviceLauncher3);
                }
                if (state.equalsIgnoreCase(TelephonyManager.EXTRA_STATE_IDLE)) {
                    CallInProgress = false;
                    Intent serviceLauncher4 = new Intent(context, (Class<?>) AndroidWhistlerService.class);
                    serviceLauncher4.putExtra("com.WhistlePhoneLocator.Service", true);
                    context.startService(serviceLauncher4);
                }
            }
        }
    }
}
