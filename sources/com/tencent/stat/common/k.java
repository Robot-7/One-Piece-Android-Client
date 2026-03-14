package com.tencent.stat.common;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.hardware.Camera;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Proxy;
import android.os.Environment;
import android.os.Process;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;
import com.igexin.getuiext.data.Consts;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.StatConfig;
import com.tencent.stat.StatSpecifyReportedInfo;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.zip.GZIPInputStream;
import org.apache.http.HttpHost;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class k {
    private static String a = null;
    private static String b = null;
    private static String c = null;
    private static String d = null;
    private static Random e = null;
    private static DisplayMetrics f = null;
    private static String g = null;
    private static String h = StatConstants.MTA_COOPERATION_TAG;
    private static String i = StatConstants.MTA_COOPERATION_TAG;
    private static int j = -1;
    private static StatLogger k = null;
    private static String l = null;
    private static String m = null;
    private static volatile int n = -1;
    private static String o = null;
    private static String p = null;
    private static long q = -1;
    private static String r = StatConstants.MTA_COOPERATION_TAG;
    private static n s = null;
    private static String t = "__MTA_FIRST_ACTIVATE__";
    private static int u = -1;
    private static long v = -1;
    private static int w = 0;
    private static String x = StatConstants.MTA_COOPERATION_TAG;

    public static int A(Context context) {
        return p.a(context, "mta.qq.com.difftime", 0);
    }

    public static String B(Context context) {
        Camera cameraOpen;
        if (c(x)) {
            return x;
        }
        try {
            if (q.a(context, "android.permission.CAMERA") && (cameraOpen = Camera.open()) != null) {
                Camera.Size size = cameraOpen.getParameters().getSupportedPictureSizes().get(0);
                x = size.width + "*" + size.height;
            }
        } catch (Throwable th) {
            k.w("getCameras failed, " + th.toString());
        }
        return x;
    }

    public static boolean C(Context context) {
        ActivityManager activityManager;
        if (context == null || (activityManager = (ActivityManager) context.getSystemService("activity")) == null) {
            return false;
        }
        String packageName = context.getPackageName();
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : activityManager.getRunningAppProcesses()) {
            if (runningAppProcessInfo.processName.startsWith(packageName)) {
                return runningAppProcessInfo.importance == 400;
            }
        }
        return false;
    }

    public static String D(Context context) {
        if (context == null) {
            return null;
        }
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        ResolveInfo resolveInfoResolveActivity = context.getPackageManager().resolveActivity(intent, 0);
        if (resolveInfoResolveActivity.activityInfo == null || resolveInfoResolveActivity.activityInfo.packageName.equals("android")) {
            return null;
        }
        return resolveInfoResolveActivity.activityInfo.packageName;
    }

    private static long E(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);
        return memoryInfo.availMem;
    }

    public static int a() {
        return g().nextInt(Integer.MAX_VALUE);
    }

    public static int a(Context context, boolean z) {
        if (z) {
            w = A(context);
        }
        return w;
    }

    public static Long a(String str, String str2, int i2, int i3, Long l2) {
        if (str == null || str2 == null) {
            return l2;
        }
        if (str2.equalsIgnoreCase(".") || str2.equalsIgnoreCase("|")) {
            str2 = "\\" + str2;
        }
        String[] strArrSplit = str.split(str2);
        if (strArrSplit.length != i3) {
            return l2;
        }
        try {
            Long l3 = 0L;
            int i4 = 0;
            while (i4 < strArrSplit.length) {
                Long lValueOf = Long.valueOf(((long) i2) * (l3.longValue() + Long.valueOf(strArrSplit[i4]).longValue()));
                i4++;
                l3 = lValueOf;
            }
            return l3;
        } catch (NumberFormatException e2) {
            return l2;
        }
    }

    public static String a(int i2) {
        Calendar calendar = Calendar.getInstance();
        calendar.roll(6, i2);
        return new SimpleDateFormat("yyyyMMdd").format(calendar.getTime());
    }

    public static String a(long j2) {
        return new SimpleDateFormat("yyyyMMdd").format(new Date(j2));
    }

    public static String a(Context context, String str) {
        if (!StatConfig.isEnableConcurrentProcess()) {
            return str;
        }
        if (m == null) {
            m = q(context);
        }
        return m != null ? str + "_" + m : str;
    }

    public static String a(String str) {
        if (str == null) {
            return "0";
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes());
            byte[] bArrDigest = messageDigest.digest();
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b2 : bArrDigest) {
                int i2 = b2 & 255;
                if (i2 < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(Integer.toHexString(i2));
            }
            return stringBuffer.toString();
        } catch (Throwable th) {
            return "0";
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x006b -> B:40:0x0004). Please report as a decompilation issue!!! */
    public static HttpHost a(Context context) {
        HttpHost httpHost;
        NetworkInfo activeNetworkInfo;
        String extraInfo;
        if (context == null) {
            return null;
        }
        try {
        } catch (Throwable th) {
            k.e(th);
        }
        if (context.getPackageManager().checkPermission("android.permission.ACCESS_NETWORK_STATE", context.getPackageName()) != 0 || (activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo()) == null) {
            httpHost = null;
        } else if ((activeNetworkInfo.getTypeName() != null && activeNetworkInfo.getTypeName().equalsIgnoreCase("WIFI")) || (extraInfo = activeNetworkInfo.getExtraInfo()) == null) {
            httpHost = null;
        } else if (extraInfo.equals("cmwap") || extraInfo.equals("3gwap") || extraInfo.equals("uniwap")) {
            httpHost = new HttpHost("10.0.0.172", 80);
        } else if (extraInfo.equals("ctwap")) {
            httpHost = new HttpHost("10.0.0.200", 80);
        } else {
            String defaultHost = Proxy.getDefaultHost();
            httpHost = (defaultHost == null || defaultHost.trim().length() <= 0) ? null : new HttpHost(defaultHost, Proxy.getDefaultPort());
        }
        return httpHost;
    }

    public static void a(Context context, int i2) {
        w = i2;
        p.b(context, "mta.qq.com.difftime", i2);
    }

    public static boolean a(StatSpecifyReportedInfo statSpecifyReportedInfo) {
        if (statSpecifyReportedInfo == null) {
            return false;
        }
        return c(statSpecifyReportedInfo.getAppKey());
    }

    public static byte[] a(byte[] bArr) throws IOException {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
        byte[] bArr2 = new byte[4096];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bArr.length * 2);
        while (true) {
            int i2 = gZIPInputStream.read(bArr2);
            if (i2 == -1) {
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArrayInputStream.close();
                gZIPInputStream.close();
                byteArrayOutputStream.close();
                return byteArray;
            }
            byteArrayOutputStream.write(bArr2, 0, i2);
        }
    }

    public static long b(String str) {
        return a(str, ".", 100, 3, 0L).longValue();
    }

    public static synchronized StatLogger b() {
        if (k == null) {
            k = new StatLogger(StatConstants.LOG_TAG);
            k.setDebugEnable(false);
        }
        return k;
    }

    public static synchronized String b(Context context) {
        String str;
        if (a == null || a.trim().length() == 0) {
            a = q.a(context);
            if (a == null || a.trim().length() == 0) {
                a = Integer.toString(g().nextInt(Integer.MAX_VALUE));
            }
            str = a;
        } else {
            str = a;
        }
        return str;
    }

    public static long c() {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.set(11, 0);
            calendar.set(12, 0);
            calendar.set(13, 0);
            calendar.set(14, 0);
            return calendar.getTimeInMillis() + Consts.TIME_24HOUR;
        } catch (Throwable th) {
            k.e(th);
            return System.currentTimeMillis() + Consts.TIME_24HOUR;
        }
    }

    public static synchronized String c(Context context) {
        if (c == null || c.trim().length() == 0) {
            c = q.b(context);
        }
        return c;
    }

    public static boolean c(String str) {
        return (str == null || str.trim().length() == 0) ? false : true;
    }

    public static DisplayMetrics d(Context context) {
        if (f == null) {
            f = new DisplayMetrics();
            ((WindowManager) context.getApplicationContext().getSystemService("window")).getDefaultDisplay().getMetrics(f);
        }
        return f;
    }

    public static String d() {
        if (c(p)) {
            return p;
        }
        long jE = e() / 1000000;
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        p = String.valueOf((((long) statFs.getAvailableBlocks()) * ((long) statFs.getBlockSize())) / 1000000) + "/" + String.valueOf(jE);
        return p;
    }

    public static long e() {
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        return ((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize());
    }

    public static boolean e(Context context) {
        NetworkInfo[] allNetworkInfo;
        try {
        } catch (Throwable th) {
            k.e(th);
        }
        if (!q.a(context, "android.permission.ACCESS_WIFI_STATE")) {
            k.warn("can not get the permission of android.permission.ACCESS_WIFI_STATE");
            return false;
        }
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getApplicationContext().getSystemService("connectivity");
        if (connectivityManager != null && (allNetworkInfo = connectivityManager.getAllNetworkInfo()) != null) {
            for (int i2 = 0; i2 < allNetworkInfo.length; i2++) {
                if (allNetworkInfo[i2].getTypeName().equalsIgnoreCase("WIFI") && allNetworkInfo[i2].isConnected()) {
                    return true;
                }
            }
        }
        return false;
    }

    public static String f(Context context) {
        if (b != null) {
            return b;
        }
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo != null) {
                String string = applicationInfo.metaData.getString("TA_APPKEY");
                if (string != null) {
                    b = string;
                    return string;
                }
                k.i("Could not read APPKEY meta-data from AndroidManifest.xml");
            }
        } catch (Throwable th) {
            k.i("Could not read APPKEY meta-data from AndroidManifest.xml");
        }
        return null;
    }

    public static String g(Context context) {
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo != null) {
                Object obj = applicationInfo.metaData.get("InstallChannel");
                if (obj != null) {
                    return obj.toString();
                }
                k.w("Could not read InstallChannel meta-data from AndroidManifest.xml");
            }
        } catch (Throwable th) {
            k.e("Could not read InstallChannel meta-data from AndroidManifest.xml");
        }
        return null;
    }

    private static synchronized Random g() {
        if (e == null) {
            e = new Random();
        }
        return e;
    }

    private static long h() {
        if (q > 0) {
            return q;
        }
        long jIntValue = 1;
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("/proc/meminfo"), 8192);
            jIntValue = Integer.valueOf(bufferedReader.readLine().split("\\s+")[1]).intValue() * 1024;
            bufferedReader.close();
        } catch (Exception e2) {
        }
        q = jIntValue;
        return q;
    }

    public static String h(Context context) {
        if (context == null) {
            return null;
        }
        return context.getClass().getName();
    }

    public static String i(Context context) {
        TelephonyManager telephonyManager;
        if (g != null) {
            return g;
        }
        try {
            if (!q.a(context, "android.permission.READ_PHONE_STATE")) {
                k.e("Could not get permission of android.permission.READ_PHONE_STATE");
            } else if (k(context) && (telephonyManager = (TelephonyManager) context.getSystemService("phone")) != null) {
                g = telephonyManager.getSimOperator();
            }
        } catch (Throwable th) {
            k.e(th);
        }
        return g;
    }

    public static String j(Context context) {
        if (c(h)) {
            return h;
        }
        try {
            h = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            if (h == null) {
                return StatConstants.MTA_COOPERATION_TAG;
            }
        } catch (Throwable th) {
            k.e(th);
        }
        return h;
    }

    public static boolean k(Context context) {
        return context.getPackageManager().checkPermission("android.permission.READ_PHONE_STATE", context.getPackageName()) == 0;
    }

    public static String l(Context context) {
        try {
            if (q.a(context, "android.permission.INTERNET") && q.a(context, "android.permission.ACCESS_NETWORK_STATE")) {
                NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
                if (activeNetworkInfo != null && activeNetworkInfo.isConnected()) {
                    String typeName = activeNetworkInfo.getTypeName();
                    String extraInfo = activeNetworkInfo.getExtraInfo();
                    if (typeName != null) {
                        return typeName.equalsIgnoreCase("WIFI") ? "WIFI" : typeName.equalsIgnoreCase("MOBILE") ? extraInfo == null ? "MOBILE" : extraInfo : extraInfo == null ? typeName : extraInfo;
                    }
                }
            } else {
                k.e("can not get the permission of android.permission.ACCESS_WIFI_STATE");
            }
        } catch (Throwable th) {
            k.e(th);
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static Integer m(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
            if (telephonyManager != null) {
                return Integer.valueOf(telephonyManager.getNetworkType());
            }
        } catch (Throwable th) {
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0026, code lost:
    
        if (com.tencent.stat.common.k.i.length() == 0) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String n(android.content.Context r3) {
        /*
            java.lang.String r0 = com.tencent.stat.common.k.i
            boolean r0 = c(r0)
            if (r0 == 0) goto Lb
            java.lang.String r0 = com.tencent.stat.common.k.i
        La:
            return r0
        Lb:
            android.content.pm.PackageManager r0 = r3.getPackageManager()     // Catch: java.lang.Throwable -> L2b
            java.lang.String r1 = r3.getPackageName()     // Catch: java.lang.Throwable -> L2b
            r2 = 0
            android.content.pm.PackageInfo r0 = r0.getPackageInfo(r1, r2)     // Catch: java.lang.Throwable -> L2b
            java.lang.String r0 = r0.versionName     // Catch: java.lang.Throwable -> L2b
            com.tencent.stat.common.k.i = r0     // Catch: java.lang.Throwable -> L2b
            java.lang.String r0 = com.tencent.stat.common.k.i     // Catch: java.lang.Throwable -> L2b
            if (r0 == 0) goto L28
            java.lang.String r0 = com.tencent.stat.common.k.i     // Catch: java.lang.Throwable -> L2b
            int r0 = r0.length()     // Catch: java.lang.Throwable -> L2b
            if (r0 != 0) goto L31
        L28:
            java.lang.String r0 = "unknown"
            goto La
        L2b:
            r0 = move-exception
            com.tencent.stat.common.StatLogger r1 = com.tencent.stat.common.k.k
            r1.e(r0)
        L31:
            java.lang.String r0 = com.tencent.stat.common.k.i
            goto La
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.stat.common.k.n(android.content.Context):java.lang.String");
    }

    public static int o(Context context) {
        if (j != -1) {
            return j;
        }
        try {
            if (o.a()) {
                j = 1;
            }
        } catch (Throwable th) {
            k.e(th);
        }
        j = 0;
        return j;
    }

    public static String p(Context context) {
        String path;
        String str = null;
        if (c(l)) {
            return l;
        }
        try {
            if (q.a(context, "android.permission.WRITE_EXTERNAL_STORAGE")) {
                String externalStorageState = Environment.getExternalStorageState();
                if (externalStorageState != null && externalStorageState.equals("mounted") && (path = Environment.getExternalStorageDirectory().getPath()) != null) {
                    StatFs statFs = new StatFs(path);
                    l = String.valueOf((((long) statFs.getBlockSize()) * ((long) statFs.getAvailableBlocks())) / 1000000) + "/" + String.valueOf((((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / 1000000);
                    str = l;
                }
            } else {
                k.warn("can not get the permission of android.permission.WRITE_EXTERNAL_STORAGE");
            }
            return str;
        } catch (Throwable th) {
            k.e(th);
            return str;
        }
    }

    static String q(Context context) {
        if (m != null) {
            return m;
        }
        int iMyPid = Process.myPid();
        Iterator<ActivityManager.RunningAppProcessInfo> it = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ActivityManager.RunningAppProcessInfo next = it.next();
            if (next.pid == iMyPid) {
                m = next.processName;
                break;
            }
        }
        return m;
    }

    public static String r(Context context) {
        return a(context, StatConstants.DATABASE_NAME);
    }

    public static synchronized Integer s(Context context) {
        Integer numValueOf;
        synchronized (k.class) {
            if (n > 0) {
                if (n % PipawSDK.PAY_CANCEL == 0) {
                    try {
                        p.b(context, "MTA_EVENT_INDEX", n < 2147383647 ? n + PipawSDK.PAY_CANCEL : 0);
                    } catch (Throwable th) {
                        k.w(th);
                    }
                }
            }
            n = p.a(context, "MTA_EVENT_INDEX", 0);
            p.b(context, "MTA_EVENT_INDEX", n + PipawSDK.PAY_CANCEL);
            n++;
            numValueOf = Integer.valueOf(n);
        }
        return numValueOf;
    }

    public static String t(Context context) {
        try {
            return String.valueOf(E(context) / 1000000) + "/" + String.valueOf(h() / 1000000);
        } catch (Throwable th) {
            th.printStackTrace();
            return null;
        }
    }

    public static JSONObject u(Context context) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("n", l.a());
            String strD = l.d();
            if (strD != null && strD.length() > 0) {
                jSONObject.put("na", strD);
            }
            int iB = l.b();
            if (iB > 0) {
                jSONObject.put("fx", iB / 1000000);
            }
            int iC = l.c();
            if (iC > 0) {
                jSONObject.put("fn", iC / 1000000);
            }
        } catch (Throwable th) {
            Log.w(StatConstants.LOG_TAG, "get cpu error", th);
        }
        return jSONObject;
    }

    public static String v(Context context) {
        List<Sensor> sensorList;
        if (c(r)) {
            return r;
        }
        try {
            SensorManager sensorManager = (SensorManager) context.getSystemService("sensor");
            if (sensorManager != null && (sensorList = sensorManager.getSensorList(-1)) != null) {
                StringBuilder sb = new StringBuilder(sensorList.size() * 10);
                for (int i2 = 0; i2 < sensorList.size(); i2++) {
                    sb.append(sensorList.get(i2).getType());
                    if (i2 != sensorList.size() - 1) {
                        sb.append(",");
                    }
                }
                r = sb.toString();
            }
        } catch (Throwable th) {
            k.e(th);
        }
        return r;
    }

    public static synchronized int w(Context context) {
        int i2;
        if (u != -1) {
            i2 = u;
        } else {
            x(context);
            i2 = u;
        }
        return i2;
    }

    public static void x(Context context) {
        u = p.a(context, t, 1);
        if (u == 1) {
            p.b(context, t, 0);
        }
    }

    public static boolean y(Context context) {
        if (v < 0) {
            v = p.a(context, "mta.qq.com.checktime", 0L);
        }
        return Math.abs(System.currentTimeMillis() - v) > Consts.TIME_24HOUR;
    }

    public static void z(Context context) {
        v = System.currentTimeMillis();
        p.b(context, "mta.qq.com.checktime", v);
    }
}
