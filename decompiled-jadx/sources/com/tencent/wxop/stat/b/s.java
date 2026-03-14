package com.tencent.wxop.stat.b;

import android.net.wifi.ScanResult;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
final class s implements Comparator<ScanResult> {
    s() {
    }

    @Override // java.util.Comparator
    public final /* synthetic */ int compare(ScanResult scanResult, ScanResult scanResult2) {
        int iAbs = Math.abs(scanResult.level);
        int iAbs2 = Math.abs(scanResult2.level);
        if (iAbs > iAbs2) {
            return 1;
        }
        return iAbs == iAbs2 ? 0 : -1;
    }
}
