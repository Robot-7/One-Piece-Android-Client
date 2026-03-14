package com.tencent.wxop.stat.a;

import android.content.Context;
import com.tencent.wxop.stat.b.l;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class i extends d {
    private com.tencent.wxop.stat.b.d bJ;
    private JSONObject bK;

    public i(Context context, int i, JSONObject jSONObject, com.tencent.wxop.stat.g gVar) {
        super(context, i, gVar);
        this.bK = null;
        this.bJ = new com.tencent.wxop.stat.b.d(context);
        this.bK = jSONObject;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final e ac() {
        return e.SESSION_ENV;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final boolean b(JSONObject jSONObject) throws JSONException {
        if (this.bp != null) {
            jSONObject.put("ut", this.bp.as());
        }
        if (this.bK != null) {
            jSONObject.put("cfg", this.bK);
        }
        if (l.P(this.bv)) {
            jSONObject.put("ncts", 1);
        }
        this.bJ.a(jSONObject, null);
        return true;
    }
}
