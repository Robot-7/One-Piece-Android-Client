package com.pipaw.pipawpay;

import android.app.Service;
import android.content.Intent;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Message;

/* JADX INFO: loaded from: classes.dex */
public class PipawService extends Service {
    private static final String a = com.pipaw.a.d.a(PipawService.class);
    private HandlerThread b;
    private f c;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        com.pipaw.a.d.a(a);
        try {
            this.b = new HandlerThread("handler_thread");
            this.b.start();
            this.c = new f(this, this.b.getLooper());
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        com.pipaw.a.d.a(a);
        if (intent != null) {
            try {
                Message messageObtain = Message.obtain(this.c);
                messageObtain.obj = intent.getAction();
                messageObtain.sendToTarget();
            } catch (Exception e) {
                com.pipaw.a.d.a(a, e);
            }
        }
        return super.onStartCommand(intent, i, i2);
    }
}
