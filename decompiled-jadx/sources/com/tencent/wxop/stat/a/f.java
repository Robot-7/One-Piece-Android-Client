package com.tencent.wxop.stat.a;

import android.content.Context;
import com.tencent.wxop.stat.b.r;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class f extends d {
    public static final com.tencent.wxop.stat.g bw;

    static {
        com.tencent.wxop.stat.g gVar = new com.tencent.wxop.stat.g();
        bw = gVar;
        gVar.s("A9VH9B8L4GX4");
    }

    public f(Context context) {
        super(context, 0, bw);
    }

    @Override // com.tencent.wxop.stat.a.d
    public final e ac() {
        return e.NETWORK_DETECTOR;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final boolean b(JSONObject jSONObject) {
        r.a(jSONObject, "actky", com.tencent.wxop.stat.c.d(this.bv));
        return true;
    }
}
