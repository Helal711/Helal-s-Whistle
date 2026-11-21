package com.pad.android.iappad;

import android.app.Activity;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import com.pad.android.util.AdLog;
import com.pad.android.util.AdRequest;
import java.util.List;
import org.apache.http.NameValuePair;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdTask extends AsyncTask<String, Void, String> {
    private Activity activity;
    private AdController adCon;
    private JSONObject results;
    private String sectionid;
    private String subid;
    private List<NameValuePair> tokens;
    private boolean useLocation = false;

    public AdTask(AdController aCon, Activity act, String sid) {
        this.adCon = aCon;
        this.activity = act;
        this.sectionid = sid;
    }

    public void setSubId(String sid) {
        this.subid = sid;
    }

    public void setTokens(List<NameValuePair> tks) {
        this.tokens = tks;
    }

    public void setUseLocation(boolean uL) {
        this.useLocation = uL;
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        super.onPreExecute();
    }

    @Override // android.os.AsyncTask
    protected void onCancelled() {
        super.onCancelled();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public String doInBackground(String... arg0) {
        ConnectivityManager cm = (ConnectivityManager) this.activity.getSystemService("connectivity");
        NetworkInfo netInfo = cm.getActiveNetworkInfo();
        if (netInfo != null) {
            AdRequest req = new AdRequest(this.activity, this.sectionid);
            req.setSubId(this.subid);
            req.setTokens(this.tokens);
            req.setUseLocation(this.useLocation);
            this.results = req.makeLBRequest();
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(String res) {
        if (this.adCon != null && this.results != null) {
            this.adCon.setResults(this.results);
            this.adCon.initialized();
        } else if (this.adCon != null) {
            this.adCon.triggerAdFailed();
            AdLog.e("LBAdController", "Failed to get results from server");
        }
    }
}
