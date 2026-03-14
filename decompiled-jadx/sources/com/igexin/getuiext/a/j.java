package com.igexin.getuiext.a;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.igexin.getuiext.data.Consts;
import com.igexin.getuiext.service.GetuiExtService;

/* JADX INFO: loaded from: classes.dex */
public class j implements a {
    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        com.igexin.getuiext.data.a.d dVarB;
        if (Consts.verifyCode != intent.getIntExtra("verifyCode", -1)) {
            return;
        }
        String stringExtra = intent.getStringExtra("filepath");
        String stringExtra2 = intent.getStringExtra("pkgname");
        if (TextUtils.isEmpty(stringExtra) || (dVarB = com.igexin.getuiext.service.c.a().b(stringExtra2)) == null) {
            return;
        }
        if (!(dVarB instanceof com.igexin.getuiext.data.a.e)) {
            com.igexin.getuiext.util.e.b(context, stringExtra);
            Intent intent2 = new Intent(context, (Class<?>) GetuiExtService.class);
            intent2.putExtra("what", Consts.INSTALL_APP);
            intent2.putExtra("pkgName", dVarB.b);
            context.startService(intent2);
            return;
        }
        com.igexin.getuiext.data.a.e eVar = (com.igexin.getuiext.data.a.e) dVarB;
        com.igexin.getuiext.data.a.f fVar = eVar.n;
        String str = eVar.a;
        String str2 = dVarB.c;
        String str3 = str != null ? str : "new";
        if (str2 != null) {
            str3 = str3 + str2;
        }
        String str4 = com.igexin.getuiext.util.e.a + (str3 + ".apk");
        switch (k.a[fVar.ordinal()]) {
            case 1:
                com.igexin.getuiext.util.e.a(context, stringExtra, str4, eVar.b);
                break;
            case 2:
                com.igexin.getuiext.util.e.b(context, stringExtra);
                break;
        }
        Intent intent3 = new Intent(context, (Class<?>) GetuiExtService.class);
        intent3.putExtra("what", Consts.INSTALL_APP);
        intent3.putExtra("pkgName", eVar.b);
        context.startService(intent3);
    }
}
