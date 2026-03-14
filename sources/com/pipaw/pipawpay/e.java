package com.pipaw.pipawpay;

/* JADX INFO: loaded from: classes.dex */
class e implements Runnable {
    final /* synthetic */ PipawSDK a;
    private final /* synthetic */ int b;
    private final /* synthetic */ String c;

    e(PipawSDK pipawSDK, int i, String str) {
        this.a = pipawSDK;
        this.b = i;
        this.c = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.a.mPipawLoginListener.callback(this.b, this.c);
        this.a.mPipawLoginListener = null;
        this.a.mLoginActivity = null;
    }
}
