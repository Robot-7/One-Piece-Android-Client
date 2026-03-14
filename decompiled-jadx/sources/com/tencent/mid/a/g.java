package com.tencent.mid.a;

import android.content.Context;
import android.util.Log;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.util.Util;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class g {
    protected Context a;
    private int b;

    public g(Context context) {
        this.a = null;
        this.b = 0;
        this.a = context;
        this.b = (int) (System.currentTimeMillis() / 1000);
    }

    public int a() {
        return 2;
    }

    public JSONObject a(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        jSONObject.put("et", a());
        b(jSONObject);
        return jSONObject;
    }

    protected void b(JSONObject jSONObject) {
        try {
            jSONObject.put(MidEntity.TAG_MID, "0");
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, this.b);
            jSONObject.put("si", this.b);
            Util.jsonPut(jSONObject, MidEntity.TAG_IMEI, Util.getImei(this.a));
            Util.jsonPut(jSONObject, MidEntity.TAG_MAC, Util.getWifiMacAddress(this.a));
            MidEntity midEntityA = com.tencent.mid.b.g.a(this.a).a();
            if (midEntityA != null && Util.isMidValid(midEntityA.getMid())) {
                jSONObject.put(MidEntity.TAG_MID, midEntityA.getMid());
            }
            new com.tencent.mid.util.e(this.a).a(jSONObject);
        } catch (Throwable th) {
            Log.e("MID", "encode error.", th);
        }
    }
}
