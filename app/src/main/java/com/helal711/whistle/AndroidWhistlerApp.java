package com.helal711.whistle;

import android.Manifest;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.media.MediaPlayer;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
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
import com.google.android.material.button.MaterialButton;
import com.google.android.material.card.MaterialCardView;
import com.google.android.material.materialswitch.MaterialSwitch;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;

/**
 * Main Dashboard Activity for Helal's Whistle (হেলালের হুইসেল).
 * Features Material Design 3 styling, animated acoustic pulse control, 5-level sensitivity
 * selector, 13-tone MP3 alert sound picker + inline preview, 4 connected quick settings,
 * and live whistle detection history.
 */
public class AndroidWhistlerApp extends AppCompatActivity {
    public static final String EXTRA_AUTO_RESUME_AFTER_BOOT = "extra_auto_resume_after_boot";

    private View dashboardContent;
    private MaterialCardView btnOpenSettings;

    // Status Card
    private MaterialCardView statusCard;
    private View statusDot;
    private TextView txtStatusBadge;
    private TextView txtStatusDetail;
    private LinearLayout micStatusChip;
    private ImageView imgMicStatus;
    private TextView txtMicStatus;

    // Hero Control
    private PulseRippleView pulseRippleView;
    private LinearLayout btnHeroToggle;
    private TextView txtHeroAction;
    private TextView txtHeroHint;

    // Sensitivity Controls (All 5 Presets)
    private TextView txtSensitivityBadge;
    private TextView txtSensitivityDesc;
    private MaterialButton[] sensitivityButtons;

    // Alert Sound Card
    private TextView txtSelectedSound;
    private MaterialButton btnPreviewSound;
    private MaterialButton btnChooseSound;

    // Quick Settings Switches
    private MaterialSwitch switchQuickAudio;
    private MaterialSwitch switchQuickMaxVol;
    private MaterialSwitch switchQuickWake;
    private MaterialSwitch switchQuickToast;
    private boolean updatingSwitches = false;

    // Detection History
    private MaterialButton btnClearHistory;
    private LinearLayout historyEmptyState;
    private LinearLayout historyListContainer;

    private MediaPlayer previewPlayer;
    private BottomSheetDialog activeSoundSheet;
    private boolean pendingStartAfterAudioPerm = false;
    private boolean receiverRegistered = false;

    private final ActivityResultLauncher<String> audioPermissionLauncher =
            registerForActivityResult(new ActivityResultContracts.RequestPermission(), granted -> {
                updatePermissionChip();
                if (granted) {
                    if (pendingStartAfterAudioPerm) {
                        pendingStartAfterAudioPerm = false;
                        startWhistleDetection();
                    }
                } else {
                    pendingStartAfterAudioPerm = false;
                    WhistlePreferences.setDetectionEnabled(this, false);
                    Toast.makeText(this, R.string.permission_audio_required, Toast.LENGTH_LONG).show();
                    updateDetectionUi();
                }
            });

    private final ActivityResultLauncher<String> notifPermissionLauncher =
            registerForActivityResult(new ActivityResultContracts.RequestPermission(), granted -> {
                // Opportunistic permission request — detection remains active regardless of result
            });

    private final BroadcastReceiver serviceReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent == null) {
                return;
            }
            String action = intent.getAction();
            if (AndroidWhistlerService.BROADCAST_STATE_CHANGED.equals(action)) {
                updateDetectionUi();
            } else if (AndroidWhistlerService.BROADCAST_WHISTLE_DETECTED.equals(action)) {
                renderDetectionHistory();
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
        setContentView(R.layout.activity_dashboard);

        configureSystemBarsAppearance();
        bindViews();
        applyEdgeToEdgeInsets();
        setupListeners();
        refreshAllUi();

        handleIncomingBootResume(getIntent());
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        handleIncomingBootResume(intent);
    }

    private void handleIncomingBootResume(Intent intent) {
        if (intent != null && intent.getBooleanExtra(EXTRA_AUTO_RESUME_AFTER_BOOT, false)) {
            intent.removeExtra(EXTRA_AUTO_RESUME_AFTER_BOOT);
            if (!AndroidWhistlerService.isServiceRunning) {
                attemptStartDetection();
            }
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        IntentFilter filter = new IntentFilter();
        filter.addAction(AndroidWhistlerService.BROADCAST_STATE_CHANGED);
        filter.addAction(AndroidWhistlerService.BROADCAST_WHISTLE_DETECTED);
        ContextCompat.registerReceiver(this, serviceReceiver, filter, ContextCompat.RECEIVER_NOT_EXPORTED);
        receiverRegistered = true;
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshAllUi();
    }

    @Override
    protected void onPause() {
        stopInlinePreview();
        super.onPause();
    }

    @Override
    protected void onStop() {
        if (receiverRegistered) {
            try {
                unregisterReceiver(serviceReceiver);
            } catch (IllegalArgumentException ignored) {
            }
            receiverRegistered = false;
        }
        super.onStop();
    }

    @Override
    protected void onDestroy() {
        stopInlinePreview();
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
        dashboardContent = findViewById(R.id.dashboardContent);
        btnOpenSettings = findViewById(R.id.btnOpenSettings);

        statusCard = findViewById(R.id.statusCard);
        statusDot = findViewById(R.id.statusDot);
        txtStatusBadge = findViewById(R.id.txtStatusBadge);
        txtStatusDetail = findViewById(R.id.txtStatusDetail);
        micStatusChip = findViewById(R.id.micStatusChip);
        imgMicStatus = findViewById(R.id.imgMicStatus);
        txtMicStatus = findViewById(R.id.txtMicStatus);

        pulseRippleView = findViewById(R.id.pulseRippleView);
        btnHeroToggle = findViewById(R.id.btnHeroToggle);
        txtHeroAction = findViewById(R.id.txtHeroAction);
        txtHeroHint = findViewById(R.id.txtHeroHint);

        txtSensitivityBadge = findViewById(R.id.txtSensitivityBadge);
        txtSensitivityDesc = findViewById(R.id.txtSensitivityDesc);
        sensitivityButtons = new MaterialButton[]{
                findViewById(R.id.btnSens1),
                findViewById(R.id.btnSens2),
                findViewById(R.id.btnSens3),
                findViewById(R.id.btnSens4),
                findViewById(R.id.btnSens5)
        };

        txtSelectedSound = findViewById(R.id.txtSelectedSound);
        btnPreviewSound = findViewById(R.id.btnPreviewSound);
        btnChooseSound = findViewById(R.id.btnChooseSound);

        switchQuickAudio = findViewById(R.id.switchQuickAudio);
        switchQuickMaxVol = findViewById(R.id.switchQuickMaxVol);
        switchQuickWake = findViewById(R.id.switchQuickWake);
        switchQuickToast = findViewById(R.id.switchQuickToast);

        btnClearHistory = findViewById(R.id.btnClearHistory);
        historyEmptyState = findViewById(R.id.historyEmptyState);
        historyListContainer = findViewById(R.id.historyListContainer);
    }

    private void applyEdgeToEdgeInsets() {
        final int baseLeft = dashboardContent.getPaddingLeft();
        final int baseTop = dashboardContent.getPaddingTop();
        final int baseRight = dashboardContent.getPaddingRight();
        final int baseBottom = dashboardContent.getPaddingBottom();

        ViewCompat.setOnApplyWindowInsetsListener(dashboardContent, (view, windowInsets) -> {
            Insets insets = windowInsets.getInsets(WindowInsetsCompat.Type.systemBars());
            view.setPadding(
                    baseLeft + insets.left,
                    baseTop + insets.top,
                    baseRight + insets.right,
                    baseBottom + insets.bottom
            );
            return windowInsets;
        });
    }

    private void setupListeners() {
        btnOpenSettings.setOnClickListener(v ->
                startActivity(new Intent(this, SettingsActivity.class)));

        micStatusChip.setOnClickListener(v -> {
            if (!hasAudioPermission()) {
                pendingStartAfterAudioPerm = false;
                audioPermissionLauncher.launch(Manifest.permission.RECORD_AUDIO);
            }
        });

        btnHeroToggle.setOnClickListener(v -> {
            animateHeroButtonTap();
            if (AndroidWhistlerService.isServiceRunning) {
                stopWhistleDetection();
            } else {
                attemptStartDetection();
            }
        });

        for (int i = 0; i < sensitivityButtons.length; i++) {
            final int level = i + 1;
            sensitivityButtons[i].setOnClickListener(v -> {
                WhistlePreferences.setSensitivity(this, level);
                updateSensitivityUi();
                notifyServiceSensitivityChanged();
            });
        }

        btnPreviewSound.setOnClickListener(v -> toggleInlinePreview());

        btnChooseSound.setOnClickListener(v -> {
            stopInlinePreview();
            activeSoundSheet = SoundPickerHelper.showSoundPicker(this, (key, title) -> {
                txtSelectedSound.setText(title);
            });
        });

        findViewById(R.id.cardQuickAudio).setOnClickListener(v -> switchQuickAudio.toggle());
        findViewById(R.id.cardQuickMaxVol).setOnClickListener(v -> switchQuickMaxVol.toggle());
        findViewById(R.id.cardQuickWake).setOnClickListener(v -> switchQuickWake.toggle());
        findViewById(R.id.cardQuickToast).setOnClickListener(v -> switchQuickToast.toggle());

        switchQuickAudio.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingSwitches) {
                WhistlePreferences.setAudioEnabled(this, checked);
            }
        });
        switchQuickMaxVol.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingSwitches) {
                WhistlePreferences.setMaxVolumeEnabled(this, checked);
            }
        });
        switchQuickWake.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingSwitches) {
                WhistlePreferences.setVisualWakeEnabled(this, checked);
            }
        });
        switchQuickToast.setOnCheckedChangeListener((btn, checked) -> {
            if (!updatingSwitches) {
                WhistlePreferences.setToastEnabled(this, checked);
            }
        });

        btnClearHistory.setOnClickListener(v -> {
            WhistlePreferences.clearDetectionHistory(this);
            renderDetectionHistory();
        });
    }

    private void animateHeroButtonTap() {
        btnHeroToggle.animate()
                .scaleX(0.94f)
                .scaleY(0.94f)
                .setDuration(90L)
                .withEndAction(() -> btnHeroToggle.animate()
                        .scaleX(1f)
                        .scaleY(1f)
                        .setDuration(140L)
                        .start())
                .start();
    }

    private boolean hasAudioPermission() {
        return ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO)
                == PackageManager.PERMISSION_GRANTED;
    }

    private void attemptStartDetection() {
        if (!hasAudioPermission()) {
            pendingStartAfterAudioPerm = true;
            audioPermissionLauncher.launch(Manifest.permission.RECORD_AUDIO);
            return;
        }
        startWhistleDetection();
    }

    private void startWhistleDetection() {
        stopInlinePreview();
        WhistlePreferences.setDetectionEnabled(this, true);

        Intent serviceIntent = new Intent(this, AndroidWhistlerService.class);
        serviceIntent.setAction(AndroidWhistlerService.ACTION_START);
        ContextCompat.startForegroundService(this, serviceIntent);

        // Opportunistically request POST_NOTIFICATIONS once on Android 13+ without blocking detection
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                && ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS)
                != PackageManager.PERMISSION_GRANTED
                && !WhistlePreferences.hasPromptedNotificationPermission(this)) {
            WhistlePreferences.markNotificationPermissionPrompted(this);
            notifPermissionLauncher.launch(Manifest.permission.POST_NOTIFICATIONS);
        }

        updateDetectionUi();
    }

    private void stopWhistleDetection() {
        WhistlePreferences.setDetectionEnabled(this, false);
        Intent serviceIntent = new Intent(this, AndroidWhistlerService.class);
        serviceIntent.setAction(AndroidWhistlerService.ACTION_STOP);
        stopService(serviceIntent);
        updateDetectionUi();
    }

    private void notifyServiceSensitivityChanged() {
        if (AndroidWhistlerService.isServiceRunning) {
            Intent intent = new Intent(this, AndroidWhistlerService.class);
            intent.setAction(AndroidWhistlerService.ACTION_REFRESH_NOTIFICATION);
            try {
                startService(intent);
            } catch (Exception ignored) {
            }
        }
    }

    private void refreshAllUi() {
        updatePermissionChip();
        updateDetectionUi();
        updateSensitivityUi();
        updateSelectedSoundUi();
        updateQuickSwitchesUi();
        renderDetectionHistory();
    }

    private void updatePermissionChip() {
        boolean granted = hasAudioPermission();
        txtMicStatus.setText(granted ? R.string.perm_granted : R.string.perm_denied);
        int tint = ContextCompat.getColor(this, granted ? R.color.brand_success : R.color.brand_warning);
        imgMicStatus.setImageTintList(ColorStateList.valueOf(tint));
    }

    private void updateDetectionUi() {
        boolean running = AndroidWhistlerService.isServiceRunning;
        boolean pausedCall = AndroidWhistlerService.isPausedForCall;

        pulseRippleView.setActive(running && !pausedCall);

        if (running) {
            statusDot.setBackgroundResource(R.drawable.bg_status_dot_active);
            txtStatusBadge.setText(R.string.status_active);
            txtStatusBadge.setTextColor(ContextCompat.getColor(this, R.color.brand_success));
            txtStatusDetail.setText(pausedCall
                    ? R.string.status_detail_paused_call
                    : R.string.status_detail_active);
            statusCard.setStrokeColor(ContextCompat.getColor(this, R.color.brand_success));

            btnHeroToggle.setBackgroundResource(R.drawable.bg_hero_button_active);
            txtHeroAction.setText(R.string.btn_stop_listening);
            txtHeroHint.setText(R.string.hero_hint_active);
        } else {
            statusDot.setBackgroundResource(R.drawable.bg_status_dot_inactive);
            txtStatusBadge.setText(R.string.status_inactive);
            txtStatusBadge.setTextColor(ContextCompat.getColor(this, R.color.text_secondary));
            txtStatusDetail.setText(R.string.status_detail_inactive);
            statusCard.setStrokeColor(ContextCompat.getColor(this, R.color.card_stroke));

            btnHeroToggle.setBackgroundResource(R.drawable.bg_hero_button_inactive);
            txtHeroAction.setText(R.string.btn_start_listening);
            txtHeroHint.setText(R.string.hero_hint_inactive);
        }
    }

    private void updateSensitivityUi() {
        int current = WhistlePreferences.getSensitivity(this);
        txtSensitivityBadge.setText(WhistlePreferences.getSensitivityShortLabel(this, current));
        txtSensitivityDesc.setText(WhistlePreferences.getSensitivityDescription(this, current));

        int activeBg = ContextCompat.getColor(this, R.color.brand_electric_blue);
        int activeText = ContextCompat.getColor(this, R.color.text_on_accent);
        int inactiveBg = ContextCompat.getColor(this, R.color.surface_elevated);
        int inactiveText = ContextCompat.getColor(this, R.color.text_secondary);
        int inactiveStroke = ContextCompat.getColor(this, R.color.card_stroke);

        for (int i = 0; i < sensitivityButtons.length; i++) {
            MaterialButton btn = sensitivityButtons[i];
            boolean selected = (i + 1) == current;
            btn.setBackgroundTintList(ColorStateList.valueOf(selected ? activeBg : inactiveBg));
            btn.setTextColor(selected ? activeText : inactiveText);
            btn.setStrokeColor(ColorStateList.valueOf(selected ? activeBg : inactiveStroke));
        }
    }

    private void updateSelectedSoundUi() {
        String key = WhistlePreferences.getSelectedAudioKey(this);
        txtSelectedSound.setText(WhistlePreferences.getAudioDisplayName(this, key));
    }

    private void updateQuickSwitchesUi() {
        updatingSwitches = true;
        switchQuickAudio.setChecked(WhistlePreferences.isAudioEnabled(this));
        switchQuickMaxVol.setChecked(WhistlePreferences.isMaxVolumeEnabled(this));
        switchQuickWake.setChecked(WhistlePreferences.isVisualWakeEnabled(this));
        switchQuickToast.setChecked(WhistlePreferences.isToastEnabled(this));
        updatingSwitches = false;
    }

    private void toggleInlinePreview() {
        if (previewPlayer != null) {
            stopInlinePreview();
            return;
        }
        String key = WhistlePreferences.getSelectedAudioKey(this);
        int resId = WhistlePreferences.resolveAudioResource(key);
        MediaPlayer mp = MediaPlayer.create(this, resId);
        if (mp != null) {
            previewPlayer = mp;
            btnPreviewSound.setText(R.string.btn_stop_preview);
            btnPreviewSound.setIconResource(R.drawable.ic_stop);
            mp.setOnCompletionListener(completed -> stopInlinePreview());
            mp.setOnErrorListener((errMp, what, extra) -> {
                stopInlinePreview();
                return true;
            });
            mp.start();
        }
    }

    private void stopInlinePreview() {
        MediaPlayer mp = previewPlayer;
        previewPlayer = null;
        if (mp != null) {
            try {
                if (mp.isPlaying()) {
                    mp.stop();
                }
            } catch (IllegalStateException ignored) {
            }
            try {
                mp.release();
            } catch (Exception ignored) {
            }
        }
        if (btnPreviewSound != null) {
            btnPreviewSound.setText(R.string.btn_preview);
            btnPreviewSound.setIconResource(R.drawable.ic_play);
        }
    }

    private void renderDetectionHistory() {
        List<WhistlePreferences.DetectionEvent> events = WhistlePreferences.getDetectionHistory(this);
        historyListContainer.removeAllViews();

        if (events.isEmpty()) {
            historyEmptyState.setVisibility(View.VISIBLE);
            historyListContainer.setVisibility(View.GONE);
            btnClearHistory.setVisibility(View.GONE);
            return;
        }

        historyEmptyState.setVisibility(View.GONE);
        historyListContainer.setVisibility(View.VISIBLE);
        btnClearHistory.setVisibility(View.VISIBLE);

        LayoutInflater inflater = LayoutInflater.from(this);
        DateFormat timeFormat = DateFormat.getTimeInstance(DateFormat.SHORT);
        int limit = Math.min(events.size(), 10);

        for (int i = 0; i < limit; i++) {
            WhistlePreferences.DetectionEvent event = events.get(i);
            View row = inflater.inflate(R.layout.item_history_row, historyListContainer, false);
            TextView txtSound = row.findViewById(R.id.txtHistorySound);
            TextView txtMeta = row.findViewById(R.id.txtHistoryMeta);
            TextView txtTime = row.findViewById(R.id.txtHistoryTime);

            txtSound.setText(WhistlePreferences.getAudioDisplayName(this, event.soundKey));
            String sensLabel = WhistlePreferences.getSensitivityShortLabel(this, event.sensitivityLevel);
            txtMeta.setText(getString(R.string.history_item_meta, sensLabel, event.frequencyHz));
            txtTime.setText(timeFormat.format(new Date(event.timestampMs)));

            historyListContainer.addView(row);
        }
    }
}
