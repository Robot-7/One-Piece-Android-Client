package com.igexin.push.core.a;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class n extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("received")) {
                return true;
            }
            try {
                if (!com.igexin.push.core.c.c.a().a(Long.parseLong(jSONObject.getString("id")))) {
                    return true;
                }
                f.a().g();
                return true;
            } catch (NumberFormatException e) {
                return true;
            }
        } catch (JSONException e2) {
            return true;
        }
    }
}
