package com.igexin.a.a.b;

/* JADX INFO: loaded from: classes.dex */
public abstract class f extends com.igexin.a.a.d.d {
    public String a;
    public c b;
    public Object c;
    public e d;

    public f(int i, String str, c cVar) {
        super(i);
        if (str != null) {
            this.a = a(str);
        }
        this.b = cVar;
    }

    public f(String str, c cVar) {
        this(0, str, cVar);
    }

    private final String a(String str) {
        return g.a(g.a(str));
    }

    @Override // com.igexin.a.a.d.d
    public void f() {
        if (this.b != null) {
            this.b.a(false);
        }
        this.b = null;
        this.d = null;
        this.c = null;
        this.a = null;
        super.f();
    }
}
