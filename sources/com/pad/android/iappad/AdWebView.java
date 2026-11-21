package com.pad.android.iappad;

import android.R;
import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.util.AttributeSet;
import android.view.inputmethod.InputMethodManager;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.pad.android.listener.AdListener;
import com.pad.android.util.AdLog;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdWebView extends WebView {
    private static final String LB_LOG = "LBAdController";
    private Context activity;
    private AdController controller;
    private AdListener listener;
    private String loadUrl;
    private boolean loading;
    private ProgressDialog loadingDialog;
    private boolean nativeOpen;
    private JSONObject results;
    private WebSettings settings;

    public AdWebView(Activity act, AdController cont, boolean nO, AdListener list) {
        super(act);
        this.loading = false;
        this.nativeOpen = false;
        this.activity = act;
        this.controller = cont;
        this.nativeOpen = nO;
        this.listener = list;
        initialize();
    }

    public AdWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.loading = false;
        this.nativeOpen = false;
        this.activity = context;
        buildFromXML(attrs);
    }

    public AdWebView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.loading = false;
        this.nativeOpen = false;
        this.activity = context;
        buildFromXML(attrs);
    }

    public void setResults(JSONObject res) {
        this.results = res;
    }

    public void setLoadingURL(String lU) {
        this.loadUrl = lU;
    }

    private void buildFromXML(AttributeSet attrs) {
        if (attrs != null) {
            this.controller = new AdController((Activity) this.activity, attrs.getAttributeValue(null, "sectionid"));
            initialize();
        }
    }

    private void initialize() {
        this.settings = getSettings();
        this.settings.setJavaScriptEnabled(true);
        this.settings.setJavaScriptCanOpenWindowsAutomatically(true);
        addJavascriptInterface(new AdJSInterface(this.activity, this.controller, this.listener), "LBOUT");
        if (Build.VERSION.SDK_INT >= 8) {
            this.settings.setPluginState(WebSettings.PluginState.ON);
        }
        setWebChromeClient(new AdWebChromeClient(this.activity));
        setWebViewClient(new AdWebClient(this.activity, this.controller, this));
    }

    public void showAd() {
        this.controller.loadAd();
    }

    private class AdWebClient extends WebViewClient {
        private Context activity;
        private AdWebView adView;
        private AdController controller;

        public AdWebClient(Context act, AdController cont, AdWebView adV) {
            this.activity = act;
            this.controller = cont;
            this.adView = adV;
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            view.setPadding(0, 0, 0, 0);
            view.setInitialScale(100);
            view.setVerticalScrollBarEnabled(false);
            view.setHorizontalScrollBarEnabled(false);
            InputMethodManager im = (InputMethodManager) this.activity.getSystemService("input_method");
            if (im.isAcceptingText()) {
                view.setVerticalScrollBarEnabled(true);
            }
            if (url.equals(AdWebView.this.loadUrl)) {
                AdLog.i("LBAdController", "Home loaded - loading = " + AdWebView.this.loading);
                if (!AdWebView.this.loading) {
                    try {
                        if (AdWebView.this.results.get("useclickwindow").equals("1")) {
                            AdLog.i("LBAdController", "Going to use ClickWindow details");
                            this.controller.setHomeLoaded(true);
                            AdWebView.this.loading = false;
                            this.controller.setLoading(AdWebView.this.loading);
                            this.controller.onLinkClicked();
                        } else {
                            AdLog.i("LBAdController", "Normal window to be used");
                        }
                        return;
                    } catch (Exception e) {
                        AdLog.e("LBAdController", "Exception - " + e.getMessage());
                        return;
                    }
                }
                return;
            }
            AdLog.d("LBAdController", "Link clicked!!");
            if (!AdWebView.this.loading) {
                if (AdWebView.this.nativeOpen || url.startsWith("market://") || url.startsWith("http://market.android.com") || url.startsWith("https://market.android.com") || url.startsWith("https://play.google.com/") || url.startsWith("http://play.google.com/")) {
                    try {
                        AdLog.i("LBAdController", "Opening URL natively");
                        view.stopLoading();
                        try {
                            view.loadUrl(AdWebView.this.results.getString("clickhelpurl"));
                        } catch (Exception e2) {
                        }
                        this.activity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                        return;
                    } catch (Exception e3) {
                        this.controller.destroyAd();
                        return;
                    }
                }
                if (url.contains("usenative=1")) {
                    view.stopLoading();
                    this.activity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                } else {
                    if (!url.startsWith("tel:")) {
                        if (AdWebView.this.loadingDialog == null || !AdWebView.this.loadingDialog.isShowing()) {
                            AdWebView.this.loadingDialog = ProgressDialog.show(this.activity, "", "Loading....Please wait!", true);
                        }
                        this.controller.onLinkClicked();
                        return;
                    }
                    this.controller.destroyAd();
                    this.activity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                }
            }
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            AdLog.d("LBAdController", "onPageFinished called");
            if (AdWebView.this.loadingDialog != null && AdWebView.this.loadingDialog.isShowing()) {
                AdWebView.this.loadingDialog.dismiss();
            }
            if (url.equals(AdWebView.this.loadUrl)) {
                view.setBackgroundColor(-1);
                this.adView.loadUrl("javascript:window.LBOUT.processHTML(document.getElementsByTagName('body')[0].getAttribute('ad_count'))");
                if (this.activity.checkCallingOrSelfPermission("android.permission.GET_ACCOUNTS") == 0) {
                    AccountManager accManager = AccountManager.get(this.activity);
                    Account[] acc = accManager.getAccounts();
                    for (Account tmp : acc) {
                        if (tmp.type.equals("com.google")) {
                            this.adView.loadUrl("javascript:(function() {var input = document.getElementsByName('Email')[0];input.select();input.focus();input.value = '" + tmp.name + "';})()");
                            break;
                        }
                    }
                } else {
                    AdLog.d("LBAdController", "Get Accounts permission not granted");
                }
            }
            AdWebView.this.loading = false;
            this.controller.setLoading(AdWebView.this.loading);
            this.adView.requestFocus(130);
            if (url.contains("#app_close")) {
                try {
                    Thread.sleep(1000L);
                    this.controller.destroyAd();
                } catch (Exception e) {
                }
            }
        }
    }

    private class AdWebChromeClient extends WebChromeClient {
        private Context ctx;

        public AdWebChromeClient(Context ctx) {
            this.ctx = ctx;
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsAlert(WebView view, String url, String message, final JsResult result) {
            new AlertDialog.Builder(this.ctx).setTitle("Alert").setMessage(message).setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() { // from class: com.pad.android.iappad.AdWebView.AdWebChromeClient.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    result.confirm();
                }
            }).setCancelable(false).create().show();
            return true;
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsConfirm(WebView view, String url, String message, final JsResult result) {
            new AlertDialog.Builder(this.ctx).setTitle("Confirm").setMessage(message).setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() { // from class: com.pad.android.iappad.AdWebView.AdWebChromeClient.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    result.confirm();
                }
            }).setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() { // from class: com.pad.android.iappad.AdWebView.AdWebChromeClient.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    result.cancel();
                }
            }).create().show();
            return true;
        }
    }
}
