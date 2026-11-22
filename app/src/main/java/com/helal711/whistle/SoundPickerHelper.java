package com.helal711.whistle;

import android.content.Context;
import android.media.MediaPlayer;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import java.util.ArrayList;
import java.util.List;

/**
 * Reusable Material 3 BottomSheet sound selector allowing users to preview and pick
 * from all 13 bundled MP3 alert sounds with guaranteed MediaPlayer cleanup.
 */
public final class SoundPickerHelper {

    public interface OnSoundSelectedListener {
        void onSoundSelected(String soundKey, String soundTitle);
    }

    private SoundPickerHelper() {
    }

    public static BottomSheetDialog showSoundPicker(
            Context context,
            OnSoundSelectedListener listener
    ) {
        BottomSheetDialog dialog = new BottomSheetDialog(context);
        View sheetView = LayoutInflater.from(context).inflate(R.layout.dialog_sound_picker, null);
        dialog.setContentView(sheetView);

        LinearLayout container = sheetView.findViewById(R.id.soundListContainer);
        String[] labels = context.getResources().getStringArray(R.array.listDisplayWord);
        String[] values = context.getResources().getStringArray(R.array.listReturnValue);
        final String[] selectedKey = {WhistlePreferences.getSelectedAudioKey(context)};

        final MediaPlayer[] previewPlayer = {null};
        final String[] playingKey = {null};
        final List<ImageButton> playButtons = new ArrayList<>();
        final List<RadioButton> radioButtons = new ArrayList<>();

        Runnable stopPreview = () -> {
            if (previewPlayer[0] != null) {
                try {
                    if (previewPlayer[0].isPlaying()) {
                        previewPlayer[0].stop();
                    }
                } catch (IllegalStateException ignored) {
                }
                try {
                    previewPlayer[0].release();
                } catch (Exception ignored) {
                }
                previewPlayer[0] = null;
            }
            playingKey[0] = null;
            for (ImageButton btn : playButtons) {
                btn.setImageResource(R.drawable.ic_play);
            }
        };

        LayoutInflater inflater = LayoutInflater.from(context);
        for (int i = 0; i < labels.length && i < values.length; i++) {
            final int index = i;
            final String key = values[i];
            final String title = labels[i];

            View row = inflater.inflate(R.layout.item_sound_row, container, false);
            RadioButton radio = row.findViewById(R.id.radioSound);
            TextView txtTitle = row.findViewById(R.id.txtSoundTitle);
            ImageButton btnPlay = row.findViewById(R.id.btnPlayRowSound);

            txtTitle.setText(title);
            radio.setChecked(key.equals(selectedKey[0]));

            playButtons.add(btnPlay);
            radioButtons.add(radio);

            row.setOnClickListener(v -> {
                selectedKey[0] = key;
                WhistlePreferences.setSelectedAudioKey(context, key);
                for (int r = 0; r < radioButtons.size(); r++) {
                    radioButtons.get(r).setChecked(r == index);
                }
                if (listener != null) {
                    listener.onSoundSelected(key, title);
                }
            });

            btnPlay.setOnClickListener(v -> {
                boolean wasPlayingThis = key.equals(playingKey[0]);
                stopPreview.run();
                if (!wasPlayingThis) {
                    int resId = WhistlePreferences.resolveAudioResource(key);
                    MediaPlayer mp = MediaPlayer.create(context, resId);
                    if (mp != null) {
                        previewPlayer[0] = mp;
                        playingKey[0] = key;
                        btnPlay.setImageResource(R.drawable.ic_stop);
                        mp.setOnCompletionListener(completed -> stopPreview.run());
                        mp.setOnErrorListener((errMp, what, extra) -> {
                            stopPreview.run();
                            return true;
                        });
                        mp.start();
                    }
                }
            });

            container.addView(row);
        }

        dialog.setOnDismissListener(d -> stopPreview.run());
        dialog.show();
        return dialog;
    }
}
