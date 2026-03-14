package com.tencent.wxop.stat.a;

import android.content.Context;
import com.tencent.mid.api.MidEntity;
import com.tencent.stat.common.StatConstants;
import com.tencent.wxop.stat.b.l;
import com.tencent.wxop.stat.b.r;
import com.tencent.wxop.stat.u;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public abstract class d {
    protected static String bt = null;
    protected int L;
    protected long aZ = System.currentTimeMillis() / 1000;
    protected String b;
    protected int bf;
    protected com.tencent.wxop.stat.b.c bp;
    protected String bq;
    protected String br;
    protected String bs;
    protected boolean bu;
    protected Context bv;
    private com.tencent.wxop.stat.g bw;

    d(Context context, int i, com.tencent.wxop.stat.g gVar) {
        this.b = null;
        this.bp = null;
        this.bq = null;
        this.br = null;
        this.bs = null;
        this.bu = false;
        this.bw = null;
        this.bv = context;
        this.L = i;
        this.br = com.tencent.wxop.stat.c.e(context);
        this.bs = l.D(context);
        this.b = com.tencent.wxop.stat.c.d(context);
        if (gVar != null) {
            this.bw = gVar;
            if (l.e(gVar.S())) {
                this.b = gVar.S();
            }
            if (l.e(gVar.T())) {
                this.br = gVar.T();
            }
            if (l.e(gVar.getVersion())) {
                this.bs = gVar.getVersion();
            }
            this.bu = gVar.U();
        }
        this.bq = com.tencent.wxop.stat.c.g(context);
        this.bp = u.s(context).t(context);
        if (ac() != e.NETWORK_DETECTOR) {
            this.bf = l.K(context).intValue();
        } else {
            this.bf = -e.NETWORK_DETECTOR.r();
        }
        if (com.tencent.a.a.a.a.h.e(bt)) {
            return;
        }
        String strH = com.tencent.wxop.stat.c.h(context);
        bt = strH;
        if (l.e(strH)) {
            return;
        }
        bt = "0";
    }

    private boolean c(JSONObject jSONObject) {
        try {
            r.a(jSONObject, "ky", this.b);
            jSONObject.put("et", ac().r());
            if (this.bp != null) {
                jSONObject.put(MidEntity.TAG_IMEI, this.bp.b());
                r.a(jSONObject, MidEntity.TAG_MAC, this.bp.ar());
                int iAs = this.bp.as();
                jSONObject.put("ut", iAs);
                if (iAs == 0 && l.N(this.bv) == 1) {
                    jSONObject.put("ia", 1);
                }
            }
            r.a(jSONObject, "cui", this.bq);
            if (ac() != e.SESSION_ENV) {
                r.a(jSONObject, "av", this.bs);
                r.a(jSONObject, "ch", this.br);
            }
            if (this.bu) {
                jSONObject.put("impt", 1);
            }
            r.a(jSONObject, MidEntity.TAG_MID, bt);
            jSONObject.put("idx", this.bf);
            jSONObject.put("si", this.L);
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, this.aZ);
            jSONObject.put("dts", l.a(this.bv, false));
            return b(jSONObject);
        } catch (Throwable th) {
            return false;
        }
    }

    public final Context J() {
        return this.bv;
    }

    public final boolean X() {
        return this.bu;
    }

    public abstract e ac();

    public final long ad() {
        return this.aZ;
    }

    public final com.tencent.wxop.stat.g ae() {
        return this.bw;
    }

    public final String af() {
        try {
            JSONObject jSONObject = new JSONObject();
            c(jSONObject);
            return jSONObject.toString();
        } catch (Throwable th) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public abstract boolean b(JSONObject jSONObject);
}
