package com.tencent.stat.a;

import com.pipaw.pipawpay.PipawSDK;

/* JADX INFO: loaded from: classes.dex */
public enum f {
    PAGE_VIEW(1),
    SESSION_ENV(2),
    ERROR(3),
    CUSTOM(PipawSDK.PAY_CANCEL),
    ADDITION(PipawSDK.PAY_SUCCESS),
    MONITOR_STAT(PipawSDK.PAY_FAIL),
    MTA_GAME_USER(PipawSDK.PAY_CHECK_SIGN_FAIL),
    NETWORK_MONITOR(1004),
    NETWORK_DETECTOR(1005);

    private int j;

    f(int i) {
        this.j = i;
    }

    public int a() {
        return this.j;
    }
}
