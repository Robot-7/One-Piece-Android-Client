package com.igexin.getuiext.service;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import com.igexin.download.SdkDownLoader;
import com.igexin.getuiext.data.Consts;
import com.igexin.sdk.PushConsts;
import java.util.Random;

/* JADX INFO: loaded from: classes.dex */
public class GetuiExtService extends Service {
    private GetuiExtReceiver a;
    private j b;
    private Context c;
    private volatile Looper d;
    private volatile h e;
    private volatile Looper f;
    private volatile i g;

    private void a() {
        HandlerThread handlerThread = new HandlerThread("GetuiExt-GetuiExtService");
        handlerThread.start();
        this.d = handlerThread.getLooper();
        this.e = new h(this, this.d);
        HandlerThread handlerThread2 = new HandlerThread("BI");
        handlerThread2.start();
        this.f = handlerThread2.getLooper();
        this.g = new i(this, this.f);
    }

    private void b() {
        SdkDownLoader instantiate = SdkDownLoader.getInstantiate(this);
        d dVar = (d) instantiate.getCallback(Consts.DOWNLOAD_HANDLER_OWNER);
        if (dVar == null) {
            dVar = new d(this, Consts.DOWNLOAD_HANDLER_OWNER);
        }
        instantiate.registerDownloadCallback(dVar);
    }

    private void c() {
        this.b = new j(this);
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter.addDataScheme("package");
        registerReceiver(this.b, intentFilter);
    }

    private void d() {
        this.a = new GetuiExtReceiver();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("com.igexin.increment");
        intentFilter.addAction("com.igexin.download.action.notify.click");
        intentFilter.addAction(PushConsts.ACTION_BROADCAST_USER_PRESENT);
        registerReceiver(this.a, intentFilter);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.c = this;
        Random random = new Random();
        random.setSeed(System.currentTimeMillis());
        Consts.verifyCode = random.nextInt();
        com.igexin.getuiext.b.c.d().a(this.c);
        String strA = com.igexin.getuiext.util.h.a(this.c);
        if (strA != null) {
            Consts.APPID = strA;
        }
        a();
        try {
            d();
            c();
            b();
        } catch (Exception e) {
            stopSelf();
        }
    }

    @Override // android.app.Service
    public void onDestroy() {
        if (this.a != null) {
            unregisterReceiver(this.a);
        }
        if (this.b != null) {
            unregisterReceiver(this.b);
        }
        if (this.d != null) {
            this.d.quit();
        }
        if (this.f != null) {
            this.f.quit();
        }
        super.onDestroy();
    }

    @Override // android.app.Service
    public void onStart(Intent intent, int i) {
        if (intent != null) {
            if (intent.getIntExtra("what", -1) == 11002) {
                Message messageObtainMessage = this.g.obtainMessage(Consts.SEND_BI);
                messageObtainMessage.arg1 = i;
                messageObtainMessage.obj = intent;
                this.g.sendMessage(messageObtainMessage);
                return;
            }
            Message messageObtainMessage2 = this.e.obtainMessage();
            messageObtainMessage2.arg1 = i;
            messageObtainMessage2.obj = intent;
            this.e.sendMessage(messageObtainMessage2);
        }
    }
}
