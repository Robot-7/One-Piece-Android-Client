package com.igexin.push.core.a;

import java.util.Timer;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class m extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) throws Throwable {
        try {
            com.igexin.push.c.c.n nVar = (com.igexin.push.c.c.n) obj;
            if (jSONObject.has("action") && jSONObject.getString("action").equals("pushmessage")) {
                byte[] bArr = (nVar.f == null || !(nVar.f instanceof byte[])) ? null : (byte[]) nVar.f;
                String string = jSONObject.getString("taskid");
                if (com.igexin.push.core.g.an.containsKey(string)) {
                    ((Timer) com.igexin.push.core.g.an.get(string)).cancel();
                    com.igexin.push.core.g.an.remove(string);
                }
                f.a().a(jSONObject, bArr, true);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return true;
    }
}
