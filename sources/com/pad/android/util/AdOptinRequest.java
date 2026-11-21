package com.pad.android.util;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.view.Window;
import android.widget.Toast;
import com.pad.android.listener.AdOptinListener;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
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
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdOptinRequest extends AsyncTask<Void, Void, JSONObject> {
    private final String LB_LOG = "LBAdController";
    private Activity activity;
    private Context context;
    private AdOptinListener oListener;
    private JSONObject optinValues;
    private String sectionid;

    public AdOptinRequest(Activity act, String secid, Context ctx, AdOptinListener list) {
        this.activity = null;
        this.sectionid = null;
        this.context = null;
        this.oListener = null;
        this.activity = act;
        this.sectionid = secid;
        this.context = ctx;
        this.oListener = list;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public JSONObject doInBackground(Void... params) {
        Context toUse = this.activity != null ? this.activity : this.context;
        ConnectivityManager cm = (ConnectivityManager) toUse.getSystemService("connectivity");
        NetworkInfo netInfo = cm.getActiveNetworkInfo();
        if (netInfo != null) {
            return makeOptinRequest();
        }
        return null;
    }

    private JSONObject makeOptinRequest() {
        TelephonyManager tele;
        JSONObject res = null;
        AdLog.d("LBAdController", "AdOptin started - " + this.activity + ", " + this.sectionid + ", " + this.context + ", " + this.oListener);
        if (this.activity != null || this.context != null) {
            Context toUse = this.activity != null ? this.activity : this.context;
            SharedPreferences pref = toUse.getSharedPreferences("Preference", 2);
            String makeRequest = pref.getString("SD_APP_OPTIN_SHOWN", "notset");
            if (makeRequest.equals("notset") || makeRequest.equals("invalid")) {
                AdLog.d("LBAdController", "Cookie is ok, going to check internet");
                ConnectivityManager cm = (ConnectivityManager) toUse.getSystemService("connectivity");
                NetworkInfo netInfo = cm.getActiveNetworkInfo();
                if (netInfo != null) {
                    AdLog.d("LBAdController", "Internet available - going to make the request");
                    int deviceWidth = 0;
                    int deviceHeight = 0;
                    if (this.activity != null) {
                        DisplayMetrics dm = new DisplayMetrics();
                        this.activity.getWindowManager().getDefaultDisplay().getMetrics(dm);
                        Rect rect = new Rect();
                        Window win = this.activity.getWindow();
                        win.getDecorView().getWindowVisibleDisplayFrame(rect);
                        int statusBarHeight = rect.top;
                        int contentViewTop = win.findViewById(R.id.content).getTop();
                        int titleBarHeight = contentViewTop > statusBarHeight ? contentViewTop - statusBarHeight : 0;
                        deviceWidth = dm.widthPixels;
                        deviceHeight = (dm.heightPixels - statusBarHeight) - titleBarHeight;
                    }
                    HttpParams params = new BasicHttpParams();
                    params.setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
                    HttpClient httpclient = new DefaultHttpClient(params);
                    if (this.activity != null) {
                        tele = (TelephonyManager) this.activity.getBaseContext().getSystemService("phone");
                    } else {
                        tele = (TelephonyManager) this.context.getSystemService("phone");
                    }
                    String[] urlDomains = {"http://ad.leadboltapps.net", "http://ad.leadbolt.net"};
                    boolean found = false;
                    int i = 0;
                    while (i < urlDomains.length && !found) {
                        String optindomain = urlDomains[i];
                        String url = String.valueOf(optindomain) + "/optin.php?";
                        HttpPost httppost = new HttpPost(String.valueOf(url) + "&section_id=" + this.sectionid);
                        try {
                            List<NameValuePair> pair = new ArrayList<>(2);
                            pair.add(new BasicNameValuePair("ref", AdRefValues.adRefValues(toUse, tele, "", null, false, deviceWidth, deviceHeight)));
                            httppost.setEntity(new UrlEncodedFormEntity(pair));
                        } catch (Exception e) {
                            AdLog.printStackTrace("LBAdController", e);
                        }
                        JSONObject res2 = res;
                        while (0 < 10 && !found) {
                            try {
                                HttpResponse response = httpclient.execute(httppost);
                                if (response.getStatusLine().getStatusCode() == 200) {
                                    found = true;
                                    HttpEntity entity = response.getEntity();
                                    if (entity != null) {
                                        InputStream instream = entity.getContent();
                                        String toReturn = AdUtilFuncs.convertStreamToString(instream);
                                        try {
                                            res2 = new JSONObject(toReturn);
                                        } catch (JSONException e2) {
                                            AdLog.printStackTrace("LBAdController", e2);
                                            AdLog.e("LBAdController", "Error in creating JSON Object for Optin - " + e2.getMessage());
                                        }
                                    }
                                }
                            } catch (Exception e3) {
                                AdLog.printStackTrace("LBAdController", e3);
                            }
                        }
                        i++;
                        res = res2;
                    }
                }
            }
        }
        return res;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(JSONObject res) {
        if (res == null) {
            if (this.oListener != null) {
                this.oListener.onAdOptin();
                return;
            }
            return;
        }
        this.optinValues = res;
        if ((this.activity != null || this.context != null) && this.optinValues != null) {
            Context toUse = this.activity != null ? this.activity : this.context;
            SharedPreferences pref = toUse.getSharedPreferences("Preference", 2);
            SharedPreferences.Editor editor = pref.edit();
            if (this.optinValues != null) {
                String optinType = "";
                String optinText = "";
                try {
                    optinType = this.optinValues.getString("optintype");
                    optinText = this.optinValues.getString("optintext");
                } catch (Exception e) {
                }
                String optinTime = new StringBuilder().append(System.currentTimeMillis()).toString();
                if (this.context != null) {
                    AdLog.d("LBAdController", "Context not null, so just flash toast....");
                    if (optinType.equals("display") || optinType.equals("confirm") || optinType.equals("webconfirm")) {
                        Toast.makeText(this.context, optinText, 0).show();
                        editor.putString("SD_APP_OPTIN", optinTime);
                        editor.commit();
                    } else if (optinType.equals("deny")) {
                        editor.putString("SD_APP_OPTIN", "0");
                        editor.commit();
                    } else if (optinType.equals("nodisplay")) {
                        editor.putString("SD_APP_OPTIN", optinTime);
                        editor.commit();
                    }
                    editor.putString("SD_APP_OPTIN_SHOWN", "1");
                    editor.commit();
                    if (this.oListener != null) {
                        this.oListener.onAdOptin();
                    }
                } else {
                    AdLog.d("LBAdController", "values received = " + this.optinValues.toString());
                    if (this.optinValues.length() == 1) {
                        if (this.oListener != null) {
                            this.oListener.onAdOptin();
                            return;
                        }
                        return;
                    }
                    if (optinType.equals("display")) {
                        if (this.activity != null) {
                            Toast.makeText(this.activity.getApplicationContext(), optinText, 1).show();
                        } else {
                            Toast.makeText(this.context, optinText, 1).show();
                        }
                        editor.putString("SD_APP_OPTIN", optinTime);
                        editor.putString("SD_APP_OPTIN_SHOWN", "1");
                        editor.commit();
                        if (this.oListener != null) {
                            this.oListener.onAdOptin();
                        }
                    } else if (optinType.equals("deny")) {
                        editor.putString("SD_APP_OPTIN", "0");
                        editor.commit();
                        if (this.oListener != null) {
                            this.oListener.onAdOptin();
                        }
                    } else if (optinType.equals("nodisplay")) {
                        editor.putString("SD_APP_OPTIN", optinTime);
                        editor.commit();
                        if (this.oListener != null) {
                            this.oListener.onAdOptin();
                        }
                    } else if (optinType.equals("webconfirm") && !this.optinValues.isNull("weboptinurl")) {
                        try {
                            new AdOptinView(this.activity, String.valueOf(this.optinValues.getString("weboptinurl")) + this.sectionid, this.oListener);
                        } catch (Exception e2) {
                            AdLog.printStackTrace("LBAdController", e2);
                        }
                    }
                }
                editor.putString("SD_APP_OPTIN_SHOWN", "1");
                editor.commit();
                return;
            }
            return;
        }
        if (this.oListener != null) {
            this.oListener.onAdOptin();
        }
    }
}
