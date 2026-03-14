package com.testin.agent.f;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Debug;
import android.os.Environment;
import android.os.Process;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.base.TestinGVariables;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Map;
import org.codehaus.jackson.util.MinimalPrettyPrinter;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class e {
    public static final Object a = new Object();
    private static PackageManager b = null;

    public static String a(Context context) {
        String str;
        Exception e;
        try {
            if (b == null) {
                b = context.getPackageManager();
            }
            str = b.getPackageInfo(context.getPackageName(), 0).versionName;
            if (str != null) {
                try {
                    if (str.length() > 0) {
                        return str;
                    }
                } catch (Exception e2) {
                    e = e2;
                    com.testin.agent.b.e.a(e);
                    return str;
                }
            }
            return StatConstants.MTA_COOPERATION_TAG;
        } catch (Exception e3) {
            str = StatConstants.MTA_COOPERATION_TAG;
            e = e3;
        }
    }

    public static String a(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        th.printStackTrace(printWriter);
        String string = stringWriter.toString();
        printWriter.close();
        return string;
    }

    public static JSONArray a() {
        JSONArray jSONArray = new JSONArray();
        try {
            for (Map.Entry<Thread, StackTraceElement[]> entry : Thread.getAllStackTraces().entrySet()) {
                Thread key = entry.getKey();
                if (!TestinGVariables.c().k.contains(Long.valueOf(key.getId()))) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.putOpt("id", String.valueOf(key.getId()));
                    jSONObject.putOpt("name", key.getName());
                    jSONObject.putOpt("state", key.getState().name());
                    jSONObject.putOpt("stacktrace", new JSONArray((Collection) Arrays.asList(entry.getValue())));
                    jSONArray.put(jSONObject);
                }
            }
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return jSONArray;
    }

    public static void a(Long l) {
        long jLongValue = l != null ? l.longValue() : Thread.currentThread().getId();
        if (TestinGVariables.c().k.contains(Long.valueOf(jLongValue))) {
            return;
        }
        TestinGVariables.c().k.add(Long.valueOf(jLongValue));
    }

    public static boolean a(Context context, String str) {
        return context.getPackageManager().checkPermission(str, context.getPackageName()) == 0;
    }

    public static String b() {
        String strValueOf = StatConstants.MTA_COOPERATION_TAG;
        try {
            Debug.MemoryInfo memoryInfo = new Debug.MemoryInfo();
            Debug.getMemoryInfo(memoryInfo);
            strValueOf = String.valueOf((memoryInfo.dalvikPss + memoryInfo.nativePss + memoryInfo.otherPss) * 1024);
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return TextUtils.isEmpty(strValueOf) ? StatConstants.MTA_COOPERATION_TAG : strValueOf;
    }

    public static String b(Context context) {
        String strA = d.a(context);
        if (!TextUtils.isEmpty(strA)) {
            return strA;
        }
        String[] strArr = {StatConstants.MTA_COOPERATION_TAG, StatConstants.MTA_COOPERATION_TAG, StatConstants.MTA_COOPERATION_TAG};
        if (a(context, "android.permission.READ_PHONE_STATE")) {
            try {
                strArr[0] = ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
            } catch (Exception e) {
                com.testin.agent.b.e.a(e);
            }
        }
        com.testin.agent.base.b.a("TestinUtil", "IMEI号：" + strArr[0]);
        if (a(context, "android.permission.ACCESS_WIFI_STATE")) {
            try {
                strArr[1] = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getMacAddress();
            } catch (Exception e2) {
                com.testin.agent.b.e.a(e2);
            }
        }
        if (TextUtils.isEmpty(strArr[1])) {
            try {
                String line = new RandomAccessFile("/sys/class/net/wlan0/address", "r").readLine();
                if (!TextUtils.isEmpty(line)) {
                    strArr[1] = line;
                }
            } catch (Exception e3) {
                com.testin.agent.b.e.a(e3);
            }
        }
        com.testin.agent.base.b.a("TestinUtil", "MAC地址：" + strArr[1]);
        if (a(context, "android.permission.READ_PHONE_STATE")) {
            strArr[2] = String.valueOf(Build.BRAND) + "/" + Build.MODEL;
        }
        com.testin.agent.base.b.a("TestinUtil", "Brand/Mode：" + strArr[2]);
        String strA2 = b.a(String.valueOf(strArr[0]) + strArr[1] + strArr[2].toLowerCase());
        com.testin.agent.base.b.a("TestinUtil", "设备ID：" + strA2);
        d.a(context, strA2);
        return strA2;
    }

    public static String c() {
        String string = StatConstants.MTA_COOPERATION_TAG;
        try {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            string = BigInteger.valueOf(statFs.getBlockCount()).multiply(BigInteger.valueOf(statFs.getBlockSize())).toString();
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return TextUtils.isEmpty(string) ? StatConstants.MTA_COOPERATION_TAG : string;
    }

    public static String c(Context context) {
        if (context == null) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
        if (TestinGVariables.c().c && a(context, "android.permission.GET_TASKS")) {
            String shortClassName = ((ActivityManager) context.getSystemService("activity")).getRunningTasks(1).get(0).topActivity.getShortClassName();
            return shortClassName.substring(shortClassName.lastIndexOf(".") + 1);
        }
        com.testin.agent.base.b.c("TestAgent", "android.permission.GET_TASKS");
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static String d() {
        String string = StatConstants.MTA_COOPERATION_TAG;
        try {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            string = BigInteger.valueOf(statFs.getAvailableBlocks()).multiply(BigInteger.valueOf(statFs.getBlockSize())).toString();
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return TextUtils.isEmpty(string) ? StatConstants.MTA_COOPERATION_TAG : string;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x009d A[Catch: Exception -> 0x00a1, TRY_LEAVE, TryCatch #9 {Exception -> 0x00a1, blocks: (B:34:0x0098, B:36:0x009d), top: B:58:0x0098 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0098 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String d(android.content.Context r8) throws java.lang.Throwable {
        /*
            r3 = 0
            r1 = 0
            java.lang.String r0 = ""
            com.testin.agent.base.TestinGVariables r2 = com.testin.agent.base.TestinGVariables.c()
            boolean r2 = r2.b
            if (r2 == 0) goto L6f
            java.lang.String r2 = com.testin.agent.f.d.g(r8)     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.lang.String r4 = "TestAgent"
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.lang.String r6 = "Logcat shell code: "
            r5.<init>(r6)     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.lang.StringBuilder r5 = r5.append(r2)     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            com.testin.agent.base.b.a(r4, r5)     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.lang.Runtime r4 = java.lang.Runtime.getRuntime()     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.lang.Process r4 = r4.exec(r2)     // Catch: java.lang.Throwable -> L93 java.io.IOException -> Lb3
            java.io.BufferedReader r2 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> Lab java.io.IOException -> Lb6
            java.io.InputStreamReader r5 = new java.io.InputStreamReader     // Catch: java.lang.Throwable -> Lab java.io.IOException -> Lb6
            java.io.InputStream r6 = r4.getInputStream()     // Catch: java.lang.Throwable -> Lab java.io.IOException -> Lb6
            java.lang.String r7 = "UTF-8"
            r5.<init>(r6, r7)     // Catch: java.lang.Throwable -> Lab java.io.IOException -> Lb6
            r2.<init>(r5)     // Catch: java.lang.Throwable -> Lab java.io.IOException -> Lb6
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            r3.<init>()     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            java.lang.String r5 = ""
        L43:
            java.lang.String r5 = r2.readLine()     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            if (r5 != 0) goto L70
            java.lang.String r1 = r3.toString()     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            java.lang.String r3 = "UTF-8"
            byte[] r1 = r1.getBytes(r3)     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            r3 = 0
            java.lang.String r0 = android.util.Base64.encodeToString(r1, r3)     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            int r1 = r0.length()     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            if (r1 <= 0) goto L65
            java.lang.String r1 = "TestinUtils"
            java.lang.String r3 = "catch system log successed"
            com.testin.agent.base.b.a(r1, r3)     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
        L65:
            if (r4 == 0) goto L6a
            r4.destroy()     // Catch: java.lang.Exception -> La6
        L6a:
            if (r2 == 0) goto L6f
            r2.close()     // Catch: java.lang.Exception -> La6
        L6f:
            return r0
        L70:
            int r1 = r1 + 1
            r6 = 2
            if (r1 <= r6) goto L43
            r3.append(r5)     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            java.lang.String r5 = "\n"
            r3.append(r5)     // Catch: java.io.IOException -> L7e java.lang.Throwable -> Lae
            goto L43
        L7e:
            r1 = move-exception
            r3 = r4
        L80:
            com.testin.agent.b.e.a(r1)     // Catch: java.lang.Throwable -> Lb0
            if (r3 == 0) goto L88
            r3.destroy()     // Catch: java.lang.Exception -> L8e
        L88:
            if (r2 == 0) goto L6f
            r2.close()     // Catch: java.lang.Exception -> L8e
            goto L6f
        L8e:
            r1 = move-exception
            com.testin.agent.b.e.a(r1)
            goto L6f
        L93:
            r0 = move-exception
            r2 = r3
            r4 = r3
        L96:
            if (r4 == 0) goto L9b
            r4.destroy()     // Catch: java.lang.Exception -> La1
        L9b:
            if (r2 == 0) goto La0
            r2.close()     // Catch: java.lang.Exception -> La1
        La0:
            throw r0
        La1:
            r1 = move-exception
            com.testin.agent.b.e.a(r1)
            goto La0
        La6:
            r1 = move-exception
            com.testin.agent.b.e.a(r1)
            goto L6f
        Lab:
            r0 = move-exception
            r2 = r3
            goto L96
        Lae:
            r0 = move-exception
            goto L96
        Lb0:
            r0 = move-exception
            r4 = r3
            goto L96
        Lb3:
            r1 = move-exception
            r2 = r3
            goto L80
        Lb6:
            r1 = move-exception
            r2 = r3
            r3 = r4
            goto L80
        */
        throw new UnsupportedOperationException("Method not decompiled: com.testin.agent.f.e.d(android.content.Context):java.lang.String");
    }

    public static String e() {
        String string = StatConstants.MTA_COOPERATION_TAG;
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            string = BigInteger.valueOf(statFs.getBlockCount()).multiply(BigInteger.valueOf(statFs.getBlockSize())).toString();
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return TextUtils.isEmpty(string) ? StatConstants.MTA_COOPERATION_TAG : string;
    }

    public static String f() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return BigInteger.valueOf(statFs.getAvailableBlocks()).multiply(BigInteger.valueOf(statFs.getBlockSize())).toString();
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public static String g() {
        String str;
        Exception e;
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile("/proc/stat", "r");
            RandomAccessFile randomAccessFile2 = new RandomAccessFile("/proc/" + Process.myPid() + "/stat", "r");
            String line = randomAccessFile.readLine();
            String line2 = randomAccessFile2.readLine();
            String[] strArrSplit = line.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            String[] strArrSplit2 = line2.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            long j = Long.parseLong(strArrSplit[2]) + Long.parseLong(strArrSplit[3]) + Long.parseLong(strArrSplit[4]) + Long.parseLong(strArrSplit[5]) + Long.parseLong(strArrSplit[6]) + Long.parseLong(strArrSplit[7]) + Long.parseLong(strArrSplit[8]);
            long j2 = Long.parseLong(strArrSplit2[13]) + Long.parseLong(strArrSplit2[14]) + Long.parseLong(strArrSplit2[15]) + Long.parseLong(strArrSplit2[16]);
            if (TestinGVariables.c().h == null && TestinGVariables.c().i == null) {
                TestinGVariables.c().h = Long.valueOf(j);
                TestinGVariables.c().i = Long.valueOf(j2);
                return StatConstants.MTA_COOPERATION_TAG;
            }
            double dLongValue = (1.0d * (j2 - TestinGVariables.c().i.longValue())) / (j - TestinGVariables.c().h.longValue());
            str = dLongValue > 0.0d ? new DecimalFormat("0.00000").format(new BigDecimal(dLongValue)) : StatConstants.MTA_COOPERATION_TAG;
            try {
                TestinGVariables.c().h = Long.valueOf(j);
                TestinGVariables.c().i = Long.valueOf(j2);
                return str;
            } catch (Exception e2) {
                e = e2;
                com.testin.agent.b.e.a(e);
                return str;
            }
        } catch (Exception e3) {
            str = StatConstants.MTA_COOPERATION_TAG;
            e = e3;
        }
    }

    public static JSONObject h() {
        JSONObject jSONObject = new JSONObject();
        try {
            LinkedList linkedList = new LinkedList();
            linkedList.add(g());
            jSONObject.put("cpu", new JSONArray((Collection) linkedList));
            LinkedList linkedList2 = new LinkedList();
            linkedList2.add(b());
            jSONObject.put("mem", new JSONArray((Collection) linkedList2));
            jSONObject.put("pow", new JSONArray((Collection) TestinGVariables.c().j));
            LinkedList linkedList3 = new LinkedList();
            linkedList3.add(c());
            jSONObject.put("tsd", new JSONArray((Collection) linkedList3));
            LinkedList linkedList4 = new LinkedList();
            linkedList4.add(d());
            jSONObject.put("asd", new JSONArray((Collection) linkedList4));
            LinkedList linkedList5 = new LinkedList();
            linkedList5.add(e());
            jSONObject.put("tssd", new JSONArray((Collection) linkedList5));
            LinkedList linkedList6 = new LinkedList();
            linkedList6.add(f());
            jSONObject.put("assd", new JSONArray((Collection) linkedList6));
        } catch (JSONException e) {
            com.testin.agent.b.e.a(e);
        }
        return jSONObject;
    }
}
