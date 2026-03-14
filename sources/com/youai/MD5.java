package com.youai;

import com.tencent.stat.common.StatConstants;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: loaded from: classes.dex */
public class MD5 {
    public static final String get(String s) {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(s.getBytes());
            byte[] messageDigest = digest.digest();
            StringBuffer hexString = new StringBuffer();
            for (byte b : messageDigest) {
                String h = Integer.toHexString(b & 255);
                while (h.length() < 2) {
                    h = "0" + h;
                }
                hexString.append(h);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public static boolean check(String content, String md5) {
        return get(content).equals(md5);
    }

    public static final String sign(String content, String key) {
        return get(content + key);
    }

    public static boolean check(String content, String key, String md5) {
        return get(content + key).equals(md5);
    }
}
