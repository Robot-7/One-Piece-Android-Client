package com.igexin.push.core.a;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class c extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("bindappid_result")) {
                return true;
            }
            String string = jSONObject.getString("type");
            if (string == null || !"bind".equals(string)) {
                if (string == null || "unbind".equals(string)) {
                }
                return true;
            }
            String string2 = jSONObject.getString("result");
            String string3 = jSONObject.getString("appid");
            String string4 = jSONObject.getString("id");
            com.igexin.a.a.c.a.a("bindappRsp|" + string3 + "|success");
            try {
                if (com.igexin.push.core.c.c.a().a(Long.parseLong(string4))) {
                }
            } catch (NumberFormatException e) {
            }
            if (string2 != null && string2.equals("ok")) {
                return true;
            }
            com.igexin.a.a.c.a.a("bindappRsp|" + string3 + "|failed");
            return true;
        } catch (JSONException e2) {
            return true;
        }
    }
}
