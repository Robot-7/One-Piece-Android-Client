package com.igexin.push.c.a;

import com.igexin.a.a.b.e;
import com.igexin.a.a.b.f;
import com.igexin.push.c.c.h;
import com.igexin.push.c.c.k;
import com.igexin.push.c.c.m;
import com.igexin.push.c.c.n;
import com.igexin.push.c.c.o;

/* JADX INFO: loaded from: classes.dex */
public class a extends com.igexin.a.a.b.c {
    a(String str, com.igexin.a.a.b.c cVar) {
        super(str, true);
        a(cVar);
    }

    @Override // com.igexin.a.a.b.c
    public Object a(f fVar, e eVar, Object obj) {
        if (obj instanceof com.igexin.push.c.c.e) {
            com.igexin.push.c.c.e eVar2 = (com.igexin.push.c.c.e) obj;
            com.igexin.push.c.c.b bVar = new com.igexin.push.c.c.b();
            bVar.b = (byte) eVar2.i;
            bVar.a(eVar2.d());
            bVar.c = eVar2.j;
            return bVar;
        }
        if (!(obj instanceof com.igexin.push.c.c.e[])) {
            return null;
        }
        com.igexin.push.c.c.e[] eVarArr = (com.igexin.push.c.c.e[]) obj;
        com.igexin.push.c.c.b[] bVarArr = new com.igexin.push.c.c.b[eVarArr.length];
        for (int i = 0; i < eVarArr.length; i++) {
            bVarArr[i] = new com.igexin.push.c.c.b();
            bVarArr[i].b = (byte) eVarArr[i].i;
            bVarArr[i].a(eVarArr[i].d());
        }
        return bVarArr;
    }

    @Override // com.igexin.a.a.b.c
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public com.igexin.a.a.d.a.f c(f fVar, e eVar, Object obj) {
        com.igexin.push.c.c.e aVar = null;
        if (obj == null) {
            return null;
        }
        if (obj instanceof h) {
            return (com.igexin.a.a.d.a.f) obj;
        }
        com.igexin.push.c.c.b bVar = (com.igexin.push.c.c.b) obj;
        switch (bVar.b) {
            case 5:
                aVar = new k();
                break;
            case 9:
                aVar = new o();
                break;
            case 26:
                aVar = new n();
                break;
            case 28:
                aVar = new com.igexin.push.c.c.a();
                break;
            case 37:
                aVar = new m();
                break;
        }
        if (aVar != null) {
            aVar.a(bVar.d);
        }
        return aVar;
    }
}
