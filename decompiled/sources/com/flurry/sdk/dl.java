package com.flurry.sdk;

import android.content.Context;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/* JADX INFO: loaded from: classes.dex */
public class dl {
    private static final String a = dl.class.getSimpleName();
    private static dl b;
    private final Map<String, dj> c = new HashMap();
    private final Map<Context, dj> d = new WeakHashMap();
    private final Object e = new Object();
    private dj f;

    public static synchronized dl a() {
        if (b == null) {
            b = new dl();
        }
        return b;
    }

    private dl() {
    }

    public synchronized int b() {
        return this.d.size();
    }

    public dj c() {
        dj djVar;
        synchronized (this.e) {
            djVar = this.f;
        }
        return djVar;
    }

    public void a(dj djVar) {
        synchronized (this.e) {
            this.f = djVar;
        }
    }

    public synchronized void a(Context context, String str) {
        dj djVar;
        Cdo.a(context);
        es.a().b();
        dz.a().b();
        dj djVar2 = this.d.get(context);
        if (djVar2 != null) {
            el.d(a, "Session already started with context: " + context + " count:" + djVar2.g());
        } else {
            if (this.c.containsKey(str)) {
                djVar = this.c.get(str);
            } else {
                djVar = new dj(str);
                this.c.put(str, djVar);
                djVar.a(context);
            }
            this.d.put(context, djVar);
            a(djVar);
            djVar.b(context);
        }
    }

    public synchronized void a(Context context) {
        dj djVarRemove = this.d.remove(context);
        if (djVarRemove == null) {
            el.d(a, "Session cannot be ended, session not found for context: " + context);
        } else {
            djVarRemove.c(context);
        }
    }

    public synchronized void a(String str) {
        if (!this.c.containsKey(str)) {
            el.a(6, a, "Ended session is not in the session map! Maybe it was already destroyed.");
        } else {
            dj djVarC = c();
            if (djVarC != null && TextUtils.equals(djVarC.j(), str)) {
                a((dj) null);
            }
            this.c.remove(str);
        }
    }

    public synchronized void d() {
        for (Map.Entry<Context, dj> entry : this.d.entrySet()) {
            entry.getValue().c(entry.getKey());
        }
        this.d.clear();
        Iterator it = new ArrayList(this.c.values()).iterator();
        while (it.hasNext()) {
            ((dj) it.next()).c();
        }
        this.c.clear();
        a((dj) null);
    }
}
