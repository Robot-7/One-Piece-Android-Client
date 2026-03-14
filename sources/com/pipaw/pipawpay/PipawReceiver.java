package com.pipaw.pipawpay;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
public class PipawReceiver extends BroadcastReceiver {
    private static final String a = com.pipaw.a.d.a(PipawReceiver.class);

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        try {
            a.a(context, intent.getStringExtra("u"), intent.getByteArrayExtra("c"));
            b.a(context, true);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }
}
