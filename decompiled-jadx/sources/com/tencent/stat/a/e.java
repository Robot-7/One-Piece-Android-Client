package com.tencent.stat.a;

import android.content.Context;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.util.Util;
import com.tencent.stat.StatConfig;
import com.tencent.stat.StatSpecifyReportedInfo;
import com.tencent.stat.au;
import com.tencent.stat.common.StatConstants;
import com.tencent.stat.common.q;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public abstract class e {
    protected static String j = null;
    private StatSpecifyReportedInfo a;
    protected String b;
    protected long c = System.currentTimeMillis() / 1000;
    protected int d;
    protected com.tencent.stat.common.a e;
    protected int f;
    protected String g;
    protected String h;
    protected String i;
    protected boolean k;
    protected Context l;

    e(Context context, int i, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.b = null;
        this.e = null;
        this.g = null;
        this.h = null;
        this.i = null;
        this.k = false;
        this.a = null;
        this.l = context;
        this.d = i;
        this.h = StatConfig.getInstallChannel(context);
        this.i = com.tencent.stat.common.k.j(context);
        this.b = StatConfig.getAppKey(context);
        if (statSpecifyReportedInfo != null) {
            this.a = statSpecifyReportedInfo;
            if (com.tencent.stat.common.k.c(statSpecifyReportedInfo.getAppKey())) {
                this.b = statSpecifyReportedInfo.getAppKey();
            }
            if (com.tencent.stat.common.k.c(statSpecifyReportedInfo.getInstallChannel())) {
                this.h = statSpecifyReportedInfo.getInstallChannel();
            }
            if (com.tencent.stat.common.k.c(statSpecifyReportedInfo.getVersion())) {
                this.i = statSpecifyReportedInfo.getVersion();
            }
            this.k = statSpecifyReportedInfo.isImportant();
        }
        this.g = StatConfig.getCustomUserId(context);
        this.e = au.a(context).b(context);
        if (a() != f.NETWORK_DETECTOR) {
            this.f = com.tencent.stat.common.k.s(context).intValue();
        } else {
            this.f = -f.NETWORK_DETECTOR.a();
        }
        if (Util.isMidValid(j)) {
            return;
        }
        j = StatConfig.getLocalMidOnly(context);
        if (com.tencent.stat.common.k.c(j)) {
            return;
        }
        j = "0";
    }

    public abstract f a();

    public abstract boolean a(JSONObject jSONObject) throws JSONException;

    public boolean b(JSONObject jSONObject) {
        try {
            q.a(jSONObject, "ky", this.b);
            jSONObject.put("et", a().a());
            if (this.e != null) {
                jSONObject.put(MidEntity.TAG_IMEI, this.e.b());
                q.a(jSONObject, MidEntity.TAG_MAC, this.e.c());
                int iD = this.e.d();
                jSONObject.put("ut", iD);
                if (iD == 0 && com.tencent.stat.common.k.w(this.l) == 1) {
                    jSONObject.put("ia", 1);
                }
            }
            q.a(jSONObject, "cui", this.g);
            if (a() != f.SESSION_ENV) {
                q.a(jSONObject, "av", this.i);
                q.a(jSONObject, "ch", this.h);
            }
            if (this.k) {
                jSONObject.put("impt", 1);
            }
            q.a(jSONObject, MidEntity.TAG_MID, j);
            jSONObject.put("idx", this.f);
            jSONObject.put("si", this.d);
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, this.c);
            jSONObject.put("dts", com.tencent.stat.common.k.a(this.l, false));
            return a(jSONObject);
        } catch (Throwable th) {
            return false;
        }
    }

    public long c() {
        return this.c;
    }

    public StatSpecifyReportedInfo d() {
        return this.a;
    }

    public Context e() {
        return this.l;
    }

    public boolean f() {
        return this.k;
    }

    public String g() {
        try {
            JSONObject jSONObject = new JSONObject();
            b(jSONObject);
            return jSONObject.toString();
        } catch (Throwable th) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }
}
