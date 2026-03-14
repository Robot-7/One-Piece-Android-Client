package com.tencent.mid.api;

import android.util.Log;
import com.tencent.mid.util.Util;

/* JADX INFO: loaded from: classes.dex */
final class a implements MidCallback {
    final /* synthetic */ MidCallback a;

    a(MidCallback midCallback) {
        this.a = midCallback;
    }

    @Override // com.tencent.mid.api.MidCallback
    public void onFail(int i, String str) {
        Log.e("MID", "failed to get mid, errorcode:" + i + " ,msg:" + str);
        this.a.onFail(i, str);
    }

    @Override // com.tencent.mid.api.MidCallback
    public void onSuccess(Object obj) {
        if (obj != null) {
            MidEntity midEntity = MidEntity.parse(obj.toString());
            Util.logInfo("success to get mid:" + midEntity.getMid());
            this.a.onSuccess(midEntity.getMid());
        }
    }
}
