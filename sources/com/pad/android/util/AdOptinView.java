package com.pad.android.util;

import android.R;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.RelativeLayout;
import com.pad.android.listener.AdOptinListener;

/* JADX INFO: loaded from: classes.dex */
public class AdOptinView extends WebView {
    private Activity activity;
    private RelativeLayout layout;
    private ProgressDialog loadingDialog;
    private AdOptinListener oListener;
    private String optinUrl;

    public AdOptinView(Activity act, String url, AdOptinListener oL) {
        super(act);
        this.activity = act;
        this.optinUrl = url;
        this.oListener = oL;
        initialize();
    }

    public AdOptinView(Context context) {
        super(context);
    }

    private void initialize() {
        WebSettings settings = getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        addJavascriptInterface(new AdOptinJSInterface(), "LBOPTIN");
        if (Build.VERSION.SDK_INT >= 8) {
            settings.setPluginState(WebSettings.PluginState.ON);
        }
        setWebViewClient(new WebViewClient() { // from class: com.pad.android.util.AdOptinView.1
            @Override // android.webkit.WebViewClient
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                if (url.equals(AdOptinView.this.optinUrl)) {
                    if (AdOptinView.this.loadingDialog == null || !AdOptinView.this.loadingDialog.isShowing()) {
                        try {
                            AdOptinView.this.loadingDialog = ProgressDialog.show(AdOptinView.this.activity, "", "Loading....Please wait!", true);
                            return;
                        } catch (Exception e) {
                            AdLog.e("LBADController", "Error when trying to show dialog - " + e.getMessage());
                            return;
                        }
                    }
                    return;
                }
                view.stopLoading();
                AdOptinView.this.activity.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
            }

            @Override // android.webkit.WebViewClient
            public void onPageFinished(WebView view, String url) {
                AdOptinView.this.requestFocus(130);
                if (AdOptinView.this.loadingDialog != null && AdOptinView.this.loadingDialog.isShowing()) {
                    AdOptinView.this.loadingDialog.dismiss();
                }
            }
        });
        loadUrl(this.optinUrl);
        this.layout = new RelativeLayout(this.activity);
        DisplayMetrics dm = new DisplayMetrics();
        this.activity.getWindowManager().getDefaultDisplay().getMetrics(dm);
        Rect rect = new Rect();
        Window win = this.activity.getWindow();
        win.getDecorView().getWindowVisibleDisplayFrame(rect);
        int statusBarHeight = rect.top;
        int contentViewTop = win.findViewById(R.id.content).getTop();
        int titleBarHeight = contentViewTop > statusBarHeight ? contentViewTop - statusBarHeight : 0;
        int sWidth = dm.widthPixels;
        int sHeight = (dm.heightPixels - statusBarHeight) - titleBarHeight;
        ViewGroup.MarginLayoutParams wM = new ViewGroup.MarginLayoutParams(sWidth, sHeight);
        wM.setMargins(0, 0, 0, 0);
        RelativeLayout.LayoutParams wL = new RelativeLayout.LayoutParams(wM);
        this.layout.addView(this, wL);
        this.activity.addContentView(this.layout, wL);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeView() {
        this.activity.runOnUiThread(new Runnable() { // from class: com.pad.android.util.AdOptinView.2
            @Override // java.lang.Runnable
            public void run() {
                if (AdOptinView.this.layout != null) {
                    AdOptinView.this.layout.removeAllViews();
                }
                AdOptinView.this.setVisibility(4);
                try {
                    Class.forName("android.webkit.WebView").getMethod("onPause", null).invoke(this, null);
                } catch (Exception e) {
                }
            }
        });
    }

    class AdOptinJSInterface {
        AdOptinJSInterface() {
        }

        public void okclicked() {
            SharedPreferences pref = AdOptinView.this.activity.getSharedPreferences("Preference", 2);
            SharedPreferences.Editor edit = pref.edit();
            edit.putString("SD_APP_OPTIN", new StringBuilder().append(System.currentTimeMillis()).toString());
            edit.putString("SD_APP_OPTIN_SHOWN", "1");
            edit.commit();
            AdOptinView.this.closeView();
            if (AdOptinView.this.oListener != null) {
                AdOptinView.this.oListener.onAdOptin();
            }
        }

        public void cancelclicked() {
            SharedPreferences pref = AdOptinView.this.activity.getSharedPreferences("Preference", 2);
            SharedPreferences.Editor edit = pref.edit();
            edit.putString("SD_APP_OPTIN", "0");
            edit.putString("SD_APP_OPTIN_SHOWN", "1");
            edit.commit();
            AdOptinView.this.closeView();
            if (AdOptinView.this.oListener != null) {
                AdOptinView.this.oListener.onAdOptin();
            }
        }
    }
}
