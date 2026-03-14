package com.tencent.wxop.stat.b;

import com.tencent.mid.api.MidEntity;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class c {
    private String W;
    private String a;
    private String b;
    private int bf;
    private String c;
    private int cu;
    private long cv;

    public c() {
        this.a = null;
        this.b = null;
        this.c = null;
        this.W = "0";
        this.bf = 0;
        this.cv = 0L;
    }

    public c(String str, String str2, int i) {
        this.a = null;
        this.b = null;
        this.c = null;
        this.W = "0";
        this.bf = 0;
        this.cv = 0L;
        this.a = str;
        this.b = str2;
        this.cu = i;
    }

    private JSONObject aq() {
        JSONObject jSONObject = new JSONObject();
        try {
            r.a(jSONObject, MidEntity.TAG_IMEI, this.a);
            r.a(jSONObject, MidEntity.TAG_MAC, this.b);
            r.a(jSONObject, MidEntity.TAG_MID, this.W);
            r.a(jSONObject, "aid", this.c);
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, this.cv);
            jSONObject.put("ver", this.bf);
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    public final String ar() {
        return this.b;
    }

    public final int as() {
        return this.cu;
    }

    public final String b() {
        return this.a;
    }

    public final String toString() {
        return aq().toString();
    }

    public final void z() {
        this.cu = 1;
    }
}
