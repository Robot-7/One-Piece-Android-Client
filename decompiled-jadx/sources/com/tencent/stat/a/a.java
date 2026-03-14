package com.tencent.stat.a;

import android.content.Context;
import com.tencent.stat.StatAccount;
import com.tencent.stat.StatSpecifyReportedInfo;
import com.tencent.stat.common.q;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class a extends e {
    private StatAccount a;

    public a(Context context, int i, StatAccount statAccount, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        super(context, i, statSpecifyReportedInfo);
        this.a = null;
        this.a = statAccount;
    }

    @Override // com.tencent.stat.a.e
    public f a() {
        return f.ADDITION;
    }

    @Override // com.tencent.stat.a.e
    public boolean a(JSONObject jSONObject) throws JSONException {
        q.a(jSONObject, "qq", this.a.getAccount());
        jSONObject.put("acc", this.a.toJsonString());
        return true;
    }
}
