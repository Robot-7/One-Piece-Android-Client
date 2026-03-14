package com.igexin.push.core.a;

/* JADX INFO: loaded from: classes.dex */
public class p extends a {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.a
    public boolean a(com.igexin.a.a.d.d dVar) {
        return false;
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(Object obj) {
        boolean z = false;
        if (obj instanceof com.igexin.push.c.c.o) {
            com.igexin.push.c.c.o oVar = (com.igexin.push.c.c.o) obj;
            com.igexin.a.a.c.a.a("registerReq|" + oVar.a + "|" + com.igexin.push.core.g.t);
            if (oVar.a != com.igexin.push.core.g.t) {
                com.igexin.push.core.g.p = false;
                com.igexin.push.core.c.f.a().a(oVar.a);
                com.igexin.push.core.g.I = 0L;
                z = true;
            }
            com.igexin.push.c.c.i iVarC = f.a().c();
            com.igexin.a.a.c.a.a("loginReqAfterRegister|" + iVarC.a);
            com.igexin.a.a.c.a.a("newtoken|" + com.igexin.a.b.a.a(String.valueOf(com.igexin.push.core.g.t)));
            com.igexin.push.core.f.a().e().a("S-" + iVarC.a, iVarC);
            if (z) {
            }
        }
        return true;
    }
}
