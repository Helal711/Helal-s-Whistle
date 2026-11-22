package com.helal711.whistle;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;

/**
 * Lightweight custom Canvas view rendering concentric acoustic sound-wave ripples
 * behind the main Start/Stop whistle detection button.
 */
public class PulseRippleView extends View {
    private static final int RING_COUNT = 3;

    private final Paint ringPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    private ValueAnimator animator;
    private float phase = 0f;
    private boolean active = false;

    private int colorBlue;
    private int colorCyan;
    private int colorInactive;

    public PulseRippleView(Context context) {
        super(context);
        init(context);
    }

    public PulseRippleView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public PulseRippleView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    private void init(Context context) {
        colorBlue = ContextCompat.getColor(context, R.color.brand_electric_blue);
        colorCyan = ContextCompat.getColor(context, R.color.brand_cyan);
        colorInactive = ContextCompat.getColor(context, R.color.card_stroke);

        ringPaint.setStyle(Paint.Style.STROKE);
        ringPaint.setStrokeWidth(context.getResources().getDisplayMetrics().density * 2.2f);
        glowPaint.setStyle(Paint.Style.FILL);
    }

    public void setActive(boolean isActive) {
        if (this.active == isActive && (animator != null && animator.isRunning() == isActive)) {
            return;
        }
        this.active = isActive;
        if (isActive) {
            startPulse();
        } else {
            stopPulse();
        }
        invalidate();
    }

    private void startPulse() {
        if (animator == null) {
            animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(2200L);
            animator.setRepeatCount(ValueAnimator.INFINITE);
            animator.setInterpolator(new LinearInterpolator());
            animator.addUpdateListener(anim -> {
                phase = (float) anim.getAnimatedValue();
                invalidate();
            });
        }
        if (!animator.isStarted()) {
            animator.start();
        }
    }

    private void stopPulse() {
        if (animator != null) {
            animator.cancel();
            animator = null;
        }
        phase = 0f;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float cx = getWidth() * 0.5f;
        float cy = getHeight() * 0.5f;
        float maxRadius = Math.min(cx, cy) - ringPaint.getStrokeWidth();
        float minRadius = maxRadius * 0.62f;

        if (!active) {
            ringPaint.setColor(colorInactive);
            ringPaint.setAlpha(110);
            canvas.drawCircle(cx, cy, maxRadius * 0.78f, ringPaint);
            ringPaint.setAlpha(55);
            canvas.drawCircle(cx, cy, maxRadius * 0.90f, ringPaint);
            return;
        }

        // Soft acoustic ambient glow
        glowPaint.setColor(colorBlue);
        glowPaint.setAlpha(28);
        canvas.drawCircle(cx, cy, maxRadius * 0.84f, glowPaint);

        for (int i = 0; i < RING_COUNT; i++) {
            float progress = (phase + (i / (float) RING_COUNT)) % 1.0f;
            float radius = minRadius + (maxRadius - minRadius) * progress;
            int alpha = (int) ((1f - progress) * 185f);

            ringPaint.setColor(i % 2 == 0 ? colorCyan : colorBlue);
            ringPaint.setAlpha(Math.max(0, Math.min(255, alpha)));
            canvas.drawCircle(cx, cy, radius, ringPaint);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        stopPulse();
        super.onDetachedFromWindow();
    }
}
