package com.youai;

import android.util.Log;
import com.youai.dreamonepiece.YouaiConfig;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.Cipher;

/* JADX INFO: loaded from: classes.dex */
public class RSAUtil {
    private static final String RSA_KEY_ALGORITHM = "RSA";
    public static final String pub_key_hand = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB";

    public static String encryptByPubKey(String data, String pPubkey) throws Exception {
        byte[] block;
        if (YouaiConfig.encryptData) {
            byte[] pub_key = Base64.decode(pPubkey);
            X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(pub_key);
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_KEY_ALGORITHM);
            PublicKey publicKey = keyFactory.generatePublic(x509KeySpec);
            Cipher cipher = Cipher.getInstance("RSA/None/PKCS1Padding");
            cipher.init(1, publicKey);
            InputStream ins = new ByteArrayInputStream(data.getBytes());
            ByteArrayOutputStream writer = new ByteArrayOutputStream();
            byte[] buf = new byte[100];
            while (true) {
                int bufl = ins.read(buf);
                if (bufl != -1) {
                    if (buf.length == bufl) {
                        block = buf;
                    } else {
                        block = new byte[bufl];
                        for (int i = 0; i < bufl; i++) {
                            block[i] = buf[i];
                        }
                    }
                    writer.write(cipher.doFinal(block));
                } else {
                    return Base64.encode(writer.toByteArray());
                }
            }
        } else {
            return data;
        }
    }

    public static String encryptByPriKey(String data, String pPrikey) throws Exception {
        byte[] block;
        if (YouaiConfig.encryptData) {
            byte[] pri_key = Base64.decode(pPrikey);
            PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(pri_key);
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_KEY_ALGORITHM);
            PrivateKey privateKey = keyFactory.generatePrivate(pkcs8KeySpec);
            Cipher cipher = Cipher.getInstance("RSA/None/PKCS1Padding");
            cipher.init(1, privateKey);
            InputStream ins = new ByteArrayInputStream(data.getBytes());
            ByteArrayOutputStream writer = new ByteArrayOutputStream();
            byte[] buf = new byte[100];
            while (true) {
                int bufl = ins.read(buf);
                if (bufl != -1) {
                    if (buf.length == bufl) {
                        block = buf;
                    } else {
                        block = new byte[bufl];
                        for (int i = 0; i < bufl; i++) {
                            block[i] = buf[i];
                        }
                    }
                    writer.write(cipher.doFinal(block));
                } else {
                    return Base64.encode(writer.toByteArray());
                }
            }
        } else {
            return data;
        }
    }

    public static String decryptByPubKey(String data, String pPubkey) throws Exception {
        byte[] block;
        if (YouaiConfig.encryptData) {
            byte[] pub_key = Base64.decode(pPubkey);
            X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(pub_key);
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_KEY_ALGORITHM);
            PublicKey publicKey = keyFactory.generatePublic(x509KeySpec);
            Cipher cipher = Cipher.getInstance("RSA/None/PKCS1Padding");
            cipher.init(2, publicKey);
            byte[] _data = Base64.decode(data);
            InputStream ins = new ByteArrayInputStream(_data);
            ByteArrayOutputStream writer = new ByteArrayOutputStream();
            byte[] buf = new byte[128];
            while (true) {
                int bufl = ins.read(buf);
                if (bufl != -1) {
                    if (buf.length == bufl) {
                        block = buf;
                    } else {
                        block = new byte[bufl];
                        for (int i = 0; i < bufl; i++) {
                            block[i] = buf[i];
                        }
                    }
                    writer.write(cipher.doFinal(block));
                } else {
                    return new String(writer.toByteArray());
                }
            }
        } else {
            return data;
        }
    }

    public static String decryptByPriKey(String data, String pPrikey) throws Exception {
        byte[] block;
        if (YouaiConfig.encryptData) {
            byte[] pri_key = Base64.decode(pPrikey);
            PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(pri_key);
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_KEY_ALGORITHM);
            PrivateKey privateKey = keyFactory.generatePrivate(pkcs8KeySpec);
            Cipher cipher = Cipher.getInstance("RSA/None/PKCS1Padding");
            cipher.init(2, privateKey);
            byte[] _data = Base64.decode(data);
            InputStream ins = new ByteArrayInputStream(_data);
            ByteArrayOutputStream writer = new ByteArrayOutputStream();
            byte[] buf = new byte[128];
            while (true) {
                int bufl = ins.read(buf);
                if (bufl != -1) {
                    if (buf.length == bufl) {
                        block = buf;
                    } else {
                        block = new byte[bufl];
                        for (int i = 0; i < bufl; i++) {
                            block[i] = buf[i];
                        }
                    }
                    writer.write(cipher.doFinal(block));
                } else {
                    return new String(writer.toByteArray());
                }
            }
        } else {
            return data;
        }
    }

    public static void main() throws Exception {
        Log.i("str:", "xI9dZDFZZ4Oq7fcpx3W+jlrxee8IcVl/htPT+XsO3m8QTpwqQG6wzYk9NK1i8Lq49UZbtLYo/q2kSouU0szpQccAwkxDUUE3S7373ihru5boabtpzyePCwoO1ghQ1I3GgdCQ40Caej3J1rGzUHot42Zy2Rc06qoyDJlnmKHIJrQ=");
        String strencrypbypubkey = decryptByPubKey("xI9dZDFZZ4Oq7fcpx3W+jlrxee8IcVl/htPT+XsO3m8QTpwqQG6wzYk9NK1i8Lq49UZbtLYo/q2kSouU0szpQccAwkxDUUE3S7373ihru5boabtpzyePCwoO1ghQ1I3GgdCQ40Caej3J1rGzUHot42Zy2Rc06qoyDJlnmKHIJrQ=", pub_key_hand);
        Log.i("strencrypbypubkey:", strencrypbypubkey);
    }
}
