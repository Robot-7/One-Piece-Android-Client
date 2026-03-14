package com.testin.agent.d;

import com.tencent.stat.common.StatConstants;
import com.testin.agent.b.e;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class c extends a {
    private String a = StatConstants.MTA_COOPERATION_TAG;
    private String b = StatConstants.MTA_COOPERATION_TAG;
    private String c = StatConstants.MTA_COOPERATION_TAG;
    private String d = StatConstants.MTA_COOPERATION_TAG;
    private String e = StatConstants.MTA_COOPERATION_TAG;
    private String f = StatConstants.MTA_COOPERATION_TAG;
    private String g = StatConstants.MTA_COOPERATION_TAG;
    private String h = StatConstants.MTA_COOPERATION_TAG;
    private String i = StatConstants.MTA_COOPERATION_TAG;

    public JSONObject a() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("und", this.a);
            jSONObject.put("av", this.b);
            jSONObject.put("pgn", this.c);
            jSONObject.put("on", this.d);
            jSONObject.put("ov", this.e);
            jSONObject.put("mt", this.f);
            jSONObject.put("pro", this.g);
            jSONObject.put("sv", this.h);
            jSONObject.put("chid", this.i);
        } catch (JSONException e) {
            e.a(e);
        }
        return jSONObject;
    }

    public void a(String str) {
        this.a = str;
    }

    public void b(String str) {
        this.b = str;
    }

    public void c(String str) {
        this.d = str;
    }

    public void d(String str) {
        this.e = str;
    }

    public void e(String str) {
        this.f = str;
    }

    public void f(String str) {
        this.g = str;
    }

    public void g(String str) {
        this.h = str;
    }

    public void h(String str) {
        this.c = str;
    }

    public void i(String str) {
        this.i = str;
    }
}
