package com.igexin.push.e.b;

import com.igexin.push.core.bean.PushTaskBean;

/* JADX INFO: loaded from: classes.dex */
public class c extends h {
    private PushTaskBean a;
    private String b;

    public c(PushTaskBean pushTaskBean, String str, long j) {
        super(j);
        this.A = false;
        this.a = pushTaskBean;
        this.b = str;
    }

    @Override // com.igexin.push.e.b.h
    protected void a() {
        com.igexin.push.core.a.f.a().b(this.a, this.b);
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
    }
}
