package com.pipaw.pipawpay;

import android.view.View;

/* JADX INFO: loaded from: classes.dex */
class m implements View.OnClickListener {
    final /* synthetic */ l a;
    private final /* synthetic */ String b;

    m(l lVar, String str) {
        this.a = lVar;
        this.b = str;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        a.a(this.a.b, this.b);
        this.a.a.j.dismiss();
        this.a.a.j = null;
    }
}
