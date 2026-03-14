package com.igexin.push.b;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.push.a.j;
import com.igexin.push.core.f;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class a extends com.igexin.a.a.d.d {
    private static final String e = j.a;
    protected SQLiteDatabase a;
    protected Cursor b;
    List c;
    boolean d;

    public a() {
        super(1);
        this.c = new LinkedList();
    }

    public void a(com.igexin.push.core.c.a aVar) {
        this.c.add(aVar);
    }

    @Override // com.igexin.a.a.d.d
    public void a_() {
        super.a_();
        this.a = f.a().i().getWritableDatabase();
        this.a.setVersion(2);
        Iterator it = this.c.iterator();
        while (it.hasNext()) {
            ((com.igexin.push.core.c.a) it.next()).a(this.a);
        }
        for (com.igexin.push.core.c.a aVar : this.c) {
            if (this.d) {
                aVar.c(this.a);
            } else {
                aVar.b(this.a);
            }
        }
        com.igexin.a.a.b.d.c().a(new c(-980948));
        com.igexin.a.a.b.d.c().d();
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2147483639;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
        if (this.b != null) {
            try {
                this.b.close();
            } catch (Exception e2) {
            }
        }
    }

    @Override // com.igexin.a.a.d.d
    public void d() {
        super.d();
        this.z = true;
        this.U = true;
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }
}
