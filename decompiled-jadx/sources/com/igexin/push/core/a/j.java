package com.igexin.push.core.a;

import android.text.TextUtils;
import com.igexin.getuiext.data.Consts;

/* JADX INFO: loaded from: classes.dex */
public class j extends a {
    @Override // com.igexin.push.core.a.a
    public boolean a(com.igexin.a.a.d.d dVar) {
        return false;
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(Object obj) throws Throwable {
        if ((obj instanceof com.igexin.push.c.c.k) && !com.igexin.push.core.g.o) {
            com.igexin.push.core.c.r.c();
            if (((com.igexin.push.c.c.k) obj).a) {
                com.igexin.a.a.c.a.a("loginRsp|" + com.igexin.push.core.g.u + "|success");
                f.a().g();
                if (TextUtils.isEmpty(com.igexin.push.core.g.B)) {
                    f.a().h();
                }
                if (!com.igexin.push.core.g.p) {
                    f.a().l();
                    com.igexin.push.core.g.p = true;
                }
                com.igexin.push.core.g.o = true;
                f.a().m();
                f.a().D();
                try {
                    long jCurrentTimeMillis = System.currentTimeMillis() - com.igexin.push.core.g.K;
                    String strG = f.a().g("ua");
                    if ((strG == null || "1".equals(strG)) && com.igexin.push.a.k.l && jCurrentTimeMillis - 259200000 > 0) {
                        if (!com.igexin.a.b.a.a(f.a().q()).equals(f.a().o()) || com.igexin.push.core.g.K == 0) {
                            com.igexin.push.core.g.K = System.currentTimeMillis();
                            f.a().p();
                        }
                    }
                } catch (Exception e) {
                }
                try {
                    if ((System.currentTimeMillis() - com.igexin.push.core.g.J) - Consts.TIME_24HOUR > 0) {
                        f.a().j();
                    }
                } catch (Exception e2) {
                }
                if ((System.currentTimeMillis() - com.igexin.push.core.g.I) - Consts.TIME_24HOUR > 0) {
                    f.a().b(com.igexin.push.core.g.c);
                    if (TextUtils.isEmpty(com.igexin.push.core.g.B)) {
                        if (com.igexin.push.core.g.ay != null) {
                            com.igexin.push.core.g.ay.t();
                            com.igexin.push.core.g.ay = null;
                        }
                        com.igexin.push.core.g.ay = new k(this, 30000L);
                        com.igexin.push.core.f.a().a(com.igexin.push.core.g.ay);
                    } else {
                        f.a().i();
                    }
                    com.igexin.push.core.g.I = System.currentTimeMillis();
                }
                try {
                    if ((System.currentTimeMillis() - com.igexin.push.core.g.N) - Consts.TIME_24HOUR > 0) {
                        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new com.igexin.push.e.a.c(new com.igexin.push.core.d.e(com.igexin.push.core.g.a())), false, true);
                    }
                } catch (Exception e3) {
                }
                com.igexin.push.core.c.f.a().b();
                com.igexin.push.core.f.a().f().a();
            } else {
                com.igexin.a.a.c.a.a("loginRsp|" + com.igexin.push.core.g.u + "|failed");
                com.igexin.push.core.c.f.a().a(0L);
                f.a().e();
                com.igexin.a.a.b.d.c().a(new com.igexin.push.c.b.b());
                com.igexin.a.a.b.d.c().d();
            }
        }
        return true;
    }
}
