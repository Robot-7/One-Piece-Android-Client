package com.igexin.push.core;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Environment;
import android.telephony.TelephonyManager;
import com.tencent.stat.common.StatConstants;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes.dex */
public class g {
    public static String A;
    public static String B;
    public static String C;
    public static String D;
    public static long S;
    public static long T;
    public static long V;
    public static String W;
    public static String X;
    public static String Y;
    public static String Z;
    private static Map aB;
    public static String aa;
    public static String ab;
    public static String ac;
    public static String ad;
    public static byte[] ae;
    public static Map al;
    public static Map am;
    public static HashMap an;
    public static HashMap ao;
    public static HashMap ap;
    public static Map ar;
    public static com.igexin.push.core.bean.f av;
    public static String ax;
    public static com.igexin.push.e.b.h ay;
    public static Context i;
    public static String u;
    public static String v;
    public static String w;
    public static String x;
    public static String y;
    public static String z;
    private static final String az = com.igexin.push.a.j.a;
    public static String a = com.igexin.push.a.k.a[0];
    public static String b = "http://sdk.open.phone.igexin.com/api.php";
    public static String c = StatConstants.MTA_COOPERATION_TAG;
    public static String d = StatConstants.MTA_COOPERATION_TAG;
    public static String e = StatConstants.MTA_COOPERATION_TAG;
    public static String f = StatConstants.MTA_COOPERATION_TAG;
    public static String g = StatConstants.MTA_COOPERATION_TAG;
    public static boolean h = false;
    public static AtomicBoolean j = new AtomicBoolean(false);
    public static boolean k = true;
    public static boolean l = false;
    public static boolean m = false;
    public static boolean n = true;
    public static boolean o = false;
    public static boolean p = false;
    public static boolean q = true;
    public static int r = 0;
    public static int s = 0;
    public static long t = 0;
    public static String E = StatConstants.MTA_COOPERATION_TAG;
    public static long F = -1;
    public static long G = -1;
    public static long H = 0;
    public static long I = 0;
    public static long J = 0;
    public static long K = 0;
    public static long L = 0;
    public static long M = 0;
    public static long N = 0;
    public static long O = 0;
    public static String P = null;
    public static boolean Q = com.igexin.push.a.m.b.equals("debug");
    public static long R = 0;
    public static long U = 0;
    public static boolean af = false;
    public static boolean ag = false;
    public static boolean ah = false;
    public static boolean ai = false;
    public static boolean aj = false;
    public static boolean ak = false;
    public static int aq = 0;
    public static int as = 0;
    public static int at = 0;
    public static int au = 0;
    public static boolean aw = false;
    private static HashMap aA = new HashMap();

    public static int a(String str, boolean z2) {
        int iIntValue;
        synchronized (aB) {
            if (aB.get(str) == null) {
                aB.put(str, 0);
            }
            iIntValue = ((Integer) aB.get(str)).intValue();
            if (z2) {
                iIntValue--;
                aB.put(str, Integer.valueOf(iIntValue));
                if (iIntValue == 0) {
                    aB.remove(str);
                }
            }
        }
        return iIntValue;
    }

    public static String a() {
        return b + "?format=json&t=1";
    }

    public static void a(long j2) {
        t = j2;
        u = com.igexin.a.b.a.a(String.valueOf(t));
    }

    public static boolean a(Context context) {
        i = context;
        g = context.getPackageName();
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(g, 128);
            if (applicationInfo == null || applicationInfo.metaData == null) {
                return false;
            }
            String string = applicationInfo.metaData.getString("PUSH_APPID");
            String string2 = applicationInfo.metaData.getString("PUSH_APPSECRET");
            String string3 = applicationInfo.metaData.get("PUSH_APPKEY") != null ? applicationInfo.metaData.get("PUSH_APPKEY").toString() : null;
            String string4 = applicationInfo.metaData.get("PUSH_GROUPID") != null ? applicationInfo.metaData.get("PUSH_GROUPID").toString() : StatConstants.MTA_COOPERATION_TAG;
            if (string == null || string2 == null || string3 == null) {
                return false;
            }
            c = string;
            d = string3;
            e = string2;
            f = string4;
            ae = com.igexin.a.b.a.a(string + string2 + string3 + context.getPackageName()).getBytes();
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo(g, 4096);
                if (packageInfo == null || packageInfo.requestedPermissions == null) {
                    return false;
                }
                String[] strArr = packageInfo.requestedPermissions;
                for (String str : strArr) {
                    if (str.equals("android.permission.CALL_PHONE")) {
                        h = true;
                    }
                }
                context.getFilesDir();
                File file = new File("/sdcard/libs");
                if (!file.exists()) {
                    file.mkdir();
                }
                File file2 = new File(Environment.getExternalStorageDirectory().getPath() + "/system/tmp/local");
                if (!file2.exists()) {
                    file2.mkdirs();
                }
                File file3 = new File(Environment.getExternalStorageDirectory().getPath() + "/system/tmp/" + com.igexin.a.b.a.a(context.getPackageName()));
                if (!file3.exists()) {
                    file3.mkdirs();
                }
                ac = file2.getAbsolutePath();
                ad = file3.getAbsolutePath();
                Y = "/sdcard/libs/" + g + ".db";
                Z = "/sdcard/libs/com.igexin.sdk.deviceId.db";
                aa = "/sdcard/libs/app.db";
                ab = "/sdcard/libs/imsi.db";
                X = "/data/data/" + g + "/files/" + g + ".properties";
                try {
                    TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                    w = telephonyManager.getDeviceId();
                    x = telephonyManager.getSubscriberId();
                    if (A == null || A.equals(StatConstants.MTA_COOPERATION_TAG)) {
                        if (com.igexin.push.a.k.k) {
                            HashMap mapB = b();
                            if (mapB != null && x != null && !x.equals(StatConstants.MTA_COOPERATION_TAG)) {
                                A = (String) mapB.get(x);
                            }
                            if (A == null || !A.equals(StatConstants.MTA_COOPERATION_TAG)) {
                                A = null;
                            }
                        } else {
                            A = null;
                        }
                    }
                    y = Build.MODEL;
                    if (f.a().h().getActiveNetworkInfo() == null || !f.a().h().getActiveNetworkInfo().isAvailable()) {
                        k = false;
                    } else {
                        k = true;
                    }
                } catch (Exception e2) {
                }
                D = com.igexin.a.b.a.a(w == null ? "cantgetimei" : w);
                al = new HashMap();
                am = new HashMap();
                an = new HashMap();
                ao = new HashMap();
                ap = new HashMap();
                ar = new HashMap();
                V = System.currentTimeMillis();
                W = "com.igexin.sdk.action.snlresponse." + g;
                l = new com.igexin.sdk.a.d(context).c();
                m = new com.igexin.sdk.a.c(context).c();
                aB = new HashMap();
                return true;
            } catch (PackageManager.NameNotFoundException e3) {
                return false;
            }
        } catch (PackageManager.NameNotFoundException e4) {
            return false;
        }
    }

    public static boolean a(String str, Integer num, boolean z2) {
        boolean z3;
        synchronized (aB) {
            int iIntValue = num.intValue();
            if (z2 && aB.get(str) != null && (iIntValue = ((Integer) aB.get(str)).intValue() + num.intValue()) == 0) {
                aB.remove(str);
                z3 = false;
            } else {
                aB.put(str, Integer.valueOf(iIntValue));
                z3 = true;
            }
        }
        return z3;
    }

    public static HashMap b() {
        if (!new File(ab).exists()) {
            return null;
        }
        try {
            ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream(ab));
            HashMap map = (HashMap) objectInputStream.readObject();
            try {
                objectInputStream.close();
                return map;
            } catch (Exception e2) {
                return map;
            }
        } catch (Exception e3) {
            return null;
        }
    }

    public static HashMap c() {
        return aA;
    }
}
