package com.pad.android.xappad;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import com.pad.android.util.AdRequest;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdTask extends AsyncTask<String, Void, String> {
    private Context context;
    private AdController notifCon;
    private String notificationLaunchType;
    private String requestType;
    private JSONObject results;
    private String sectionid;
    private boolean useLocation = false;

    public AdTask(AdController nCon, Context ctx, String secid, String type, String nLT) {
        this.notificationLaunchType = "App";
        this.notifCon = nCon;
        this.context = ctx;
        this.sectionid = secid;
        this.requestType = type;
        this.notificationLaunchType = nLT;
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
    public String doInBackground(String... params) {
        ConnectivityManager cm = (ConnectivityManager) this.context.getSystemService("connectivity");
        NetworkInfo netInfo = cm.getActiveNetworkInfo();
        if (netInfo != null) {
            AdRequest req = new AdRequest(this.context, this.sectionid, this.requestType, this.notificationLaunchType);
            req.setUseLocation(this.useLocation);
            this.results = req.makeLBRequest();
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(String res) throws JSONException {
        if (this.notifCon != null && this.results != null) {
            this.notifCon.setResults(this.results);
            this.notifCon.initialized();
        }
    }
}
