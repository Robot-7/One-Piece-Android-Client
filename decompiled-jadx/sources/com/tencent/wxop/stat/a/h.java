package com.tencent.wxop.stat.a;

import android.content.Context;
import com.tencent.wxop.stat.b.r;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class h extends d {
    String aR;
    String aS;
    Long bI;

    public h(Context context, String str, String str2, int i, Long l, com.tencent.wxop.stat.g gVar) {
        super(context, i, gVar);
        this.bI = null;
        this.aS = str;
        this.aR = str2;
        this.bI = l;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final e ac() {
        return e.PAGE_VIEW;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final boolean b(JSONObject jSONObject) throws JSONException {
        r.a(jSONObject, "pi", this.aR);
        r.a(jSONObject, "rf", this.aS);
        if (this.bI == null) {
            return true;
        }
        jSONObject.put("du", this.bI);
        return true;
    }
}
