package com.tencent.a.a.a.a;

import android.util.Log;
import com.tencent.mid.api.MidEntity;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class c {
    String a = null;
    String b = null;
    String c = "0";
    long d = 0;

    static c c(String str) {
        c cVar = new c();
        if (h.d(str)) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (!jSONObject.isNull(MidEntity.TAG_IMEI)) {
                    cVar.a = jSONObject.getString(MidEntity.TAG_IMEI);
                }
                if (!jSONObject.isNull(MidEntity.TAG_MAC)) {
                    cVar.b = jSONObject.getString(MidEntity.TAG_MAC);
                }
                if (!jSONObject.isNull(MidEntity.TAG_MID)) {
                    cVar.c = jSONObject.getString(MidEntity.TAG_MID);
                }
                if (!jSONObject.isNull(MidEntity.TAG_TIMESTAMPS)) {
                    cVar.d = jSONObject.getLong(MidEntity.TAG_TIMESTAMPS);
                }
            } catch (JSONException e) {
                Log.w("MID", e);
            }
        }
        return cVar;
    }

    private JSONObject d() {
        JSONObject jSONObject = new JSONObject();
        try {
            h.a(jSONObject, MidEntity.TAG_IMEI, this.a);
            h.a(jSONObject, MidEntity.TAG_MAC, this.b);
            h.a(jSONObject, MidEntity.TAG_MID, this.c);
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, this.d);
        } catch (JSONException e) {
            Log.w("MID", e);
        }
        return jSONObject;
    }

    public final String c() {
        return this.c;
    }

    public final String toString() {
        return d().toString();
    }
}
