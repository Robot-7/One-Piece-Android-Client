package com.youai.dreamonepiece;

import java.util.Comparator;

/* JADX INFO: compiled from: YouaiLastLoginHelp.java */
/* JADX INFO: loaded from: classes.dex */
class Ordercomparator implements Comparator {
    Ordercomparator() {
    }

    @Override // java.util.Comparator
    public int compare(Object o1, Object o2) {
        long time1 = ((YouaiServerInfo) o1).getLastLoginTime().longValue();
        long time2 = ((YouaiServerInfo) o2).getLastLoginTime().longValue();
        if (time1 > time2) {
            return -1;
        }
        if (time1 < time2) {
            return 1;
        }
        return 0;
    }
}
