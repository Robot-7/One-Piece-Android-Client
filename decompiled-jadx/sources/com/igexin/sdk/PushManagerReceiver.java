package com.igexin.sdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.igexin.push.core.a.f;
import com.igexin.sdk.a.d;

/* JADX INFO: loaded from: classes.dex */
public class PushManagerReceiver extends BroadcastReceiver {
    private static String a = "PushSdk";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String strG = f.a().g("ss");
        if ((strG == null || !strG.equals("1") || new d(context).c()) && PushConsts.ACTION_BROADCAST_PUSHMANAGER.equals(intent.getAction())) {
            Intent intent2 = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
            intent2.putExtra("action", PushConsts.ACTION_BROADCAST_PUSHMANAGER);
            intent2.putExtra("bundle", intent.getExtras());
            context.getApplicationContext().startService(intent2);
        }
    }
}
