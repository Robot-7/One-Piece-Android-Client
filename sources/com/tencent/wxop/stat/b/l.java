package com.tencent.wxop.stat.b;

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
import com.tencent.stat.common.StatConstants;
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
public final class l {
    private static String a = null;
    private static String b = null;
    private static String c = null;
    private static String W = null;
    private static Random cR = null;
    private static DisplayMetrics cS = null;
    private static String bq = null;
    private static String br = StatConstants.MTA_COOPERATION_TAG;
    private static String bs = StatConstants.MTA_COOPERATION_TAG;
    private static int bG = -1;
    private static b cT = null;
    private static String cU = null;
    private static String aR = null;
    private static volatile int bn = -1;
    private static String cV = null;
    private static String cC = null;
    private static long cW = -1;
    private static String cE = StatConstants.MTA_COOPERATION_TAG;
    private static o cX = null;
    private static String cY = "__MTA_FIRST_ACTIVATE__";
    private static int U = -1;
    private static long cZ = -1;
    private static int w = 0;
    private static String da = StatConstants.MTA_COOPERATION_TAG;

    public static String A(Context context) {
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo != null) {
                Object obj = applicationInfo.metaData.get("InstallChannel");
                if (obj != null) {
                    return obj.toString();
                }
                cT.c("Could not read InstallChannel meta-data from AndroidManifest.xml");
            }
        } catch (Throwable th) {
            cT.d("Could not read InstallChannel meta-data from AndroidManifest.xml");
        }
        return null;
    }

    public static String B(Context context) {
        if (context == null) {
            return null;
        }
        return context.getClass().getName();
    }

    public static String C(Context context) {
        TelephonyManager telephonyManager;
        if (bq != null) {
            return bq;
        }
        try {
            if (r.a(context, "android.permission.READ_PHONE_STATE")) {
                if ((context.getPackageManager().checkPermission("android.permission.READ_PHONE_STATE", context.getPackageName()) == 0) && (telephonyManager = (TelephonyManager) context.getSystemService("phone")) != null) {
                    bq = telephonyManager.getSimOperator();
                }
            } else {
                cT.d("Could not get permission of android.permission.READ_PHONE_STATE");
            }
        } catch (Throwable th) {
            cT.b(th);
        }
        return bq;
    }

    public static String D(Context context) {
        if (e(br)) {
            return br;
        }
        try {
            String str = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            br = str;
            if (str == null) {
                return StatConstants.MTA_COOPERATION_TAG;
            }
        } catch (Throwable th) {
            cT.b(th);
        }
        return br;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x004e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String E(android.content.Context r4) {
        /*
            java.lang.String r1 = ""
            java.lang.String r0 = "android.permission.INTERNET"
            boolean r0 = com.tencent.wxop.stat.b.r.a(r4, r0)     // Catch: java.lang.Throwable -> L59
            if (r0 == 0) goto L51
            java.lang.String r0 = "android.permission.ACCESS_NETWORK_STATE"
            boolean r0 = com.tencent.wxop.stat.b.r.a(r4, r0)     // Catch: java.lang.Throwable -> L59
            if (r0 == 0) goto L51
            java.lang.String r0 = "connectivity"
            java.lang.Object r0 = r4.getSystemService(r0)     // Catch: java.lang.Throwable -> L59
            android.net.ConnectivityManager r0 = (android.net.ConnectivityManager) r0     // Catch: java.lang.Throwable -> L59
            android.net.NetworkInfo r2 = r0.getActiveNetworkInfo()     // Catch: java.lang.Throwable -> L59
            if (r2 == 0) goto L4e
            boolean r0 = r2.isConnected()     // Catch: java.lang.Throwable -> L59
            if (r0 == 0) goto L4e
            java.lang.String r0 = r2.getTypeName()     // Catch: java.lang.Throwable -> L59
            java.lang.String r2 = r2.getExtraInfo()     // Catch: java.lang.Throwable -> L59
            if (r0 == 0) goto L4e
            java.lang.String r3 = "WIFI"
            boolean r3 = r0.equalsIgnoreCase(r3)     // Catch: java.lang.Throwable -> L59
            if (r3 == 0) goto L3b
            java.lang.String r1 = "WIFI"
        L3a:
            return r1
        L3b:
            java.lang.String r3 = "MOBILE"
            boolean r3 = r0.equalsIgnoreCase(r3)     // Catch: java.lang.Throwable -> L59
            if (r3 == 0) goto L4a
            if (r2 == 0) goto L47
            r1 = r2
            goto L3a
        L47:
            java.lang.String r1 = "MOBILE"
            goto L3a
        L4a:
            if (r2 == 0) goto L4f
            r1 = r2
            goto L3a
        L4e:
            r0 = r1
        L4f:
            r1 = r0
            goto L3a
        L51:
            com.tencent.wxop.stat.b.b r0 = com.tencent.wxop.stat.b.l.cT     // Catch: java.lang.Throwable -> L59
            java.lang.String r2 = "can not get the permission of android.permission.ACCESS_WIFI_STATE"
            r0.d(r2)     // Catch: java.lang.Throwable -> L59
            goto L3a
        L59:
            r0 = move-exception
            com.tencent.wxop.stat.b.b r2 = com.tencent.wxop.stat.b.l.cT
            r2.b(r0)
            goto L3a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.b.l.E(android.content.Context):java.lang.String");
    }

    public static Integer F(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
            if (telephonyManager != null) {
                return Integer.valueOf(telephonyManager.getNetworkType());
            }
        } catch (Throwable th) {
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0024, code lost:
    
        if (com.tencent.wxop.stat.b.l.bs.length() == 0) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String G(android.content.Context r3) {
        /*
            java.lang.String r0 = com.tencent.wxop.stat.b.l.bs
            boolean r0 = e(r0)
            if (r0 == 0) goto Lb
            java.lang.String r0 = com.tencent.wxop.stat.b.l.bs
        La:
            return r0
        Lb:
            android.content.pm.PackageManager r0 = r3.getPackageManager()     // Catch: java.lang.Throwable -> L29
            java.lang.String r1 = r3.getPackageName()     // Catch: java.lang.Throwable -> L29
            r2 = 0
            android.content.pm.PackageInfo r0 = r0.getPackageInfo(r1, r2)     // Catch: java.lang.Throwable -> L29
            java.lang.String r0 = r0.versionName     // Catch: java.lang.Throwable -> L29
            com.tencent.wxop.stat.b.l.bs = r0     // Catch: java.lang.Throwable -> L29
            if (r0 == 0) goto L26
            java.lang.String r0 = com.tencent.wxop.stat.b.l.bs     // Catch: java.lang.Throwable -> L29
            int r0 = r0.length()     // Catch: java.lang.Throwable -> L29
            if (r0 != 0) goto L2f
        L26:
            java.lang.String r0 = "unknown"
            goto La
        L29:
            r0 = move-exception
            com.tencent.wxop.stat.b.b r1 = com.tencent.wxop.stat.b.l.cT
            r1.b(r0)
        L2f:
            java.lang.String r0 = com.tencent.wxop.stat.b.l.bs
            goto La
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.b.l.G(android.content.Context):java.lang.String");
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0077 -> B:21:0x000b). Please report as a decompilation issue!!! */
    public static String H(Context context) {
        String str;
        String path;
        if (e(cU)) {
            return cU;
        }
        try {
        } catch (Throwable th) {
            cT.b(th);
        }
        if (r.a(context, "android.permission.WRITE_EXTERNAL_STORAGE")) {
            String externalStorageState = Environment.getExternalStorageState();
            if (externalStorageState == null || !externalStorageState.equals("mounted") || (path = Environment.getExternalStorageDirectory().getPath()) == null) {
                str = null;
            } else {
                StatFs statFs = new StatFs(path);
                str = String.valueOf((((long) statFs.getAvailableBlocks()) * ((long) statFs.getBlockSize())) / 1000000) + "/" + String.valueOf((((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / 1000000);
                cU = str;
            }
        } else {
            cT.warn("can not get the permission of android.permission.WRITE_EXTERNAL_STORAGE");
            str = null;
        }
        return str;
    }

    static String I(Context context) {
        if (aR != null) {
            return aR;
        }
        int iMyPid = Process.myPid();
        Iterator<ActivityManager.RunningAppProcessInfo> it = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ActivityManager.RunningAppProcessInfo next = it.next();
            if (next.pid == iMyPid) {
                aR = next.processName;
                break;
            }
        }
        return aR;
    }

    public static String J(Context context) {
        return f(context, a.ct);
    }

    public static synchronized Integer K(Context context) {
        Integer numValueOf;
        synchronized (l.class) {
            if (bn > 0) {
                if (bn % PipawSDK.PAY_CANCEL == 0) {
                    try {
                        q.b(context, "MTA_EVENT_INDEX", bn < 2147383647 ? bn + PipawSDK.PAY_CANCEL : 0);
                    } catch (Throwable th) {
                        cT.c(th);
                    }
                }
            }
            bn = q.a(context, "MTA_EVENT_INDEX", 0);
            q.b(context, "MTA_EVENT_INDEX", bn + PipawSDK.PAY_CANCEL);
            int i = bn + 1;
            bn = i;
            numValueOf = Integer.valueOf(i);
        }
        return numValueOf;
    }

    public static String L(Context context) {
        try {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
            activityManager.getMemoryInfo(memoryInfo);
            return String.valueOf(memoryInfo.availMem / 1000000) + "/" + String.valueOf(ay() / 1000000);
        } catch (Throwable th) {
            th.printStackTrace();
            return null;
        }
    }

    public static String M(Context context) {
        List<Sensor> sensorList;
        if (e(cE)) {
            return cE;
        }
        try {
            SensorManager sensorManager = (SensorManager) context.getSystemService("sensor");
            if (sensorManager != null && (sensorList = sensorManager.getSensorList(-1)) != null) {
                StringBuilder sb = new StringBuilder(sensorList.size() * 10);
                for (int i = 0; i < sensorList.size(); i++) {
                    sb.append(sensorList.get(i).getType());
                    if (i != sensorList.size() - 1) {
                        sb.append(",");
                    }
                }
                cE = sb.toString();
            }
        } catch (Throwable th) {
            cT.b(th);
        }
        return cE;
    }

    public static synchronized int N(Context context) {
        int i;
        if (U != -1) {
            i = U;
        } else {
            O(context);
            i = U;
        }
        return i;
    }

    public static void O(Context context) {
        int iA = q.a(context, cY, 1);
        U = iA;
        if (iA == 1) {
            q.b(context, cY, 0);
        }
    }

    public static boolean P(Context context) {
        if (cZ < 0) {
            cZ = q.g(context, "mta.qq.com.checktime");
        }
        return Math.abs(System.currentTimeMillis() - cZ) > Consts.TIME_24HOUR;
    }

    public static void Q(Context context) {
        cZ = System.currentTimeMillis();
        q.a(context, "mta.qq.com.checktime", cZ);
    }

    public static String R(Context context) {
        Camera cameraOpen;
        if (e(da)) {
            return da;
        }
        try {
            if (r.a(context, "android.permission.CAMERA") && (cameraOpen = Camera.open()) != null) {
                Camera.Size size = cameraOpen.getParameters().getSupportedPictureSizes().get(0);
                da = size.width + "*" + size.height;
            }
        } catch (Throwable th) {
            cT.c("getCameras failed, " + th.toString());
        }
        return da;
    }

    public static String S(Context context) {
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

    public static int a(Context context, boolean z) {
        if (z) {
            w = q.a(context, "mta.qq.com.difftime", 0);
        }
        return w;
    }

    private static Long a(String str, String str2, Long l) {
        if (str == null || str2 == null) {
            return l;
        }
        if (str2.equalsIgnoreCase(".") || str2.equalsIgnoreCase("|")) {
            str2 = "\\" + str2;
        }
        String[] strArrSplit = str.split(str2);
        if (strArrSplit.length != 3) {
            return l;
        }
        try {
            Long l2 = 0L;
            int i = 0;
            while (i < strArrSplit.length) {
                Long lValueOf = Long.valueOf(100 * (l2.longValue() + Long.valueOf(strArrSplit[i]).longValue()));
                i++;
                l2 = lValueOf;
            }
            return l2;
        } catch (NumberFormatException e) {
            return l;
        }
    }

    public static void a(Context context, int i) {
        w = i;
        q.b(context, "mta.qq.com.difftime", i);
    }

    public static boolean a(com.tencent.wxop.stat.g gVar) {
        if (gVar == null) {
            return false;
        }
        return e(gVar.S());
    }

    public static long ad() {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.set(11, 0);
            calendar.set(12, 0);
            calendar.set(13, 0);
            calendar.set(14, 0);
            return calendar.getTimeInMillis() + Consts.TIME_24HOUR;
        } catch (Throwable th) {
            cT.b(th);
            return System.currentTimeMillis() + Consts.TIME_24HOUR;
        }
    }

    private static synchronized Random at() {
        if (cR == null) {
            cR = new Random();
        }
        return cR;
    }

    public static int au() {
        if (bG != -1) {
            return bG;
        }
        try {
            if (p.a()) {
                bG = 1;
            }
        } catch (Throwable th) {
            cT.b(th);
        }
        bG = 0;
        return 0;
    }

    public static synchronized b av() {
        if (cT == null) {
            b bVar = new b(StatConstants.LOG_TAG);
            cT = bVar;
            bVar.ap();
        }
        return cT;
    }

    public static String aw() {
        Calendar calendar = Calendar.getInstance();
        calendar.roll(6, 0);
        return new SimpleDateFormat("yyyyMMdd").format(calendar.getTime());
    }

    public static String ax() {
        if (e(cC)) {
            return cC;
        }
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        long blockCount = (((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / 1000000;
        StatFs statFs2 = new StatFs(Environment.getDataDirectory().getPath());
        String str = String.valueOf((((long) statFs2.getAvailableBlocks()) * ((long) statFs2.getBlockSize())) / 1000000) + "/" + String.valueOf(blockCount);
        cC = str;
        return str;
    }

    private static long ay() {
        if (cW > 0) {
            return cW;
        }
        long jIntValue = 1;
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("/proc/meminfo"), 8192);
            jIntValue = Integer.valueOf(bufferedReader.readLine().split("\\s+")[1]).intValue() * 1024;
            bufferedReader.close();
        } catch (Exception e) {
        }
        cW = jIntValue;
        return jIntValue;
    }

    public static JSONObject az() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("n", m.r());
            String strAx = m.ax();
            if (strAx != null && strAx.length() > 0) {
                jSONObject.put("na", strAx);
            }
            int iAA = m.aA();
            if (iAA > 0) {
                jSONObject.put("fx", iAA / 1000000);
            }
            int iD = m.D();
            if (iD > 0) {
                jSONObject.put("fn", iD / 1000000);
            }
        } catch (Throwable th) {
            Log.w(StatConstants.LOG_TAG, "get cpu error", th);
        }
        return jSONObject;
    }

    public static byte[] b(byte[] bArr) throws IOException {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
        byte[] bArr2 = new byte[4096];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bArr.length * 2);
        while (true) {
            int i = gZIPInputStream.read(bArr2);
            if (i == -1) {
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArrayInputStream.close();
                gZIPInputStream.close();
                byteArrayOutputStream.close();
                return byteArray;
            }
            byteArrayOutputStream.write(bArr2, 0, i);
        }
    }

    public static synchronized String c(Context context) {
        String str;
        if (a == null || a.trim().length() == 0) {
            String strB = r.b(context);
            a = strB;
            if (strB == null || a.trim().length() == 0) {
                a = Integer.toString(at().nextInt(Integer.MAX_VALUE));
            }
            str = a;
        } else {
            str = a;
        }
        return str;
    }

    public static String d(long j) {
        return new SimpleDateFormat("yyyyMMdd").format(new Date(j));
    }

    public static boolean e(String str) {
        return (str == null || str.trim().length() == 0) ? false : true;
    }

    public static String f(Context context, String str) {
        if (!com.tencent.wxop.stat.c.E()) {
            return str;
        }
        if (aR == null) {
            aR = I(context);
        }
        return aR != null ? str + "_" + aR : str;
    }

    public static int r() {
        return at().nextInt(Integer.MAX_VALUE);
    }

    public static String t(String str) {
        if (str == null) {
            return "0";
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes());
            byte[] bArrDigest = messageDigest.digest();
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b2 : bArrDigest) {
                int i = b2 & 255;
                if (i < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(Integer.toHexString(i));
            }
            return stringBuffer.toString();
        } catch (Throwable th) {
            return "0";
        }
    }

    public static long u(String str) {
        return a(str, ".", 0L).longValue();
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x006b -> B:40:0x0004). Please report as a decompilation issue!!! */
    public static HttpHost v(Context context) {
        HttpHost httpHost;
        NetworkInfo activeNetworkInfo;
        String extraInfo;
        if (context == null) {
            return null;
        }
        try {
        } catch (Throwable th) {
            cT.b(th);
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

    public static synchronized String w(Context context) {
        if (c == null || c.trim().length() == 0) {
            c = r.c(context);
        }
        return c;
    }

    public static DisplayMetrics x(Context context) {
        if (cS == null) {
            cS = new DisplayMetrics();
            ((WindowManager) context.getApplicationContext().getSystemService("window")).getDefaultDisplay().getMetrics(cS);
        }
        return cS;
    }

    public static boolean y(Context context) {
        NetworkInfo[] allNetworkInfo;
        try {
        } catch (Throwable th) {
            cT.b(th);
        }
        if (!r.a(context, "android.permission.ACCESS_WIFI_STATE")) {
            cT.warn("can not get the permission of android.permission.ACCESS_WIFI_STATE");
            return false;
        }
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getApplicationContext().getSystemService("connectivity");
        if (connectivityManager != null && (allNetworkInfo = connectivityManager.getAllNetworkInfo()) != null) {
            for (int i = 0; i < allNetworkInfo.length; i++) {
                if (allNetworkInfo[i].getTypeName().equalsIgnoreCase("WIFI") && allNetworkInfo[i].isConnected()) {
                    return true;
                }
            }
        }
        return false;
    }

    public static String z(Context context) {
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
                cT.b("Could not read APPKEY meta-data from AndroidManifest.xml");
            }
        } catch (Throwable th) {
            cT.b("Could not read APPKEY meta-data from AndroidManifest.xml");
        }
        return null;
    }
}
