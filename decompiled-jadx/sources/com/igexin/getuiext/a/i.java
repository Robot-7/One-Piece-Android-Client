package com.igexin.getuiext.a;

import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
public class i implements a {
    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        a aVarA;
        String stringExtra = intent.getStringExtra("action");
        if (stringExtra == null || (aVarA = b.a(stringExtra)) == null) {
            return;
        }
        aVarA.a(context, intent);
    }
}
