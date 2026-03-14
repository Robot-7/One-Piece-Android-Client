package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class at implements Runnable {
    final /* synthetic */ String a;
    final /* synthetic */ g bM;
    final /* synthetic */ Context co;

    at(String str, Context context, g gVar) {
        this.a = str;
        this.co = context;
        this.bM = gVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            synchronized (f.aT) {
                if (f.aT.size() >= c.v()) {
                    f.aV.error("The number of page events exceeds the maximum value " + Integer.toString(c.v()));
                } else {
                    String unused = f.aR = this.a;
                    if (f.aT.containsKey(f.aR)) {
                        f.aV.d("Duplicate PageID : " + f.aR + ", onResume() repeated?");
                    } else {
                        f.aT.put(f.aR, Long.valueOf(System.currentTimeMillis()));
                        f.a(this.co, true, this.bM);
                    }
                }
            }
        } catch (Throwable th) {
            f.aV.b(th);
            f.a(this.co, th);
        }
    }
}
