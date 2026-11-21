package com.pad.android.util;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

/* JADX INFO: loaded from: classes.dex */
public class AdRefValues {
    private static final String LB_LOG = "LBAdConroller";
    private static final String SDK_LEVEL = "06b";
    private static final String SDK_VERSION = "3";
    private static boolean dataretrieve = true;

    public static String adRefValues(Context ctx, TelephonyManager tm, String subid, List<NameValuePair> tokens, boolean uL, int sWidth, int sHeight) {
        List<NameValuePair> nameValuePairs = new ArrayList<>(2);
        if (subid != null) {
            nameValuePairs.add(new BasicNameValuePair("subid", subid));
        }
        if (tokens != null) {
            String str = "";
            for (int j = 0; j < tokens.size(); j++) {
                try {
                    BasicNameValuePair tmp = (BasicNameValuePair) tokens.get(j);
                    str = String.valueOf(str) + AdEncryption.base64encode(tmp.getName().getBytes()) + ":" + AdEncryption.base64encode(tmp.getValue().getBytes()) + ",";
                } catch (Exception e) {
                    AdLog.e(LB_LOG, "Error while adding tokens - " + e.getMessage());
                }
            }
            nameValuePairs.add(new BasicNameValuePair("tokens", str));
            AdLog.i(LB_LOG, "Token Str = " + str);
        }
        try {
            String deviceId = Settings.Secure.getString(ctx.getContentResolver(), "android_id");
            Calendar cal = Calendar.getInstance();
            nameValuePairs.add(new BasicNameValuePair("ref1", deviceId));
            nameValuePairs.add(new BasicNameValuePair("ref2", Build.VERSION.RELEASE));
            nameValuePairs.add(new BasicNameValuePair("ref3", "Android"));
            nameValuePairs.add(new BasicNameValuePair("ref4", getLocalIpAddress()));
            nameValuePairs.add(new BasicNameValuePair("ref5", new StringBuilder().append(cal.get(15)).toString()));
            nameValuePairs.add(new BasicNameValuePair("ref6", new StringBuilder().append((int) (cal.getTimeInMillis() / 1000)).toString()));
            nameValuePairs.add(new BasicNameValuePair("ref7", new StringBuilder().append(sWidth).toString()));
            nameValuePairs.add(new BasicNameValuePair("ref8", new StringBuilder().append(sHeight).toString()));
            if (uL) {
                try {
                    LocationManager lm = (LocationManager) ctx.getSystemService("location");
                    Location location = lm.getLastKnownLocation("gps");
                    String longitude = String.valueOf(location.getLongitude());
                    String latitude = String.valueOf(location.getLatitude());
                    nameValuePairs.add(new BasicNameValuePair("ref9", latitude));
                    nameValuePairs.add(new BasicNameValuePair("ref10", longitude));
                } catch (Exception e2) {
                }
            }
            if (dataretrieve) {
                try {
                    nameValuePairs.add(new BasicNameValuePair("ref11", tm.getNetworkCountryIso()));
                    nameValuePairs.add(new BasicNameValuePair("ref12", tm.getNetworkOperator()));
                    nameValuePairs.add(new BasicNameValuePair("ref13", tm.getNetworkOperatorName()));
                } catch (Exception e3) {
                }
            }
            nameValuePairs.add(new BasicNameValuePair("ref15", "3"));
            nameValuePairs.add(new BasicNameValuePair("ref16", "06b"));
            String ref17 = tm.getDeviceId() != null ? tm.getDeviceId() : "0";
            nameValuePairs.add(new BasicNameValuePair("ref17", ref17));
            nameValuePairs.add(new BasicNameValuePair("ref18", Build.MANUFACTURER));
            nameValuePairs.add(new BasicNameValuePair("ref19", Build.MODEL));
            ConnectivityManager cm = (ConnectivityManager) ctx.getSystemService("connectivity");
            NetworkInfo mobileNet = cm.getNetworkInfo(0);
            NetworkInfo wifiNet = cm.getNetworkInfo(1);
            NetworkInfo.State mobile = mobileNet != null ? mobileNet.getState() : null;
            NetworkInfo.State wifi = wifiNet != null ? wifiNet.getState() : null;
            String networkState = "";
            if (wifi == NetworkInfo.State.CONNECTED || wifi == NetworkInfo.State.CONNECTING) {
                networkState = "wifi";
            } else if (mobile == NetworkInfo.State.CONNECTED || mobile == NetworkInfo.State.CONNECTING) {
                networkState = "carrier";
            }
            nameValuePairs.add(new BasicNameValuePair("ref20", networkState));
            int simState = tm.getSimState();
            String simStatus = "";
            switch (simState) {
                case 0:
                    simStatus = "sim_unknown";
                    break;
                case 1:
                    simStatus = "no_sim";
                    break;
                case 2:
                    simStatus = "sim_user_locked";
                    break;
                case 3:
                    simStatus = "sim_puk_locked";
                    break;
                case 4:
                    simStatus = "sim_carrier_locked";
                    break;
                case 5:
                    simStatus = "sim_ok";
                    break;
            }
            nameValuePairs.add(new BasicNameValuePair("ref21", simStatus));
            AdLog.d(LB_LOG, "r20 - " + (networkState.equals("wifi") ? "w" : "c") + ", r21 - " + simStatus);
            if (ctx.checkCallingOrSelfPermission("android.permission.ACCESS_WIFI_STATE") == 0) {
                WifiManager wifiMan = (WifiManager) ctx.getSystemService("wifi");
                WifiInfo wifiInf = wifiMan.getConnectionInfo();
                nameValuePairs.add(new BasicNameValuePair("ref22", wifiInf.getMacAddress()));
            }
            String refStr = "";
            for (int x = 0; x < nameValuePairs.size(); x++) {
                NameValuePair tmp2 = nameValuePairs.get(x);
                String val = tmp2.getValue();
                if (val != null) {
                    refStr = String.valueOf(refStr) + tmp2.getName() + "=" + URLEncoder.encode(val, "UTF-8") + "&";
                }
            }
            return AdEncryption.encrypt(refStr.substring(0, refStr.length() - 1));
        } catch (Exception e4) {
            AdLog.printStackTrace(LB_LOG, e4);
            return "";
        }
    }

    private static String getLocalIpAddress() {
        try {
            Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
            while (en.hasMoreElements()) {
                NetworkInterface intf = en.nextElement();
                Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses();
                while (enumIpAddr.hasMoreElements()) {
                    InetAddress inetAddress = enumIpAddr.nextElement();
                    if (!inetAddress.isLoopbackAddress()) {
                        return inetAddress.getHostAddress().toString();
                    }
                }
            }
        } catch (SocketException ex) {
            AdLog.printStackTrace(LB_LOG, ex);
        }
        return null;
    }
}
