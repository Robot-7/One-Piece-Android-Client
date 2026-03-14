package com.tencent.mm.sdk.a.a;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.mm.sdk.b.e;
import com.tencent.mm.sdk.constants.ConstantsAPI;

/* JADX INFO: loaded from: classes.dex */
public final class a {

    /* JADX INFO: renamed from: com.tencent.mm.sdk.a.a.a$a, reason: collision with other inner class name */
    public static class C0003a {
        public String m;
        public Bundle n;
        public String o;
        public String p;
    }

    public static boolean a(Context context, C0003a c0003a) {
        if (context == null || c0003a == null) {
            com.tencent.mm.sdk.b.a.a("MicroMsg.SDK.MMessage", "send fail, invalid argument");
            return false;
        }
        if (e.j(c0003a.p)) {
            com.tencent.mm.sdk.b.a.a("MicroMsg.SDK.MMessage", "send fail, action is null");
            return false;
        }
        String str = e.j(c0003a.o) ? null : c0003a.o + ".permission.MM_MESSAGE";
        Intent intent = new Intent(c0003a.p);
        if (c0003a.n != null) {
            intent.putExtras(c0003a.n);
        }
        String packageName = context.getPackageName();
        intent.putExtra(ConstantsAPI.SDK_VERSION, 570490883);
        intent.putExtra(ConstantsAPI.APP_PACKAGE, packageName);
        intent.putExtra(ConstantsAPI.CONTENT, c0003a.m);
        intent.putExtra(ConstantsAPI.CHECK_SUM, b.a(c0003a.m, 570490883, packageName));
        context.sendBroadcast(intent, str);
        com.tencent.mm.sdk.b.a.d("MicroMsg.SDK.MMessage", "send mm message, intent=" + intent + ", perm=" + str);
        return true;
    }
}
