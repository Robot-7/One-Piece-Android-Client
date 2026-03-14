package com.tencent.wxop.stat;

import android.content.Context;
import android.os.Build;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.mid.api.MidEntity;
import com.tencent.stat.common.StatConstants;
import java.net.URI;
import java.util.Iterator;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class c {
    private static String Y;
    private static String Z;
    private static com.tencent.wxop.stat.b.b N = com.tencent.wxop.stat.b.l.av();
    static ai O = new ai(2);
    static ai P = new ai(1);
    private static d Q = d.APP_LAUNCH;
    private static boolean R = false;
    private static boolean S = true;
    private static int T = 30000;
    private static int U = 100000;
    private static int V = 30;
    private static int w = 10;
    private static int x = 100;
    private static int y = 30;
    private static int z = 1;
    static String c = "__HIBERNATE__";
    static String W = "__HIBERNATE__TIME";
    static String M = "__MTA_KILL__";
    private static String X = null;
    private static String aa = "mta_channel";
    static String ab = StatConstants.MTA_COOPERATION_TAG;
    private static int ac = Opcodes.GETFIELD;
    static boolean ad = false;
    static int ae = 100;
    static long af = 10000;
    private static int ag = 1024;
    static boolean ah = true;
    private static long ai = 0;
    private static long aj = 300000;
    public static boolean ak = true;
    static volatile String al = StatConstants.MTA_SERVER;
    private static volatile String am = StatConstants.MTA_REPORT_FULL_URL;
    private static int an = 0;
    private static volatile int ao = 0;
    private static int ap = 20;
    private static int aq = 0;
    private static boolean ar = false;
    private static int as = 4096;
    private static boolean at = false;
    private static String au = null;
    private static boolean av = false;
    private static aj aw = null;
    static boolean ax = true;
    static int ay = 0;
    static long az = 10000;
    static int aA = 512;

    public static int A() {
        return ap;
    }

    static void B() {
        aq++;
    }

    static void C() {
        aq = 0;
    }

    static int D() {
        return aq;
    }

    public static boolean E() {
        return at;
    }

    public static aj F() {
        return aw;
    }

    static void a(Context context, ai aiVar) {
        if (aiVar.aI != P.aI) {
            if (aiVar.aI == O.aI) {
                O = aiVar;
            }
        } else {
            P = aiVar;
            a(aiVar.df);
            if (P.df.isNull("iplist")) {
                return;
            }
            h.r(context).b(P.df.getString("iplist"));
        }
    }

    private static void a(Context context, ai aiVar, JSONObject jSONObject) {
        boolean z2;
        try {
            try {
                Iterator<String> itKeys = jSONObject.keys();
                boolean z3 = false;
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    if (next.equalsIgnoreCase("v")) {
                        int i = jSONObject.getInt(next);
                        boolean z4 = aiVar.L != i ? true : z3;
                        aiVar.L = i;
                        z3 = z4;
                    } else if (next.equalsIgnoreCase("c")) {
                        String string = jSONObject.getString("c");
                        if (string.length() > 0) {
                            aiVar.df = new JSONObject(string);
                        }
                    } else if (next.equalsIgnoreCase("m")) {
                        aiVar.c = jSONObject.getString("m");
                    }
                }
                if (z3) {
                    u uVarS = u.s(al.aB());
                    if (uVarS != null) {
                        uVarS.b(aiVar);
                    }
                    if (aiVar.aI == P.aI) {
                        a(aiVar.df);
                        JSONObject jSONObject2 = aiVar.df;
                        if (jSONObject2 != null && jSONObject2.length() != 0) {
                            try {
                                Context contextAB = al.aB();
                                try {
                                    String strOptString = jSONObject2.optString(M);
                                    if (com.tencent.wxop.stat.b.l.e(strOptString)) {
                                        JSONObject jSONObject3 = new JSONObject(strOptString);
                                        if (jSONObject3.length() != 0) {
                                            if (!jSONObject3.isNull("sm")) {
                                                Object obj = jSONObject3.get("sm");
                                                int iIntValue = obj instanceof Integer ? ((Integer) obj).intValue() : obj instanceof String ? Integer.valueOf((String) obj).intValue() : 0;
                                                if (iIntValue > 0) {
                                                    if (R) {
                                                        N.b("match sleepTime:" + iIntValue + " minutes");
                                                    }
                                                    com.tencent.wxop.stat.b.q.a(contextAB, W, System.currentTimeMillis() + ((long) (iIntValue * 60 * PipawSDK.PAY_CANCEL)));
                                                    a(false);
                                                    N.warn("MTA is disable for current SDK version");
                                                }
                                            }
                                            if (b(jSONObject3, "sv", "2.0.2")) {
                                                N.b("match sdk version:2.0.2");
                                                z2 = true;
                                            } else {
                                                z2 = false;
                                            }
                                            if (b(jSONObject3, "md", Build.MODEL)) {
                                                N.b("match MODEL:" + Build.MODEL);
                                                z2 = true;
                                            }
                                            if (b(jSONObject3, "av", com.tencent.wxop.stat.b.l.D(contextAB))) {
                                                N.b("match app version:" + com.tencent.wxop.stat.b.l.D(contextAB));
                                                z2 = true;
                                            }
                                            if (b(jSONObject3, "mf", Build.MANUFACTURER)) {
                                                N.b("match MANUFACTURER:" + Build.MANUFACTURER);
                                                z2 = true;
                                            }
                                            if (b(jSONObject3, "osv", new StringBuilder().append(Build.VERSION.SDK_INT).toString())) {
                                                N.b("match android SDK version:" + Build.VERSION.SDK_INT);
                                                z2 = true;
                                            }
                                            if (b(jSONObject3, "ov", new StringBuilder().append(Build.VERSION.SDK_INT).toString())) {
                                                N.b("match android SDK version:" + Build.VERSION.SDK_INT);
                                                z2 = true;
                                            }
                                            if (b(jSONObject3, MidEntity.TAG_IMEI, u.s(contextAB).t(contextAB).b())) {
                                                N.b("match imei:" + u.s(contextAB).t(contextAB).b());
                                                z2 = true;
                                            }
                                            if (b(jSONObject3, MidEntity.TAG_MID, h(contextAB))) {
                                                N.b("match mid:" + h(contextAB));
                                                z2 = true;
                                            }
                                            if (z2) {
                                                b(com.tencent.wxop.stat.b.l.u("2.0.2"));
                                            }
                                        }
                                    }
                                } catch (Exception e) {
                                    N.b((Throwable) e);
                                }
                                String string2 = jSONObject2.getString(c);
                                if (R) {
                                    N.e("hibernateVer:" + string2 + ", current version:2.0.2");
                                }
                                long jU = com.tencent.wxop.stat.b.l.u(string2);
                                if (com.tencent.wxop.stat.b.l.u("2.0.2") <= jU) {
                                    b(jU);
                                }
                            } catch (JSONException e2) {
                                N.e("__HIBERNATE__ not found.");
                            }
                        }
                    }
                }
                a(context, aiVar);
            } catch (Throwable th) {
                N.b(th);
            }
        } catch (JSONException e3) {
            N.b((Throwable) e3);
        }
    }

    static void a(Context context, JSONObject jSONObject) {
        try {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                if (next.equalsIgnoreCase(Integer.toString(P.aI))) {
                    a(context, P, jSONObject.getJSONObject(next));
                } else if (next.equalsIgnoreCase(Integer.toString(O.aI))) {
                    a(context, O, jSONObject.getJSONObject(next));
                } else {
                    if (!next.equalsIgnoreCase("rs")) {
                        return;
                    }
                    d dVarA = d.a(jSONObject.getInt(next));
                    if (dVarA != null) {
                        Q = dVarA;
                        if (R) {
                            N.e("Change to ReportStrategy:" + dVarA.name());
                        }
                    }
                }
            }
        } catch (JSONException e) {
            N.b((Throwable) e);
        }
    }

    public static void a(d dVar) {
        Q = dVar;
        if (dVar != d.PERIOD) {
            f.aZ = 0L;
        }
        if (R) {
            N.e("Change to statSendStrategy: " + dVar);
        }
    }

    private static void a(JSONObject jSONObject) {
        try {
            d dVarA = d.a(jSONObject.getInt("rs"));
            if (dVarA != null) {
                a(dVarA);
            }
        } catch (JSONException e) {
            if (R) {
                N.b("rs not found.");
            }
        }
    }

    public static void a(boolean z2) {
        S = z2;
        if (z2) {
            return;
        }
        N.warn("!!!!!!MTA StatService has been disabled!!!!!!");
    }

    private static void b(long j) {
        com.tencent.wxop.stat.b.q.a(al.aB(), c, j);
        a(false);
        N.warn("MTA is disable for current SDK version");
    }

    public static void b(Context context, String str) {
        String str2;
        if (context == null) {
            N.error("ctx in StatConfig.setAppKey() is null");
            return;
        }
        if (str == null || str.length() > 256) {
            N.error("appkey in StatConfig.setAppKey() is null or exceed 256 bytes");
            return;
        }
        if (Y == null) {
            Y = com.tencent.wxop.stat.b.r.t(com.tencent.wxop.stat.b.q.c(context, "_mta_ky_tag_", null));
        }
        if ((!m(str) && !m(com.tencent.wxop.stat.b.l.z(context))) || (str2 = Y) == null) {
            return;
        }
        com.tencent.wxop.stat.b.q.d(context, "_mta_ky_tag_", com.tencent.wxop.stat.b.r.q(str2));
    }

    private static boolean b(JSONObject jSONObject, String str, String str2) {
        if (!jSONObject.isNull(str)) {
            String strOptString = jSONObject.optString(str);
            if (com.tencent.wxop.stat.b.l.e(str2) && com.tencent.wxop.stat.b.l.e(strOptString) && str2.equalsIgnoreCase(strOptString)) {
                return true;
            }
        }
        return false;
    }

    public static void c(Context context, String str) {
        if (str.length() > 128) {
            N.error("the length of installChannel can not exceed the range of 128 bytes.");
        } else {
            Z = str;
            com.tencent.wxop.stat.b.q.d(context, aa, str);
        }
    }

    public static synchronized String d(Context context) {
        String str;
        if (Y != null) {
            str = Y;
        } else {
            if (context != null && Y == null) {
                Y = com.tencent.wxop.stat.b.l.z(context);
            }
            if (Y == null || Y.trim().length() == 0) {
                N.error("AppKey can not be null or empty, please read Developer's Guide first!");
            }
            str = Y;
        }
        return str;
    }

    public static synchronized String e(Context context) {
        String str;
        if (Z != null) {
            str = Z;
        } else {
            String strC = com.tencent.wxop.stat.b.q.c(context, aa, StatConstants.MTA_COOPERATION_TAG);
            Z = strC;
            if (strC == null || Z.trim().length() == 0) {
                Z = com.tencent.wxop.stat.b.l.A(context);
            }
            if (Z == null || Z.trim().length() == 0) {
                N.c("installChannel can not be null or empty, please read Developer's Guide first!");
            }
            str = Z;
        }
        return str;
    }

    public static String f(Context context) {
        return com.tencent.wxop.stat.b.q.c(context, "mta.acc.qq", ab);
    }

    public static String g(Context context) {
        if (context == null) {
            N.error("Context for getCustomUid is null.");
            return null;
        }
        if (au == null) {
            au = com.tencent.wxop.stat.b.q.c(context, "MTA_CUSTOM_UID", StatConstants.MTA_COOPERATION_TAG);
        }
        return au;
    }

    public static String h(Context context) {
        return context != null ? com.tencent.a.a.a.a.g.a(context).f().c() : "0";
    }

    public static d j() {
        return Q;
    }

    public static boolean k() {
        return R;
    }

    static String l(String str) {
        String string;
        try {
            string = P.df.getString(str);
        } catch (Throwable th) {
            N.c("can't find custom key:" + str);
        }
        if (string != null) {
            return string;
        }
        return null;
    }

    public static boolean l() {
        return S;
    }

    public static int m() {
        return T;
    }

    private static boolean m(String str) {
        if (str == null) {
            return false;
        }
        if (Y == null) {
            Y = str;
            return true;
        }
        if (Y.contains(str)) {
            return false;
        }
        Y += "|" + str;
        return true;
    }

    public static int n() {
        return x;
    }

    public static void n(String str) {
        if (str.length() > 128) {
            N.error("the length of installChannel can not exceed the range of 128 bytes.");
        } else {
            Z = str;
        }
    }

    public static int o() {
        return y;
    }

    public static void o(String str) {
        if (str == null || str.length() == 0) {
            N.error("statReportUrl cannot be null or empty.");
            return;
        }
        am = str;
        try {
            al = new URI(am).getHost();
        } catch (Exception e) {
            N.c(e);
        }
        if (R) {
            N.b("url:" + am + ", domain:" + al);
        }
    }

    public static int p() {
        return w;
    }

    public static int q() {
        return z;
    }

    static int r() {
        return V;
    }

    public static int s() {
        return U;
    }

    public static void t() {
        ac = 60;
    }

    public static int u() {
        return ac;
    }

    public static int v() {
        return ag;
    }

    public static void w() {
        ah = true;
    }

    public static boolean x() {
        return ak;
    }

    public static String y() {
        return am;
    }

    static synchronized void z() {
        ao = 0;
    }
}
