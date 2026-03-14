package com.testin.agent.e;

import com.testin.agent.b.e;
import com.testin.agent.f.c;
import com.testin.agent.f.d;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class b extends Thread {
    final /* synthetic */ a a;
    private final /* synthetic */ Throwable b;

    b(a aVar, Throwable th) {
        this.a = aVar;
        this.b = th;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // java.lang.Thread, java.lang.Runnable
    public void run() throws Throwable {
        com.testin.agent.c.a aVarA = this.a.a(this.b);
        try {
        } catch (Exception e) {
            e.a(e);
        } finally {
        }
        switch (d.c(this.a.c)) {
            case 0:
                if (c.a(this.a.c)) {
                    String strA = com.testin.agent.f.a.a(aVarA);
                    try {
                        com.testin.agent.f.e.a((Long) null);
                        HttpResponse httpResponseA = this.a.d.a(c.a("/cpi/crash"), strA, "submit", d.f(this.a.c));
                        if (httpResponseA.getStatusLine().getStatusCode() == 200) {
                            String string = EntityUtils.toString(httpResponseA.getEntity(), "UTF-8");
                            com.testin.agent.base.b.a("CrashHandler", "ResultMsg:" + string);
                            switch (new JSONObject(string).getInt("en")) {
                                case 0:
                                    break;
                                default:
                                    com.testin.agent.f.a.a(this.a.c, aVarA);
                                    break;
                            }
                        } else {
                            com.testin.agent.base.b.c("CrashHandler", "ResponseCode: " + httpResponseA.getStatusLine().getStatusCode());
                            com.testin.agent.f.a.a(this.a.c, aVarA);
                        }
                    } catch (Exception e2) {
                        com.testin.agent.f.a.a(this.a.c, aVarA);
                        e.a(e2);
                    } finally {
                    }
                } else {
                    this.a.e = true;
                    com.testin.agent.f.a.a(this.a.c, aVarA);
                    com.testin.agent.base.b.a("CrashHandler", "Current network is disconnected or disabled");
                }
                super.run();
                return;
            case 1:
                com.testin.agent.f.a.a(this.a.c, aVarA);
                this.a.e = true;
                super.run();
                return;
            default:
                super.run();
                return;
        }
    }
}
