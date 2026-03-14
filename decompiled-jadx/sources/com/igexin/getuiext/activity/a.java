package com.igexin.getuiext.activity;

import com.igexin.getuiext.ui.d;

/* JADX INFO: loaded from: classes.dex */
/* synthetic */ class a {
    static final /* synthetic */ int[] a = new int[d.values().length];

    static {
        try {
            a[d.SLEEP.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            a[d.DOWNLOADING.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            a[d.PAUSE.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            a[d.DOWNLOADED.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        try {
            a[d.INSTALLED.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        try {
            a[d.ERROR.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
    }
}
