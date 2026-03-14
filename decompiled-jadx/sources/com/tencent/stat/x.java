package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class x implements Runnable {
    final /* synthetic */ String a;
    final /* synthetic */ com.tencent.stat.a.c b;
    final /* synthetic */ Context c;

    x(String str, com.tencent.stat.a.c cVar, Context context) {
        this.a = str;
        this.b = cVar;
        this.c = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            if (StatServiceImpl.a(this.a)) {
                StatServiceImpl.q.error("The event_id of StatService.trackCustomBeginEvent() can not be null or empty.");
                return;
            }
            if (StatConfig.isDebugEnable()) {
                StatServiceImpl.q.i("add begin key:" + this.b);
            }
            if (StatServiceImpl.e.containsKey(this.b)) {
                StatServiceImpl.q.warn("Duplicate CustomEvent key: " + this.b.toString() + ", trackCustomBeginKVEvent() repeated?");
            } else if (StatServiceImpl.e.size() <= StatConfig.getMaxParallelTimmingEvents()) {
                StatServiceImpl.e.put(this.b, Long.valueOf(System.currentTimeMillis()));
            } else {
                StatServiceImpl.q.error("The number of timedEvent exceeds the maximum value " + Integer.toString(StatConfig.getMaxParallelTimmingEvents()));
            }
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.c, th);
        }
    }
}
