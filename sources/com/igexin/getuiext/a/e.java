package com.igexin.getuiext.a;

import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import com.igexin.getuiext.activity.GetuiExtActivity;
import com.igexin.getuiext.data.Consts;

/* JADX INFO: loaded from: classes.dex */
public class e implements a {
    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        if (Consts.verifyCode != intent.getIntExtra("verifyCode", -1)) {
            return;
        }
        int intExtra = intent.getIntExtra("notifID", 0);
        if (intExtra != 0) {
            ((NotificationManager) context.getSystemService("notification")).cancel(intExtra);
        }
        boolean zB = com.igexin.getuiext.util.h.b(context);
        Intent intent2 = new Intent(context, (Class<?>) GetuiExtActivity.class);
        intent2.setFlags(268435456);
        intent2.putExtras(intent.getExtras());
        intent2.putExtra("isWifi", zB);
        context.startActivity(intent2);
    }
}
