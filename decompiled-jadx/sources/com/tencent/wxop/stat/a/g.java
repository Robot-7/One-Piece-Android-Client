package com.tencent.wxop.stat.a;

import android.content.Context;
import com.tencent.wxop.stat.b.l;
import com.tencent.wxop.stat.b.r;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class g extends d {
    private static String a = null;
    private String aR;
    private String aS;

    public g(Context context, int i, com.tencent.wxop.stat.g gVar) {
        super(context, i, gVar);
        this.aR = null;
        this.aS = null;
        this.aR = com.tencent.wxop.stat.h.r(context).b();
        if (a == null) {
            a = l.C(context);
        }
    }

    @Override // com.tencent.wxop.stat.a.d
    public final e ac() {
        return e.NETWORK_MONITOR;
    }

    public final void b(String str) {
        this.aS = str;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final boolean b(JSONObject jSONObject) throws JSONException {
        r.a(jSONObject, "op", a);
        r.a(jSONObject, "cn", this.aR);
        jSONObject.put("sp", this.aS);
        return true;
    }
}
