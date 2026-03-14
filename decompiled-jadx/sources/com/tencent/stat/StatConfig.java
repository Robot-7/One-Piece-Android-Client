package com.tencent.stat;

import android.content.Context;
import android.os.Build;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.api.MidService;
import com.tencent.stat.common.StatConstants;
import com.tencent.stat.common.StatLogger;
import java.net.URI;
import java.util.Iterator;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class StatConfig {
    private static String C;
    private static String D;
    private static StatLogger q = com.tencent.stat.common.k.b();
    static f a = new f(2);
    static f b = new f(1);
    private static StatReportStrategy r = StatReportStrategy.APP_LAUNCH;
    private static boolean s = false;
    private static boolean t = true;
    private static int u = 30000;
    private static int v = 100000;
    private static int w = 30;
    private static int x = 10;
    private static int y = 100;
    private static int z = 30;
    private static int A = 1;
    static String c = "__HIBERNATE__";
    static String d = "__HIBERNATE__TIME";
    static String e = "__MTA_KILL__";
    private static String B = null;
    private static String E = "mta_channel";
    static String f = StatConstants.MTA_COOPERATION_TAG;
    private static int F = Opcodes.GETFIELD;
    static boolean g = false;
    static int h = 100;
    static long i = 10000;
    private static int G = 1024;
    static boolean j = true;
    private static long H = 0;
    private static long I = 300000;
    public static boolean isAutoExceptionCaught = true;
    static volatile String k = StatConstants.MTA_SERVER;
    private static volatile String J = StatConstants.MTA_REPORT_FULL_URL;
    private static int K = 0;
    private static volatile int L = 0;
    private static int M = 20;
    private static int N = 0;
    private static boolean O = false;
    private static int P = 4096;
    private static boolean Q = false;
    private static String R = null;
    private static boolean S = false;
    private static StatCustomLogger T = null;
    static boolean l = true;
    static int m = 0;
    static long n = 10000;
    static int o = 512;
    static StatDataTransfer p = null;

    static int a() {
        return w;
    }

    static String a(Context context) {
        return com.tencent.stat.common.q.a(com.tencent.stat.common.p.a(context, "_mta_ky_tag_", (String) null));
    }

    static String a(String str, String str2) {
        try {
            String string = b.b.getString(str);
            return string != null ? string : str2;
        } catch (Throwable th) {
            q.w("can't find custom key:" + str);
            return str2;
        }
    }

    static synchronized void a(int i2) {
        L = i2;
    }

    static void a(long j2) {
        com.tencent.stat.common.p.b(g.a(), c, j2);
        setEnableStatService(false);
        q.warn("MTA is disable for current SDK version");
    }

    static void a(Context context, f fVar) throws JSONException {
        if (fVar.a != b.a) {
            if (fVar.a == a.a) {
                a = fVar;
            }
        } else {
            b = fVar;
            a(b.b);
            if (b.b.isNull("iplist")) {
                return;
            }
            a.a(context).a(b.b.getString("iplist"));
        }
    }

    static void a(Context context, f fVar, JSONObject jSONObject) {
        boolean z2;
        boolean z3 = false;
        try {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                if (next.equalsIgnoreCase("v")) {
                    int i2 = jSONObject.getInt(next);
                    z2 = fVar.d != i2 ? true : z3;
                    fVar.d = i2;
                } else if (next.equalsIgnoreCase("c")) {
                    String string = jSONObject.getString("c");
                    if (string.length() > 0) {
                        fVar.b = new JSONObject(string);
                    }
                    z2 = z3;
                } else {
                    if (next.equalsIgnoreCase("m")) {
                        fVar.c = jSONObject.getString("m");
                    }
                    z2 = z3;
                }
                z3 = z2;
            }
            if (z3) {
                au auVarA = au.a(g.a());
                if (auVarA != null) {
                    auVarA.a(fVar);
                }
                if (fVar.a == b.a) {
                    a(fVar.b);
                    b(fVar.b);
                }
            }
            a(context, fVar);
        } catch (JSONException e2) {
            q.e((Throwable) e2);
        } catch (Throwable th) {
            q.e(th);
        }
    }

    static void a(Context context, String str) {
        if (str != null) {
            com.tencent.stat.common.p.b(context, "_mta_ky_tag_", com.tencent.stat.common.q.b(str));
        }
    }

    static void a(Context context, JSONObject jSONObject) {
        try {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                if (next.equalsIgnoreCase(Integer.toString(b.a))) {
                    a(context, b, jSONObject.getJSONObject(next));
                } else if (next.equalsIgnoreCase(Integer.toString(a.a))) {
                    a(context, a, jSONObject.getJSONObject(next));
                } else {
                    if (!next.equalsIgnoreCase("rs")) {
                        return;
                    }
                    StatReportStrategy statReportStrategy = StatReportStrategy.getStatReportStrategy(jSONObject.getInt(next));
                    if (statReportStrategy != null) {
                        r = statReportStrategy;
                        if (isDebugEnable()) {
                            q.d("Change to ReportStrategy:" + statReportStrategy.name());
                        }
                    }
                }
            }
        } catch (JSONException e2) {
            q.e((Throwable) e2);
        }
    }

    static void a(JSONObject jSONObject) {
        try {
            StatReportStrategy statReportStrategy = StatReportStrategy.getStatReportStrategy(jSONObject.getInt("rs"));
            if (statReportStrategy != null) {
                setStatSendStrategy(statReportStrategy);
            }
        } catch (JSONException e2) {
            if (isDebugEnable()) {
                q.i("rs not found.");
            }
        }
    }

    static boolean a(int i2, int i3, int i4) {
        return i2 >= i3 && i2 <= i4;
    }

    private static boolean a(String str) {
        if (str == null) {
            return false;
        }
        if (C == null) {
            C = str;
            return true;
        }
        if (C.contains(str)) {
            return false;
        }
        C += "|" + str;
        return true;
    }

    static boolean a(JSONObject jSONObject, String str, String str2) {
        if (!jSONObject.isNull(str)) {
            String strOptString = jSONObject.optString(str);
            if (com.tencent.stat.common.k.c(str2) && com.tencent.stat.common.k.c(strOptString) && str2.equalsIgnoreCase(strOptString)) {
                return true;
            }
        }
        return false;
    }

    static void b() {
        N++;
    }

    static void b(int i2) {
        if (i2 < 0) {
            return;
        }
        N = i2;
    }

    static void b(Context context, JSONObject jSONObject) {
        JSONObject jSONObject2;
        boolean z2;
        try {
            String strOptString = jSONObject.optString(e);
            if (!com.tencent.stat.common.k.c(strOptString) || (jSONObject2 = new JSONObject(strOptString)) == null || jSONObject2.length() == 0) {
                return;
            }
            if (!jSONObject2.isNull("sm")) {
                Object obj = jSONObject2.get("sm");
                int iIntValue = obj instanceof Integer ? ((Integer) obj).intValue() : obj instanceof String ? Integer.valueOf((String) obj).intValue() : 0;
                if (iIntValue > 0) {
                    if (isDebugEnable()) {
                        q.i("match sleepTime:" + iIntValue + " minutes");
                    }
                    com.tencent.stat.common.p.b(context, d, System.currentTimeMillis() + ((long) (iIntValue * 60 * PipawSDK.PAY_CANCEL)));
                    setEnableStatService(false);
                    q.warn("MTA is disable for current SDK version");
                }
            }
            if (a(jSONObject2, "sv", StatConstants.VERSION)) {
                q.i("match sdk version:2.0.0");
                z2 = true;
            } else {
                z2 = false;
            }
            if (a(jSONObject2, "md", Build.MODEL)) {
                q.i("match MODEL:" + Build.MODEL);
                z2 = true;
            }
            if (a(jSONObject2, "av", com.tencent.stat.common.k.j(context))) {
                q.i("match app version:" + com.tencent.stat.common.k.j(context));
                z2 = true;
            }
            if (a(jSONObject2, "mf", Build.MANUFACTURER + StatConstants.MTA_COOPERATION_TAG)) {
                q.i("match MANUFACTURER:" + Build.MANUFACTURER + StatConstants.MTA_COOPERATION_TAG);
                z2 = true;
            }
            if (a(jSONObject2, "osv", Build.VERSION.SDK_INT + StatConstants.MTA_COOPERATION_TAG)) {
                q.i("match android SDK version:" + Build.VERSION.SDK_INT);
                z2 = true;
            }
            if (a(jSONObject2, "ov", Build.VERSION.SDK_INT + StatConstants.MTA_COOPERATION_TAG)) {
                q.i("match android SDK version:" + Build.VERSION.SDK_INT);
                z2 = true;
            }
            if (a(jSONObject2, MidEntity.TAG_IMEI, au.a(context).b(context).b())) {
                q.i("match imei:" + au.a(context).b(context).b());
                z2 = true;
            }
            if (a(jSONObject2, MidEntity.TAG_MID, getLocalMidOnly(context))) {
                q.i("match mid:" + getLocalMidOnly(context));
                z2 = true;
            }
            if (z2) {
                a(com.tencent.stat.common.k.b(StatConstants.VERSION));
            }
        } catch (Exception e2) {
            q.e((Throwable) e2);
        }
    }

    static void b(JSONObject jSONObject) {
        if (jSONObject == null || jSONObject.length() == 0) {
            return;
        }
        try {
            b(g.a(), jSONObject);
            String string = jSONObject.getString(c);
            if (isDebugEnable()) {
                q.d("hibernateVer:" + string + ", current version:" + StatConstants.VERSION);
            }
            long jB = com.tencent.stat.common.k.b(string);
            if (com.tencent.stat.common.k.b(StatConstants.VERSION) <= jB) {
                a(jB);
            }
        } catch (JSONException e2) {
            q.d("__HIBERNATE__ not found.");
        }
    }

    static int c() {
        return N;
    }

    public static synchronized String getAppKey(Context context) {
        String str;
        if (C != null) {
            str = C;
        } else {
            if (context != null && C == null) {
                C = com.tencent.stat.common.k.f(context);
            }
            if (C == null || C.trim().length() == 0) {
                q.error("AppKey can not be null or empty, please read Developer's Guide first!");
            }
            str = C;
        }
        return str;
    }

    public static int getCurSessionStatReportCount() {
        return L;
    }

    public static StatCustomLogger getCustomLogger() {
        return T;
    }

    public static String getCustomProperty(String str) {
        try {
            return a.b.getString(str);
        } catch (Throwable th) {
            q.e(th);
            return null;
        }
    }

    public static String getCustomProperty(String str, String str2) {
        try {
            String string = a.b.getString(str);
            return string != null ? string : str2;
        } catch (Throwable th) {
            q.e(th);
            return str2;
        }
    }

    public static String getCustomUserId(Context context) {
        if (context == null) {
            q.error("Context for getCustomUid is null.");
            return null;
        }
        if (R == null) {
            R = com.tencent.stat.common.p.a(context, "MTA_CUSTOM_UID", StatConstants.MTA_COOPERATION_TAG);
        }
        return R;
    }

    public static StatDataTransfer getDataTransfer() {
        return p;
    }

    public static long getFlushDBSpaceMS() {
        return n;
    }

    public static synchronized String getInstallChannel(Context context) {
        String str;
        if (D != null) {
            str = D;
        } else {
            D = com.tencent.stat.common.p.a(context, E, StatConstants.MTA_COOPERATION_TAG);
            if (D == null || D.trim().length() == 0) {
                D = com.tencent.stat.common.k.g(context);
            }
            if (D == null || D.trim().length() == 0) {
                q.w("installChannel can not be null or empty, please read Developer's Guide first!");
            }
            str = D;
        }
        return str;
    }

    public static String getLocalMidOnly(Context context) {
        return MidService.getLocalMidOnly(context);
    }

    public static int getMaxBatchReportCount() {
        return z;
    }

    public static int getMaxDaySessionNumbers() {
        return M;
    }

    public static int getMaxImportantDataSendRetryCount() {
        return y;
    }

    public static int getMaxParallelTimmingEvents() {
        return G;
    }

    public static int getMaxReportEventLength() {
        return P;
    }

    public static int getMaxSendRetryCount() {
        return x;
    }

    public static int getMaxSessionStatReportCount() {
        return K;
    }

    public static int getMaxStoreEventCount() {
        return v;
    }

    public static String getMid(Context context) {
        return MidService.getMid(context);
    }

    public static long getMsPeriodForMethodsCalledLimitClear() {
        return i;
    }

    public static int getNumEventsCachedInMemory() {
        return m;
    }

    public static int getNumEventsCommitPerSec() {
        return A;
    }

    public static int getNumOfMethodsCalledLimit() {
        return h;
    }

    public static String getQQ(Context context) {
        return com.tencent.stat.common.p.a(context, "mta.acc.qq", f);
    }

    public static int getReportCompressedSize() {
        return o;
    }

    public static int getSendPeriodMinutes() {
        return F;
    }

    public static int getSessionTimoutMillis() {
        return u;
    }

    public static String getStatReportHost() {
        return k;
    }

    public static String getStatReportUrl() {
        return J;
    }

    public static StatReportStrategy getStatSendStrategy() {
        return r;
    }

    public static void initNativeCrashReport(Context context, String str) {
        if (isEnableStatService()) {
            if (context == null) {
                q.error("The Context of StatConfig.initNativeCrashReport() can not be null!");
            } else {
                StatNativeCrashReport.initNativeCrash(context, str);
            }
        }
    }

    public static boolean isAutoExceptionCaught() {
        return isAutoExceptionCaught;
    }

    public static boolean isDebugEnable() {
        return s;
    }

    public static boolean isEnableConcurrentProcess() {
        return Q;
    }

    public static boolean isEnableSmartReporting() {
        return j;
    }

    public static boolean isEnableStatService() {
        return t;
    }

    public static boolean isReportEventsByOrder() {
        return l;
    }

    public static boolean isXGProMode() {
        return S;
    }

    public static void setAppKey(Context context, String str) {
        if (context == null) {
            q.error("ctx in StatConfig.setAppKey() is null");
            return;
        }
        if (str == null || str.length() > 256) {
            q.error("appkey in StatConfig.setAppKey() is null or exceed 256 bytes");
            return;
        }
        if (C == null) {
            C = a(context);
        }
        if (a(str) || a(com.tencent.stat.common.k.f(context))) {
            a(context, C);
        }
    }

    public static void setAppKey(String str) {
        if (str == null) {
            q.error("appkey in StatConfig.setAppKey() is null");
        } else if (str.length() > 256) {
            q.error("The length of appkey cann't exceed 256 bytes.");
        } else {
            C = str;
        }
    }

    public static void setAutoExceptionCaught(boolean z2) {
        isAutoExceptionCaught = z2;
    }

    public static void setCustomLogger(StatCustomLogger statCustomLogger) {
        T = statCustomLogger;
    }

    public static void setCustomUserId(Context context, String str) {
        if (context == null) {
            q.error("Context for setCustomUid is null.");
        } else {
            com.tencent.stat.common.p.b(context, "MTA_CUSTOM_UID", str);
            R = str;
        }
    }

    public static void setDataTransfer(StatDataTransfer statDataTransfer) {
        p = statDataTransfer;
    }

    public static void setDebugEnable(boolean z2) {
        s = z2;
        com.tencent.stat.common.k.b().setDebugEnable(z2);
    }

    public static void setEnableConcurrentProcess(boolean z2) {
        Q = z2;
    }

    public static void setEnableSmartReporting(boolean z2) {
        j = z2;
    }

    public static void setEnableStatService(boolean z2) {
        t = z2;
        if (z2) {
            return;
        }
        q.warn("!!!!!!MTA StatService has been disabled!!!!!!");
    }

    public static void setFlushDBSpaceMS(long j2) {
        if (j2 > 0) {
            n = j2;
        }
    }

    public static void setInstallChannel(Context context, String str) {
        if (str.length() > 128) {
            q.error("the length of installChannel can not exceed the range of 128 bytes.");
        } else {
            D = str;
            com.tencent.stat.common.p.b(context, E, str);
        }
    }

    public static void setInstallChannel(String str) {
        if (str.length() > 128) {
            q.error("the length of installChannel can not exceed the range of 128 bytes.");
        } else {
            D = str;
        }
    }

    public static void setMaxBatchReportCount(int i2) {
        if (a(i2, 2, PipawSDK.PAY_CANCEL)) {
            z = i2;
        } else {
            q.error("setMaxBatchReportCount can not exceed the range of [2,1000].");
        }
    }

    public static void setMaxDaySessionNumbers(int i2) {
        if (i2 <= 0) {
            q.e("maxDaySessionNumbers must be greater than 0.");
        } else {
            M = i2;
        }
    }

    public static void setMaxImportantDataSendRetryCount(int i2) {
        if (i2 > 100) {
            y = i2;
        }
    }

    public static void setMaxParallelTimmingEvents(int i2) {
        if (a(i2, 1, 4096)) {
            G = i2;
        } else {
            q.error("setMaxParallelTimmingEvents can not exceed the range of [1, 4096].");
        }
    }

    public static void setMaxReportEventLength(int i2) {
        if (i2 <= 0) {
            q.error("maxReportEventLength on setMaxReportEventLength() must greater than 0.");
        } else {
            P = i2;
        }
    }

    public static void setMaxSendRetryCount(int i2) {
        if (a(i2, 1, PipawSDK.PAY_CANCEL)) {
            x = i2;
        } else {
            q.error("setMaxSendRetryCount can not exceed the range of [1,1000].");
        }
    }

    public static void setMaxSessionStatReportCount(int i2) {
        if (i2 < 0) {
            q.error("maxSessionStatReportCount cannot be less than 0.");
        } else {
            K = i2;
        }
    }

    public static void setMaxStoreEventCount(int i2) {
        if (a(i2, 0, 500000)) {
            v = i2;
        } else {
            q.error("setMaxStoreEventCount can not exceed the range of [0, 500000].");
        }
    }

    public static void setNativeCrashDebugEnable(boolean z2) {
        StatNativeCrashReport.setNativeCrashDebugEnable(z2);
    }

    public static void setNumEventsCachedInMemory(int i2) {
        if (i2 >= 0) {
            m = i2;
        }
    }

    public static void setNumEventsCommitPerSec(int i2) {
        if (i2 > 0) {
            A = i2;
        }
    }

    public static void setNumOfMethodsCalledLimit(int i2, long j2) {
        h = i2;
        if (j2 >= 1000) {
            i = j2;
        }
    }

    public static void setQQ(Context context, String str) {
        com.tencent.stat.common.p.b(context, "mta.acc.qq", str);
        f = str;
    }

    public static void setReportCompressedSize(int i2) {
        if (i2 > 0) {
            o = i2;
        }
    }

    public static void setReportEventsByOrder(boolean z2) {
        l = z2;
    }

    public static void setSendPeriodMinutes(int i2) {
        if (a(i2, 1, 10080)) {
            F = i2;
        } else {
            q.error("setSendPeriodMinutes can not exceed the range of [1, 7*24*60] minutes.");
        }
    }

    public static void setSessionTimoutMillis(int i2) {
        if (a(i2, PipawSDK.PAY_CANCEL, 86400000)) {
            u = i2;
        } else {
            q.error("setSessionTimoutMillis can not exceed the range of [1000, 24 * 60 * 60 * 1000].");
        }
    }

    public static void setStatReportUrl(String str) {
        if (str == null || str.length() == 0) {
            q.error("statReportUrl cannot be null or empty.");
            return;
        }
        J = str;
        try {
            k = new URI(J).getHost();
        } catch (Exception e2) {
            q.w(e2);
        }
        if (isDebugEnable()) {
            q.i("url:" + J + ", domain:" + k);
        }
    }

    public static void setStatSendStrategy(StatReportStrategy statReportStrategy) {
        r = statReportStrategy;
        if (statReportStrategy != StatReportStrategy.PERIOD) {
            StatServiceImpl.c = 0L;
        }
        if (isDebugEnable()) {
            q.d("Change to statSendStrategy: " + statReportStrategy);
        }
    }

    public static void setXGProMode(boolean z2) {
        S = z2;
    }
}
