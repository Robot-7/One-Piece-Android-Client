package com.tencent.wxop.stat;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
final class aa extends BroadcastReceiver {
    final /* synthetic */ h cm;

    aa(h hVar) {
        this.cm = hVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (this.cm.be != null) {
            this.cm.be.a(new af(this));
        }
    }
}
