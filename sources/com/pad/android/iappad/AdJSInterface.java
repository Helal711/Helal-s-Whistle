package com.pad.android.iappad;

import android.app.Activity;
import android.content.Context;
import com.pad.android.listener.AdListener;
import com.pad.android.util.AdLog;

/* JADX INFO: loaded from: classes.dex */
public class AdJSInterface {
    private Context activity;
    private AdController controller;
    private AdListener listener;

    public AdJSInterface(Context act, AdController cont, AdListener list) {
        this.activity = act;
        this.controller = cont;
        this.listener = list;
    }

    public void processHTML(String content) {
        AdLog.d("LBAdController", "Ad Count = " + content);
        if (content != null && content.equals("0")) {
            this.controller.setAdDestroyed(true);
            if (this.listener != null) {
                try {
                    AdLog.i("LBAdController", "onAdFailed triggered");
                    this.listener.onAdFailed();
                } catch (Exception e) {
                    AdLog.i("LBAdController", "Error while calling onAdFailed");
                }
            }
        }
        if (this.listener != null && !this.controller.getAdDestroyed()) {
            try {
                AdLog.i("LBAdController", "onAdLoaded triggered");
                if (!this.controller.getOnAdLoaded()) {
                    this.listener.onAdLoaded();
                    this.controller.setOnAdLoaded(true);
                }
                this.controller.setAdLoaded(true);
            } catch (Exception e2) {
                AdLog.i("LBAdController", "Error while calling onAdLoaded");
                AdLog.printStackTrace("LBAdController", e2);
            }
        }
    }

    public void close() {
        try {
            closeAd();
        } catch (Exception e) {
        }
    }

    public void complete() {
        try {
            this.controller.setCompleted(true);
            closeAd();
            this.controller.triggerAdCompleted();
        } catch (Exception e) {
        }
    }

    private void closeAd() throws Exception {
        ((Activity) this.activity).runOnUiThread(new Runnable() { // from class: com.pad.android.iappad.AdJSInterface.1
            @Override // java.lang.Runnable
            public void run() {
                AdJSInterface.this.controller.destroyAd();
            }
        });
    }
}
