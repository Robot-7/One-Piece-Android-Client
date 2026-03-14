package com.igexin.getuiext.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: loaded from: classes.dex */
public class g {
    public static String a(String str) {
        MessageDigest messageDigest;
        int i = 0;
        byte[] bytes = str.getBytes();
        char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            messageDigest = null;
        }
        if (messageDigest == null) {
            return null;
        }
        messageDigest.update(bytes);
        byte[] bArrDigest = messageDigest.digest();
        char[] cArr2 = new char[32];
        for (int i2 = 0; i2 < 16; i2++) {
            byte b = bArrDigest[i2];
            int i3 = i + 1;
            cArr2[i] = cArr[(b >>> 4) & 15];
            i = i3 + 1;
            cArr2[i3] = cArr[b & 15];
        }
        return new String(cArr2);
    }

    public static String a(byte[] bArr, int i, int i2) {
        StringBuilder sb = new StringBuilder();
        for (int i3 = i; i3 < i + i2; i3++) {
            sb.append(String.format("%02x", Byte.valueOf(bArr[i3])));
        }
        return sb.toString();
    }

    public static byte[] a(byte[] bArr) {
        byte[] bArrA;
        if (bArr == null || (bArrA = d.a(bArr)) == null) {
            return null;
        }
        String strA = a(String.valueOf(System.currentTimeMillis()));
        int length = bArrA.length;
        byte[] bArr2 = new byte[length + 16];
        byte[] bytes = strA.substring(0, 8).getBytes();
        byte[] bytes2 = strA.substring(24, 32).getBytes();
        System.arraycopy(bytes, 0, bArr2, 0, 8);
        System.arraycopy(bArrA, 0, bArr2, 8, length);
        System.arraycopy(bytes2, 0, bArr2, length + 8, 8);
        return bArr2;
    }
}
