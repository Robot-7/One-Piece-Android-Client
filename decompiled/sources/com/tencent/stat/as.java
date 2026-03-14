package com.tencent.stat;

/* JADX INFO: loaded from: classes.dex */
class as implements StatDispatchCallback {
    final /* synthetic */ aq a;

    as(aq aqVar) {
        this.a = aqVar;
    }

    @Override // com.tencent.stat.StatDispatchCallback
    public void onDispatchFailure() {
        StatServiceImpl.d();
    }

    @Override // com.tencent.stat.StatDispatchCallback
    public void onDispatchSuccess() {
        StatServiceImpl.c();
    }
}
