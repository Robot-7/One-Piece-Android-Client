package com.tencent.stat;

import com.tencent.stat.common.StatConstants;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class f {
    int a;
    JSONObject b = new JSONObject();
    String c = StatConstants.MTA_COOPERATION_TAG;
    int d = 0;

    public f(int i) {
        this.a = i;
    }

    String a() {
        return this.b.toString();
    }
}
