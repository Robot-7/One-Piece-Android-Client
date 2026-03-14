package com.testin.agent.b;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class c extends Thread {
    final /* synthetic */ b a;
    private final /* synthetic */ int b;
    private final /* synthetic */ String c;
    private final /* synthetic */ String d;

    c(b bVar, int i, String str, String str2) {
        this.a = bVar;
        this.b = i;
        this.c = str;
        this.d = str2;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() throws Throwable {
        com.testin.agent.c.a aVarB = this.a.b(this.b, this.c, this.d);
        switch (com.testin.agent.f.d.c(this.a.a)) {
            case 0:
                if (!com.testin.agent.f.c.a(this.a.a)) {
                    this.a.c = true;
                    com.testin.agent.f.a.a(this.a.a, aVarB);
                    com.testin.agent.base.b.c("CustomExceptionHandler", "Current network is disconnected or disabled");
                } else {
                    String strB = com.testin.agent.f.a.b(aVarB);
                    try {
                        com.testin.agent.f.e.a((Long) null);
                        HttpResponse httpResponseA = this.a.b.a(com.testin.agent.f.c.a("/cpi/crash"), strB, "exception", com.testin.agent.f.d.f(this.a.a));
                        if (httpResponseA.getStatusLine().getStatusCode() == 200) {
                            String string = EntityUtils.toString(httpResponseA.getEntity(), "UTF-8");
                            com.testin.agent.base.b.a("CustomExceptionHandler", "ResultMsg:" + string);
                            switch (new JSONObject(string).getInt("en")) {
                                case 0:
                                    break;
                                default:
                                    com.testin.agent.f.a.a(this.a.a, aVarB);
                                    break;
                            }
                        } else {
                            com.testin.agent.base.b.c("CustomExceptionHandler", "ResponseCode: " + httpResponseA.getStatusLine().getStatusCode());
                            com.testin.agent.f.a.a(this.a.a, aVarB);
                        }
                    } catch (Exception e) {
                        com.testin.agent.f.a.a(this.a.a, aVarB);
                        e.a(e);
                    } finally {
                    }
                }
                break;
            case 1:
                try {
                    com.testin.agent.f.a.a(this.a.a, aVarB);
                    this.a.c = true;
                } catch (Exception e2) {
                    e.a(e2);
                } finally {
                }
                break;
        }
        super.run();
    }
}
