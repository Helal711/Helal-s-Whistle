package com.helal711.whistle;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Random;
import org.junit.Test;

/**
 * JVM unit tests verifying the pure-Java FFT WhistleDetectorEngine across all
 * 5 sensitivity levels, pitch accuracy, partial buffer reads, and false-positive rejection.
 */
public class WhistleDetectorEngineTest {

    private static short[] generateSineWave(double freqHz, double amplitude, int samples) {
        short[] pcm = new short[samples];
        for (int i = 0; i < samples; i++) {
            double sample = amplitude * Math.sin(2.0 * Math.PI * freqHz * i / WhistleDetectorEngine.SAMPLE_RATE);
            pcm[i] = (short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, Math.round(sample)));
        }
        return pcm;
    }

    @Test
    public void detectsClearWhistleAcrossAllFiveSensitivityLevels() {
        short[] whistle2000Hz = generateSineWave(2000.0, 5000.0, 6000);
        for (short level = 1; level <= 5; level++) {
            WhistleDetectorEngine engine = new WhistleDetectorEngine();
            int detected = engine.WhistleProcessAndDetect(whistle2000Hz, whistle2000Hz.length, level);
            assertEquals("Expected detection at sensitivity level " + level, 1, detected);
            int hz = engine.getLastDetectedFrequencyHz();
            assertTrue("Expected detected pitch near 2000 Hz, got " + hz,
                    Math.abs(hz - 2000) <= 60);
        }
    }

    @Test
    public void sensitivityThresholdsDifferentiateQuietWhistles() {
        // Quiet whistle: RMS ~ 260 (below Normal 450 & Very Low 900, above Very High 180)
        short[] quietWhistle = generateSineWave(1800.0, 370.0, 6000);

        WhistleDetectorEngine veryLowEngine = new WhistleDetectorEngine();
        assertEquals(0, veryLowEngine.WhistleProcessAndDetect(quietWhistle, quietWhistle.length, (short) 1));

        WhistleDetectorEngine veryHighEngine = new WhistleDetectorEngine();
        assertEquals(1, veryHighEngine.WhistleProcessAndDetect(quietWhistle, quietWhistle.length, (short) 5));
    }

    @Test
    public void rejectsSilenceLowHumAndBroadbandNoise() {
        short[] silence = new short[6000];
        short[] lowHum = generateSineWave(250.0, 6000.0, 6000);
        short[] whiteNoise = new short[6000];
        Random rng = new Random(42L);
        for (int i = 0; i < whiteNoise.length; i++) {
            whiteNoise[i] = (short) (rng.nextInt(12000) - 6000);
        }

        for (short level = 1; level <= 5; level++) {
            WhistleDetectorEngine engine = new WhistleDetectorEngine();
            assertEquals("Silence must not trigger", 0,
                    engine.WhistleProcessAndDetect(silence, silence.length, level));
            assertEquals("250 Hz hum must not trigger", 0,
                    engine.WhistleProcessAndDetect(lowHum, lowHum.length, level));
            assertEquals("Broadband white noise must not trigger", 0,
                    engine.WhistleProcessAndDetect(whiteNoise, whiteNoise.length, level));
        }
    }

    @Test
    public void partialBufferLengthIgnoresStaleWhistleTail() {
        // First 1500 samples are silence, remaining tail contains a loud 2200 Hz whistle
        short[] buffer = new short[6000];
        short[] tailWhistle = generateSineWave(2200.0, 5000.0, 4500);
        System.arraycopy(tailWhistle, 0, buffer, 1500, tailWhistle.length);

        WhistleDetectorEngine engine = new WhistleDetectorEngine();
        int detected = engine.WhistleProcessAndDetect(buffer, 1500, (short) 5);
        assertEquals("Partial read must ignore stale tail beyond valid length", 0, detected);
    }

    @Test
    public void preservedTwoArgSignatureWorksForStandard4410Chunk() {
        short[] chunk = generateSineWave(1550.0, 4000.0, 4410);
        WhistleDetectorEngine engine = new WhistleDetectorEngine();
        assertEquals(1, engine.WhistleProcessAndDetect(chunk, (short) 3));
    }
}
