package com.pad.android.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/* JADX INFO: loaded from: classes.dex */
public class AdUtilFuncs {
    private static final String LB_LOG = "LBAdController";

    public static String convertStreamToString(InputStream is) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(is), 8192);
        StringBuilder sb = new StringBuilder();
        while (true) {
            try {
                try {
                    String line = reader.readLine();
                    if (line != null) {
                        sb.append(String.valueOf(line) + "\n");
                    } else {
                        try {
                            break;
                        } catch (IOException e) {
                            AdLog.printStackTrace("LBAdController", e);
                        }
                    }
                } catch (IOException e2) {
                    AdLog.printStackTrace("LBAdController", e2);
                    try {
                        is.close();
                    } catch (IOException e3) {
                        AdLog.printStackTrace("LBAdController", e3);
                    }
                }
            } catch (Throwable th) {
                try {
                    is.close();
                } catch (IOException e4) {
                    AdLog.printStackTrace("LBAdController", e4);
                }
                throw th;
            }
        }
        is.close();
        return sb.toString();
    }
}
