package com.igexin.push.core;

import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
final class p extends com.igexin.sdk.aidl.c {
    p() {
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public byte[] extFunction(byte[] bArr) {
        return null;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int isStarted(String str) {
        int iA = com.igexin.push.core.b.c.a().a(com.igexin.push.core.b.e.a().b(str), com.igexin.push.core.b.i.IS_STARTED);
        if (iA != 0 || g.l) {
            return iA;
        }
        return 1;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int onASNLConnected(String str, String str2, String str3, long j) {
        if (f.a() != null) {
            return f.a().f().a(str3);
        }
        return -1;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int onASNLNetworkConnected() {
        if (f.a().e().a()) {
            return -1;
        }
        f.a().e().b();
        return 0;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int onASNLNetworkDisconnected() throws Throwable {
        if (f.a().e().a()) {
            return -1;
        }
        f.a().e().b(false);
        return 0;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int onPSNLConnected(String str, String str2, String str3, long j) {
        if (f.a() == null || str.equals(StatConstants.MTA_COOPERATION_TAG) || str2.equals(StatConstants.MTA_COOPERATION_TAG)) {
            return -1;
        }
        return f.a().f().a(str, str2);
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int receiveToPSNL(String str, String str2, byte[] bArr) {
        if (str2 == null || bArr == null || f.a().e().a()) {
            return -1;
        }
        return f.a().f().b(str, str2, bArr);
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int sendByASNL(String str, String str2, byte[] bArr) {
        if (str2 == null || bArr == null || !f.a().e().a()) {
            return -1;
        }
        return f.a().f().a(str, str2, bArr);
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int setSilentTime(int i, int i2, String str) {
        String strB = com.igexin.push.core.b.e.a().b(str);
        int iA = com.igexin.push.core.b.c.a().a(strB, com.igexin.push.core.b.i.SET_SILENTTIME);
        if (iA == 0 && com.igexin.push.a.k.o) {
            com.igexin.push.core.a.f.a().a(i, i2, strB);
        }
        return iA;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int startService(String str) {
        String strB = com.igexin.push.core.b.e.a().b(str);
        int iA = com.igexin.push.core.b.c.a().a(strB, com.igexin.push.core.b.i.START_SERVICE);
        if (iA == 0) {
            f.a().a(true);
            g.E = strB;
        }
        return iA;
    }

    @Override // com.igexin.sdk.aidl.IGexinMsgService
    public int stopService(String str) {
        String strB = com.igexin.push.core.b.e.a().b(str);
        int iA = com.igexin.push.core.b.c.a().a(strB, com.igexin.push.core.b.i.STOP_SERVICE);
        if (iA == 0) {
            f.a().a(strB);
        }
        return iA;
    }
}
