package com.tencent.wxop.stat.b;

import android.content.Context;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class d {
    static e cw;
    private static b cx = l.av();
    private static JSONObject cz = new JSONObject();
    String c;
    Integer cy;

    public d(Context context) {
        this.cy = null;
        this.c = null;
        try {
            u(context);
            this.cy = l.F(context.getApplicationContext());
            this.c = com.tencent.wxop.stat.h.r(context).b();
        } catch (Throwable th) {
            cx.b(th);
        }
    }

    private static synchronized e u(Context context) {
        if (cw == null) {
            cw = new e(context.getApplicationContext(), (byte) 0);
        }
        return cw;
    }

    public final void a(JSONObject jSONObject, Thread thread) {
        JSONObject jSONObject2 = new JSONObject();
        try {
            if (cw != null) {
                cw.a(jSONObject2, thread);
            }
            r.a(jSONObject2, "cn", this.c);
            if (this.cy != null) {
                jSONObject2.put("tn", this.cy);
            }
            if (thread == null) {
                jSONObject.put("ev", jSONObject2);
            } else {
                jSONObject.put("errkv", jSONObject2.toString());
            }
            if (cz == null || cz.length() <= 0) {
                return;
            }
            jSONObject.put("eva", cz);
        } catch (Throwable th) {
            cx.b(th);
        }
    }
}
