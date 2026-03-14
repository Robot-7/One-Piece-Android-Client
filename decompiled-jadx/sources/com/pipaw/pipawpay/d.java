package com.pipaw.pipawpay;

/* JADX INFO: loaded from: classes.dex */
class d implements Runnable {
    final /* synthetic */ PipawSDK a;
    private final /* synthetic */ int b;
    private final /* synthetic */ String c;

    d(PipawSDK pipawSDK, int i, String str) {
        this.a = pipawSDK;
        this.b = i;
        this.c = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        com.pipaw.a.d.a(PipawSDK.TAG, "payCallback start");
        this.a.mPipawPayListener.callback(this.b, this.c);
        this.a.mPipawPayListener = null;
        this.a.mPayActivity = null;
        com.pipaw.a.d.a(PipawSDK.TAG, "payCallback end");
    }
}
