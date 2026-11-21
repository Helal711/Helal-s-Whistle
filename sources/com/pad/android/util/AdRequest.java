package com.pad.android.util;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.view.Window;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdRequest {
    private static final String LB_LOG = "LBAdController";
    private Activity activity;
    private Context context;
    private String domain;
    private boolean loadIcon;
    private String notificationLaunchType;
    private boolean requestInProgress;
    private JSONObject results;
    private int sHeight;
    private int sWidth;
    private String sectionid;
    private String subid;
    private TelephonyManager tm;
    private List<NameValuePair> tokens;
    private boolean useLocation;
    private boolean useNotification;

    public AdRequest(Activity act, String secid) {
        this.requestInProgress = false;
        this.useNotification = false;
        this.loadIcon = false;
        this.notificationLaunchType = "App";
        this.useLocation = false;
        this.activity = act;
        this.context = null;
        this.sectionid = secid;
    }

    public AdRequest(Context ctx, String secid, String type, String nLT) {
        this.requestInProgress = false;
        this.useNotification = false;
        this.loadIcon = false;
        this.notificationLaunchType = "App";
        this.useLocation = false;
        this.activity = null;
        this.context = ctx;
        this.sectionid = secid;
        this.useNotification = type.equals("notification");
        this.loadIcon = type.equals("icon");
        this.notificationLaunchType = nLT;
    }

    public void setSubId(String sbid) {
        this.subid = sbid;
    }

    public void setTokens(List<NameValuePair> tks) {
        this.tokens = tks;
    }

    public void setUseLocation(boolean uL) {
        this.useLocation = uL;
        AdLog.i("LBAdController", "setUseLocation: " + uL);
    }

    public JSONObject makeLBRequest() {
        if (this.requestInProgress) {
            return null;
        }
        this.requestInProgress = true;
        Random r = new Random();
        int rand = r.nextInt(151) + 250;
        try {
            Thread.sleep(rand);
        } catch (Exception e) {
        }
        Context toUse = this.activity == null ? this.context : this.activity;
        SharedPreferences pref = toUse.getSharedPreferences("Preference", 2);
        if (this.activity != null) {
            DisplayMetrics dm = new DisplayMetrics();
            this.activity.getWindowManager().getDefaultDisplay().getMetrics(dm);
            Rect rect = new Rect();
            Window win = this.activity.getWindow();
            win.getDecorView().getWindowVisibleDisplayFrame(rect);
            int statusBarHeight = rect.top;
            int contentViewTop = win.findViewById(R.id.content).getTop();
            int titleBarHeight = contentViewTop > statusBarHeight ? contentViewTop - statusBarHeight : 0;
            this.sWidth = dm.widthPixels;
            this.sHeight = (dm.heightPixels - statusBarHeight) - titleBarHeight;
            AdLog.d("LBAdController", "Device Width = " + this.sWidth + ", Height = " + this.sHeight);
            AdLog.d("LBAdController", "SBH = " + statusBarHeight + ", TBH = " + titleBarHeight);
        }
        HttpParams params = new BasicHttpParams();
        params.setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
        HttpClient httpclient = new DefaultHttpClient(params);
        if (this.activity != null) {
            this.tm = (TelephonyManager) this.activity.getBaseContext().getSystemService("phone");
        } else {
            this.tm = (TelephonyManager) this.context.getSystemService("phone");
        }
        String[] urlDomains = {"http://ad.leadboltapps.net", "http://ad.leadbolt.net"};
        boolean found = false;
        for (int i = 0; i < urlDomains.length && !found; i++) {
            this.domain = urlDomains[i];
            String url = String.valueOf(this.domain) + "/show_app.conf?";
            if (this.useNotification) {
                url = String.valueOf(this.domain) + "/show_notification?";
            } else if (this.loadIcon) {
                url = String.valueOf(this.domain) + "/show_app_icon.conf?";
            }
            String get = "&section_id=" + this.sectionid + "&appId=null&optin=" + pref.getString("SD_APP_OPTIN", "0");
            if (this.useNotification) {
                int iterationcounter = Integer.valueOf(pref.getString("SD_ITERATION_COUNTER_" + this.sectionid, "0")).intValue();
                String get2 = String.valueOf(String.valueOf(get) + "&iteration_counter=" + iterationcounter) + "&launch_type=" + this.notificationLaunchType;
                long fireTime = pref.getLong("SD_NOTIFICATION_FIRED_" + this.sectionid, -1L);
                int interval = fireTime == -1 ? -1 : ((int) (System.currentTimeMillis() / 1000)) - ((int) (fireTime / 1000));
                get = String.valueOf(get2) + "&notification_fired=" + interval;
                AdLog.d("LBAdController", "NotificationFired = " + interval);
            }
            if (this.loadIcon) {
                int displayCount = pref.getInt("SD_ICON_DISPLAY_" + this.sectionid, 0);
                get = String.valueOf(get) + "&icon_displayed_count=" + displayCount;
            }
            String getString = AdEncryption.encrypt(get.trim()).trim();
            String url2 = String.valueOf(url) + "&get=" + getString + "&section_id=" + this.sectionid;
            AdLog.d("LBAdController", "Get = " + getString);
            HttpPost httppost = new HttpPost(url2);
            try {
                List<NameValuePair> pair = new ArrayList<>(2);
                pair.add(new BasicNameValuePair("ref", AdRefValues.adRefValues(toUse, this.tm, this.subid, this.tokens, this.useLocation, this.sWidth, this.sHeight)));
                httppost.setEntity(new UrlEncodedFormEntity(pair));
            } catch (Exception e2) {
                AdLog.printStackTrace("LBAdController", e2);
            }
            for (int connectionCount = 0; connectionCount < 10 && !found; connectionCount++) {
                try {
                    try {
                        HttpResponse response = httpclient.execute(httppost);
                        if (response.getStatusLine().getStatusCode() == 200) {
                            found = true;
                            HttpEntity entity = response.getEntity();
                            if (entity != null) {
                                InputStream instream = entity.getContent();
                                String str = AdUtilFuncs.convertStreamToString(instream);
                                this.results = new JSONObject(str);
                                instream.close();
                            }
                        }
                        this.requestInProgress = false;
                    } catch (Exception ex) {
                        AdLog.printStackTrace("LBAdController", ex);
                        found = false;
                        this.results = new JSONObject();
                        this.requestInProgress = false;
                    }
                } catch (Throwable th) {
                    this.requestInProgress = false;
                    throw th;
                }
            }
        }
        return this.results;
    }
}
