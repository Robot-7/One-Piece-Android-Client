package com.igexin.push.core.c;

import android.content.ContentValues;

/* JADX INFO: loaded from: classes.dex */
class e extends com.igexin.push.b.d {
    final /* synthetic */ long a;
    final /* synthetic */ c b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    e(c cVar, ContentValues contentValues, long j) {
        super(contentValues);
        this.b = cVar;
        this.a = j;
    }

    @Override // com.igexin.push.b.d
    public void a() {
        this.c.delete("ral", "id=?", new String[]{String.valueOf(this.a)});
    }
}
