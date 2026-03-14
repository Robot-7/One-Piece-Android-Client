package com.igexin.getuiext.a;

import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
class d implements Comparator {
    final /* synthetic */ c a;

    d(c cVar) {
        this.a = cVar;
    }

    @Override // java.util.Comparator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compare(com.igexin.getuiext.data.a.c cVar, com.igexin.getuiext.data.a.c cVar2) {
        if (cVar.b != cVar2.b) {
            return cVar.b.compareTo(cVar2.b);
        }
        return 0;
    }
}
