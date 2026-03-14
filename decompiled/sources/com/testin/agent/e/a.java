package com.testin.agent.e;

import android.content.Context;
import android.os.Process;
import com.testin.agent.b.d;
import com.testin.agent.base.TestinGVariables;
import com.testin.agent.d.c;
import com.testin.agent.f.e;
import java.lang.Thread;

/* JADX INFO: loaded from: classes.dex */
public class a implements Thread.UncaughtExceptionHandler {
    private static a a;
    private Thread.UncaughtExceptionHandler b;
    private Context c;
    private d d;
    private boolean e = false;

    private a() {
        if (this.d == null) {
            this.d = new d();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized com.testin.agent.c.a a(Throwable th) {
        com.testin.agent.c.a aVar;
        long jCurrentTimeMillis = System.currentTimeMillis();
        aVar = new com.testin.agent.c.a();
        try {
            c cVarB = TestinGVariables.c().b();
            com.testin.agent.d.d dVarA = TestinGVariables.c().a();
            aVar.a(String.valueOf(0));
            aVar.b(String.valueOf(System.currentTimeMillis() / 1000));
            aVar.c(String.valueOf(10));
            aVar.e("5.0");
            aVar.d(cVarB.a().toString());
            aVar.f(e.h().toString());
            aVar.g(e.a().toString());
            aVar.i(dVarA.a().toString());
            aVar.j(e.c(this.c));
            aVar.k(e.a(th));
            aVar.l(e.d(this.c));
            aVar.m(com.testin.agent.f.a.a().toString());
            aVar.b(0);
            aVar.c(com.testin.agent.f.d.d(this.c));
            com.testin.agent.base.b.a("CrashHandler", "数据采集耗时（毫秒）：" + (System.currentTimeMillis() - jCurrentTimeMillis));
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return aVar;
    }

    public static synchronized a a() {
        if (a == null) {
            a = new a();
        }
        return a;
    }

    public void a(Context context) {
        this.c = context;
        this.b = Thread.getDefaultUncaughtExceptionHandler();
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable th) {
        e.a((Long) null);
        if (this.e) {
            com.testin.agent.base.b.c("CrashHandler", "Crash info is reported");
            Process.killProcess(Process.myPid());
            return;
        }
        new b(this, th).start();
        while (!this.e) {
            try {
                Thread.sleep(1L);
            } catch (InterruptedException e) {
                com.testin.agent.b.e.a(e);
            }
        }
        this.b.uncaughtException(thread, th);
    }
}
