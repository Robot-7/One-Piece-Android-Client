package com.tencent.stat.common;

import android.net.wifi.ScanResult;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
final class r implements Comparator<ScanResult> {
    r() {
    }

    @Override // java.util.Comparator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compare(ScanResult scanResult, ScanResult scanResult2) {
        int iAbs = Math.abs(scanResult.level);
        int iAbs2 = Math.abs(scanResult2.level);
        if (iAbs > iAbs2) {
            return 1;
        }
        return iAbs == iAbs2 ? 0 : -1;
    }
}
