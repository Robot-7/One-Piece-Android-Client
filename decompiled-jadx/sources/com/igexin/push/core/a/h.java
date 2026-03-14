package com.igexin.push.core.a;

import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class h extends a {
    private static final String a = com.igexin.push.a.j.a;
    private static Map b;

    public h() {
        b = new HashMap();
        b.put("redirect_server", new o());
        b.put("response_deviceid", new r());
        b.put("pushmessage", new m());
        b.put("response_ca_list", new q());
        b.put("bindappid_result", new c());
        b.put("received", new n());
        b.put("sendmessage_feedback", new s());
        b.put("block_client", new d());
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(com.igexin.a.a.d.d dVar) {
        return false;
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(Object obj) {
        if (obj instanceof com.igexin.push.c.c.n) {
            com.igexin.push.c.c.n nVar = (com.igexin.push.c.c.n) obj;
            if (nVar.a() && nVar.e != null) {
                try {
                    JSONObject jSONObject = new JSONObject((String) nVar.e);
                    if (jSONObject.has("id")) {
                        f.a().a(jSONObject.getString("id"));
                    }
                    if (jSONObject != null && jSONObject.has("action")) {
                        b bVar = (b) b.get(jSONObject.getString("action"));
                        if (bVar != null) {
                            return bVar.a(obj, jSONObject);
                        }
                    }
                } catch (Exception e) {
                }
            }
        }
        return false;
    }
}
