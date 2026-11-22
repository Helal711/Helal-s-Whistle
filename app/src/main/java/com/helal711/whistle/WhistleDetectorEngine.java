package com.helal711.whistle;

/**
 * Pure-Java 64-bit-compatible DSP whistle detector preserving the original
 * WhistleDetectorEngine method signature and 5-level sensitivity scale.
 *
 * Uses 1024-point Hann-windowed Radix-2 FFT with 50% overlapping hops (512 samples)
 * to isolate narrowband sustained human whistle fundamentals (~750 Hz - ~3800 Hz)
 * while rejecting speech, low-frequency hum, and broadband ambient noise.
 */
public class WhistleDetectorEngine {
    public static final int SAMPLE_RATE = 44100;
    public static final int FFT_SIZE = 1024;
    private static final int HOP_SIZE = FFT_SIZE / 2;

    // Human whistle fundamental band (~750 Hz to ~3800 Hz)
    private static final int MIN_WHISTLE_BIN = (int) Math.round(750.0 * FFT_SIZE / SAMPLE_RATE);
    private static final int MAX_WHISTLE_BIN = (int) Math.round(3800.0 * FFT_SIZE / SAMPLE_RATE);
    // Reference audible energy band (~200 Hz to ~8000 Hz)
    private static final int MIN_REF_BIN = (int) Math.round(200.0 * FFT_SIZE / SAMPLE_RATE);
    private static final int MAX_REF_BIN = (int) Math.round(8000.0 * FFT_SIZE / SAMPLE_RATE);

    private final double[] hannWindow = new double[FFT_SIZE];
    private final double[] real = new double[FFT_SIZE];
    private final double[] imag = new double[FFT_SIZE];

    private int consecutiveWhistleFrames = 0;
    private int lastPeakBin = -1;
    private int lastDetectedFrequencyHz = 0;

    public WhistleDetectorEngine() {
        for (int i = 0; i < FFT_SIZE; i++) {
            hannWindow[i] = 0.5 * (1.0 - Math.cos((2.0 * Math.PI * i) / (FFT_SIZE - 1)));
        }
    }

    /**
     * Resets multi-frame continuity state (e.g., when pausing/resuming recording).
     */
    public void reset() {
        consecutiveWhistleFrames = 0;
        lastPeakBin = -1;
    }

    /**
     * Returns the fundamental frequency (in Hz) of the most recently detected whistle.
     */
    public int getLastDetectedFrequencyHz() {
        return lastDetectedFrequencyHz;
    }

    /**
     * Preserved original signature analyzing the full buffer up to 4410 samples.
     */
    public int WhistleProcessAndDetect(short[] sArr, short sensitivity) {
        if (sArr == null) {
            return 0;
        }
        return WhistleProcessAndDetect(sArr, Math.min(sArr.length, 4410), sensitivity);
    }

    /**
     * Analyzes exactly {@code length} samples of a 44.1 kHz 16-bit mono PCM buffer
     * using 50% overlapping 1024-sample Hann windows so partial AudioRecord reads
     * never inspect stale buffer tail samples.
     *
     * @param sArr        PCM audio samples
     * @param length      Number of valid samples in {@code sArr}
     * @param sensitivity Detection sensitivity from 1 (Very Low) to 5 (Very High)
     * @return 1 if a sustained whistle is detected, 0 otherwise
     */
    public int WhistleProcessAndDetect(short[] sArr, int length, short sensitivity) {
        if (sArr == null || length < FFT_SIZE) {
            return 0;
        }
        int validLength = Math.min(length, sArr.length);
        if (validLength < FFT_SIZE) {
            return 0;
        }

        int level = Math.max(1, Math.min(5, sensitivity));
        double rmsThreshold;
        double tonalityThreshold;
        int requiredFrames;

        switch (level) {
            case 1: // Very Low
                rmsThreshold = 900.0;
                tonalityThreshold = 0.62;
                requiredFrames = 9;
                break;
            case 2: // Low
                rmsThreshold = 650.0;
                tonalityThreshold = 0.54;
                requiredFrames = 7;
                break;
            case 4: // High
                rmsThreshold = 300.0;
                tonalityThreshold = 0.40;
                requiredFrames = 4;
                break;
            case 5: // Very High
                rmsThreshold = 180.0;
                tonalityThreshold = 0.34;
                requiredFrames = 3;
                break;
            case 3: // Normal (default)
            default:
                rmsThreshold = 450.0;
                tonalityThreshold = 0.46;
                requiredFrames = 5;
                break;
        }

        for (int offset = 0; offset + FFT_SIZE <= validLength; offset += HOP_SIZE) {
            double mean = 0.0;
            for (int i = 0; i < FFT_SIZE; i++) {
                mean += sArr[offset + i];
            }
            mean /= FFT_SIZE;

            double sumSq = 0.0;
            for (int i = 0; i < FFT_SIZE; i++) {
                double centered = sArr[offset + i] - mean;
                sumSq += centered * centered;
                real[i] = centered * hannWindow[i];
                imag[i] = 0.0;
            }

            double rms = Math.sqrt(sumSq / FFT_SIZE);
            if (rms < rmsThreshold) {
                consecutiveWhistleFrames = 0;
                lastPeakBin = -1;
                continue;
            }

            fft(real, imag);

            int peakBin = MIN_WHISTLE_BIN;
            double peakPower = 0.0;
            double totalBandPower = 0.0;

            for (int k = MIN_REF_BIN; k <= MAX_REF_BIN; k++) {
                double power = (real[k] * real[k]) + (imag[k] * imag[k]);
                totalBandPower += power;
                if (k >= MIN_WHISTLE_BIN && k <= MAX_WHISTLE_BIN && power > peakPower) {
                    peakPower = power;
                    peakBin = k;
                }
            }

            if (totalBandPower <= 0.0) {
                consecutiveWhistleFrames = 0;
                lastPeakBin = -1;
                continue;
            }

            double localPeakPower = peakPower;
            if (peakBin > 0) {
                localPeakPower += (real[peakBin - 1] * real[peakBin - 1])
                        + (imag[peakBin - 1] * imag[peakBin - 1]);
            }
            if (peakBin + 1 < FFT_SIZE / 2) {
                localPeakPower += (real[peakBin + 1] * real[peakBin + 1])
                        + (imag[peakBin + 1] * imag[peakBin + 1]);
            }

            double tonalityRatio = localPeakPower / totalBandPower;
            boolean pitchStable = (lastPeakBin == -1) || (Math.abs(peakBin - lastPeakBin) <= 4);

            if (tonalityRatio >= tonalityThreshold && pitchStable) {
                consecutiveWhistleFrames++;
                lastPeakBin = peakBin;
                if (consecutiveWhistleFrames >= requiredFrames) {
                    lastDetectedFrequencyHz = (int) Math.round(peakBin * (double) SAMPLE_RATE / FFT_SIZE);
                    consecutiveWhistleFrames = 0;
                    lastPeakBin = -1;
                    return 1;
                }
            } else {
                consecutiveWhistleFrames = 0;
                lastPeakBin = -1;
            }
        }

        return 0;
    }

    private static void fft(double[] re, double[] im) {
        int n = re.length;
        int j = 0;
        for (int i = 1; i < n; i++) {
            int bit = n >> 1;
            while ((j & bit) != 0) {
                j ^= bit;
                bit >>= 1;
            }
            j ^= bit;
            if (i < j) {
                double tempR = re[i];
                re[i] = re[j];
                re[j] = tempR;
                double tempI = im[i];
                im[i] = im[j];
                im[j] = tempI;
            }
        }

        for (int len = 2; len <= n; len <<= 1) {
            double angle = -2.0 * Math.PI / len;
            double wLenR = Math.cos(angle);
            double wLenI = Math.sin(angle);
            int halfLen = len >> 1;
            for (int i = 0; i < n; i += len) {
                double wR = 1.0;
                double wI = 0.0;
                for (int k = 0; k < halfLen; k++) {
                    int even = i + k;
                    int odd = even + halfLen;
                    double uR = re[even];
                    double uI = im[even];
                    double vR = (re[odd] * wR) - (im[odd] * wI);
                    double vI = (re[odd] * wI) + (im[odd] * wR);
                    re[even] = uR + vR;
                    im[even] = uI + vI;
                    re[odd] = uR - vR;
                    im[odd] = uI - vI;
                    double nextWR = (wR * wLenR) - (wI * wLenI);
                    wI = (wR * wLenI) + (wI * wLenR);
                    wR = nextWR;
                }
            }
        }
    }
}
