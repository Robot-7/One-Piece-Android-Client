package com.testin.agent.d;

import com.tencent.stat.common.StatConstants;
import com.testin.agent.b.e;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class b extends a {
    private String a = StatConstants.MTA_COOPERATION_TAG;
    private String b = StatConstants.MTA_COOPERATION_TAG;
    private String c = StatConstants.MTA_COOPERATION_TAG;
    private String d = StatConstants.MTA_COOPERATION_TAG;
    private String e = StatConstants.MTA_COOPERATION_TAG;
    private String f = StatConstants.MTA_COOPERATION_TAG;
    private JSONArray g = null;
    private JSONArray h = null;

    public JSONObject a() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("act", this.a);
            jSONObject.put("et", this.b);
            jSONObject.put("log", this.c);
            jSONObject.put("ty", this.d);
            jSONObject.put("oti", this.h);
            jSONObject.put("csc", this.g);
            jSONObject.put("tm", this.f);
        } catch (JSONException e) {
            e.a(e);
        }
        return jSONObject;
    }

    public void a(String str) {
        this.a = str;
    }

    public void a(JSONArray jSONArray) {
        if (jSONArray != null) {
            this.g = jSONArray;
        } else {
            this.g = (JSONArray) JSONObject.NULL;
        }
    }

    public JSONObject b() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("act", this.a);
            jSONObject.put("et", this.b);
            jSONObject.put("log", this.c);
            jSONObject.put("ty", this.d);
            jSONObject.put("msg", this.e);
            jSONObject.put("csc", this.g);
            jSONObject.put("tm", this.f);
        } catch (JSONException e) {
            e.a(e);
        }
        return jSONObject;
    }

    public void b(String str) {
        this.b = str;
    }

    public void b(JSONArray jSONArray) {
        if (jSONArray != null) {
            this.h = jSONArray;
        } else {
            this.h = (JSONArray) JSONObject.NULL;
        }
    }

    public String c() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("act", this.a);
            jSONObject.put("log", this.c);
            jSONObject.put("ty", this.d);
            jSONObject.put("csc", this.g);
            jSONObject.put("tm", this.f);
            return jSONObject.toString();
        } catch (JSONException e) {
            e.a(e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public void c(String str) {
        this.e = str;
    }

    public void d(String str) {
        this.c = str;
    }

    public void e(String str) {
        this.d = str;
    }

    public void f(String str) {
        this.f = str;
    }
}
