package com.igexin.push.core.c;

import android.database.sqlite.SQLiteDatabase;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class b implements a {
    private static b c;
    private Map b = new HashMap();
    com.igexin.push.f.a a = new com.igexin.push.f.a();

    private b() {
    }

    public static b a() {
        if (c == null) {
            c = new b();
        }
        return c;
    }

    @Override // com.igexin.push.core.c.a
    public void a(SQLiteDatabase sQLiteDatabase) {
    }

    @Override // com.igexin.push.core.c.a
    public void b(SQLiteDatabase sQLiteDatabase) {
    }

    @Override // com.igexin.push.core.c.a
    public void c(SQLiteDatabase sQLiteDatabase) {
    }
}
