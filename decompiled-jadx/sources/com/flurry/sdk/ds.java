package com.flurry.sdk;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class ds<K, V> {
    private final Map<K, List<V>> a = new HashMap();
    private int b;

    public void a() {
        this.a.clear();
    }

    public List<V> a(K k) {
        if (k == null) {
            return Collections.emptyList();
        }
        List<V> listA = a((Object) k, false);
        if (listA == null) {
            return Collections.emptyList();
        }
        return listA;
    }

    public void a(K k, V v) {
        if (k != null) {
            a((Object) k, true).add(v);
        }
    }

    public void a(ds<K, V> dsVar) {
        if (dsVar != null) {
            for (Map.Entry<K, List<V>> entry : dsVar.a.entrySet()) {
                this.a.put(entry.getKey(), entry.getValue());
            }
        }
    }

    public boolean b(K k, V v) {
        List<V> listA;
        boolean zRemove = false;
        if (k != null && (listA = a((Object) k, false)) != null) {
            zRemove = listA.remove(v);
            if (listA.size() == 0) {
                this.a.remove(k);
            }
        }
        return zRemove;
    }

    public boolean b(K k) {
        if (k == null) {
            return false;
        }
        return this.a.remove(k) != null;
    }

    public Collection<Map.Entry<K, V>> b() {
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<K, List<V>> entry : this.a.entrySet()) {
            Iterator<V> it = entry.getValue().iterator();
            while (it.hasNext()) {
                arrayList.add(new AbstractMap.SimpleImmutableEntry(entry.getKey(), it.next()));
            }
        }
        return arrayList;
    }

    public Set<K> c() {
        return this.a.keySet();
    }

    private List<V> a(K k, boolean z) {
        List<V> arrayList = this.a.get(k);
        if (z && arrayList == null) {
            if (this.b > 0) {
                arrayList = new ArrayList<>(this.b);
            } else {
                arrayList = new ArrayList<>();
            }
            this.a.put(k, arrayList);
        }
        return arrayList;
    }
}
