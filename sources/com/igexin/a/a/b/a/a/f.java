package com.igexin.a.a.b.a.a;

import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
class f implements Comparator {
    final /* synthetic */ e a;

    f(e eVar) {
        this.a = eVar;
    }

    @Override // java.util.Comparator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compare(g gVar, g gVar2) {
        if (gVar == null) {
            return 1;
        }
        if (gVar2 == null) {
            return -1;
        }
        if (((long) gVar.K) + gVar.I <= ((long) gVar2.K) + gVar2.I) {
            return ((long) gVar.K) + gVar.I < ((long) gVar2.K) + gVar2.I ? -1 : 0;
        }
        return 1;
    }
}
