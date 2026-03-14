package com.igexin.push.core.a;

import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class d extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("block_client") || !jSONObject.has("duration")) {
                return true;
            }
            long j = jSONObject.getLong("duration") * 1000;
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (j == 0) {
                return true;
            }
            com.igexin.push.a.k.g = j + jCurrentTimeMillis;
            com.igexin.push.a.a.a().e();
            com.igexin.push.e.b.g.g().h();
            return true;
        } catch (Exception e) {
            return true;
        }
    }
}
