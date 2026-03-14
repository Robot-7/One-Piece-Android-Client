package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class m implements Runnable {
    final /* synthetic */ Context a;

    m(Context context) {
        this.a = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        StatServiceImpl.flushDataToDB(this.a);
    }
}
