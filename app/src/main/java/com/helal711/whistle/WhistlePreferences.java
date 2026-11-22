package com.helal711.whistle;

import android.content.Context;
import android.content.SharedPreferences;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.core.os.LocaleListCompat;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Centralized SharedPreferences manager preserving all legacy Helal's Whistle preference keys
 * while adding modern alert volume, alert duration, theme, localization, and detection history.
 */
public final class WhistlePreferences {
    // Original preserved keys
    public static final String KEY_DETECTION_ENABLE = "detectionEnable";
    public static final String KEY_SENSITIVITY = "selectSensitivity";
    public static final String KEY_AUDIO_NOTIFICATION = "audioNotification";
    public static final String KEY_SELECT_AUDIO = "selectAudio";
    public static final String KEY_MAX_VOLUME = "maxVolume";
    public static final String KEY_VISUAL_NOTIFICATION = "visualNotification";
    public static final String KEY_TOAST_NOTIFICATION = "toastNotification";

    // New modern preference keys
    public static final String KEY_ALERT_VOLUME_PERCENT = "alertVolumePercent";
    public static final String KEY_ALERT_DURATION_SEC = "alertDurationSec";
    public static final String KEY_THEME_MODE = "themeMode";
    public static final String KEY_APP_LANGUAGE = "appLanguage";
    public static final String KEY_DETECTION_HISTORY = "detectionHistoryJson";
    public static final String KEY_NOTIF_PERM_PROMPTED = "notifPermPrompted";

    public static final String THEME_SYSTEM = "system";
    public static final String THEME_DARK = "dark";
    public static final String THEME_LIGHT = "light";

    public static final String LANG_SYSTEM = "system";
    public static final String LANG_ENGLISH = "en";
    public static final String LANG_BENGALI = "bn";

    private static final int MAX_HISTORY_ITEMS = 30;

    private WhistlePreferences() {
    }

    public static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(
                context.getPackageName() + "_preferences",
                Context.MODE_PRIVATE
        );
    }

    public static boolean isDetectionEnabled(Context context) {
        return prefs(context).getBoolean(KEY_DETECTION_ENABLE, false);
    }

    public static void setDetectionEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_DETECTION_ENABLE, enabled).apply();
    }

    public static short getSensitivity(Context context) {
        String raw = prefs(context).getString(KEY_SENSITIVITY, "3");
        try {
            int parsed = Integer.parseInt(raw);
            return (short) Math.max(1, Math.min(5, parsed));
        } catch (NumberFormatException e) {
            return 3;
        }
    }

    public static void setSensitivity(Context context, int level) {
        int clamped = Math.max(1, Math.min(5, level));
        prefs(context).edit().putString(KEY_SENSITIVITY, String.valueOf(clamped)).apply();
    }

    public static boolean isAudioEnabled(Context context) {
        return prefs(context).getBoolean(KEY_AUDIO_NOTIFICATION, true);
    }

    public static void setAudioEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_AUDIO_NOTIFICATION, enabled).apply();
    }

    public static String getSelectedAudioKey(Context context) {
        String key = prefs(context).getString(KEY_SELECT_AUDIO, "6");
        return (key == null || key.isEmpty()) ? "6" : key;
    }

    public static void setSelectedAudioKey(Context context, String key) {
        prefs(context).edit().putString(KEY_SELECT_AUDIO, key).apply();
    }

    public static boolean isMaxVolumeEnabled(Context context) {
        return prefs(context).getBoolean(KEY_MAX_VOLUME, false);
    }

    public static void setMaxVolumeEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_MAX_VOLUME, enabled).apply();
    }

    public static boolean isVisualWakeEnabled(Context context) {
        return prefs(context).getBoolean(KEY_VISUAL_NOTIFICATION, true);
    }

    public static void setVisualWakeEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_VISUAL_NOTIFICATION, enabled).apply();
    }

    public static boolean isToastEnabled(Context context) {
        return prefs(context).getBoolean(KEY_TOAST_NOTIFICATION, false);
    }

    public static void setToastEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_TOAST_NOTIFICATION, enabled).apply();
    }

    public static int getAlertVolumePercent(Context context) {
        int val = prefs(context).getInt(KEY_ALERT_VOLUME_PERCENT, 85);
        return Math.max(10, Math.min(100, val));
    }

    public static void setAlertVolumePercent(Context context, int percent) {
        int clamped = Math.max(10, Math.min(100, percent));
        prefs(context).edit().putInt(KEY_ALERT_VOLUME_PERCENT, clamped).apply();
    }

    /**
     * Returns configured alert playback duration in seconds, or 0 for full audio clip.
     */
    public static int getAlertDurationSec(Context context) {
        return prefs(context).getInt(KEY_ALERT_DURATION_SEC, 0);
    }

    public static void setAlertDurationSec(Context context, int seconds) {
        prefs(context).edit().putInt(KEY_ALERT_DURATION_SEC, Math.max(0, seconds)).apply();
    }

    public static String getThemeMode(Context context) {
        String mode = prefs(context).getString(KEY_THEME_MODE, THEME_DARK);
        return mode != null ? mode : THEME_DARK;
    }

    public static void setThemeMode(Context context, String mode) {
        prefs(context).edit().putString(KEY_THEME_MODE, mode).apply();
        applySavedTheme(context);
    }

    public static void applySavedTheme(Context context) {
        String mode = getThemeMode(context);
        if (THEME_LIGHT.equals(mode)) {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
        } else if (THEME_DARK.equals(mode)) {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES);
        } else {
            AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_FOLLOW_SYSTEM);
        }
    }

    public static String getAppLanguage(Context context) {
        String lang = prefs(context).getString(KEY_APP_LANGUAGE, LANG_SYSTEM);
        return lang != null ? lang : LANG_SYSTEM;
    }

    public static void setAppLanguage(Context context, String langCode) {
        prefs(context).edit().putString(KEY_APP_LANGUAGE, langCode).apply();
        if (LANG_ENGLISH.equals(langCode)) {
            AppCompatDelegate.setApplicationLocales(LocaleListCompat.forLanguageTags("en"));
        } else if (LANG_BENGALI.equals(langCode)) {
            AppCompatDelegate.setApplicationLocales(LocaleListCompat.forLanguageTags("bn"));
        } else {
            AppCompatDelegate.setApplicationLocales(LocaleListCompat.getEmptyLocaleList());
        }
    }

    public static boolean hasPromptedNotificationPermission(Context context) {
        return prefs(context).getBoolean(KEY_NOTIF_PERM_PROMPTED, false);
    }

    public static void markNotificationPermissionPrompted(Context context) {
        prefs(context).edit().putBoolean(KEY_NOTIF_PERM_PROMPTED, true).apply();
    }

    public static int resolveAudioResource(String audioKey) {
        if ("1".equals(audioKey)) return R.raw.audio1;
        if ("2".equals(audioKey)) return R.raw.audio2;
        if ("3".equals(audioKey)) return R.raw.audio3;
        if ("4".equals(audioKey)) return R.raw.audio4;
        if ("5".equals(audioKey)) return R.raw.audio5;
        if ("7".equals(audioKey)) return R.raw.audio7;
        if ("8".equals(audioKey)) return R.raw.audio8;
        if ("9".equals(audioKey)) return R.raw.audio9;
        if ("10".equals(audioKey)) return R.raw.audio10;
        if ("11".equals(audioKey)) return R.raw.audio11;
        if ("12".equals(audioKey)) return R.raw.audio12;
        if ("13".equals(audioKey)) return R.raw.audio13;
        return R.raw.audio6;
    }

    public static String getAudioDisplayName(Context context, String audioKey) {
        String[] labels = context.getResources().getStringArray(R.array.listDisplayWord);
        String[] values = context.getResources().getStringArray(R.array.listReturnValue);
        for (int i = 0; i < values.length && i < labels.length; i++) {
            if (values[i].equals(audioKey)) {
                return labels[i];
            }
        }
        return labels.length > 5 ? labels[5] : "Whistle!";
    }

    public static String getSensitivityLabel(Context context, int level) {
        String[] labels = context.getResources().getStringArray(R.array.listDisplayWordSens);
        int idx = Math.max(0, Math.min(labels.length - 1, level - 1));
        return labels[idx];
    }

    public static String getSensitivityShortLabel(Context context, int level) {
        switch (level) {
            case 1: return context.getString(R.string.sens_short_1);
            case 2: return context.getString(R.string.sens_short_2);
            case 4: return context.getString(R.string.sens_short_4);
            case 5: return context.getString(R.string.sens_short_5);
            case 3:
            default: return context.getString(R.string.sens_short_3);
        }
    }

    public static String getSensitivityDescription(Context context, int level) {
        switch (level) {
            case 1: return context.getString(R.string.sens_desc_1);
            case 2: return context.getString(R.string.sens_desc_2);
            case 4: return context.getString(R.string.sens_desc_4);
            case 5: return context.getString(R.string.sens_desc_5);
            case 3:
            default: return context.getString(R.string.sens_desc_3);
        }
    }

    public static final class DetectionEvent {
        public final long timestampMs;
        public final String soundKey;
        public final int sensitivityLevel;
        public final int frequencyHz;

        public DetectionEvent(long timestampMs, String soundKey, int sensitivityLevel, int frequencyHz) {
            this.timestampMs = timestampMs;
            this.soundKey = soundKey;
            this.sensitivityLevel = sensitivityLevel;
            this.frequencyHz = frequencyHz;
        }
    }

    public static synchronized void recordDetectionEvent(
            Context context,
            String soundKey,
            int sensitivityLevel,
            int frequencyHz
    ) {
        List<DetectionEvent> existing = getDetectionHistory(context);
        List<DetectionEvent> updated = new ArrayList<>();
        updated.add(new DetectionEvent(System.currentTimeMillis(), soundKey, sensitivityLevel, frequencyHz));
        for (int i = 0; i < existing.size() && updated.size() < MAX_HISTORY_ITEMS; i++) {
            updated.add(existing.get(i));
        }

        JSONArray array = new JSONArray();
        for (DetectionEvent event : updated) {
            try {
                JSONObject obj = new JSONObject();
                obj.put("ts", event.timestampMs);
                obj.put("sound", event.soundKey);
                obj.put("sens", event.sensitivityLevel);
                obj.put("hz", event.frequencyHz);
                array.put(obj);
            } catch (JSONException ignored) {
            }
        }
        prefs(context).edit().putString(KEY_DETECTION_HISTORY, array.toString()).apply();
    }

    public static synchronized List<DetectionEvent> getDetectionHistory(Context context) {
        List<DetectionEvent> result = new ArrayList<>();
        String raw = prefs(context).getString(KEY_DETECTION_HISTORY, null);
        if (raw == null || raw.isEmpty()) {
            return result;
        }
        try {
            JSONArray array = new JSONArray(raw);
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.optJSONObject(i);
                if (obj != null) {
                    result.add(new DetectionEvent(
                            obj.optLong("ts", 0L),
                            obj.optString("sound", "6"),
                            obj.optInt("sens", 3),
                            obj.optInt("hz", 1800)
                    ));
                }
            }
        } catch (JSONException ignored) {
        }
        return result;
    }

    public static synchronized void clearDetectionHistory(Context context) {
        prefs(context).edit().remove(KEY_DETECTION_HISTORY).apply();
    }
}
