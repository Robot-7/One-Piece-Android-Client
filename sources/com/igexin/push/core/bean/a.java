package com.igexin.push.core.bean;

import android.os.Build;
import com.igexin.sdk.PushBuildConfig;
import com.tencent.stat.common.StatConstants;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class a {
    public String a;
    public String b;
    public String c;
    public String d;
    public String e;
    public String f = "open";
    public String g;
    public String h;
    public String i;
    public String j;
    public String k;
    public long l;

    public a() {
        if (com.igexin.push.core.g.g != null) {
            this.f += ":" + com.igexin.push.core.g.g;
        }
        this.e = PushBuildConfig.sdk_conf_version;
        this.b = com.igexin.push.core.g.x;
        this.c = com.igexin.push.core.g.w;
        this.d = com.igexin.push.core.g.z;
        this.i = com.igexin.push.core.g.A;
        this.a = com.igexin.push.core.g.y;
        this.h = "ANDROID";
        this.j = "android" + Build.VERSION.RELEASE;
        this.k = "MDP";
        this.g = com.igexin.push.core.g.B;
        this.l = System.currentTimeMillis();
    }

    public static String a(a aVar) {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("model", aVar.a == null ? StatConstants.MTA_COOPERATION_TAG : aVar.a);
        jSONObject.put("sim", aVar.b == null ? StatConstants.MTA_COOPERATION_TAG : aVar.b);
        jSONObject.put("imei", aVar.c == null ? StatConstants.MTA_COOPERATION_TAG : aVar.c);
        jSONObject.put("mac", aVar.d == null ? StatConstants.MTA_COOPERATION_TAG : aVar.d);
        jSONObject.put("version", aVar.e == null ? StatConstants.MTA_COOPERATION_TAG : aVar.e);
        jSONObject.put("channelid", aVar.f == null ? StatConstants.MTA_COOPERATION_TAG : aVar.f);
        jSONObject.put("type", "ANDROID");
        jSONObject.put("app", aVar.k == null ? StatConstants.MTA_COOPERATION_TAG : aVar.k);
        jSONObject.put("deviceid", "ANDROID-" + (aVar.g == null ? StatConstants.MTA_COOPERATION_TAG : aVar.g));
        jSONObject.put("system_version", aVar.j == null ? StatConstants.MTA_COOPERATION_TAG : aVar.j);
        jSONObject.put("cell", aVar.i == null ? StatConstants.MTA_COOPERATION_TAG : aVar.i);
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("action", "addphoneinfo");
        jSONObject2.put("id", String.valueOf(aVar.l));
        jSONObject2.put("info", jSONObject);
        return jSONObject2.toString();
    }
}
