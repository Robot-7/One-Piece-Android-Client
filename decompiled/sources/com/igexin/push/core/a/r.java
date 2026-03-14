package com.igexin.push.core.a;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class r extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("response_deviceid")) {
                return true;
            }
            com.igexin.push.core.c.f.a().a(jSONObject.getString("deviceid"));
            if (com.igexin.push.core.g.ay != null) {
                com.igexin.push.core.g.ay.t();
                com.igexin.push.core.g.ay = null;
            }
            if (com.igexin.push.core.g.B != null) {
                com.igexin.push.core.f.a().g().i();
            }
            com.igexin.a.a.c.a.a("deviceidRsp|" + com.igexin.push.core.g.B);
            return true;
        } catch (JSONException e) {
            return true;
        }
    }
}
