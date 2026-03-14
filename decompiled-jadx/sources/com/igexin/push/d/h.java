package com.igexin.push.d;

/* JADX INFO: loaded from: classes.dex */
/* synthetic */ class h {
    static final /* synthetic */ int[] a;
    static final /* synthetic */ int[] b = new int[com.igexin.push.core.d.values().length];

    static {
        try {
            b[com.igexin.push.core.d.init.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            b[com.igexin.push.core.d.prepare.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            b[com.igexin.push.core.d.active.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            b[com.igexin.push.core.d.passive.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        a = new int[com.igexin.push.core.c.values().length];
        try {
            a[com.igexin.push.core.c.start.ordinal()] = 1;
        } catch (NoSuchFieldError e5) {
        }
        try {
            a[com.igexin.push.core.c.analyze.ordinal()] = 2;
        } catch (NoSuchFieldError e6) {
        }
        try {
            a[com.igexin.push.core.c.stop.ordinal()] = 3;
        } catch (NoSuchFieldError e7) {
        }
        try {
            a[com.igexin.push.core.c.retire.ordinal()] = 4;
        } catch (NoSuchFieldError e8) {
        }
        try {
            a[com.igexin.push.core.c.determine.ordinal()] = 5;
        } catch (NoSuchFieldError e9) {
        }
        try {
            a[com.igexin.push.core.c.connectASNL.ordinal()] = 6;
        } catch (NoSuchFieldError e10) {
        }
        try {
            a[com.igexin.push.core.c.check.ordinal()] = 7;
        } catch (NoSuchFieldError e11) {
        }
    }
}
