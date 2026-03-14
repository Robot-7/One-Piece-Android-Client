package com.tencent.mm.sdk.a;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.mm.sdk.a.a.b;
import com.tencent.mm.sdk.b.e;
import com.tencent.mm.sdk.constants.ConstantsAPI;

/* JADX INFO: loaded from: classes.dex */
public final class a {

    /* JADX INFO: renamed from: com.tencent.mm.sdk.a.a$a, reason: collision with other inner class name */
    public static class C0002a {
        public int flags = -1;
        public String k;
        public String l;
        public String m;
        public Bundle n;
    }

    public static boolean a(Context context, C0002a c0002a) {
        if (context == null || c0002a == null) {
            com.tencent.mm.sdk.b.a.a("MicroMsg.SDK.MMessageAct", "send fail, invalid argument");
            return false;
        }
        if (e.j(c0002a.k)) {
            com.tencent.mm.sdk.b.a.a("MicroMsg.SDK.MMessageAct", "send fail, invalid targetPkgName, targetPkgName = " + c0002a.k);
            return false;
        }
        if (e.j(c0002a.l)) {
            c0002a.l = c0002a.k + ".wxapi.WXEntryActivity";
        }
        com.tencent.mm.sdk.b.a.d("MicroMsg.SDK.MMessageAct", "send, targetPkgName = " + c0002a.k + ", targetClassName = " + c0002a.l);
        Intent intent = new Intent();
        intent.setClassName(c0002a.k, c0002a.l);
        if (c0002a.n != null) {
            intent.putExtras(c0002a.n);
        }
        String packageName = context.getPackageName();
        intent.putExtra(ConstantsAPI.SDK_VERSION, 570490883);
        intent.putExtra(ConstantsAPI.APP_PACKAGE, packageName);
        intent.putExtra(ConstantsAPI.CONTENT, c0002a.m);
        intent.putExtra(ConstantsAPI.CHECK_SUM, b.a(c0002a.m, 570490883, packageName));
        if (c0002a.flags == -1) {
            intent.addFlags(268435456).addFlags(134217728);
        } else {
            intent.setFlags(c0002a.flags);
        }
        try {
            context.startActivity(intent);
            com.tencent.mm.sdk.b.a.d("MicroMsg.SDK.MMessageAct", "send mm message, intent=" + intent);
            return true;
        } catch (Exception e) {
            com.tencent.mm.sdk.b.a.a("MicroMsg.SDK.MMessageAct", "send fail, ex = %s", e.getMessage());
            return false;
        }
    }
}
