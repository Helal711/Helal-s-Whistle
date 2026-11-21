package com.pad.android.iappad;

import android.R;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.pad.android.listener.AdListener;
import com.pad.android.listener.AdOptinListener;
import com.pad.android.util.AdLog;
import com.pad.android.util.AdOptinRequest;
import com.pad.android.util.AdUtilFuncs;
import java.io.InputStream;
import java.util.List;
import java.util.TimerTask;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdController {
    public static final String LB_LOG = "LBAdController";
    public static final String SDK_LEVEL = "06b";
    public static final String SDK_VERSION = "3";
    private final int LB_MAX_POLL;
    private final int LB_SET_MANUAL_AFTER;
    private Activity activity;
    private boolean adDestroyed;
    private String adDisplayInterval;
    private boolean adLoaded;
    private OfferPolling adPolling;
    private int additionalDockingMargin;
    private Button backBtn;
    private Button closeBtn;
    private boolean completed;
    private Context context;
    private View footer;
    private TextView footerTitle;
    private Button fwdBtn;
    private Button homeBtn;
    private boolean homeLoaded;
    private boolean initialized;
    private RelativeLayout layout;
    private boolean linkClicked;
    private AdListener listener;
    private boolean loadAd;
    private Runnable loadProgress;
    private String loadUrl;
    private boolean loading;
    private ProgressDialog loadingDialog;
    private RelativeLayout.LayoutParams lpC;
    private WebView mainView;
    private ViewGroup mainViewParent;
    private View mask;
    private ViewGroup.MarginLayoutParams mlpC;
    private boolean nativeOpen;
    private boolean onAdLoaded;
    private Button pollBtn;
    private int pollCount;
    private int pollManual;
    private int pollMax;
    private Handler pollingHandler;
    private boolean pollingInitialized;
    private Handler progressHandler;
    private int progressInterval;
    private Button refreshBtn;
    private JSONObject results;
    private int sHeight;
    private int sWidth;
    private String sectionid;
    private String subid;
    private TextView title;
    private List<NameValuePair> tokens;
    private View toolbar;
    private boolean useLocation;
    private AdWebView webview;

    public AdController(Activity act, String sid) {
        this(act, sid, new RelativeLayout(act));
    }

    public AdController(Activity act, String sid, WebView w) {
        this.LB_MAX_POLL = 500;
        this.LB_SET_MANUAL_AFTER = 10;
        this.completed = false;
        this.homeLoaded = false;
        this.linkClicked = false;
        this.pollingInitialized = false;
        this.useLocation = false;
        this.nativeOpen = false;
        this.initialized = false;
        this.additionalDockingMargin = 0;
        this.loadAd = true;
        this.listener = null;
        this.progressInterval = 0;
        this.adLoaded = false;
        this.adDestroyed = false;
        this.pollCount = 0;
        this.pollMax = 0;
        this.pollManual = 0;
        this.onAdLoaded = false;
        this.activity = act;
        this.sectionid = sid;
        this.mainView = w;
        this.layout = new RelativeLayout(this.activity);
    }

    public AdController(Activity act, String sid, AdListener lt) {
        this(act, sid, new RelativeLayout(act));
        this.listener = lt;
    }

    public AdController(Activity act, String sid, RelativeLayout ly) {
        this.LB_MAX_POLL = 500;
        this.LB_SET_MANUAL_AFTER = 10;
        this.completed = false;
        this.homeLoaded = false;
        this.linkClicked = false;
        this.pollingInitialized = false;
        this.useLocation = false;
        this.nativeOpen = false;
        this.initialized = false;
        this.additionalDockingMargin = 0;
        this.loadAd = true;
        this.listener = null;
        this.progressInterval = 0;
        this.adLoaded = false;
        this.adDestroyed = false;
        this.pollCount = 0;
        this.pollMax = 0;
        this.pollManual = 0;
        this.onAdLoaded = false;
        this.activity = act;
        this.sectionid = sid;
        this.layout = ly == null ? new RelativeLayout(act) : ly;
        this.mainView = null;
    }

    public void setUseLocation(boolean uL) {
        this.useLocation = uL;
        AdLog.i("LBAdController", "setUseLocation: " + uL);
    }

    public void setLayout(RelativeLayout ly) {
        this.layout = ly;
    }

    public void setAdditionalDockingMargin(int newOffset) {
        this.additionalDockingMargin = newOffset;
        AdLog.i("LBAdController", "setAdditionalDockingMargin: " + newOffset);
    }

    public void setAsynchTask(boolean asynch) {
    }

    public void setSubId(String sbid) {
        this.subid = sbid;
    }

    public void setTokens(List<NameValuePair> tks) {
        this.tokens = tks;
    }

    public void setOnProgressInterval(int pI) {
        this.progressInterval = pI;
    }

    public void destroyAd() {
        AdLog.i("LBAdController", "destroyAd called");
        this.adDestroyed = true;
        closeUnlocker();
    }

    public void pauseAd() {
        Context toUse = this.activity != null ? this.activity : this.context;
        SharedPreferences pref = toUse.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("SD_ADSTATUS_" + this.sectionid, "hidden");
        editor.commit();
    }

    public void resumeAd() {
        Context toUse = this.activity != null ? this.activity : this.context;
        SharedPreferences pref = toUse.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("SD_ADSTATUS_" + this.sectionid, "default");
        editor.commit();
        if (this.listener != null) {
            try {
                this.listener.onAdResumed();
            } catch (Exception e) {
                AdLog.printStackTrace("LBAdController", e);
                AdLog.e("LBAdController", "Error while triggering onAdResumed - " + e.getMessage());
            }
        }
    }

    public void hideAd() {
        pauseAd();
    }

    public void showAd() {
        resumeAd();
    }

    public String adShowStatus() {
        Context toUse = this.activity != null ? this.activity : this.context;
        SharedPreferences pref = toUse.getSharedPreferences("Preference", 2);
        return pref.getString("SD_ADSTATUS_" + this.sectionid, "default");
    }

    public void loadOptin(Activity act, String section, AdOptinListener oListener) {
        if (act != null) {
            if (act instanceof Activity) {
                AdOptinRequest optin = new AdOptinRequest(act, section, null, oListener);
                optin.execute(new Void[0]);
            } else {
                Log.e("com.pad.android.iappad.AdController", "Activity required for loadOptin - incorrect value passed");
            }
        }
    }

    private int getAdVisibility() {
        if (this.webview != null) {
            return this.webview.getVisibility();
        }
        return 4;
    }

    public void setHomeLoaded(boolean hL) {
        this.homeLoaded = hL;
    }

    public void onLinkClicked() {
        linkClicked();
    }

    public void setLoading(boolean l) {
        this.loading = l;
    }

    public void setCompleted(boolean c) {
        this.completed = c;
    }

    public void triggerAdCompleted() {
        if (this.listener != null) {
            try {
                AdLog.i("LBAdController", "onAdCompleted triggered");
                this.listener.onAdCompleted();
            } catch (Exception e) {
                AdLog.e("LBAdController", "error when onAdCompleted triggered");
                AdLog.printStackTrace("LBAdController", e);
            }
        }
    }

    public void setResults(JSONObject res) {
        if (res != null) {
            this.results = res;
        }
    }

    public void initialized() {
        this.initialized = true;
        if (this.results != null) {
            try {
                if (this.results.getString("show").equals("0")) {
                    if (this.listener != null) {
                        this.listener.onAdFailed();
                        return;
                    }
                    return;
                }
            } catch (Exception e) {
            }
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
            }
            try {
                this.pollMax = this.results.getInt("pollmaxcount");
                int pMA = this.results.getInt("pollmanualafter");
                int pollInterval = this.results.getInt("pollinterval");
                if (pollInterval > 0) {
                    this.pollManual = (pMA * 60) / pollInterval;
                } else {
                    this.pollManual = 10;
                }
            } catch (Exception e2) {
                this.pollMax = 500;
                this.pollManual = 10;
            }
            try {
                if (this.results.get("usenative").equals("1")) {
                    this.nativeOpen = true;
                }
            } catch (JSONException e3) {
            }
            SharedPreferences pref = this.activity.getSharedPreferences("Preference", 2);
            SharedPreferences.Editor editor = pref.edit();
            try {
                editor.putString("SD_" + this.sectionid, this.results.getString("displayinterval"));
            } catch (Exception e4) {
                if (this.adDisplayInterval != null && !this.adDisplayInterval.equals("0")) {
                    editor.putString("SD_" + this.sectionid, this.adDisplayInterval);
                } else {
                    editor.putString("SD_" + this.sectionid, "0");
                }
            }
            editor.commit();
            try {
                if (!this.results.isNull("invalidateoptin")) {
                    String invalidate = "0";
                    try {
                        invalidate = this.results.getString("invalidateoptin");
                    } catch (Exception e5) {
                    }
                    if (invalidate.equals("1")) {
                        editor.putString("SD_APP_OPTIN_SHOWN", "invalid");
                        editor.commit();
                    }
                }
            } catch (Exception e6) {
            }
            if (this.webview == null) {
                this.webview = new AdWebView(this.activity, this, this.nativeOpen, this.listener);
                if (Build.VERSION.SDK_INT >= 11) {
                    try {
                        this.activity.getWindow().setFlags(16777216, 16777216);
                    } catch (Exception e7) {
                        AdLog.e("LBAdController", "Error when setting Hardware Acceleration Flags");
                        AdLog.printStackTrace("LBAdController", e7);
                    }
                }
                this.webview.setResults(this.results);
            }
            try {
                PollRequest pR = new PollRequest(this, null);
                pR.execute(this.results.getString("pollurl"));
                return;
            } catch (Exception e8) {
                AdLog.printStackTrace("LBAdController", e8);
                AdLog.e("LBAdController", "Error while trying to call pollurl - " + e8.getMessage());
                return;
            }
        }
        if (this.listener != null) {
            this.listener.onAdFailed();
        }
    }

    public void triggerAdFailed() {
        AdLog.e("LBAdController", "No Internet connection detected. No Ads loaded");
        if (this.listener != null) {
            try {
                AdLog.i("LBAdController", "onAdFailed triggered");
                this.listener.onAdFailed();
                this.adLoaded = true;
            } catch (Exception e) {
                AdLog.i("LBAdController", "Error while calling onAdFailed");
                AdLog.printStackTrace("LBAdController", e);
            }
        }
    }

    private void initialize() {
        if (this.loadAd && adShowStatus().equals("hidden")) {
            AdLog.d("LBAdController", "Ad paused, will not show");
            if (this.listener != null) {
                try {
                    AdLog.i("LBAdController", "onAdPaused triggered");
                    this.listener.onAdPaused();
                    this.listener.onAdHidden();
                    return;
                } catch (Exception e) {
                    AdLog.i("LBAdController", "Error while calling onAdPaused");
                    AdLog.printStackTrace("LBAdController", e);
                    return;
                }
            }
            return;
        }
        AdLog.i("LBAdController", "initializing...");
        AdTask task = new AdTask(this, this.activity, this.sectionid);
        task.setSubId(this.subid);
        task.setTokens(this.tokens);
        task.setUseLocation(this.useLocation);
        task.execute("");
    }

    public void loadAd() {
        SharedPreferences pref = this.activity.getSharedPreferences("Preference", 2);
        String optinShowed = pref.getString("SD_APP_OPTIN_SHOWN", "notset");
        String optin = pref.getString("SD_APP_OPTIN", "notset");
        if (!optinShowed.equals("notset") && optin.equals("0")) {
            SharedPreferences.Editor editor = pref.edit();
            editor.putString("SD_APP_OPTIN_SHOWN", "invalid");
            editor.commit();
        }
        AdLog.i("LBAdController", "loadAd called");
        this.onAdLoaded = false;
        if (!this.initialized) {
            this.loadAd = true;
            initialize();
        } else {
            displayAd();
        }
        if (this.listener != null && this.progressInterval > 0) {
            if (this.loadProgress == null) {
                this.loadProgress = new Runnable() { // from class: com.pad.android.iappad.AdController.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            if (!AdController.this.adLoaded && !AdController.this.adDestroyed) {
                                AdLog.i("LBAdController", "onAdProgress triggered");
                                AdController.this.listener.onAdProgress();
                                AdController.this.progressHandler.postDelayed(AdController.this.loadProgress, AdController.this.progressInterval * 1000);
                            }
                        } catch (Exception e) {
                            AdLog.e("LBAdController", "error when onAdProgress triggered");
                            AdLog.printStackTrace("LBAdController", e);
                        }
                    }
                };
            }
            if (this.progressHandler == null) {
                this.progressHandler = new Handler();
                this.progressHandler.postDelayed(this.loadProgress, this.progressInterval * 1000);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void displayAd() {
        AdLog.d("LBAdController", "displayAd called");
        if (this.results == null) {
            AdLog.e("LBAdController", "Results are null - no ad will be loaded");
            return;
        }
        try {
            if (!this.results.isNull("useclickwindow") && this.results.getString("useclickwindow").equals("1")) {
                this.loading = false;
                this.linkClicked = false;
                AdLog.i("LBAdController", "Going to use click window - cancel out of here...");
                linkClicked();
                return;
            }
        } catch (Exception e) {
            AdLog.printStackTrace("LBAdController", e);
            AdLog.e("LBAdController", "Exception when using ClickWindow - " + e.getMessage());
        }
        if (!this.homeLoaded) {
            AdLog.d("LBAdController", "Going to load the Ad now...");
            this.homeLoaded = true;
            this.linkClicked = false;
            try {
                try {
                    this.loading = true;
                    if (this.results.get("show").equals("1")) {
                        if (!this.completed) {
                            try {
                                this.layout.removeView(this.webview);
                                this.layout.removeView(this.toolbar);
                                this.layout.removeView(this.title);
                                this.layout.removeView(this.footer);
                                this.layout.removeView(this.footerTitle);
                                this.layout.removeView(this.backBtn);
                                this.layout.removeView(this.fwdBtn);
                                this.layout.removeView(this.closeBtn);
                                this.layout.removeView(this.homeBtn);
                                this.layout.removeView(this.refreshBtn);
                                this.layout.removeView(this.mask);
                                if (this.pollBtn != null) {
                                    this.layout.removeAllViews();
                                }
                            } catch (Exception e2) {
                            }
                            try {
                                this.mask = new View(this.activity);
                                this.mask.setMinimumHeight(-1);
                                this.mask.setMinimumWidth(-1);
                                this.mask.setBackgroundColor(-16777216);
                                double alpha = this.results.getDouble("maskalpha") * 255.0d;
                                this.mask.getBackground().setAlpha((int) alpha);
                                this.mask.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.2
                                    @Override // android.view.View.OnClickListener
                                    public void onClick(View v) {
                                    }
                                });
                            } catch (Exception e3) {
                            }
                            ViewGroup.MarginLayoutParams mM = new ViewGroup.MarginLayoutParams(-1, -1);
                            mM.setMargins(0, 0, 0, 0);
                            RelativeLayout.LayoutParams mL = new RelativeLayout.LayoutParams(mM);
                            int windowYPos = this.results.getInt("windowy");
                            String docking = "Middle";
                            try {
                                docking = this.results.getString("windowdockingy");
                            } catch (Exception e4) {
                            }
                            if (this.results.getInt("titlevisible") == 0) {
                                if (this.webview != null) {
                                    this.webview.setBackgroundColor(0);
                                }
                                if (this.additionalDockingMargin > 0 && !docking.equals("Middle")) {
                                    AdLog.i("LBAdController", "Additional Docking is set, adjusting banner by " + this.additionalDockingMargin + "px");
                                    if (docking.equals("Top")) {
                                        windowYPos += this.additionalDockingMargin;
                                    } else if (docking.equals("Bottom") && (windowYPos = windowYPos - this.additionalDockingMargin) < 0) {
                                        windowYPos = 0;
                                    }
                                }
                            }
                            ViewGroup.MarginLayoutParams wM = new ViewGroup.MarginLayoutParams(this.results.getInt("windowwidth"), this.results.getInt("windowheight"));
                            wM.setMargins(this.results.getInt("windowx"), windowYPos, 0, 0);
                            RelativeLayout.LayoutParams wL = new RelativeLayout.LayoutParams(wM);
                            int toolbarx = this.results.getInt("titlex");
                            int toolbary = this.results.getInt("titley");
                            int toolbarwidth = this.results.getInt("titlewidth");
                            int toolbarheight = this.results.getInt("titleheight");
                            ViewGroup.MarginLayoutParams tM = new ViewGroup.MarginLayoutParams(toolbarwidth, toolbarheight);
                            tM.setMargins(toolbarx, toolbary, 0, 0);
                            RelativeLayout.LayoutParams tL = new RelativeLayout.LayoutParams(tM);
                            this.toolbar = new View(this.activity);
                            String clr = this.results.getString("titlecolor");
                            if (clr.equals("") || clr == null) {
                                clr = "#E6E6E6";
                            }
                            this.toolbar.setBackgroundColor(Color.parseColor(clr));
                            this.title = new TextView(this.activity);
                            this.title.setText(this.results.getString("titletext"));
                            String clk = this.results.getString("titletextcolor");
                            if (clk.equals("") || clk == null) {
                                clk = "#E6E6E6";
                            }
                            this.title.setTextColor(Color.parseColor(clk));
                            int titletextheight = this.results.getInt("titletextheight");
                            ViewGroup.MarginLayoutParams tvp = new ViewGroup.MarginLayoutParams(this.results.getInt("titletextwidth"), titletextheight);
                            int titlex = toolbarx + 20;
                            int titley = ((toolbarheight - titletextheight) / 2) + toolbary + 4;
                            tvp.setMargins(titlex, titley, 0, 0);
                            RelativeLayout.LayoutParams tvl = new RelativeLayout.LayoutParams(tvp);
                            int footerx = this.results.getInt("footerx");
                            int footery = this.results.getInt("footery");
                            int footerheight = this.results.getInt("footerheight");
                            ViewGroup.MarginLayoutParams fM = new ViewGroup.MarginLayoutParams(this.results.getInt("footerwidth"), footerheight);
                            fM.setMargins(footerx, footery, 0, 0);
                            RelativeLayout.LayoutParams fL = new RelativeLayout.LayoutParams(fM);
                            this.footer = new View(this.activity);
                            String fClr = this.results.getString("footercolor");
                            if (fClr.equals("") || fClr == null) {
                                fClr = "#E6E6E6";
                            }
                            this.footer.setBackgroundColor(Color.parseColor(fClr));
                            this.footerTitle = new TextView(this.activity);
                            this.footerTitle.setText(this.results.getString("footertext"));
                            this.footerTitle.setTextSize(10.0f);
                            int footertextheight = this.results.getInt("footertextheight");
                            String fclk = this.results.getString("footertextcolor");
                            if (fclk.equals("") || fclk == null) {
                                fclk = "#E6E6E6";
                            }
                            this.footerTitle.setTextColor(Color.parseColor(fclk));
                            ViewGroup.MarginLayoutParams fvp = new ViewGroup.MarginLayoutParams(this.results.getInt("footertextwidth"), footertextheight);
                            int fTitlex = footerx + 20;
                            int fTitley = footery + ((footerheight - footertextheight) / 2);
                            fvp.setMargins(fTitlex, fTitley, 0, 0);
                            RelativeLayout.LayoutParams fvl = new RelativeLayout.LayoutParams(fvp);
                            int buttonHeight = Math.max(toolbarheight - 5, 0);
                            float buttonFont = buttonHeight / 2;
                            this.closeBtn = new Button(this.activity);
                            this.closeBtn.setText("X");
                            this.closeBtn.setTextSize(buttonFont);
                            this.closeBtn.setTextColor(Color.parseColor(clk));
                            this.closeBtn.setPadding(0, 0, 0, 0);
                            this.closeBtn.setBackgroundColor(Color.parseColor(clr));
                            this.closeBtn.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.3
                                @Override // android.view.View.OnClickListener
                                public void onClick(View v) {
                                    AdController.this.closeUnlocker();
                                }
                            });
                            this.mlpC = new ViewGroup.MarginLayoutParams(55, buttonHeight);
                            int closex = ((toolbarwidth + toolbarx) - 55) - 5;
                            int closey = ((toolbarheight - buttonHeight) / 2) + toolbary + 2;
                            this.mlpC.setMargins(closex, closey, 0, 0);
                            this.lpC = new RelativeLayout.LayoutParams(this.mlpC);
                            if (this.mainView != null) {
                                this.mainViewParent = (ViewGroup) this.mainView.getParent();
                                this.mainViewParent.removeView(this.mainView);
                                this.layout.addView(this.mainView);
                            }
                            if (this.results.getInt("maskvisible") == 1) {
                                this.layout.addView(this.mask, mL);
                                if (this.mainView != null) {
                                    this.mainView.setOnTouchListener(new View.OnTouchListener() { // from class: com.pad.android.iappad.AdController.4
                                        @Override // android.view.View.OnTouchListener
                                        public boolean onTouch(View v, MotionEvent event) {
                                            event.setAction(3);
                                            return false;
                                        }
                                    });
                                }
                            }
                            AdLog.d("LBAdController", "Going to attach WebView to layout");
                            this.layout.addView(this.webview, wL);
                            AdLog.d("LBAdController", "WebView attached to layout");
                            if (this.results.getInt("titlevisible") == 1) {
                                this.layout.addView(this.toolbar, tL);
                                if (!this.results.getString("titletext").equals("")) {
                                    this.layout.addView(this.title, tvl);
                                }
                                if (this.results.getInt("showclose") == 1) {
                                    this.layout.addView(this.closeBtn, this.lpC);
                                }
                            }
                            if (this.results.getInt("footervisible") == 1) {
                                this.layout.addView(this.footer, fL);
                                if (!this.results.getString("footertext").equals("")) {
                                    this.layout.addView(this.footerTitle, fvl);
                                }
                            }
                            try {
                                this.loadUrl = String.valueOf(this.results.getString("adurl")) + this.sectionid;
                                this.webview.setLoadingURL(this.loadUrl);
                                this.webview.loadUrl(this.loadUrl);
                                this.loading = true;
                            } catch (Exception e5) {
                                closeUnlocker();
                                this.loading = false;
                            }
                            ViewGroup.MarginLayoutParams full = new ViewGroup.MarginLayoutParams(this.sWidth, this.sHeight);
                            full.setMargins(0, 0, 0, 0);
                            RelativeLayout.LayoutParams fullParams = new RelativeLayout.LayoutParams(full);
                            try {
                                this.activity.addContentView(this.layout, fullParams);
                            } catch (Exception e6) {
                                AdLog.e("LBAdController", "Issue attaching layout to activity - " + e6.getMessage());
                            }
                            if (this.results.getInt("pollenable") == 1 && !this.pollingInitialized && this.pollCount <= this.pollMax && this.pollCount < this.pollManual) {
                                AdLog.d("LBAdController", "Polling going to be set...");
                                this.pollingInitialized = true;
                                this.adPolling = new OfferPolling();
                                this.pollingHandler = new Handler();
                                try {
                                    AdLog.d("LBAdController", "Polling initialized every " + this.results.getInt("pollinterval") + "s");
                                    this.pollingHandler.postDelayed(this.adPolling, this.results.getInt("pollinterval") * 1000);
                                    return;
                                } catch (Exception e7) {
                                    AdLog.e("LBAdController", "Error in initializing polling - " + e7.getMessage());
                                    AdLog.printStackTrace("LBAdController", e7);
                                    return;
                                }
                            }
                            if (this.pollCount > this.pollMax && this.pollCount >= this.pollManual) {
                                this.pollingInitialized = false;
                                showManualPoll();
                                return;
                            }
                            return;
                        }
                        this.loading = false;
                        closeUnlocker();
                        return;
                    }
                    this.loading = false;
                    closeUnlocker();
                    if (this.listener != null) {
                        try {
                            AdLog.i("LBAdController", "onAdFailed triggered");
                            this.listener.onAdFailed();
                            this.adLoaded = true;
                        } catch (Exception e8) {
                            AdLog.i("LBAdController", "Error while calling onAdFailed");
                            AdLog.printStackTrace("LBAdController", e8);
                        }
                    }
                } catch (Exception e9) {
                    closeUnlocker();
                    AdLog.printStackTrace("LBAdController", e9);
                    Log.d("AdController", "Exception - " + e9.getMessage());
                }
            } catch (JSONException e10) {
                closeUnlocker();
                Log.d("AdController", "JSONException - " + e10.getMessage());
            }
        }
    }

    private void linkClicked() {
        int fTitlex;
        AdLog.i("LBAdController", "linkClicked called");
        if (!this.linkClicked) {
            AdLog.i("LBAdController", "Loading window...");
            this.homeLoaded = false;
            this.linkClicked = true;
            if (!this.loading) {
                AdLog.i("LBAdController", "remove the views if required first...");
                try {
                    try {
                        this.layout.removeView(this.webview);
                        this.layout.removeView(this.toolbar);
                        this.layout.removeView(this.title);
                        this.layout.removeView(this.footer);
                        this.layout.removeView(this.footerTitle);
                        this.layout.removeView(this.backBtn);
                        this.layout.removeView(this.fwdBtn);
                        this.layout.removeView(this.closeBtn);
                        this.layout.removeView(this.homeBtn);
                        this.layout.removeView(this.refreshBtn);
                        if (this.pollBtn != null) {
                            this.layout.removeAllViews();
                        }
                    } catch (JSONException ex) {
                        AdLog.printStackTrace("LBAdController", ex);
                        AdLog.e("LBAdController", "JSON Exception - " + ex.getMessage());
                        return;
                    }
                } catch (Exception e) {
                }
                int windowx = this.results.getInt("clickwindowx");
                int windowy = this.results.getInt("clickwindowy");
                ViewGroup.MarginLayoutParams wM = new ViewGroup.MarginLayoutParams(this.results.getInt("clickwindowwidth"), this.results.getInt("clickwindowheight"));
                wM.setMargins(windowx, windowy, 0, 0);
                RelativeLayout.LayoutParams wL = new RelativeLayout.LayoutParams(wM);
                int toolbarwidth = this.results.getInt("clicktitlewidth");
                int toolbarheight = this.results.getInt("clicktitleheight");
                int toolbarx = this.results.getInt("clicktitlex");
                int toolbary = this.results.getInt("clicktitley");
                ViewGroup.MarginLayoutParams tM = new ViewGroup.MarginLayoutParams(toolbarwidth, toolbarheight);
                tM.setMargins(toolbarx, toolbary, 0, 0);
                RelativeLayout.LayoutParams tL = new RelativeLayout.LayoutParams(tM);
                try {
                    this.toolbar.invalidate();
                } catch (Exception e2) {
                }
                this.toolbar = new View(this.activity);
                String clr = this.results.getString("clicktitlecolor");
                if (clr.equals("") || clr == null) {
                    clr = "#E6E6E6";
                }
                this.toolbar.setBackgroundColor(Color.parseColor(clr));
                try {
                    this.title.invalidate();
                } catch (Exception e3) {
                }
                this.title = new TextView(this.activity);
                this.title.setText(this.results.getString("clicktitletext"));
                String clk = this.results.getString("clicktitletextcolor");
                if (clk.equals("") || clk == null) {
                    clk = "#000000";
                }
                this.title.setTextColor(Color.parseColor(clk));
                ViewGroup.MarginLayoutParams tvp = new ViewGroup.MarginLayoutParams(this.results.getInt("clicktitletextwidth"), toolbarheight - 2);
                int titlex = toolbarx + 20;
                int titley = toolbary + 8;
                tvp.setMargins(titlex, titley, 0, 0);
                RelativeLayout.LayoutParams tvl = new RelativeLayout.LayoutParams(tvp);
                int footerx = this.results.getInt("clickfooterx");
                int footery = this.results.getInt("clickfootery");
                int footerheight = this.results.getInt("clickfooterheight");
                ViewGroup.MarginLayoutParams fM = new ViewGroup.MarginLayoutParams(this.results.getInt("clickfooterwidth"), footerheight);
                fM.setMargins(footerx, footery, 0, 0);
                RelativeLayout.LayoutParams fL = new RelativeLayout.LayoutParams(fM);
                this.footer = new View(this.activity);
                String fClr = this.results.getString("clickfootercolor");
                if (fClr.equals("") || fClr == null) {
                    fClr = "#E6E6E6";
                }
                this.footer.setBackgroundColor(Color.parseColor(fClr));
                this.footerTitle = new TextView(this.activity);
                this.footerTitle.setText(this.results.getString("clickfootertext"));
                this.footerTitle.setTextSize(10.0f);
                String fClk = this.results.getString("clickfootertextcolor");
                if (fClk.equals("") || fClk == null) {
                    fClk = "#000000";
                }
                this.footerTitle.setTextColor(Color.parseColor(fClk));
                ViewGroup.MarginLayoutParams fvp = new ViewGroup.MarginLayoutParams(this.results.getInt("clickfootertextwidth"), this.results.getInt("clickfootertextheight"));
                if (this.results.getInt("shownavigation") == 1) {
                    fTitlex = footerx + 70;
                } else {
                    fTitlex = footerx + 20;
                }
                int fTitley = footery + 5;
                fvp.setMargins(fTitlex, fTitley, 0, 0);
                RelativeLayout.LayoutParams fvl = new RelativeLayout.LayoutParams(fvp);
                int titleBtnHeight = Math.max(toolbarheight - 5, 0);
                float titleBtnFont = titleBtnHeight / 2;
                if (titleBtnFont > 10.0f) {
                    titleBtnFont = 10.0f;
                }
                int navBtnHeight = Math.max(footerheight - 5, 0);
                float navBtnFont = navBtnHeight / 2;
                if (navBtnFont > 10.0f) {
                    navBtnFont = 10.0f;
                }
                if (this.homeBtn != null) {
                    this.homeBtn.invalidate();
                }
                this.homeBtn = new Button(this.activity);
                this.homeBtn.setText("Back");
                this.homeBtn.setTextSize(navBtnFont);
                this.homeBtn.setTextColor(Color.parseColor(clk));
                this.homeBtn.setPadding(0, 0, 0, 0);
                this.homeBtn.setBackgroundColor(Color.parseColor(fClr));
                this.homeBtn.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.5
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        AdController.this.loadAd();
                    }
                });
                if (this.closeBtn != null) {
                    this.closeBtn.invalidate();
                }
                this.closeBtn = new Button(this.activity);
                this.closeBtn.setText("X");
                this.closeBtn.setTextSize(titleBtnFont);
                this.closeBtn.setTextColor(Color.parseColor(clk));
                this.closeBtn.setPadding(0, 0, 0, 0);
                this.closeBtn.setBackgroundColor(Color.parseColor(clr));
                this.closeBtn.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.6
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        AdController.this.closeUnlocker();
                    }
                });
                this.fwdBtn = new Button(this.activity);
                this.fwdBtn.setText(">");
                this.fwdBtn.setTextSize(navBtnFont);
                this.fwdBtn.setTextColor(Color.parseColor(clk));
                this.fwdBtn.setPadding(0, 0, 0, 0);
                this.fwdBtn.setBackgroundColor(Color.parseColor(fClr));
                this.fwdBtn.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.7
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        AdController.this.goForward();
                    }
                });
                if (this.backBtn != null) {
                    this.backBtn.invalidate();
                }
                this.backBtn = new Button(this.activity);
                this.backBtn.setText("<");
                this.backBtn.setTextSize(navBtnFont);
                this.backBtn.setTextColor(Color.parseColor(clk));
                this.backBtn.setPadding(0, 0, 0, 0);
                this.backBtn.setBackgroundColor(Color.parseColor(fClr));
                this.backBtn.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.8
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        AdController.this.goBack();
                    }
                });
                ViewGroup.MarginLayoutParams nB = new ViewGroup.MarginLayoutParams(30, navBtnHeight);
                int btny = ((this.results.getInt("clickfooterheight") - navBtnHeight) / 2) + footery + 3;
                nB.setMargins(footerx + 5, btny, 0, 0);
                RelativeLayout.LayoutParams bB = new RelativeLayout.LayoutParams(nB);
                nB.setMargins(footerx + 5 + 30, btny, 0, 0);
                RelativeLayout.LayoutParams fB = new RelativeLayout.LayoutParams(nB);
                this.layout.addView(this.webview, wL);
                if (this.listener != null) {
                    try {
                        if (!this.results.get("useclickwindow").equals("1")) {
                            AdLog.i("LBAdController", "onAdClicked triggered");
                            this.listener.onAdClicked();
                        }
                    } catch (Exception e4) {
                        AdLog.e("LBAdController", "error when onAdClicked triggered");
                        AdLog.printStackTrace("LBAdController", e4);
                    }
                }
                if (this.results.getInt("clicktitlevisible") == 1) {
                    this.layout.addView(this.toolbar, tL);
                    if (!this.results.getString("clicktitletext").equals("")) {
                        this.layout.addView(this.title, tvl);
                    }
                    if (this.results.getInt("showclose") == 1) {
                        this.mlpC = new ViewGroup.MarginLayoutParams(55, titleBtnHeight);
                        int closex = ((toolbarwidth + toolbarx) - 55) - 5;
                        int closey = ((toolbarheight - titleBtnHeight) / 2) + toolbary + 2;
                        this.mlpC.setMargins(closex, closey, 0, 0);
                        this.lpC = new RelativeLayout.LayoutParams(this.mlpC);
                        this.layout.addView(this.closeBtn, this.lpC);
                    }
                }
                if (this.results.getInt("clickfootervisible") == 1) {
                    this.layout.addView(this.footer, fL);
                    if (!this.results.getString("clickfootertext").equals("")) {
                        this.layout.addView(this.footerTitle, fvl);
                    }
                    if (this.results.getInt("shownavigation") == 1) {
                        this.layout.addView(this.backBtn, bB);
                        this.layout.addView(this.fwdBtn, fB);
                    }
                    if (this.results.getInt("showback") == 1) {
                        ViewGroup.MarginLayoutParams hB = new ViewGroup.MarginLayoutParams(55, navBtnHeight);
                        int footerW = this.results.getInt("clickfooterwidth");
                        int backX = ((footerW + footerx) - 55) - 5;
                        int backY = ((footerheight - navBtnHeight) / 2) + footery + 2;
                        hB.setMargins(backX, backY, 0, 0);
                        RelativeLayout.LayoutParams hL = new RelativeLayout.LayoutParams(hB);
                        this.layout.addView(this.homeBtn, hL);
                    }
                }
                if (this.results.get("useclickwindow").equals("1")) {
                    try {
                        this.loadUrl = String.valueOf(this.results.getString("adurl")) + this.sectionid;
                        this.webview.setLoadingURL(this.loadUrl);
                        this.webview.loadUrl(this.loadUrl);
                        this.loading = true;
                    } catch (Exception e5) {
                        closeUnlocker();
                        this.loading = false;
                    }
                    try {
                        ViewGroup.MarginLayoutParams full = new ViewGroup.MarginLayoutParams(this.sWidth, this.sHeight);
                        full.setMargins(0, 0, 0, 0);
                        RelativeLayout.LayoutParams fullParams = new RelativeLayout.LayoutParams(full);
                        try {
                            this.activity.addContentView(this.layout, fullParams);
                        } catch (Exception e6) {
                        }
                    } catch (Exception e7) {
                    }
                }
                AdLog.i("LBAdController", "pE = " + this.results.getInt("pollenable") + ", pI = " + this.pollingInitialized + ", pC = " + this.pollCount + ", pM = " + this.pollMax + ", pMl = " + this.pollManual);
                boolean iP = false;
                int pE = this.results.getInt("pollenable");
                if (pE == 1 && !this.pollingInitialized && this.pollCount > 0) {
                    iP = true;
                } else if (this.pollCount <= this.pollMax && this.pollCount < this.pollManual) {
                    iP = true;
                } else if (this.pollCount > this.pollMax && this.pollCount >= this.pollManual) {
                    iP = false;
                }
                if (iP) {
                    AdLog.i("LBAdController", "Polling to be initialized in linkClicked");
                    this.pollingInitialized = true;
                    this.adPolling = new OfferPolling();
                    this.pollingHandler = new Handler();
                    try {
                        AdLog.d("LBAdController", "Polling initialized every " + this.results.getInt("pollinterval") + "s");
                        this.pollingHandler.postDelayed(this.adPolling, this.results.getInt("pollinterval") * 1000);
                        return;
                    } catch (Exception e8) {
                        return;
                    }
                }
                AdLog.i("LBAdController", "Manual Polling in linkClicked");
                this.pollingInitialized = false;
                showManualPoll();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showManualPoll() {
        try {
            if (!this.results.getString("clickfootervisible").equals("1")) {
                return;
            }
        } catch (Exception e) {
        }
        this.pollingInitialized = false;
        if (this.pollingHandler != null) {
            this.pollingHandler.removeCallbacks(this.adPolling);
        }
        this.pollBtn = new Button(this.activity);
        this.pollBtn.setText("Refresh");
        int pollBtnHeight = 0;
        String clr = "#E6E6E6";
        String clk = "#000000";
        if (this.linkClicked) {
            try {
                pollBtnHeight = Math.max(this.results.getInt("clickfooterheight") - 5, 0);
                clr = this.results.getString("clickfootercolor");
                clk = this.results.getString("clicktitletextcolor");
                if (clr.equals("") || clr == null) {
                    clr = "#E6E6E6";
                }
                if (clk.equals("") || clk == null) {
                    clk = "#000000";
                }
            } catch (Exception e2) {
            }
        }
        float pollBtnFont = pollBtnHeight / 2;
        if (pollBtnFont > 10.0f) {
            pollBtnFont = 10.0f;
        }
        this.pollBtn.setPadding(0, 0, 0, 0);
        this.pollBtn.setTextSize(pollBtnFont);
        this.pollBtn.setTextColor(Color.parseColor(clk));
        this.pollBtn.setBackgroundColor(Color.parseColor(clr));
        this.pollBtn.setOnClickListener(new View.OnClickListener() { // from class: com.pad.android.iappad.AdController.9
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AdController.this.loadingDialog = ProgressDialog.show(AdController.this.activity, "", "Checking....Please Wait!", true);
                if (AdController.this.adPolling == null) {
                    AdController.this.adPolling = AdController.this.new OfferPolling();
                }
                AdController.this.pollingHandler = new Handler();
                try {
                    AdLog.i("LBAdController", "Manually Polling");
                    AdController.this.pollingHandler.post(AdController.this.adPolling);
                } catch (Exception e3) {
                    AdLog.e("LBAdController", "Error in manual polling - " + e3.getMessage());
                    AdLog.printStackTrace("LBAdController", e3);
                }
            }
        });
        if (this.linkClicked) {
            try {
                int footerx = this.results.getInt("clickfooterx");
                int footery = this.results.getInt("clickfootery");
                int footerheight = this.results.getInt("clickfooterheight");
                ViewGroup.MarginLayoutParams hB = new ViewGroup.MarginLayoutParams(55, pollBtnHeight);
                int footerW = this.results.getInt("clickfooterwidth");
                int backX = (footerW + footerx) - 120;
                int backY = ((footerheight - pollBtnHeight) / 2) + footery + 2;
                hB.setMargins(backX, backY, 0, 0);
                RelativeLayout.LayoutParams hL = new RelativeLayout.LayoutParams(hB);
                this.layout.addView(this.pollBtn, hL);
            } catch (Exception e3) {
                AdLog.e("LBAdController", "Error (add Manual Poll btn before click): " + e3.getMessage());
                AdLog.printStackTrace("LBAdController", e3);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeUnlocker() {
        if (getAdVisibility() == 0) {
            if (this.listener != null && !this.completed) {
                try {
                    AdLog.i("LBAdController", "onAdClosed triggered");
                    this.listener.onAdClosed();
                } catch (Exception e) {
                    AdLog.e("LBAdController", "error when onAdClosed triggered");
                    AdLog.printStackTrace("LBAdController", e);
                }
            }
            this.adDestroyed = true;
            AdLog.i("LBAdController", "closeUnlocker called");
            this.homeLoaded = false;
            this.linkClicked = false;
            this.pollingInitialized = false;
            if (this.pollingHandler != null) {
                this.pollingHandler.removeCallbacks(this.adPolling);
            }
            try {
                Class.forName("android.webkit.WebView").getMethod("onPause", null).invoke(this.webview, null);
            } catch (Exception e2) {
            }
            try {
                this.layout.removeAllViews();
                if (this.mainView != null) {
                    this.mainView.setOnTouchListener(null);
                }
            } catch (Exception e3) {
                AdLog.e("LBAdController", "CloseUnlocker error - " + e3.getMessage());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void goBack() {
        if (this.webview.canGoBack()) {
            this.webview.goBack();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void goForward() {
        if (this.webview.canGoForward()) {
            this.webview.goForward();
        }
    }

    private class PollRequest extends AsyncTask<String, Void, String> {
        private String pollRes;

        private PollRequest() {
            this.pollRes = null;
        }

        /* synthetic */ PollRequest(AdController adController, PollRequest pollRequest) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... pollUrl) {
            HttpEntity entity;
            AdLog.d("LBAdController", "Initial Poll Started....");
            if (pollUrl[0] == null) {
                return null;
            }
            try {
                HttpClient httpclient = new DefaultHttpClient();
                HttpGet httpget = new HttpGet(String.valueOf(pollUrl[0]) + AdController.this.sectionid);
                HttpResponse response = httpclient.execute(httpget);
                if (response.getStatusLine().getStatusCode() == 200 && (entity = response.getEntity()) != null) {
                    InputStream instream = entity.getContent();
                    this.pollRes = AdUtilFuncs.convertStreamToString(instream);
                    AdLog.d("LBAdController", "Result " + this.pollRes);
                    instream.close();
                }
            } catch (Exception e) {
                this.pollRes = null;
            }
            return this.pollRes;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String res) {
            super.onPostExecute(res);
            if (res == null || res.trim().equals("0")) {
                try {
                    if (AdController.this.results.getInt("timeopen") > 0) {
                        int time = AdController.this.results.getInt("timeopen") * 1000;
                        AdLog.i("LBAdController", "Tease Time used - ad will load after " + time + "ms");
                        Handler handl = new Handler();
                        handl.postDelayed(new Runnable() { // from class: com.pad.android.iappad.AdController.PollRequest.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AdLog.i("LBAdController", "Tease Time passed - loading Ad");
                                AdController.this.displayAd();
                            }
                        }, time);
                    } else {
                        AdController.this.displayAd();
                    }
                    return;
                } catch (Exception e) {
                    AdController.this.displayAd();
                    return;
                }
            }
            if (res.trim().equals("1")) {
                AdLog.d("LBAdController", "Going to trigger onAdAlreadyCompleted event");
                if (AdController.this.listener != null) {
                    try {
                        AdLog.i("LBAdController", "onAdAlreadyCompleted triggered");
                        AdController.this.listener.onAdAlreadyCompleted();
                    } catch (Exception e2) {
                        AdLog.e("LBAdController", "error when onAdAlreadyCompleted triggered");
                        AdLog.printStackTrace("LBAdController", e2);
                    }
                }
            }
        }
    }

    private class Polling extends AsyncTask<String, Void, String> {
        private Polling() {
        }

        /* synthetic */ Polling(AdController adController, Polling polling) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... pollUrl) {
            HttpEntity entity;
            String success = "0";
            if (pollUrl[0] == null) {
                return "0";
            }
            AdLog.d("LBAdController", "Polling...");
            try {
                HttpClient httpclient = new DefaultHttpClient();
                HttpGet httpget = new HttpGet(String.valueOf(pollUrl[0]) + AdController.this.sectionid);
                HttpResponse response = httpclient.execute(httpget);
                if (response.getStatusLine().getStatusCode() != 200 || (entity = response.getEntity()) == null) {
                    return "0";
                }
                InputStream instream = entity.getContent();
                success = AdUtilFuncs.convertStreamToString(instream);
                AdLog.d("LBAdController", "Polling Result - " + success);
                instream.close();
                return success;
            } catch (Exception e) {
                return success;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String res) {
            if (AdController.this.loadingDialog != null && AdController.this.loadingDialog.isShowing()) {
                AdController.this.loadingDialog.dismiss();
            }
            AdController.this.pollCount++;
            if (res.contains("0")) {
                try {
                    if (AdController.this.pollCount <= AdController.this.pollMax && AdController.this.pollCount < AdController.this.pollManual) {
                        AdController.this.pollingHandler.postDelayed(AdController.this.adPolling, AdController.this.results.getInt("pollinterval") * 1000);
                    } else {
                        AdController.this.showManualPoll();
                    }
                    return;
                } catch (Exception e) {
                    return;
                }
            }
            if (res.contains("1")) {
                AdController.this.completed = true;
                AdController.this.closeUnlocker();
                if (AdController.this.listener != null) {
                    try {
                        AdLog.i("LBAdController", "onAdCompleted triggered");
                        AdController.this.listener.onAdCompleted();
                    } catch (Exception e2) {
                        AdLog.e("LBAdController", "error when onAdCompleted triggered");
                        AdLog.printStackTrace("LBAdController", e2);
                    }
                }
            }
        }
    }

    class OfferPolling extends TimerTask {
        OfferPolling() {
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            Polling poll = new Polling(AdController.this, null);
            try {
                poll.execute(String.valueOf(AdController.this.results.getString("pollurl")) + AdController.this.sectionid);
            } catch (Exception e) {
            }
        }
    }

    public boolean onBackPressed() {
        if (!this.linkClicked) {
            return false;
        }
        loadAd();
        return true;
    }

    public void setAdDestroyed(boolean aD) {
        this.adDestroyed = aD;
    }

    public boolean getAdDestroyed() {
        return this.adDestroyed;
    }

    public boolean getOnAdLoaded() {
        return this.onAdLoaded;
    }

    public void setOnAdLoaded(boolean sOA) {
        this.onAdLoaded = sOA;
    }

    public boolean getAdLoaded() {
        return this.adLoaded;
    }

    public void setAdLoaded(boolean aL) {
        this.adLoaded = aL;
    }
}
