package com.igexin.push.core.a;

import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
class g implements Comparator {
    final /* synthetic */ f a;

    g(f fVar) {
        this.a = fVar;
    }

    @Override // java.util.Comparator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compare(com.igexin.push.core.bean.l lVar, com.igexin.push.core.bean.l lVar2) {
        if (lVar.c() != lVar2.c()) {
            return lVar.c().compareTo(lVar2.c());
        }
        return 0;
    }
}
