package com.igexin.push.core.a;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class s extends b {
    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("sendmessage_feedback")) {
                return true;
            }
            f.a().a(jSONObject.getString("appid"), jSONObject.getString("taskid"), jSONObject.getString("actionid"), jSONObject.getString("result"), jSONObject.getLong("timestamp"));
            return true;
        } catch (JSONException e) {
            return true;
        }
    }
}
