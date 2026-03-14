package com.igexin.push.d;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.igexin.push.c.c.l;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
class g implements ServiceConnection {
    final /* synthetic */ b a;
    final /* synthetic */ String b;
    final /* synthetic */ c c;

    g(c cVar, b bVar, String str) {
        this.c = cVar;
        this.a = bVar;
        this.b = str;
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (this.c.b == com.igexin.push.core.d.active) {
            try {
                this.a.a(com.igexin.sdk.aidl.c.a(iBinder));
                this.c.g.put(this.b, this.a);
                if (this.a.c().onASNLConnected(this.a.a(), this.a.b(), this.b, 0L) == -1) {
                    this.c.g.remove(this.b);
                } else if (com.igexin.push.core.g.o) {
                    this.a.c().onASNLNetworkConnected();
                }
            } catch (Exception e) {
                this.c.g.remove(this.b);
            }
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        if (this.c.b != com.igexin.push.core.d.active) {
            return;
        }
        b bVar = (b) this.c.g.get(this.b);
        this.c.g.remove(this.b);
        List listC = this.c.c(bVar.e());
        if (listC.size() == 0) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= listC.size()) {
                return;
            }
            String str = (String) listC.get(i2);
            if (str.startsWith("S-")) {
                l lVar = new l();
                lVar.a = Long.valueOf(str.substring(2)).longValue();
                com.igexin.push.core.f.a().e().a("S-" + String.valueOf(lVar.a), lVar);
            }
            this.c.h.remove(str);
            i = i2 + 1;
        }
    }
}
