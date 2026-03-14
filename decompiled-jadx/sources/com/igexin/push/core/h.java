package com.igexin.push.core;

import android.os.Looper;

/* JADX INFO: loaded from: classes.dex */
public class h extends Thread {
    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        Looper.prepare();
        if (f.a() != null) {
            f.a().a(new e());
        }
        f.a().b();
        Looper.loop();
    }
}
