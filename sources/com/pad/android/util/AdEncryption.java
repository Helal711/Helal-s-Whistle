package com.pad.android.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: loaded from: classes.dex */
public class AdEncryption {
    private static final String KEY = "ciF6e+7Fd^21sd|0";

    public static String encrypt(String plaintext) {
        String subStr;
        String plaintext2 = String.valueOf(plaintext) + (char) 19;
        int n = plaintext2.length();
        if (n % 16 != 0) {
            plaintext2 = String.valueOf(plaintext2) + repeat((char) 0, 16 - (n % 16));
        }
        byte[] encText = getRndIv().getBytes();
        byte[] iv = xor(KEY.getBytes(), encText);
        if (iv.length > 512) {
            byte[] tmp = new byte[512];
            for (int x = 0; x < 512; x++) {
                tmp[x] = iv[x];
            }
            iv = tmp;
        }
        for (int i = 0; i < n; i += 16) {
            String sha1Str = sha1(iv);
            byte[] packStr = pack(sha1Str);
            try {
                subStr = plaintext2.substring(i, i + 16);
            } catch (Exception e) {
                subStr = plaintext2.substring(i);
            }
            byte[] block = xor(subStr.getBytes(), packStr);
            byte[] tmp2 = new byte[encText.length + block.length];
            for (int x2 = 0; x2 < encText.length; x2++) {
                tmp2[x2] = encText[x2];
            }
            for (int y = 0; y < block.length; y++) {
                tmp2[encText.length + y] = block[y];
            }
            encText = tmp2;
            byte[] tmp3 = new byte[block.length + iv.length];
            for (int z = 0; z < block.length; z++) {
                tmp3[z] = block[z];
            }
            for (int za = 0; za < iv.length; za++) {
                tmp3[block.length + za] = iv[za];
            }
            if (tmp3.length > 512) {
                byte[] sub = new byte[512];
                for (int zb = 0; zb < 512; zb++) {
                    sub[zb] = tmp3[zb];
                }
                tmp3 = sub;
            }
            iv = xor(KEY.getBytes(), tmp3);
        }
        return replaceChars(base64encode(encText), "+/=", "-_~");
    }

    private static byte[] xor(byte[] a, byte[] b) {
        byte[] out = new byte[a.length];
        for (int i = 0; i < a.length; i++) {
            out[i] = (byte) (a[i] ^ b[i % b.length]);
        }
        return out;
    }

    private static String getRndIv() {
        int ivLen = 16;
        String iv = "";
        while (true) {
            int ivLen2 = ivLen;
            ivLen = ivLen2 - 1;
            if (ivLen2 > 0) {
                int rand = (int) (Math.random() * 62.0d);
                String ch = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".substring(rand, rand + 1);
                iv = String.valueOf(iv) + ch;
            } else {
                return iv;
            }
        }
    }

    private static String repeat(char s, int n) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            sb.append(s);
        }
        return sb.toString();
    }

    private static String sha1(byte[] input) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-1");
        } catch (NoSuchAlgorithmException e) {
        }
        try {
            String encrypt = byteArrayToHexString(md.digest(input));
            return encrypt;
        } catch (Exception e2) {
            return "";
        }
    }

    private static String byteArrayToHexString(byte[] b) throws Exception {
        String result = "";
        for (byte b2 : b) {
            result = String.valueOf(result) + Integer.toString((b2 & 255) + 256, 16).substring(1);
        }
        return result;
    }

    private static byte[] pack(String str) {
        String c;
        int len = str.length();
        byte[] out = new byte[1];
        for (int i = 0; i < Math.ceil(len / 2); i++) {
            try {
                c = str.substring(i * 2, (i * 2) + 2);
            } catch (Exception e) {
                c = String.valueOf(str.substring(i * 2, (i * 2) + 1)) + "0";
            }
            byte ch = (byte) Integer.parseInt(c, 16);
            try {
                out[i] = ch;
            } catch (Exception e2) {
                byte[] tmp = new byte[out.length + 1];
                for (int x = 0; x < out.length; x++) {
                    tmp[x] = out[x];
                }
                tmp[tmp.length - 1] = ch;
                out = tmp;
            }
        }
        return out;
    }

    private static String replaceChars(String str, String searchChars, String replaceChars) {
        if (str != null && str.length() != 0 && searchChars != null && searchChars.length() != 0) {
            if (replaceChars == null) {
                replaceChars = "";
            }
            boolean modified = false;
            int replaceCharsLength = replaceChars.length();
            int strLength = str.length();
            StringBuffer buf = new StringBuffer(strLength);
            for (int i = 0; i < strLength; i++) {
                char ch = str.charAt(i);
                int index = searchChars.indexOf(ch);
                if (index >= 0) {
                    modified = true;
                    if (index < replaceCharsLength) {
                        buf.append(replaceChars.charAt(index));
                    }
                } else {
                    buf.append(ch);
                }
            }
            if (modified) {
                return buf.toString();
            }
            return str;
        }
        return str;
    }

    private static byte[] zeroPad(int length, byte[] bytes) {
        byte[] padded = new byte[length];
        System.arraycopy(bytes, 0, padded, 0, bytes.length);
        return padded;
    }

    public static String base64encode(byte[] stringArray) {
        String encoded = "";
        int paddingCount = (3 - (stringArray.length % 3)) % 3;
        byte[] stringArray2 = zeroPad(stringArray.length + paddingCount, stringArray);
        for (int i = 0; i < stringArray2.length; i += 3) {
            int j = ((stringArray2[i] & 255) << 16) + ((stringArray2[i + 1] & 255) << 8) + (stringArray2[i + 2] & 255);
            encoded = String.valueOf(encoded) + "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((j >> 18) & 63) + "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((j >> 12) & 63) + "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((j >> 6) & 63) + "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(j & 63);
        }
        return String.valueOf(encoded.substring(0, encoded.length() - paddingCount)) + "==".substring(0, paddingCount);
    }
}
