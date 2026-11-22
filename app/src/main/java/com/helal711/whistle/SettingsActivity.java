package com.helal711.whistle;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.Settings;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.materialswitch.MaterialSwitch;
import com.google.android.material.slider.Slider;

/**
 * Redesigned Settings screen organizing Detection Settings, Alert Settings,
 * App Preferences (Theme, Language, Notification Channels), System Status
 * (Battery Optimization & Permissions), and About into clean Material 3 cards.
 * Every control is bound to real application behavior.
 */
public class SettingsActivity extends AppCompatActivity {
    private static final int[] DURATION_OPTIONS_SEC = {0, 5, 10, 15, 20, 30};

    private View settingsTopBar;
    private View settingsContent;
    private ImageButton btnBack;

    // 1. Detection Settings
    private MaterialSwitch switchBgDetection;
    private View rowSensitivity;
    private TextView txtSettingSensitivityValue;
    private MaterialSwitch switchScreenWake;
    private MaterialSwitch switchToast;

    // 2. Alert Settings
    private MaterialSwitch switchAudioEnabled;
    private View rowAlertSound;
    private TextView txtSettingSoundValue;
    private MaterialSwitch switchMaxVolume;
    private TextView txtVolumePercent;
    private Slider sliderAlertVolume;
    private View rowAlertDuration;
    private TextView txtAlertDurationValue;

    // 3. App Preferences
    private View rowTheme;
    private TextView txtThemeValue;
    private View rowLanguage;
    private TextView txtLanguageValue;
    private View rowNotifPrefs;

    // 4. System
    private View rowBatteryOpt;
    private TextView txtBatteryStatus;
    private View rowMicPermission;
    private TextView txtMicPermStatus;
    private View rowNotifPermission;
    private TextView txtNotifPermStatus;

    // 5. About
    private View rowQuickHelp;

    private BottomSheetDialog activeSoundSheet;
    private boolean updatingUi = false;
    private boolean pendingStartAfterMicPerm = false;

    private final ActivityResultLauncher<String> micPermissionLauncher =
            registerForActivityResult(new ActivityResultContracts.RequestPermission(), granted -> {
                updateSystemStatusRows();
                if (granted && pendingStartAfterMicPerm) {
                    pendingStartAfterMicPerm = false;
                    startDetectionService();
                } else if (!granted && pendingStartAfterMicPerm) {
                    pendingStartAfterMicPerm = false;
                    WhistlePreferences.setDetectionEnabled(this, false);
                    Toast.makeText(this, R.string.permission_audio_required, Toast.LENGTH_LONG).show();
                    refreshUi();
                }
            });

    private final ActivityResultLauncher<String> notifPermissionLauncher =
            registerForActivityResult(new ActivityResultContracts.RequestPermission(), granted ->
                    updateSystemStatusRows());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
        setContentView(R.layout.activity_settings);

        configureSystemBarsAppearance();
        bindViews();
        applyEdgeToEdgeInsets();
        setupListeners();
        refreshUi();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshUi();
    }

    @Override
    protected void onDestroy() {
        if (activeSoundSheet != null && activeSoundSheet.isShowing()) {
            activeSoundSheet.dismiss();
        }
        super.onDestroy();
    }

    private void configureSystemBarsAppearance() {
        boolean isNightMode = (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        WindowInsetsControllerCompat controller =
                WindowCompat.getInsetsController(getWindow(), getWindow().getDecorView());
        if (controller != null) {
            controller.setAppearanceLightStatusBars(!isNightMode);
            controller.setAppearanceLightNavigationBars(!isNightMode);
        }
    }

    private void bindViews() {
        settingsTopBar = findViewById(R.id.settingsTopBar);
        settingsContent = findViewById(R.id.settingsContent);
        btnBack = findViewById(R.id.btnBack);

        switchBgDetection = findViewById(R.id.switchBgDetection);
        rowSensitivity = findViewById(R.id.rowSensitivity);
        txtSettingSensitivityValue = findViewById(R.id.txtSettingSensitivityValue);
        switchScreenWake = findViewById(R.id.switchScreenWake);
        switchToast = findViewById(R.id.switchToast);

        switchAudioEnabled = findViewById(R.id.switchAudioEnabled);
        rowAlertSound = findViewById(R.id.rowAlertSound);
        txtSettingSoundValue = findViewById(R.id.txtSettingSoundValue);
        switchMaxVolume = findViewById(R.id.switchMaxVolume);
        txtVolumePercent = findViewById(R.id.txtVolumePercent);
        sliderAlertVolume = findViewById(R.id.sliderAlertVolume);
        rowAlertDuration = findViewById(R.id.rowAlertDuration);
        txtAlertDurationValue = findViewById(R.id.txtAlertDurationValue);

        rowTheme = findViewById(R.id.rowTheme);
        txtThemeValue = findViewById(R.id.txtThemeValue);
        rowLanguage = findViewById(R.id.rowLanguage);
        txtLanguageValue = findViewById(R.id.txtLanguageValue);
        rowNotifPrefs = findViewById(R.id.rowNotifPrefs);

        rowBatteryOpt = findViewById(R.id.rowBatteryOpt);
        txtBatteryStatus = findViewById(R.id.txtBatteryStatus);
        rowMicPermission = findViewById(R.id.rowMicPermission);
        txtMicPermStatus = findViewById(R.id.txtMicPermStatus);
        rowNotifPermission = findViewById(R.id.rowNotifPermission);
        txtNotifPermStatus = findViewById(R.id.txtNotifPermStatus);

        rowQuickHelp = findViewById(R.id.rowQuickHelp);
    }

    private void applyEdgeToEdgeInsets() {
        final int topBase = settingsTopBar.getPaddingTop();
        final int contentBottomBase = settingsContent.getPaddingBottom();

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.settingsRoot), (v, windowInsets) -> {
            Insets insets = windowInsets.getInsets(WindowInsetsCompat.Type.systemBars());
            settingsTopBar.setPadding(
                    settingsTopBar.getPaddingLeft(),
                    topBase + insets.top,
                    settingsTopBar.getPaddingRight(),
                    settingsTopBar.getPaddingBottom()
            );
            settingsContent.setPadding(
                    settingsContent.getPaddingLeft(),
                    settingsContent.getPaddingTop(),
                    settingsContent.getPaddingRight(),
                    contentBottomBase + insets.bottom
            );
            return windowInsets;
        });
    }

    private void setupListeners() {
        btnBack.setOnClickListener(v -> finish());

        // Detection Settings
        switchBgDetection.setOnCheckedChangeListener((buttonView, isChecked) -> {
            if (updatingUi) {
                return;
            }
            if (isChecked) {
                if (hasAudioPermission()) {
                    startDetectionService();
                } else {
                    pendingStartAfterMicPerm = true;
                    micPermissionLauncher.launch(Manifest.permission.RECORD_AUDIO);
                }
            } else {
                WhistlePreferences.setDetectionEnabled(this, false);
                Intent stopIntent = new Intent(this, AndroidWhistlerService.class);
                stopIntent.setAction(AndroidWhistlerService.ACTION_STOP);
                stopService(stopIntent);
            }
        });

        rowSensitivity.setOnClickListener(v -> showSensitivityPicker());

        switchScreenWake.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingUi) {
                WhistlePreferences.setVisualWakeEnabled(this, checked);
            }
        });

        switchToast.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingUi) {
                WhistlePreferences.setToastEnabled(this, checked);
            }
        });

        // Alert Settings
        switchAudioEnabled.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingUi) {
                WhistlePreferences.setAudioEnabled(this, checked);
            }
        });

        rowAlertSound.setOnClickListener(v -> {
            activeSoundSheet = SoundPickerHelper.showSoundPicker(this, (key, title) ->
                    txtSettingSoundValue.setText(title));
        });

        switchMaxVolume.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingUi) {
                WhistlePreferences.setMaxVolumeEnabled(this, checked);
                sliderAlertVolume.setEnabled(!checked);
            }
        });

        sliderAlertVolume.addOnChangeListener((slider, value, fromUser) -> {
            int pct = Math.round(value);
            txtVolumePercent.setText(getString(R.string.setting_volume_value, pct));
            if (fromUser) {
                WhistlePreferences.setAlertVolumePercent(this, pct);
            }
        });

        rowAlertDuration.setOnClickListener(v -> showDurationPicker());

        // App Preferences
        rowTheme.setOnClickListener(v -> showThemePicker());
        rowLanguage.setOnClickListener(v -> showLanguagePicker());
        rowNotifPrefs.setOnClickListener(v -> openNotificationChannelSettings());

        // System
        rowBatteryOpt.setOnClickListener(v -> openBatteryOptimizationSettings());

        rowMicPermission.setOnClickListener(v -> {
            if (!hasAudioPermission()) {
                pendingStartAfterMicPerm = false;
                micPermissionLauncher.launch(Manifest.permission.RECORD_AUDIO);
            } else {
                openAppDetailsSettings();
            }
        });

        rowNotifPermission.setOnClickListener(v -> {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                    && !hasNotificationPermission()) {
                notifPermissionLauncher.launch(Manifest.permission.POST_NOTIFICATIONS);
            } else {
                openNotificationChannelSettings();
            }
        });

        // About
        rowQuickHelp.setOnClickListener(v -> new MaterialAlertDialogBuilder(this)
                .setTitle(R.string.setting_help_title)
                .setMessage(R.string.help_dialog_body)
                .setPositiveButton(R.string.btn_close, null)
                .show());
    }

    private void startDetectionService() {
        WhistlePreferences.setDetectionEnabled(this, true);
        Intent intent = new Intent(this, AndroidWhistlerService.class);
        intent.setAction(AndroidWhistlerService.ACTION_START);
        ContextCompat.startForegroundService(this, intent);
    }

    private void refreshUi() {
        updatingUi = true;

        switchBgDetection.setChecked(AndroidWhistlerService.isServiceRunning);
        int sens = WhistlePreferences.getSensitivity(this);
        txtSettingSensitivityValue.setText(WhistlePreferences.getSensitivityLabel(this, sens));
        switchScreenWake.setChecked(WhistlePreferences.isVisualWakeEnabled(this));
        switchToast.setChecked(WhistlePreferences.isToastEnabled(this));

        switchAudioEnabled.setChecked(WhistlePreferences.isAudioEnabled(this));
        String soundKey = WhistlePreferences.getSelectedAudioKey(this);
        txtSettingSoundValue.setText(WhistlePreferences.getAudioDisplayName(this, soundKey));

        boolean maxVol = WhistlePreferences.isMaxVolumeEnabled(this);
        switchMaxVolume.setChecked(maxVol);
        int volPercent = WhistlePreferences.getAlertVolumePercent(this);
        // Snap value to slider stepSize of 5
        int snappedVol = Math.max(10, Math.min(100, (Math.round(volPercent / 5.0f) * 5)));
        sliderAlertVolume.setValue(snappedVol);
        sliderAlertVolume.setEnabled(!maxVol);
        txtVolumePercent.setText(getString(R.string.setting_volume_value, snappedVol));

        int durationSec = WhistlePreferences.getAlertDurationSec(this);
        txtAlertDurationValue.setText(formatDuration(durationSec));

        txtThemeValue.setText(formatThemeMode(WhistlePreferences.getThemeMode(this)));
        txtLanguageValue.setText(formatLanguage(WhistlePreferences.getAppLanguage(this)));

        updateSystemStatusRows();

        updatingUi = false;
    }

    private void updateSystemStatusRows() {
        PowerManager pm = (PowerManager) getSystemService(POWER_SERVICE);
        boolean ignoringBatteryOpt = pm != null && pm.isIgnoringBatteryOptimizations(getPackageName());
        txtBatteryStatus.setText(ignoringBatteryOpt
                ? R.string.battery_unrestricted
                : R.string.battery_optimized);

        boolean micGranted = hasAudioPermission();
        txtMicPermStatus.setText(micGranted ? R.string.perm_granted : R.string.perm_denied);
        txtMicPermStatus.setTextColor(ContextCompat.getColor(
                this,
                micGranted ? R.color.brand_success : R.color.brand_warning
        ));

        boolean notifGranted = hasNotificationPermission();
        txtNotifPermStatus.setText(notifGranted ? R.string.perm_granted : R.string.perm_denied);
        txtNotifPermStatus.setTextColor(ContextCompat.getColor(
                this,
                notifGranted ? R.color.brand_success : R.color.brand_warning
        ));
    }

    private boolean hasAudioPermission() {
        return ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO)
                == PackageManager.PERMISSION_GRANTED;
    }

    private boolean hasNotificationPermission() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            return true;
        }
        return ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS)
                == PackageManager.PERMISSION_GRANTED;
    }

    private void showSensitivityPicker() {
        String[] labels = getResources().getStringArray(R.array.listDisplayWordSens);
        int checkedIndex = Math.max(0, Math.min(labels.length - 1, WhistlePreferences.getSensitivity(this) - 1));

        new MaterialAlertDialogBuilder(this)
                .setTitle(R.string.setting_sensitivity_title)
                .setSingleChoiceItems(labels, checkedIndex, (dialog, which) -> {
                    int level = which + 1;
                    WhistlePreferences.setSensitivity(this, level);
                    txtSettingSensitivityValue.setText(labels[which]);
                    if (AndroidWhistlerService.isServiceRunning) {
                        Intent refreshIntent = new Intent(this, AndroidWhistlerService.class);
                        refreshIntent.setAction(AndroidWhistlerService.ACTION_REFRESH_NOTIFICATION);
                        try {
                            startService(refreshIntent);
                        } catch (Exception ignored) {
                        }
                    }
                    dialog.dismiss();
                })
                .setNegativeButton(R.string.btn_close, null)
                .show();
    }

    private void showDurationPicker() {
        String[] labels = new String[DURATION_OPTIONS_SEC.length];
        int currentSec = WhistlePreferences.getAlertDurationSec(this);
        int checkedIndex = 0;

        for (int i = 0; i < DURATION_OPTIONS_SEC.length; i++) {
            labels[i] = formatDuration(DURATION_OPTIONS_SEC[i]);
            if (DURATION_OPTIONS_SEC[i] == currentSec) {
                checkedIndex = i;
            }
        }

        new MaterialAlertDialogBuilder(this)
                .setTitle(R.string.setting_duration_title)
                .setSingleChoiceItems(labels, checkedIndex, (dialog, which) -> {
                    int selected = DURATION_OPTIONS_SEC[which];
                    WhistlePreferences.setAlertDurationSec(this, selected);
                    txtAlertDurationValue.setText(formatDuration(selected));
                    dialog.dismiss();
                })
                .setNegativeButton(R.string.btn_close, null)
                .show();
    }

    private void showThemePicker() {
        final String[] values = {
                WhistlePreferences.THEME_DARK,
                WhistlePreferences.THEME_LIGHT,
                WhistlePreferences.THEME_SYSTEM
        };
        final String[] labels = {
                getString(R.string.theme_dark),
                getString(R.string.theme_light),
                getString(R.string.theme_system)
        };
        String current = WhistlePreferences.getThemeMode(this);
        int checkedIndex = 0;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(current)) {
                checkedIndex = i;
                break;
            }
        }

        new MaterialAlertDialogBuilder(this)
                .setTitle(R.string.setting_theme_title)
                .setSingleChoiceItems(labels, checkedIndex, (dialog, which) -> {
                    WhistlePreferences.setThemeMode(this, values[which]);
                    txtThemeValue.setText(labels[which]);
                    dialog.dismiss();
                })
                .setNegativeButton(R.string.btn_close, null)
                .show();
    }

    private void showLanguagePicker() {
        final String[] values = {
                WhistlePreferences.LANG_SYSTEM,
                WhistlePreferences.LANG_ENGLISH,
                WhistlePreferences.LANG_BENGALI
        };
        final String[] labels = {
                getString(R.string.lang_system),
                getString(R.string.lang_english),
                getString(R.string.lang_bengali)
        };
        String current = WhistlePreferences.getAppLanguage(this);
        int checkedIndex = 0;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(current)) {
                checkedIndex = i;
                break;
            }
        }

        new MaterialAlertDialogBuilder(this)
                .setTitle(R.string.setting_language_title)
                .setSingleChoiceItems(labels, checkedIndex, (dialog, which) -> {
                    WhistlePreferences.setAppLanguage(this, values[which]);
                    txtLanguageValue.setText(labels[which]);
                    dialog.dismiss();
                })
                .setNegativeButton(R.string.btn_close, null)
                .show();
    }

    private void openNotificationChannelSettings() {
        AndroidWhistlerService.ensureNotificationChannel(this);
        Intent intent;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            intent = new Intent(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS);
            intent.putExtra(Settings.EXTRA_APP_PACKAGE, getPackageName());
            intent.putExtra(Settings.EXTRA_CHANNEL_ID, AndroidWhistlerService.CHANNEL_ID);
        } else {
            intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
            intent.setData(Uri.fromParts("package", getPackageName(), null));
        }
        try {
            startActivity(intent);
        } catch (Exception e) {
            openAppDetailsSettings();
        }
    }

    private void openBatteryOptimizationSettings() {
        Intent intent = new Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS);
        try {
            startActivity(intent);
        } catch (Exception e) {
            openAppDetailsSettings();
        }
    }

    private void openAppDetailsSettings() {
        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
        intent.setData(Uri.fromParts("package", getPackageName(), null));
        try {
            startActivity(intent);
        } catch (Exception ignored) {
        }
    }

    private String formatDuration(int seconds) {
        if (seconds <= 0) {
            return getString(R.string.duration_full);
        }
        return getString(R.string.duration_seconds, seconds);
    }

    private String formatThemeMode(String mode) {
        if (WhistlePreferences.THEME_LIGHT.equals(mode)) {
            return getString(R.string.theme_light);
        }
        if (WhistlePreferences.THEME_SYSTEM.equals(mode)) {
            return getString(R.string.theme_system);
        }
        return getString(R.string.theme_dark);
    }

    private String formatLanguage(String lang) {
        if (WhistlePreferences.LANG_ENGLISH.equals(lang)) {
            return getString(R.string.lang_english);
        }
        if (WhistlePreferences.LANG_BENGALI.equals(lang)) {
            return getString(R.string.lang_bengali);
        }
        return getString(R.string.lang_system);
    }
}
