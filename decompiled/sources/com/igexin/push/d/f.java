package com.igexin.push.d;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;

/* JADX INFO: loaded from: classes.dex */
class f implements ServiceConnection {
    final /* synthetic */ c a;

    f(c cVar) {
        this.a = cVar;
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (this.a.b == com.igexin.push.core.d.prepare) {
            this.a.e.a(com.igexin.sdk.aidl.c.a(iBinder));
            a aVar = new a();
            aVar.a(com.igexin.push.core.c.connectASNL);
            this.a.a(aVar);
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) throws Throwable {
        if (this.a.b == com.igexin.push.core.d.passive) {
            com.igexin.push.core.f.a().e().b(true);
            this.a.c();
        }
    }
}
