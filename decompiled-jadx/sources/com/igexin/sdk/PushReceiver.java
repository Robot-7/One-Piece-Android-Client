package com.igexin.sdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.igexin.push.core.a.f;
import com.igexin.sdk.a.d;

/* JADX INFO: loaded from: classes.dex */
public class PushReceiver extends BroadcastReceiver {
    private static String a = "PushSdk";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String strG = f.a().g("ss");
        if (strG == null || !strG.equals("1") || new d(context).c()) {
            String action = intent.getAction();
            if (PushConsts.ACTION_BROADCAST_PUSHMANAGER.equals(action)) {
                Intent intent2 = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
                intent2.putExtra("action", PushConsts.ACTION_BROADCAST_PUSHMANAGER);
                intent2.putExtra("bundle", intent.getExtras());
                context.getApplicationContext().startService(intent2);
            }
            if (PushConsts.ACTION_BROADCAST_REFRESHLS.equals(action)) {
                String stringExtra = intent.getStringExtra("callback_pkgname");
                String stringExtra2 = intent.getStringExtra("callback_classname");
                Intent intent3 = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
                intent3.putExtra("action", PushConsts.ACTION_BROADCAST_REFRESHLS);
                intent3.putExtra("callback_pkgname", stringExtra);
                intent3.putExtra("callback_classname", stringExtra2);
                context.getApplicationContext().startService(intent3);
            }
            if (PushConsts.ACTION_BROADCAST_TO_BOOT.equals(action)) {
                context.startService(new Intent(context.getApplicationContext(), (Class<?>) PushService.class));
                return;
            }
            if (PushConsts.ACTION_BROADCAST_NETWORK_CHANGE.equals(action)) {
                Intent intent4 = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
                intent4.putExtra("action", PushConsts.ACTION_BROADCAST_NETWORK_CHANGE);
                context.startService(intent4);
            } else if (PushConsts.ACTION_BROADCAST_USER_PRESENT.equals(action)) {
                Intent intent5 = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
                intent5.putExtra("action", PushConsts.ACTION_BROADCAST_USER_PRESENT);
                context.startService(intent5);
            }
        }
    }
}
