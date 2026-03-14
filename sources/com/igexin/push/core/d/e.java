package com.igexin.push.core.d;

import com.igexin.sdk.PushBuildConfig;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class e extends com.igexin.push.e.a.b {
    public e(String str) {
        super(str);
        a();
    }

    public void a() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("action", "sdkconfig");
            jSONObject.put("cid", com.igexin.push.core.g.u);
            jSONObject.put("appid", com.igexin.push.core.g.c);
            jSONObject.put("sdk_version", PushBuildConfig.sdk_conf_version);
            b(com.igexin.a.b.a.b(jSONObject.toString().getBytes()));
        } catch (Exception e) {
        }
    }

    @Override // com.igexin.push.e.a.b
    public void a(byte[] bArr) throws Throwable {
        com.igexin.push.core.a.f.a().a(bArr);
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }
}
