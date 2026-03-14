package com.testin.agent.b;

import com.tencent.stat.common.StatConstants;
import com.testin.agent.base.TestinGVariables;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class e {
    public static void a(Exception exc) {
        try {
            HttpResponse httpResponseA = new d().a(com.testin.agent.f.c.a("/cpi/crash"), b(exc), "sdkcatch", com.testin.agent.f.d.f(TestinGVariables.c().d));
            int statusCode = httpResponseA.getStatusLine().getStatusCode();
            if (statusCode == 200) {
                com.testin.agent.base.b.a("TestinDebug", "ResultMsg:" + EntityUtils.toString(httpResponseA.getEntity(), "UTF-8"));
            } else {
                com.testin.agent.base.b.c("TestinDebug", "ResponseCode: " + statusCode);
            }
        } catch (Exception e) {
            com.testin.agent.base.b.c("TestinDebug", "Exception: " + e.toString());
        }
    }

    private static String b(Exception exc) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("et", com.testin.agent.f.e.a(exc));
            return jSONObject.toString();
        } catch (JSONException e) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }
}
