package com.igexin.push.core.a;

/* JADX INFO: loaded from: classes.dex */
public class i extends a {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.a
    public boolean a(com.igexin.a.a.d.d dVar) {
        return false;
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(Object obj) {
        if (!(obj instanceof com.igexin.push.c.c.h)) {
            return true;
        }
        com.igexin.a.a.c.a.a("heartbeatRsp");
        com.igexin.push.core.i.a().a(com.igexin.push.core.k.HEARTBEAT_OK);
        return true;
    }
}
