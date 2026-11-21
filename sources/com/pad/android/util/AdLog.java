package com.pad.android.util;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import java.io.PrintWriter;
import java.io.StringWriter;

/* JADX INFO: loaded from: classes.dex */
public class AdLog {
    private static boolean doLog = false;
    private static Handler myHandler;

    public static void enableLog(boolean enable) {
        Log.i("LBAdController", "enableLog: " + enable);
        doLog = enable;
    }

    public static void i(String tag, String msg) {
        if (doLog) {
            Log.i(tag, msg);
            sendToTextView(tag, msg);
        }
    }

    public static void e(String tag, String msg) {
        if (doLog) {
            Log.e(tag, msg);
            sendToTextView(tag, msg);
        }
    }

    public static void w(String tag, String msg) {
        if (doLog) {
            Log.w(tag, msg);
            sendToTextView(tag, msg);
        }
    }

    public static void d(String tag, String msg) {
        if (doLog) {
            Log.d(tag, msg);
            sendToTextView(tag, msg);
        }
    }

    public static void v(String tag, String msg) {
        if (doLog) {
            Log.v(tag, msg);
            sendToTextView(tag, msg);
        }
    }

    public static void printStackTrace(String tag, Exception e) {
        StringWriter sw = new StringWriter();
        e.printStackTrace(new PrintWriter(sw));
        String stacktrace = sw.toString();
        Log.d(tag, stacktrace);
        sendToTextView(tag, stacktrace);
    }

    public static void setHandler(Handler hd) {
        myHandler = hd;
    }

    private static void sendToTextView(String tag, String msg) {
        if (myHandler != null) {
            Message message = new Message();
            Bundle bundle = new Bundle();
            bundle.putString("tag", tag);
            bundle.putString("msg", msg);
            message.setData(bundle);
            myHandler.sendMessage(message);
        }
    }
}
