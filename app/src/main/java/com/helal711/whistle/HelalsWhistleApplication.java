package com.helal711.whistle;

import android.app.Application;

/**
 * Application entry point ensuring saved Light/Dark theme preferences are applied
 * immediately on process creation before any Activity inflates.
 */
public class HelalsWhistleApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        WhistlePreferences.applySavedTheme(this);
    }
}
