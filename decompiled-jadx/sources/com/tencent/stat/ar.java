package com.tencent.stat;

/* JADX INFO: loaded from: classes.dex */
class ar implements StatDispatchCallback {
    final /* synthetic */ aq a;

    ar(aq aqVar) {
        this.a = aqVar;
    }

    @Override // com.tencent.stat.StatDispatchCallback
    public void onDispatchFailure() {
        StatServiceImpl.d();
    }

    @Override // com.tencent.stat.StatDispatchCallback
    public void onDispatchSuccess() {
        StatServiceImpl.c();
        if (au.b().a() >= StatConfig.getMaxBatchReportCount()) {
            au.b().a(StatConfig.getMaxBatchReportCount());
        }
    }
}
