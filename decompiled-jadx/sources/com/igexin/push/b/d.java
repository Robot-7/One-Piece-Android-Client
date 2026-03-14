package com.igexin.push.b;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.push.a.j;
import com.igexin.push.core.f;

/* JADX INFO: loaded from: classes.dex */
public abstract class d extends com.igexin.a.a.d.d {
    private static final String a = j.a;
    protected SQLiteDatabase c;
    protected Cursor d;
    protected ContentValues e;
    public c f;

    public d() {
        super(1);
    }

    public d(ContentValues contentValues) {
        super(1);
        this.e = contentValues;
    }

    public abstract void a();

    @Override // com.igexin.a.a.d.d
    public void a_() {
        super.a_();
        this.c = f.a().i().getWritableDatabase();
        a();
        if (this.f != null) {
            com.igexin.a.a.b.d.c().a(this.f);
            com.igexin.a.a.b.d.c().d();
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2147483640;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
        if (this.d == null || this.d.isClosed()) {
            return;
        }
        try {
            this.d.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.igexin.a.a.d.d
    public void d() {
        this.z = true;
        this.U = true;
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }
}
