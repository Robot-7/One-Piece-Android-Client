package com.testin.agent.b;

import java.io.File;

/* JADX INFO: loaded from: classes.dex */
class h implements Runnable {
    final /* synthetic */ f a;

    h(f fVar) {
        this.a = fVar;
    }

    @Override // java.lang.Runnable
    public void run() {
        com.testin.agent.f.e.a((Long) null);
        if (com.testin.agent.nativecrash.b.a(this.a.c)) {
            File file = new File(this.a.c.getFilesDir(), "/com.testin.agent/dumps/");
            if (!file.exists()) {
                if (file.mkdirs()) {
                    com.testin.agent.base.b.a("TestinTestHandler", "Dumps directories create successed");
                } else {
                    com.testin.agent.base.b.c("TestinTestHandler", "Dumps directories create failled");
                }
            }
            com.testin.agent.nativecrash.b.a(file.getPath());
        }
    }
}
