package com.tencent.stat.a;

import android.content.Context;
import com.tencent.stat.StatSpecifyReportedInfo;
import com.tencent.stat.common.q;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class k extends e {
    Long a;
    String m;
    String n;

    public k(Context context, String str, String str2, int i, Long l, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        super(context, i, statSpecifyReportedInfo);
        this.a = null;
        this.n = str;
        this.m = str2;
        this.a = l;
    }

    @Override // com.tencent.stat.a.e
    public f a() {
        return f.PAGE_VIEW;
    }

    @Override // com.tencent.stat.a.e
    public boolean a(JSONObject jSONObject) throws JSONException {
        q.a(jSONObject, "pi", this.m);
        q.a(jSONObject, "rf", this.n);
        if (this.a == null) {
            return true;
        }
        jSONObject.put("du", this.a);
        return true;
    }
}
