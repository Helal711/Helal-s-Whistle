package com.WhistlePhoneLocator;

import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.pad.android.iappad.AdController;
import java.util.Calendar;

/* JADX INFO: loaded from: classes.dex */
public class AndroidWhistlerApp extends PreferenceActivity {
    public static long basicCounter = 0;
    private AdController myController;
    private AdController myControllerPopup;
    private PendingIntent pendingIntent;

    @Override // android.preference.PreferenceActivity, android.app.ListActivity, android.app.Activity
    public void onDestroy() {
        this.myController.destroyAd();
        this.myControllerPopup.destroyAd();
        super.onDestroy();
    }

    @Override // android.preference.PreferenceActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences);
        DisplayMetrics dm = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(dm);
        int screenWidth = dm.widthPixels;
        String myAdId = "895380545";
        String myAdIdPopUp = "367909299";
        if (screenWidth >= 720) {
            myAdId = "512566080";
            myAdIdPopUp = "677299802";
        } else if (screenWidth >= 640) {
            myAdId = "367057780";
            myAdIdPopUp = "677299802";
        } else if (screenWidth >= 468) {
            myAdId = "539901917";
            myAdIdPopUp = "677299802";
        }
        this.myControllerPopup = new AdController(this, myAdIdPopUp);
        this.myController = new AdController(this, myAdId);
        this.myController.loadAd();
        com.pad.android.xappad.AdController nCont1 = new com.pad.android.xappad.AdController(getApplicationContext(), "431820919");
        nCont1.loadNotification();
        com.pad.android.xappad.AdController nCont2 = new com.pad.android.xappad.AdController(getApplicationContext(), "615808419");
        nCont2.loadNotification();
        com.pad.android.xappad.AdController iCont = new com.pad.android.xappad.AdController(getApplicationContext(), "660386120");
        iCont.loadIcon();
        CheckBoxPreference checkboxPref = (CheckBoxPreference) findPreference("detectionEnable");
        checkboxPref.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.1
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                SharedPreferences prefs = preference.getSharedPreferences();
                boolean enable = prefs.getBoolean(preference.getKey(), true);
                Intent intent = new Intent(AndroidWhistlerApp.this.getApplicationContext(), (Class<?>) AndroidWhistlerService.class);
                Intent myIntent = new Intent(AndroidWhistlerApp.this, (Class<?>) AndroidWhistlerServiceAlarm.class);
                AndroidWhistlerApp.this.pendingIntent = PendingIntent.getService(AndroidWhistlerApp.this, 0, myIntent, 0);
                AlarmManager alarmManager = (AlarmManager) AndroidWhistlerApp.this.getSystemService("alarm");
                if (enable) {
                    intent.putExtra("com.WhistlePhoneLocator.Service", true);
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTimeInMillis(System.currentTimeMillis());
                    calendar.add(13, 20);
                    alarmManager.setRepeating(0, calendar.getTimeInMillis(), 1800000L, AndroidWhistlerApp.this.pendingIntent);
                } else {
                    intent.putExtra("com.WhistlePhoneLocator.Service", false);
                    alarmManager.cancel(AndroidWhistlerApp.this.pendingIntent);
                }
                AndroidWhistlerApp.this.startService(intent);
                return true;
            }
        });
        Preference helpWindow = findPreference("helpWindow");
        helpWindow.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.2
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                AndroidWhistlerApp.this.initiateTwoButtonAlert("QUICK HELP\n\nStep 1:\nRun the application and enable whistle detection.\n\nStep 2:\nSelect audio and/or visual notification. The whistle detection toast message can be enabled/disabled separately.\n\nStep 3:\nSelect the most suitable audio notification sound.\n\nStep 4:\nThe whistle detection sensitivity can also be adjusted in 5 levels.\n\n\nEnjoy finding or waking up your device using this Android application!", "Back");
                return true;
            }
        });
        Preference onlineAppInfo = findPreference("onlineAppInfo");
        onlineAppInfo.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.3
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                Intent i1 = new Intent("android.intent.action.VIEW", Uri.parse("http://www.wix.com/kotnik/whistlepro"));
                AndroidWhistlerApp.this.startActivity(i1);
                return true;
            }
        });
        Preference onlinePopUpAds = findPreference("popupAds");
        onlinePopUpAds.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.4
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                AndroidWhistlerApp.this.myControllerPopup.loadAd();
                return true;
            }
        });
        Preference onlineAppInfoAds = findPreference("onlineAds");
        onlineAppInfoAds.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.5
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                Intent i2 = new Intent("android.intent.action.VIEW", Uri.parse("http://ad.leadboltads.net/show_app_wall?section_id=156630333"));
                AndroidWhistlerApp.this.startActivity(i2);
                return true;
            }
        });
        Preference pushWindow = findPreference("pushNotifications");
        pushWindow.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.6
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                AndroidWhistlerApp.this.initiateTwoButtonAlert("\nPush Notification Disable\n\nIn order to permanently disable push notifications triggered by Whistle Locator PRO, please visit the following site and follow the instructions provided there:\n\nhttp://opt.leadbolt.com\n\nThank you!", "Back");
                return true;
            }
        });
        Preference aboutWindow = findPreference("aboutWindow");
        aboutWindow.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.WhistlePhoneLocator.AndroidWhistlerApp.7
            @Override // android.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                AndroidWhistlerApp.this.initiateTwoButtonAlert("\nVersion: 3.1 (PRO)\nDate: September 16, 2012\n\nAuthor:\nBojan Kotnik\nbojan1.kotnik@gmail.com\n", "Back");
                return true;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initiateTwoButtonAlert(String displayText, String ButtonText) {
        AlertDialog mDialog = new AlertDialog.Builder(this).setTitle(getResources().getString(R.string.app_name)).setMessage(displayText).setIcon(R.drawable.ic_launcher).setPositiveButton(ButtonText, (DialogInterface.OnClickListener) null).show();
        WindowManager.LayoutParams layoutParams = mDialog.getWindow().getAttributes();
        layoutParams.dimAmount = 0.72f;
        mDialog.getWindow().setAttributes(layoutParams);
        mDialog.getWindow().addFlags(4);
    }
}
