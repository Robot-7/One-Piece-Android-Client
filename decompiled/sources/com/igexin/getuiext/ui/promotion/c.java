package com.igexin.getuiext.ui.promotion;

import android.content.Context;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
public abstract class c implements View.OnClickListener {
    protected b a;
    protected Context b;
    protected int c;
    protected int d;
    protected com.igexin.getuiext.ui.f e;
    private m f;
    private String g;
    private String h;

    public c(Context context, m mVar) {
        this.b = context.getApplicationContext();
        this.f = mVar;
        this.e = com.igexin.getuiext.ui.f.a(context);
        this.c = com.igexin.getuiext.ui.a.a(context, 2.0f);
        this.d = com.igexin.getuiext.ui.a.a(context, 3.0f);
    }

    public abstract View a(int i, int i2);

    public m a() {
        return this.f;
    }

    protected void a(View view) {
        if (this.a == null) {
            b(view);
        } else {
            if (this.a.a(this)) {
                return;
            }
            b(view);
            this.a.b(this);
        }
    }

    public void a(String str) {
        this.g = str;
    }

    public String b() {
        return this.g;
    }

    protected abstract void b(View view);

    public void b(String str) {
        this.h = str;
    }

    public String c() {
        return this.h;
    }

    public abstract void c(String str);

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        a(view);
    }
}
