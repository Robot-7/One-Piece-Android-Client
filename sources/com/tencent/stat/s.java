package com.tencent.stat;

/* JADX INFO: loaded from: classes.dex */
final class s implements StatDispatchCallback {
    s() {
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
