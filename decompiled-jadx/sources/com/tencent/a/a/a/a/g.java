package com.tencent.a.a.a.a;

import android.content.Context;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class g {
    private static g i = null;
    private Map<Integer, f> f;
    private int g = 0;
    private Context h;

    private g(Context context) {
        this.f = null;
        this.h = null;
        this.h = context.getApplicationContext();
        this.f = new HashMap(3);
        this.f.put(1, new e(context));
        this.f.put(2, new b(context));
        this.f.put(4, new d(context));
    }

    private c a(List<Integer> list) {
        c cVarE;
        if (list != null && list.size() >= 0) {
            Iterator<Integer> it = list.iterator();
            while (it.hasNext()) {
                f fVar = this.f.get(it.next());
                if (fVar != null && (cVarE = fVar.e()) != null && h.e(cVarE.c)) {
                    return cVarE;
                }
            }
        }
        return new c();
    }

    public static synchronized g a(Context context) {
        if (i == null) {
            i = new g(context);
        }
        return i;
    }

    public final void b(String str) {
        c cVarF = f();
        cVarF.c = str;
        if (!h.d(cVarF.a)) {
            cVarF.a = h.b(this.h);
        }
        if (!h.d(cVarF.b)) {
            cVarF.b = h.c(this.h);
        }
        cVarF.d = System.currentTimeMillis();
        Iterator<Map.Entry<Integer, f>> it = this.f.entrySet().iterator();
        while (it.hasNext()) {
            it.next().getValue().a(cVarF);
        }
    }

    public final c f() {
        return a(new ArrayList(Arrays.asList(1, 2, 4)));
    }
}
