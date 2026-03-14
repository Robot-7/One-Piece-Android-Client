package com.youai.dreamonepiece;

import android.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: YouaiLastLoginHelp.java */
/* JADX INFO: loaded from: classes.dex */
class DES {
    private static final String ALGORITHM_DES = "DES/CBC/PKCS5Padding";
    private static byte[] iv = {1, 2, 3, 4, 5, 6, 7, 8};

    DES() {
    }

    public static String encryptDES(String encryptKey, String encryptString) throws Exception {
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
        cipher.init(1, key, zeroIv);
        byte[] encryptedData = cipher.doFinal(encryptString.getBytes());
        return Base64.encodeToString(encryptedData, 0);
    }

    public static String decryptDES(String decryptKey, String decryptString) throws Exception {
        byte[] byteMi = Base64.decode(decryptString, 0);
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(decryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
        cipher.init(2, key, zeroIv);
        byte[] decryptedData = cipher.doFinal(byteMi);
        return new String(decryptedData);
    }
}
