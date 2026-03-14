package com.testin.agent.d;

import com.tencent.stat.common.StatConstants;
import com.testin.agent.b.e;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class d extends a {
    private String a = StatConstants.MTA_COOPERATION_TAG;
    private String b = StatConstants.MTA_COOPERATION_TAG;

    public JSONObject a() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("isp", this.a);
            jSONObject.put("nt", this.b);
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
}
