package com.igexin.sdk;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.Process;
import com.igexin.push.a.l;
import com.igexin.push.core.g;
import com.igexin.sdk.a.a;
import com.igexin.sdk.a.d;

/* JADX INFO: loaded from: classes.dex */
public class PushService extends Service {
    private static String a = "PushSdk";
    private IPushCore b;
    private boolean c = false;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        if (this.b != null) {
            return this.b.onServiceBind(intent);
        }
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
    }

    @Override // android.app.Service
    public void onDestroy() {
        if (this.b != null) {
            this.b.onServiceDestroy();
        }
        Process.killProcess(Process.myPid());
        super.onDestroy();
    }

    @Override // android.app.Service, android.content.ComponentCallbacks
    public void onLowMemory() {
        super.onLowMemory();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) throws Throwable {
        super.onStartCommand(intent, i, i2);
        if (!this.c) {
            this.c = true;
            if (intent != null) {
                String stringExtra = intent.getStringExtra("action");
                if (!PushConsts.ACTION_SERVICE_INITIALIZE.equals(stringExtra) && !PushConsts.ACTION_SERVICE_INITIALIZE_SLAVE.equals(stringExtra)) {
                    l.a(this);
                    if ("1".equals(g.c().get("ss")) && !new d(this).c()) {
                        stopSelf();
                        return 1;
                    }
                }
            }
            a.a().a(this);
            this.b = a.a().b();
            this.b.start(this);
        }
        if (this.b != null) {
            return this.b.onServiceStartCommand(intent, i, i2);
        }
        return 1;
    }
}
