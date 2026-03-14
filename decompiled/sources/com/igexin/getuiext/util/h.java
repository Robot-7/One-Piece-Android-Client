package com.igexin.getuiext.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Environment;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class h {
    public static int a(Context context, String str) {
        try {
            return context.getPackageManager().getPackageInfo(str, 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            return -1;
        }
    }

    public static int a(Context context, String str, String str2) {
        int i = 0;
        new ArrayList();
        List<PackageInfo> installedPackages = context.getPackageManager().getInstalledPackages(0);
        int iIntValue = Integer.valueOf(str2).intValue();
        while (true) {
            int i2 = i;
            if (i2 >= installedPackages.size()) {
                return -1;
            }
            PackageInfo packageInfo = installedPackages.get(i2);
            if (str.equals(packageInfo.packageName)) {
                if (packageInfo.versionCode < iIntValue) {
                    return packageInfo.versionCode;
                }
                return -2;
            }
            i = i2 + 1;
        }
    }

    public static String a(Context context) {
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getApplicationContext().getPackageName(), 128);
            if (applicationInfo.metaData != null) {
                return applicationInfo.metaData.getString("PUSH_APPID");
            }
            return null;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    public static JSONObject a(Context context, String str, String str2, boolean z) {
        int iA = a(context, str, str2);
        if (iA == -2 || (!z && iA == -1)) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("packageName", str);
            jSONObject.put("checksum", iA == -1 ? StatConstants.MTA_COOPERATION_TAG : b(context, str));
            jSONObject.put("versionCode", iA);
            return jSONObject;
        } catch (JSONException e) {
            return jSONObject;
        }
    }

    public static String b(Context context, String str) {
        String strA = e.a(context, str);
        return strA != null ? b(context, str, strA) : "0";
    }

    public static String b(Context context, String str, String str2) {
        String strA = "0";
        File file = new File(str2);
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
                        strA = g.a(bArrDigest, 0, bArrDigest.length);
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

    public static boolean b(Context context) {
        NetworkInfo networkInfo;
        if (context == null || (networkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getNetworkInfo(1)) == null) {
            return false;
        }
        return networkInfo.isAvailable();
    }

    public static int c() {
        return new Random(System.currentTimeMillis()).nextInt(PipawSDK.PAY_CANCEL);
    }

    public static boolean c(Context context, String str) {
        return context.getPackageManager().getPackageInfo(str, 1) != null;
    }

    public void a() {
        File file = new File(Environment.getExternalStorageDirectory().getPath() + "/libs");
        if (!file.exists()) {
            file.mkdir();
        }
        File file2 = new File(file.getPath() + "/notify.db");
        if (file2.exists()) {
            file2.delete();
        }
        try {
            if (file2.createNewFile()) {
                FileOutputStream fileOutputStream = new FileOutputStream(file2);
                fileOutputStream.write(String.valueOf(System.currentTimeMillis()).getBytes());
                fileOutputStream.close();
            }
        } catch (FileNotFoundException e) {
        } catch (IOException e2) {
        }
    }

    public long b() {
        int i = 0;
        long j = 0;
        File file = new File(Environment.getExternalStorageDirectory().getPath() + "/libs/notify.db");
        if (!file.exists()) {
            return 0L;
        }
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            byte[] bArr = new byte[30];
            while (true) {
                int i2 = fileInputStream.read(bArr, i, 15);
                if (i2 == -1) {
                    byte[] bArr2 = new byte[i];
                    System.arraycopy(bArr, 0, bArr2, 0, i);
                    j = Long.parseLong(new String(bArr2));
                    fileInputStream.close();
                    return j;
                }
                i += i2;
            }
        } catch (FileNotFoundException e) {
            return j;
        } catch (IOException e2) {
            return j;
        } catch (Exception e3) {
            return j;
        }
    }
}
