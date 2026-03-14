package com.igexin.push.core.a;

import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class q extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("response_ca_list")) {
                return true;
            }
            JSONArray jSONArray = jSONObject.getJSONArray("ca_list");
            HashMap map = new HashMap();
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                com.igexin.push.core.b.h hVar = new com.igexin.push.core.b.h();
                hVar.a(jSONObject2.getString("pkgname"));
                hVar.c(jSONObject2.getString("signature"));
                hVar.a(com.igexin.push.core.b.e.a().c(jSONObject2.getString("permissions")));
                map.put(hVar.a(), hVar);
            }
            com.igexin.push.core.c.f.a().e(System.currentTimeMillis());
            if (map.size() <= 0) {
                return true;
            }
            com.igexin.push.core.b.e.a().a(map);
            return true;
        } catch (JSONException e) {
            return true;
        }
    }
}
