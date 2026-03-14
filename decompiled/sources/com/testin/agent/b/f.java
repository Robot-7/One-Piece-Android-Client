package com.testin.agent.b;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.mid.api.MidEntity;
import com.testin.agent.base.TestinGVariables;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class f {
    public static Handler a;
    private d b;
    private Context c;

    public f() {
        HandlerThread handlerThread = new HandlerThread("TestinAgent");
        handlerThread.start();
        a = new g(this, handlerThread.getLooper());
        com.testin.agent.f.e.a(Long.valueOf(handlerThread.getId()));
    }

    public static void a(Context context, int i, String str, String str2) {
        new b(context).a(i, str, str2);
    }

    private void d(Context context) {
        if (new com.testin.agent.c.c(context).a("crashtable") > 0) {
            com.testin.agent.a.a.a(context).a();
        } else {
            com.testin.agent.a.a.b();
        }
        a.post(new i(this, context));
        if (TestinGVariables.c().b() == null || TestinGVariables.c().a() == null) {
            e(context);
        }
    }

    private void e(Context context) {
        a.post(new j(this, context));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void f(Context context) {
        com.testin.agent.d.d dVar = new com.testin.agent.d.d();
        dVar.a(com.testin.agent.f.c.b(context));
        dVar.b(com.testin.agent.f.c.c(context));
        TestinGVariables.c().a(dVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void g(Context context) {
        com.testin.agent.d.c cVar = new com.testin.agent.d.c();
        cVar.a(com.testin.agent.f.e.b(context));
        cVar.b(com.testin.agent.f.e.a(context));
        cVar.c("1");
        cVar.h(context.getPackageName());
        cVar.d(Build.VERSION.RELEASE);
        cVar.e(String.valueOf(Build.BRAND) + "/" + Build.MODEL);
        cVar.f("5.0");
        cVar.g("1.7.1");
        cVar.i(TestinGVariables.c().f);
        TestinGVariables.c().a(cVar);
    }

    public void a(Context context) {
        try {
            this.c = context;
            TestinGVariables.c().d = context;
            com.testin.agent.f.d.a(this.c, true);
            this.c.registerReceiver(new k(null), new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            com.testin.agent.e.a aVarA = com.testin.agent.e.a.a();
            aVarA.a(this.c);
            Thread.setDefaultUncaughtExceptionHandler(aVarA);
            a.post(new h(this));
            d(this.c);
        } catch (Exception e) {
            e.a(e);
        }
    }

    public void b(Context context) {
        try {
            com.testin.agent.f.d.a(context, true);
            com.testin.agent.base.b.a("App on foreground");
            d(context);
        } catch (Exception e) {
            e.a(e);
        }
    }

    public void c(Context context) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("und", com.testin.agent.f.e.b(context));
            jSONObject.put("av", com.testin.agent.f.e.a(context));
            jSONObject.put("pgn", context.getPackageName());
            jSONObject.put("on", "1");
            jSONObject.put("ov", Build.VERSION.RELEASE);
            jSONObject.put("mt", String.valueOf(Build.BRAND) + "/" + Build.MODEL);
            jSONObject.put("pro", "5.0");
            jSONObject.put("sv", "1.7.1");
            jSONObject.put("chid", TestinGVariables.c().f);
        } catch (JSONException e) {
            e.a(e);
        }
        try {
            HttpResponse httpResponseA = this.b.a(com.testin.agent.f.c.a("/cpi/crash"), jSONObject.toString(), "register", com.testin.agent.f.d.f(context));
            if (httpResponseA.getStatusLine().getStatusCode() != 200) {
                com.testin.agent.base.b.c("TestinTestHandler", "ResponseCode: " + httpResponseA.getStatusLine().getStatusCode());
                return;
            }
            String string = EntityUtils.toString(httpResponseA.getEntity(), "UTF-8");
            com.testin.agent.base.b.a("TestinTestHandler", "ResultMsg: " + string);
            JSONObject jSONObject2 = new JSONObject(string);
            com.testin.agent.f.d.d(context, jSONObject2.getInt("to") * PipawSDK.PAY_CANCEL);
            com.testin.agent.f.d.a(context, jSONObject2.getInt("po"));
            com.testin.agent.f.d.b(context, jSONObject2.getInt("rc"));
            com.testin.agent.f.d.c(context, jSONObject2.getInt(MidEntity.TAG_MAC));
            com.testin.agent.f.d.a(context, jSONObject2.getString("lv"), jSONObject2.getString("tag"));
            if (jSONObject2.getInt("en") < 1) {
                com.testin.agent.base.b.a("TestinAgent Init Successed");
            } else {
                com.testin.agent.base.b.a("TestinAgent Init Failled");
            }
        } catch (Exception e2) {
            e.a(e2);
        }
    }
}
