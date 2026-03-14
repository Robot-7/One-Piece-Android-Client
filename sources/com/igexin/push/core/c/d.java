package com.igexin.push.core.c;

import android.content.ContentValues;

/* JADX INFO: loaded from: classes.dex */
class d extends com.igexin.push.b.d {
    final /* synthetic */ c a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    d(c cVar, ContentValues contentValues) {
        super(contentValues);
        this.a = cVar;
    }

    @Override // com.igexin.push.b.d
    public void a() {
        this.c.replace("ral", null, this.e);
    }
}
