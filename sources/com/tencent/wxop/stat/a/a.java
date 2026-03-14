package com.tencent.wxop.stat.a;

import android.content.Context;
import java.util.Map;
import java.util.Properties;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class a extends d {
    protected b bj;
    private long bk;

    public a(Context context, int i, String str, com.tencent.wxop.stat.g gVar) {
        super(context, i, gVar);
        this.bj = new b();
        this.bk = -1L;
        this.bj.a = str;
    }

    public final b ab() {
        return this.bj;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final e ac() {
        return e.CUSTOM;
    }

    @Override // com.tencent.wxop.stat.a.d
    public final boolean b(JSONObject jSONObject) throws JSONException {
        Properties propertiesP;
        jSONObject.put("ei", this.bj.a);
        if (this.bk > 0) {
            jSONObject.put("du", this.bk);
        }
        if (this.bj.bl != null) {
            jSONObject.put("ar", this.bj.bl);
            return true;
        }
        if (this.bj.a != null && (propertiesP = com.tencent.wxop.stat.f.p(this.bj.a)) != null && propertiesP.size() > 0) {
            if (this.bj.bm == null || this.bj.bm.length() == 0) {
                this.bj.bm = new JSONObject(propertiesP);
            } else {
                for (Map.Entry entry : propertiesP.entrySet()) {
                    try {
                        this.bj.bm.put(entry.getKey().toString(), entry.getValue());
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        jSONObject.put("kv", this.bj.bm);
        return true;
    }
}
