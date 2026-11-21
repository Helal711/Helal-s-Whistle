package com.pad.android.listener;

/* JADX INFO: loaded from: classes.dex */
public interface AdListener {
    void onAdAlreadyCompleted();

    void onAdClicked();

    void onAdClosed();

    void onAdCompleted();

    void onAdFailed();

    void onAdHidden();

    void onAdLoaded();

    void onAdPaused();

    void onAdProgress();

    void onAdResumed();
}
