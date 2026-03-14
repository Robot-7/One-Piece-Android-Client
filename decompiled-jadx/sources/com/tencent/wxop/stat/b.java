package com.tencent.wxop.stat;

import com.tencent.mid.api.MidEntity;
import com.tencent.stat.common.StatConstants;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class b {
    private long K = 0;
    private int g = 0;
    private String c = StatConstants.MTA_COOPERATION_TAG;
    private int L = 0;
    private String M = StatConstants.MTA_COOPERATION_TAG;

    public final void a(long j) {
        this.K = j;
    }

    public final JSONObject i() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("tm", this.K);
            jSONObject.put("st", this.g);
            if (this.c != null) {
                jSONObject.put("dm", this.c);
            }
            jSONObject.put("pt", this.L);
            if (this.M != null) {
                jSONObject.put("rip", this.M);
            }
            jSONObject.put(MidEntity.TAG_TIMESTAMPS, System.currentTimeMillis() / 1000);
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    public final void k(String str) {
        this.M = str;
    }

    public final void setDomain(String str) {
        this.c = str;
    }

    public final void setPort(int i) {
        this.L = i;
    }

    public final void setStatusCode(int i) {
        this.g = i;
    }
}
