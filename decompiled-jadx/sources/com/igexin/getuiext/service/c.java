package com.igexin.getuiext.service;

import android.graphics.Bitmap;
import java.util.HashMap;
import java.util.WeakHashMap;

/* JADX INFO: loaded from: classes.dex */
public final class c {
    private static c c = new c();
    private HashMap a = new HashMap();
    private WeakHashMap b = new WeakHashMap();

    private c() {
    }

    public static c a() {
        return c;
    }

    public Bitmap a(String str) {
        return (Bitmap) this.b.get(str);
    }

    public void a(String str, Bitmap bitmap) {
        this.b.put(str, bitmap);
    }

    public void a(String str, com.igexin.getuiext.data.a.d dVar) {
        this.a.put(str, dVar);
    }

    public com.igexin.getuiext.data.a.d b(String str) {
        return (com.igexin.getuiext.data.a.d) this.a.get(str);
    }

    public void c(String str) {
        this.a.remove(str);
    }
}
