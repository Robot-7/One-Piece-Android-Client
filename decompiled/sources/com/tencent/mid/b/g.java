package com.tencent.mid.b;

import android.content.Context;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.util.Util;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class g {
    private static g b = null;
    private Map<Integer, f> a;

    private g(Context context) {
        this.a = null;
        this.a = new HashMap(3);
        this.a.put(1, new e(context));
        this.a.put(2, new c(context));
        this.a.put(4, new d(context));
    }

    public static synchronized g a(Context context) {
        if (b == null) {
            b = new g(context);
        }
        return b;
    }

    public MidEntity a() {
        return a(new ArrayList(Arrays.asList(1, 2, 4)));
    }

    public MidEntity a(List<Integer> list) {
        MidEntity midEntityH;
        if (list == null || list.size() == 0) {
            return null;
        }
        Iterator<Integer> it = list.iterator();
        while (it.hasNext()) {
            f fVar = this.a.get(it.next());
            if (fVar != null && (midEntityH = fVar.h()) != null && midEntityH.isMidValid()) {
                return midEntityH;
            }
        }
        return null;
    }

    public void a(int i, int i2) {
        a aVarB = b();
        if (i > 0) {
            aVarB.c(i);
        }
        if (i2 > 0) {
            aVarB.a(i2);
        }
        aVarB.a(System.currentTimeMillis());
        aVarB.b(0);
        a(aVarB);
    }

    public void a(MidEntity midEntity) {
        Iterator<Map.Entry<Integer, f>> it = this.a.entrySet().iterator();
        while (it.hasNext()) {
            it.next().getValue().a(midEntity);
        }
    }

    public void a(a aVar) {
        Iterator<Map.Entry<Integer, f>> it = this.a.entrySet().iterator();
        while (it.hasNext()) {
            it.next().getValue().b(aVar);
        }
    }

    public a b() {
        return b(new ArrayList(Arrays.asList(1, 4)));
    }

    public a b(List<Integer> list) {
        a aVarJ;
        if (list == null || list.size() == 0) {
            return null;
        }
        Iterator<Integer> it = list.iterator();
        while (it.hasNext()) {
            f fVar = this.a.get(it.next());
            if (fVar != null && (aVarJ = fVar.j()) != null) {
                return aVarJ;
            }
        }
        return null;
    }

    public void c() {
        Util.logInfo("clear mid cache");
        Iterator<Map.Entry<Integer, f>> it = this.a.entrySet().iterator();
        while (it.hasNext()) {
            it.next().getValue().i();
        }
    }
}
