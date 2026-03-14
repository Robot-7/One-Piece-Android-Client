package com.igexin.push.core.b;

import android.content.ContentValues;

/* JADX INFO: loaded from: classes.dex */
class f extends com.igexin.push.b.d {
    final /* synthetic */ e a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    f(e eVar, ContentValues contentValues) {
        super(contentValues);
        this.a = eVar;
    }

    @Override // com.igexin.push.b.d
    public void a() {
        this.c.replace("ca", null, this.e);
    }
}
