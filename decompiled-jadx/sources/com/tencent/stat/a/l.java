package com.tencent.stat.a;

import android.content.Context;
import com.tencent.stat.StatSpecifyReportedInfo;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class l extends e {
    private com.tencent.stat.common.b a;
    private JSONObject m;

    public l(Context context, int i, JSONObject jSONObject, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        super(context, i, statSpecifyReportedInfo);
        this.m = null;
        this.a = new com.tencent.stat.common.b(context);
        this.m = jSONObject;
    }

    @Override // com.tencent.stat.a.e
    public f a() {
        return f.SESSION_ENV;
    }

    @Override // com.tencent.stat.a.e
    public boolean a(JSONObject jSONObject) throws JSONException {
        if (this.e != null) {
            jSONObject.put("ut", this.e.d());
        }
        if (this.m != null) {
            jSONObject.put("cfg", this.m);
        }
        if (com.tencent.stat.common.k.y(this.l)) {
            jSONObject.put("ncts", 1);
        }
        this.a.a(jSONObject, (Thread) null);
        return true;
    }
}
