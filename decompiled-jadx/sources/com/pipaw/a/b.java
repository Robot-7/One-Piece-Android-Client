package com.pipaw.a;

import com.tencent.stat.common.StatConstants;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import javax.crypto.Cipher;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private static final String a = d.a(b.class);

    public static String a(byte[] bArr, int i, int i2) {
        try {
            PrivateKey privateKeyB = b("10103166745709600780215616551837697832816413714471062522342538060943596036859967333870827790358555455232243383580565187280643159050869924436081447583051139", "367979294475011322800474185715497882523349856362702385535371444397399388741997039894583483410120364529325888461124714276674612930833020362278754665756193");
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(2, privateKeyB);
            return new String(cipher.doFinal(bArr, i, i2));
        } catch (Exception e) {
            d.a(a, e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    private static PublicKey a(String str, String str2) {
        try {
            return KeyFactory.getInstance("RSA").generatePublic(new RSAPublicKeySpec(new BigInteger(str), new BigInteger(str2)));
        } catch (Exception e) {
            d.a(a, e);
            return null;
        }
    }

    public static byte[] a(String str) {
        try {
            PublicKey publicKeyA = a("10103166745709600780215616551837697832816413714471062522342538060943596036859967333870827790358555455232243383580565187280643159050869924436081447583051139", "65537");
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(1, publicKeyA);
            return cipher.doFinal(str.getBytes());
        } catch (Exception e) {
            d.a(a, e);
            return null;
        }
    }

    public static String b(String str) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes("UTF-8"));
            byte[] bArrDigest = messageDigest.digest();
            for (byte b : bArrDigest) {
                String hexString = Integer.toHexString(b & 255);
                if (hexString.length() == 1) {
                    sb.append("0");
                }
                sb.append(hexString);
            }
        } catch (Exception e) {
            d.a(a, e);
        }
        return sb.toString();
    }

    private static PrivateKey b(String str, String str2) {
        try {
            return KeyFactory.getInstance("RSA").generatePrivate(new RSAPrivateKeySpec(new BigInteger(str), new BigInteger(str2)));
        } catch (Exception e) {
            d.a(a, e);
            return null;
        }
    }
}
