package com.pad.android.xappad;

import android.R;
import android.app.Activity;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.provider.Browser;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import com.pad.android.listener.AdNotificationListener;
import com.pad.android.listener.AdOptinListener;
import com.pad.android.util.AdLog;
import com.pad.android.util.AdOptinRequest;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AdController {
    public static final String LB_LOG = "LBAdController";
    public static final String SDK_LEVEL = "06b";
    public static final String SDK_VERSION = "3";
    private final int MAX_APP_ICONS;
    private AlarmManager am;
    private Context context;
    private boolean initialized;
    private AdNotificationListener listenNotif;
    private boolean loadIcon;
    private String notificationLaunchType;
    private boolean onRequest;
    private boolean onTimer;
    private PendingIntent pendingAlarmIntent;
    private JSONObject results;
    private String sectionid;
    private boolean useNotification;

    public AdController(Context ctx, String sid) {
        this.MAX_APP_ICONS = 5;
        this.initialized = false;
        this.results = null;
        this.useNotification = false;
        this.onTimer = false;
        this.onRequest = false;
        this.loadIcon = false;
        this.context = ctx;
        this.sectionid = sid;
    }

    public void setAsynchTask(boolean asynch) {
    }

    public AdController(Context ctx, String sid, AdNotificationListener lt) {
        this(ctx, sid);
        this.listenNotif = lt;
    }

    public void pauseNotification() {
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("SD_ADSTATUS_" + this.sectionid, "hidden");
        editor.commit();
        setPauseAlarm();
        if (this.listenNotif != null) {
            try {
                this.listenNotif.onAdNotificationPaused();
            } catch (Exception e) {
                AdLog.printStackTrace("LBAdController", e);
                AdLog.e("LBAdController", "Error with notification listener " + e.getMessage());
            }
        }
    }

    public void resumeNotification() {
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("SD_ADSTATUS_" + this.sectionid, "default");
        editor.commit();
        setResumeAlarm();
        if (this.listenNotif != null) {
            try {
                this.listenNotif.onAdNotificationResumed();
            } catch (Exception e) {
                AdLog.printStackTrace("LBAdController", e);
                AdLog.e("LBAdController", "Error with notification listener " + e.getMessage());
            }
        }
    }

    public void loadOptin(Activity act, String section, AdOptinListener oListener) {
        if (act != null) {
            if (act instanceof Activity) {
                AdOptinRequest optin = new AdOptinRequest(act, section, null, oListener);
                optin.execute(new Void[0]);
            } else {
                Log.e("com.pad.android.xappad.AdController", "Activity required for loadOptin - incorrect value passed");
            }
        }
    }

    public void initialize() {
        String type = this.useNotification ? "notification" : "icon";
        AdTask task = new AdTask(this, this.context, this.sectionid, type, this.notificationLaunchType);
        task.execute("");
    }

    public void setResults(JSONObject res) {
        if (res != null) {
            this.results = res;
        }
    }

    public void initialized() throws JSONException {
        this.initialized = true;
        if (this.results != null) {
            if (this.useNotification) {
                SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
                SharedPreferences.Editor editor = pref.edit();
                editor.putLong("SD_NOTIFICATION_REQUESTED_" + this.sectionid, System.currentTimeMillis());
                editor.commit();
            }
            if (!this.results.isNull("remindertype")) {
                setReminder();
            }
            if (!this.results.isNull("invalidateoptin")) {
                invalidateOptin();
            }
            if (this.loadIcon) {
                displayIcon();
                return;
            } else {
                setNotification();
                return;
            }
        }
        if (!this.loadIcon) {
            setAlarmFromCookie();
        }
    }

    private void invalidateOptin() {
        if (this.results != null && !this.results.isNull("invalidateoptin")) {
            String invalidate = "0";
            try {
                invalidate = this.results.getString("invalidateoptin");
            } catch (Exception e) {
            }
            if (invalidate.equals("1")) {
                SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
                SharedPreferences.Editor editor = pref.edit();
                editor.putString("SD_APP_OPTIN_SHOWN", "invalid");
                editor.commit();
            }
        }
    }

    private void setReminder() throws JSONException {
        AdLog.d("LBAdController", "setReminder called");
        if (this.results != null && !this.results.isNull("remindertype")) {
            SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
            SharedPreferences.Editor editor = pref.edit();
            String hasShown = "1";
            try {
                String reminderType = this.results.getString("remindertype");
                String text = this.results.getString("remindertext");
                String force = this.results.getString("remindershow");
                String shown = pref.getString("SD_REMINDER_SHOWN_" + this.sectionid, "0");
                boolean toShow = force.equals("always") || shown.equals("0");
                if (toShow && reminderType.equals("display")) {
                    AdLog.d("LBAdController", "Reminder Type Set - " + reminderType);
                    Intent intent = new Intent(this.context.getApplicationContext(), (Class<?>) AdReminderNotification.class);
                    intent.putExtra("sectionid", this.sectionid);
                    intent.putExtra("alarmtype", "reminder");
                    intent.putExtra("remindertitle", this.results.getString("remindertitle"));
                    intent.putExtra("remindertext", text);
                    intent.putExtra("remindericon", this.results.getString("remindericon"));
                    PendingIntent pAI = PendingIntent.getBroadcast(this.context, 0, intent, 134217728);
                    long startAt = System.currentTimeMillis() + ((long) (Integer.parseInt(this.results.getString("reminderstart")) * 1000));
                    AlarmManager reminderAlarm = (AlarmManager) this.context.getSystemService("alarm");
                    try {
                        reminderAlarm.set(0, startAt, pAI);
                    } catch (Exception ex) {
                        AdLog.printStackTrace("LBAdController", ex);
                        AdLog.d("AdController", "Error while trying to set reminder alarm - " + ex.getMessage());
                    }
                }
            } catch (Exception e) {
                AdLog.printStackTrace("LBAdController", e);
                AdLog.d("LBAdController", "Error in setReminder - " + e.getMessage());
                hasShown = "0";
            }
            AdLog.d("LBAdController", "Reminder Set, set preference to " + hasShown);
            editor.putString("SD_REMINDER_SHOWN_" + this.sectionid, hasShown);
            editor.commit();
        }
    }

    public void loadNotification() {
        AdLog.i("LBAdController", "loadNotification called");
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        String optinShowed = pref.getString("SD_APP_OPTIN_SHOWN", "notset");
        String optin = pref.getString("SD_APP_OPTIN", "notset");
        if (optinShowed.equals("notset")) {
            AdLog.i("LBAdController", "optin not set, do optin first...");
            AdOptinRequest opt = new AdOptinRequest(null, this.sectionid, this.context, new AdOptinListener() { // from class: com.pad.android.xappad.AdController.1
                @Override // com.pad.android.listener.AdOptinListener
                public void onAdOptin() {
                    AdController.this.loadNotification();
                }
            });
            opt.execute(new Void[0]);
            return;
        }
        if (!optinShowed.equals("notset") && optin.equals("0")) {
            SharedPreferences.Editor editor = pref.edit();
            editor.putString("SD_APP_OPTIN_SHOWN", "invalid");
            editor.commit();
            return;
        }
        AdLog.i("LBAdController", "optin already done - loadNotification");
        if (!this.initialized) {
            this.useNotification = true;
            this.loadIcon = false;
            this.notificationLaunchType = "App";
            this.onTimer = false;
            this.onRequest = false;
            initialize();
        }
    }

    private void setNotification() throws JSONException {
        AdLog.d("LBAdController", "setNotification called");
        if (this.results == null) {
            AdLog.e("LBAdController", "Results are null - no notification will be loaded");
            return;
        }
        try {
            if (this.onRequest) {
                loadNotificationDetails();
            } else if (this.onTimer) {
                loadNotificationTimerDetails();
            } else if (this.results.getString("show").equals("1")) {
                String notificationtype = this.results.getString("notificationtype");
                if (notificationtype.equals("Immediate")) {
                    AdLog.i("LBAdController", "Immediate notification to be fired");
                    loadNotificationOnRequest("App");
                } else if (notificationtype.equals("Recurring")) {
                    AdLog.i("LBAdController", "Recurring notification to be created");
                    loadNotificationOnTimer();
                }
            } else {
                AdLog.i("LBAdController", "Notification not be set for this user");
            }
        } catch (Exception e) {
            AdLog.printStackTrace("LBAdController", e);
        }
    }

    private void loadNotificationOnTimer() {
        AdLog.i("LBAdController", "loadNotificationOnTimer called");
        if (!this.initialized) {
            this.useNotification = true;
            this.onRequest = true;
            this.onTimer = false;
            initialize();
            return;
        }
        loadNotificationTimerDetails();
    }

    private void loadNotificationTimerDetails() {
        if (this.results == null) {
            AdLog.e("LBAdController", "Notification will not be loaded - no internet connection");
            return;
        }
        try {
            if (this.results.getString("show").equals("1")) {
                setAlarm();
            }
        } catch (Exception e) {
            AdLog.printStackTrace("LBAdController", e);
        }
    }

    private void setAlarmFromCookie() {
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        long timesAttempted = Integer.valueOf(pref.getString("SD_ALARM_ATTEMPTED_" + this.sectionid, "0")).intValue();
        long now = System.currentTimeMillis();
        long newStartTimeTime = now + 10000;
        if (timesAttempted > 25) {
            long alarminterval = pref.getLong("SD_ALARM_INTERVAL_" + this.sectionid, 0L);
            AdLog.i("LBAdController", "No internet, already tried 5 times, set it to timer " + alarminterval + "s");
            AdLog.i("LBAdController", "Times attempted = " + timesAttempted);
            newStartTimeTime = now + (1000 * alarminterval);
            editor.putLong("SD_ALARM_TIME_" + this.sectionid, newStartTimeTime);
            editor.putString("SD_ALARM_ATTEMPTED_" + this.sectionid, "0");
            editor.commit();
        } else if (timesAttempted % 5 == 0 && timesAttempted > 0) {
            newStartTimeTime = now + 600000;
            AdLog.i("LBAdController", "No internet, retry alarm in 10 mins");
            editor.putString("SD_ALARM_ATTEMPTED_" + this.sectionid, new StringBuilder().append(1 + timesAttempted).toString());
            editor.commit();
        } else {
            AdLog.i("LBAdController", "No internet, retry alarm in 10s");
            editor.putString("SD_ALARM_ATTEMPTED_" + this.sectionid, new StringBuilder().append(1 + timesAttempted).toString());
            editor.commit();
        }
        this.am = (AlarmManager) this.context.getSystemService("alarm");
        Intent intent = new Intent(this.context, (Class<?>) AdNotification.class);
        intent.putExtra("sectionid", this.sectionid);
        this.pendingAlarmIntent = PendingIntent.getBroadcast(this.context, 0, intent, 134217728);
        try {
            this.am.set(0, newStartTimeTime, this.pendingAlarmIntent);
        } catch (Exception ex) {
            AdLog.printStackTrace("LBAdController", ex);
        }
    }

    public void setPauseAlarm() {
        this.am = (AlarmManager) this.context.getSystemService("alarm");
        Intent intent = new Intent(this.context, (Class<?>) AdNotification.class);
        intent.putExtra("sectionid", this.sectionid);
        this.pendingAlarmIntent = PendingIntent.getBroadcast(this.context, 0, intent, 134217728);
        long now = System.currentTimeMillis();
        long newStartTimeTime = now + 1515098112;
        try {
            this.am.cancel(this.pendingAlarmIntent);
            this.am.set(0, newStartTimeTime, this.pendingAlarmIntent);
        } catch (Exception ex) {
            AdLog.printStackTrace("LBAdController", ex);
            Log.d("LBAdController", "Error while trying to set pause alarm - " + ex.getMessage());
        }
    }

    private void setResumeAlarm() {
        this.am = (AlarmManager) this.context.getSystemService("alarm");
        Intent intent = new Intent(this.context, (Class<?>) AdNotification.class);
        intent.putExtra("sectionid", this.sectionid);
        this.pendingAlarmIntent = PendingIntent.getBroadcast(this.context, 0, intent, 134217728);
        long now = System.currentTimeMillis();
        long newStartTimeTime = now + 1440000;
        try {
            this.am.cancel(this.pendingAlarmIntent);
            this.am.set(0, newStartTimeTime, this.pendingAlarmIntent);
        } catch (Exception ex) {
            AdLog.printStackTrace("LBAdController", ex);
            Log.d("LBAdController", "Error while trying to set pause alarm - " + ex.getMessage());
        }
    }

    private void setAlarm() {
        int resultcookie;
        AdLog.i("LBAdController", "setAlarm called");
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        if (this.results.length() > 1) {
            AdLog.i("LBAdController", "internet connection found....initialize alarm from settings - Result Length=" + this.results.length());
            try {
                int iterationcounter = Integer.valueOf(pref.getString("SD_ITERATION_COUNTER_" + this.sectionid, "0")).intValue();
                try {
                    resultcookie = Integer.valueOf(this.results.getString("notificationcookie")).intValue();
                } catch (Exception e) {
                    resultcookie = 0;
                }
                AdLog.d("LBAdController", "Values: ck=" + resultcookie + ", ic=" + iterationcounter + ", nLT=" + this.notificationLaunchType);
                this.am = (AlarmManager) this.context.getSystemService("alarm");
                Intent intent = new Intent(this.context.getApplicationContext(), (Class<?>) AdNotification.class);
                intent.putExtra("sectionid", this.sectionid);
                this.pendingAlarmIntent = PendingIntent.getBroadcast(this.context.getApplicationContext(), 0, intent, 134217728);
                if (resultcookie == 1 || ((resultcookie == 0 && iterationcounter == 0) || this.notificationLaunchType.equals("Alarm"))) {
                    AdLog.i("LBAdController", "alarm will be initialized - ck is " + resultcookie + ", ic is " + iterationcounter + ", nLT is " + this.notificationLaunchType);
                    Calendar cal = Calendar.getInstance();
                    long now = System.currentTimeMillis();
                    try {
                        int startat = Integer.parseInt(this.results.getString("notificationstart"));
                        cal.add(13, startat);
                        AdLog.d("LBAdController", "Alarm initialized - Scheduled at " + startat + ", current time = " + now);
                        AdLog.d("LBAdController", "----------------------------------------");
                        this.am.set(0, cal.getTimeInMillis(), this.pendingAlarmIntent);
                        editor.putLong("SD_ALARM_TIME_" + this.sectionid, now);
                        editor.putLong("SD_WAKE_TIME_" + this.sectionid, cal.getTimeInMillis());
                        editor.putLong("SD_ALARM_INTERVAL_" + this.sectionid, startat);
                        editor.commit();
                    } catch (Exception e2) {
                        AdLog.e("LBAdController", "Error caused while setting Alarm (if case): " + e2.getMessage());
                        AdLog.printStackTrace("LBAdController", e2);
                    }
                } else {
                    long newstartat = pref.getLong("SD_WAKE_TIME_" + this.sectionid, 0L);
                    Calendar cal2 = Calendar.getInstance();
                    long now2 = System.currentTimeMillis();
                    try {
                        cal2.setTimeInMillis(newstartat);
                        AdLog.d("LBAdController", "Alarm reset - Scheduled at " + newstartat + ", current time = " + now2);
                        AdLog.d("LBAdController", "----------------------------------------");
                        this.am.set(0, cal2.getTimeInMillis(), this.pendingAlarmIntent);
                        editor.putLong("SD_ALARM_TIME_" + this.sectionid, now2);
                        editor.putLong("SD_WAKE_TIME_" + this.sectionid, newstartat);
                        editor.commit();
                    } catch (Exception e3) {
                        AdLog.e("LBAdController", "Error caused while setting Alarm (else case): " + e3.getMessage());
                        AdLog.printStackTrace("LBAdController", e3);
                    }
                }
                return;
            } catch (Exception e4) {
                return;
            }
        }
        setAlarmFromCookie();
    }

    public void loadNotificationOnRequest(String launchtype) {
        if (launchtype.equals("App") || launchtype.equals("Alarm")) {
            AdLog.i("LBAdController", "loadNotificationOnRequest called");
            this.notificationLaunchType = launchtype;
            if (!this.initialized) {
                this.useNotification = true;
                this.onRequest = true;
                this.onTimer = false;
                initialize();
                return;
            }
            loadNotificationDetails();
            return;
        }
        AdLog.e("LBAdController", "Illegal use of loadNotificationOnRequest. LaunchType used = " + launchtype);
    }

    private void loadNotificationDetails() {
        int icon;
        AdLog.i("LBAdController", "loadNotificationDetails called");
        try {
            if (this.results == null) {
                AdLog.e("LBAdController", "Notification will not be loaded - no internet connection");
                return;
            }
            try {
                if (this.results.getString("show").equals("1")) {
                    AdLog.i("LBAdController", "notification to be fired");
                    NotificationManager notificationManager = (NotificationManager) this.context.getSystemService("notification");
                    int[] iconArray = {R.drawable.star_on, R.drawable.ic_input_add, R.drawable.btn_star_big_on, R.drawable.btn_star, R.drawable.star_big_on};
                    int icon2 = 0;
                    try {
                        icon2 = this.results.getInt("notificationicon");
                    } catch (Exception e) {
                        icon2 = 0;
                    } finally {
                        int icon3 = iconArray[icon2];
                    }
                    CharSequence text = this.results.getString("notificationtext");
                    CharSequence instruction = "";
                    try {
                        instruction = this.results.getString("notificationinstruction");
                    } catch (Exception e2) {
                    }
                    CharSequence contentTitle = this.results.getString("notificationtext");
                    CharSequence contentText = this.results.getString("notificationdescription");
                    try {
                        String toUseText = this.results.getString("notificationdisplay");
                        if (!toUseText.equals("")) {
                            if (toUseText.equals("notificationtext")) {
                                contentTitle = this.results.getString(toUseText);
                                contentText = instruction;
                            }
                        } else {
                            contentTitle = "You have 1 new message";
                            contentText = "Tap to View";
                        }
                    } catch (Exception e3) {
                    }
                    long when = System.currentTimeMillis();
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(this.results.getString("notificationurl")));
                    PendingIntent contentIntent = PendingIntent.getActivity(this.context, 0, intent, 0);
                    Notification notification = new Notification(icon, text, when);
                    notification.flags |= 16;
                    notification.setLatestEventInfo(this.context, contentTitle, contentText, contentIntent);
                    SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
                    SharedPreferences.Editor editor = pref.edit();
                    int lastid = pref.getInt("SD_NOTIFICATION_ID_" + this.sectionid, 0);
                    AdLog.d("LBAdController", "Stored Pref - " + lastid);
                    if (lastid == 0) {
                        lastid = 10001;
                    }
                    notificationManager.notify(1001, notification);
                    try {
                        editor.putLong("SD_NOTIFICATION_FIRED_" + this.sectionid, when);
                        editor.commit();
                    } catch (Exception e4) {
                    }
                    AdLog.d("LBAdController", "New Notification created with ID - " + lastid);
                    try {
                        if (this.results.getString("notificationmultiple").equals("1")) {
                            editor.putInt("SD_NOTIFICATION_ID_" + this.sectionid, lastid + 1);
                            editor.commit();
                        }
                    } catch (Exception e5) {
                    }
                }
                incrementIterationCounter();
                try {
                    if (this.onTimer || this.notificationLaunchType.equals("Alarm")) {
                        setAlarm();
                    }
                } catch (Exception e6) {
                    AdLog.e("LBAdController", "Error while setting Alarm - " + e6.getMessage());
                    AdLog.printStackTrace("LBAdController", e6);
                }
            } catch (Exception e7) {
                AdLog.printStackTrace("LBAdController", e7);
                incrementIterationCounter();
                try {
                    if (this.onTimer || this.notificationLaunchType.equals("Alarm")) {
                        setAlarm();
                    }
                } catch (Exception e8) {
                    AdLog.e("LBAdController", "Error while setting Alarm - " + e8.getMessage());
                    AdLog.printStackTrace("LBAdController", e8);
                }
            }
        } catch (Throwable th) {
            incrementIterationCounter();
            try {
                if (this.onTimer || this.notificationLaunchType.equals("Alarm")) {
                    setAlarm();
                }
            } catch (Exception e9) {
                AdLog.e("LBAdController", "Error while setting Alarm - " + e9.getMessage());
                AdLog.printStackTrace("LBAdController", e9);
            }
            throw th;
        }
    }

    private void incrementIterationCounter() {
        AdLog.i("LBAdController", "increment counter called");
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        SharedPreferences.Editor editor = pref.edit();
        int iterationcounter = Integer.valueOf(pref.getString("SD_ITERATION_COUNTER_" + this.sectionid, "0")).intValue();
        editor.putString("SD_ITERATION_COUNTER_" + this.sectionid, new StringBuilder().append(iterationcounter + 1).toString());
        editor.commit();
    }

    public void loadIcon() {
        SharedPreferences pref = this.context.getSharedPreferences("Preference", 2);
        String optinShowed = pref.getString("SD_APP_OPTIN_SHOWN", "notset");
        String optin = pref.getString("SD_APP_OPTIN_SHOWN", "notset");
        if (optinShowed.equals("notset")) {
            AdOptinRequest opt = new AdOptinRequest(null, this.sectionid, this.context, new AdOptinListener() { // from class: com.pad.android.xappad.AdController.2
                @Override // com.pad.android.listener.AdOptinListener
                public void onAdOptin() {
                    AdController.this.loadIcon();
                }
            });
            opt.execute(new Void[0]);
            return;
        }
        if (!optinShowed.equals("notset") && optin.equals("0")) {
            SharedPreferences.Editor editor = pref.edit();
            editor.putString("SD_APP_OPTIN_SHOWN", "invalid");
            editor.commit();
        } else {
            AdLog.i("LBAdController", "loadIcon called");
            if (!this.initialized) {
                this.loadIcon = true;
                initialize();
            } else {
                displayIcon();
            }
        }
    }

    private void displayIcon() {
        AdLog.i("LBAdController", "displayIcon called");
        if (this.results == null) {
            AdLog.e("LBAdController", "Results are null - no icon will be loaded");
            return;
        }
        try {
            if (this.results.get("show").equals("1") && this.context != null) {
                AdIcon ic = new AdIcon(this, null);
                ic.execute(new Void[0]);
            }
        } catch (Exception e) {
            AdLog.printStackTrace("LBAdController", e);
        }
    }

    private class AdIcon extends AsyncTask<Void, Void, Void> {
        private AdIcon() {
        }

        /* synthetic */ AdIcon(AdController adController, AdIcon adIcon) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... params) {
            try {
                AdLog.i("LBAdController", "going to display icon");
                String adText = "Search";
                try {
                    adText = AdController.this.results.getString("adname");
                } catch (Exception e) {
                    AdLog.printStackTrace("LBAdController", e);
                }
                SharedPreferences pref = AdController.this.context.getSharedPreferences("Preference", 2);
                int displayCount = pref.getInt("SD_ICON_DISPLAY_" + AdController.this.sectionid, 0);
                if (displayCount < 5) {
                    AdLog.i("LBAdController", "MAX count not passed so display icon");
                    Intent shortcutIntent = new Intent("android.intent.action.VIEW", Uri.parse(String.valueOf(AdController.this.results.getString("adurl")) + AdController.this.sectionid));
                    Intent addIntent = new Intent();
                    addIntent.putExtra("android.intent.extra.shortcut.INTENT", shortcutIntent);
                    addIntent.putExtra("android.intent.extra.shortcut.NAME", adText);
                    try {
                        String url1 = AdController.this.results.getString("adiconurl");
                        URL ulrn = new URL(url1);
                        HttpURLConnection con = (HttpURLConnection) ulrn.openConnection();
                        InputStream is = con.getInputStream();
                        Bitmap bmp = BitmapFactory.decodeStream(is);
                        Display display = ((WindowManager) AdController.this.context.getSystemService("window")).getDefaultDisplay();
                        DisplayMetrics metrics = new DisplayMetrics();
                        display.getMetrics(metrics);
                        bmp.setDensity(240);
                        Bitmap bmp2 = Bitmap.createScaledBitmap(bmp, 72, 72, true);
                        if (bmp2 != null) {
                            AdLog.i("LBAdController", "bitmap not null");
                            addIntent.putExtra("android.intent.extra.shortcut.ICON", bmp2);
                        } else {
                            AdLog.i("LBAdController", "bitmap null");
                            addIntent.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", Intent.ShortcutIconResource.fromContext(AdController.this.context, R.drawable.ic_menu_zoom));
                        }
                    } catch (Exception e2) {
                        String url2 = null;
                        try {
                            url2 = AdController.this.results.getString("adiconurl");
                        } catch (Exception e3) {
                        }
                        AdLog.i("LBAdController", "exception in getting icon - " + url2);
                        AdLog.printStackTrace("LBAdController", e2);
                        addIntent.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", Intent.ShortcutIconResource.fromContext(AdController.this.context, R.drawable.ic_menu_zoom));
                    }
                    addIntent.setAction("com.android.launcher.action.INSTALL_SHORTCUT");
                    AdController.this.context.sendBroadcast(addIntent);
                    SharedPreferences.Editor editor = pref.edit();
                    editor.putInt("SD_ICON_DISPLAY_" + AdController.this.sectionid, displayCount + 1);
                    editor.commit();
                } else {
                    AdLog.d("LBAdController", "DisplayCount = " + displayCount + ", MAX_APP_ICONS = 5");
                }
                ContentValues cv = new ContentValues();
                cv.put("title", adText);
                cv.put("url", String.valueOf(AdController.this.results.getString("adurl")) + AdController.this.sectionid);
                cv.put("bookmark", (Integer) 1);
                try {
                    AdController.this.context.getContentResolver().insert(Browser.BOOKMARKS_URI, cv);
                    AdLog.d("LBAdController", "bookmark inserted successfully");
                    return null;
                } catch (Exception e4) {
                    AdLog.e("LBAdController", "bookmark inserted error");
                    return null;
                }
            } catch (Exception e5) {
                AdLog.printStackTrace("LBAdController", e5);
                AdLog.e("LBAdController", "Error when setting icon - " + e5.getMessage());
                return null;
            }
        }
    }
}
