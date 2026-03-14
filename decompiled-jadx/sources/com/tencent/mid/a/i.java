package com.tencent.mid.a;

import com.tencent.mid.api.MidCallback;
import com.tencent.mid.util.Util;

/* JADX INFO: loaded from: classes.dex */
class i implements MidCallback {
    final /* synthetic */ h a;

    i(h hVar) {
        this.a = hVar;
    }

    @Override // com.tencent.mid.api.MidCallback
    public void onFail(int i, String str) {
        Util.logInfo("checkServer failed, errCode:" + i + ",msg:" + str);
    }

    @Override // com.tencent.mid.api.MidCallback
    public void onSuccess(Object obj) {
        Util.logInfo("checkServer success:" + obj);
    }
}
