package com.pad.android.xappad;

import android.content.Context;
import android.os.PowerManager;
import com.pad.android.util.AdLog;

/* JADX INFO: loaded from: classes.dex */
public abstract class AdWakeLock {
    private static final String LB_LOG = "LBAdController";
    private static PowerManager.WakeLock wakeLock;

    public static void acquire(Context ctx) {
        if (wakeLock != null) {
            wakeLock.release();
        }
        try {
            PowerManager pm = (PowerManager) ctx.getSystemService("power");
            wakeLock = pm.newWakeLock(805306394, "AdControllerWakeLock");
            wakeLock.acquire();
        } catch (Exception e) {
            AdLog.e("LBAdController", "Error acquiring Wake Lock - " + e.getMessage());
            AdLog.printStackTrace("LBAdController", e);
        }
    }

    public static void release() {
        try {
            if (wakeLock != null) {
                wakeLock.release();
            }
            wakeLock = null;
        } catch (Exception e) {
            AdLog.e("LBAdController", "Error releasing Wake Lock - " + e.getMessage());
            AdLog.printStackTrace("LBAdController", e);
            wakeLock = null;
        }
    }
}
