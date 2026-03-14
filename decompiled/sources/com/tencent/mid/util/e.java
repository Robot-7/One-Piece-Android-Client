package com.tencent.mid.util;

import android.content.Context;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class e {
    static g a;
    private static JSONObject d = null;
    Integer b;
    String c;

    public e(Context context) {
        this.b = null;
        this.c = null;
        try {
            a(context);
            this.b = i.e(context.getApplicationContext());
            this.c = i.d(context);
        } catch (Throwable th) {
            Util.logWarn(th);
        }
    }

    static synchronized g a(Context context) {
        if (a == null) {
            a = new g(context.getApplicationContext());
        }
        return a;
    }

    public void a(JSONObject jSONObject) {
        JSONObject jSONObject2 = new JSONObject();
        try {
            if (a != null) {
                a.a(jSONObject2);
            }
            Util.jsonPut(jSONObject2, "cn", this.c);
            if (this.b != null) {
                jSONObject2.put("tn", this.b);
            }
            jSONObject.put("ev", jSONObject2);
            if (d == null || d.length() <= 0) {
                return;
            }
            jSONObject.put("eva", d);
        } catch (Throwable th) {
            Util.logWarn(th);
        }
    }
}
