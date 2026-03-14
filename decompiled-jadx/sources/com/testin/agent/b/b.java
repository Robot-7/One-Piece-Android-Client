package com.testin.agent.b;

import android.content.Context;
import com.testin.agent.base.TestinGVariables;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private Context a;
    private d b;
    private boolean c = false;

    protected b(Context context) {
        this.b = null;
        this.a = context;
        if (this.b == null) {
            this.b = new d();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.testin.agent.c.a b(int i, String str, String str2) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        com.testin.agent.c.a aVar = new com.testin.agent.c.a();
        try {
            com.testin.agent.d.c cVarB = TestinGVariables.c().b();
            com.testin.agent.d.d dVarA = TestinGVariables.c().a();
            aVar.a(String.valueOf(i));
            aVar.b(String.valueOf(System.currentTimeMillis() / 1000));
            aVar.c(String.valueOf(11));
            aVar.e("5.0");
            aVar.d(cVarB.a().toString());
            aVar.f(com.testin.agent.f.e.h().toString());
            aVar.h(str);
            aVar.i(dVarA.a().toString());
            aVar.j(com.testin.agent.f.e.c(this.a));
            aVar.k(str2);
            aVar.l(com.testin.agent.f.e.d(this.a));
            aVar.m(com.testin.agent.f.a.a().toString());
            aVar.b(0);
            aVar.c(com.testin.agent.f.d.d(this.a));
            com.testin.agent.base.b.a("CustomExceptionHandler", "数据采集耗时（毫秒）：" + (System.currentTimeMillis() - jCurrentTimeMillis));
        } catch (Exception e) {
            e.a(e);
        }
        return aVar;
    }

    protected void a(int i, String str, String str2) {
        new c(this, i, str, str2).start();
        while (!this.c) {
            try {
                Thread.sleep(1L);
            } catch (InterruptedException e) {
                e.a(e);
            }
        }
    }
}
