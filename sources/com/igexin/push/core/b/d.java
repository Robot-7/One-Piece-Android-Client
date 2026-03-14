package com.igexin.push.core.b;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Message;
import com.igexin.sdk.aidl.ICACallback;

/* JADX INFO: loaded from: classes.dex */
class d implements ServiceConnection {
    final /* synthetic */ c a;

    d(c cVar) {
        this.a = cVar;
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        b.a().a(componentName.getPackageName()).a(com.igexin.sdk.aidl.a.a(iBinder));
        Message message = new Message();
        Intent intent = new Intent();
        intent.putExtra("pkgname", componentName.getPackageName());
        String strA = this.a.a(componentName.getPackageName());
        if (strA == null || !e.a().a(componentName.getPackageName(), strA)) {
            intent.putExtra("action", "disconnected");
        } else {
            intent.putExtra("action", "connected");
        }
        message.what = com.igexin.push.core.a.d;
        message.obj = intent;
        com.igexin.push.core.f.a().a(message);
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        b.a().a(componentName.getPackageName()).a((ICACallback) null);
    }
}
