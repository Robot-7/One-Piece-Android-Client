package com.igexin.a.b;

import android.content.Context;
import com.igexin.a.a.b.g;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private static final char[] a = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

    public static String a(int i) {
        int i2 = i < 0 ? 100 : i;
        if (i2 > 100) {
            i2 = 10;
        }
        Random random = new Random();
        char[] cArr = new char[i2];
        for (int i3 = 0; i3 < i2; i3++) {
            cArr[i3] = a[random.nextInt(a.length)];
        }
        return new String(cArr);
    }

    public static String a(Context context, String str) {
        String strA = "0";
        File file = new File(str);
        try {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                if (messageDigest == null) {
                    return "0";
                }
                FileInputStream fileInputStream = new FileInputStream(file);
                byte[] bArr = new byte[10240];
                while (true) {
                    int i = fileInputStream.read(bArr);
                    if (i <= 0) {
                        byte[] bArrDigest = messageDigest.digest();
                        strA = a(bArrDigest, 0, bArrDigest.length);
                        fileInputStream.close();
                        return strA;
                    }
                    if (i < 10240) {
                        byte[] bArr2 = new byte[i];
                        System.arraycopy(bArr, 0, bArr2, 0, i);
                        messageDigest.update(bArr2);
                    } else {
                        messageDigest.update(bArr);
                    }
                }
            } catch (NoSuchAlgorithmException e) {
                return "0";
            }
        } catch (FileNotFoundException e2) {
            return strA;
        } catch (IOException e3) {
            return strA;
        }
    }

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
            sb.append(String.format("%02X", Byte.valueOf(bArr[i3])));
        }
        return sb.toString();
    }

    public static byte[] a(byte[] bArr) {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            messageDigest = null;
        }
        if (messageDigest == null) {
            return null;
        }
        messageDigest.update(bArr);
        return messageDigest.digest();
    }

    public static byte[] b(byte[] bArr) {
        byte[] bArrA;
        if (bArr == null || (bArrA = g.a(bArr)) == null) {
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

    public static byte[] c(byte[] bArr) {
        if (bArr == null || bArr.length < 16) {
            return null;
        }
        byte[] bArr2 = new byte[bArr.length - 16];
        System.arraycopy(bArr, 8, bArr2, 0, bArr.length - 16);
        return g.b(bArr2);
    }
}
