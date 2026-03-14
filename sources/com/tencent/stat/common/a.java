package com.tencent.stat.common;

import com.tencent.mid.api.MidEntity;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private String a;
    private String b;
    private String c;
    private String d;
    private int e;
    private int f;
    private long g;

    public a() {
        this.a = null;
        this.b = null;
        this.c = null;
        this.d = "0";
        this.f = 0;
        this.g = 0L;
    }

    public a(String str, String str2, int i) {
        this.a = null;
        this.b = null;
        this.c = null;
        this.d = "0";
        this.f = 0;
        this.g = 0L;
        this.a = str;
        this.b = str2;
        this.e = i;
    }

    JSONObject a() {
        JSONObject jSONObject = new JSONObject();
        try {
            q.a(jSONObject, MidEntity.TAG_IMEI, this.a);
            q.a(jSONObject, MidEntity.TAG_MAC, this.b);
            q.a(jSONObject, MidEntity.TAG_MID, this.d);
            q.a(jSONObject, "aid", this.c);
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, this.g);
            jSONObject.put("ver", this.f);
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    public void a(int i) {
        this.e = i;
    }

    public String b() {
        return this.a;
    }

    public String c() {
        return this.b;
    }

    public int d() {
        return this.e;
    }

    public String toString() {
        return a().toString();
    }
}
