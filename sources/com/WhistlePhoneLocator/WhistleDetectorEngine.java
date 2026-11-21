package com.WhistlePhoneLocator;

/* JADX INFO: loaded from: classes.dex */
public class WhistleDetectorEngine {
    public native int WhistleProcessAndDetect(short[] sArr, short s);

    static {
        System.loadLibrary("ndk_whistle");
    }
}
