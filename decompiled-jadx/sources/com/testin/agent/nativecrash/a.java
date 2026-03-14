package com.testin.agent.nativecrash;

import com.testin.agent.f.e;

/* JADX INFO: loaded from: classes.dex */
class a implements Runnable {
    final /* synthetic */ NativeCrash a;
    private final /* synthetic */ String b;

    a(NativeCrash nativeCrash, String str) {
        this.a = nativeCrash;
        this.b = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            e.a((Long) null);
            b.b(this.b);
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        } finally {
            this.a.tag = true;
        }
    }
}
