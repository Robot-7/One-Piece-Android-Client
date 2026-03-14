package com.igexin.getuiext.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
public class GetuiExtReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        com.igexin.getuiext.a.a aVarA;
        if (intent == null || (aVarA = com.igexin.getuiext.a.b.a(intent.getAction())) == null) {
            return;
        }
        aVarA.a(context, intent);
    }
}
