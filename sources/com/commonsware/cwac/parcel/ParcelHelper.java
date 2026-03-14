package com.commonsware.cwac.parcel;

import android.content.Context;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import org.codehaus.jackson.org.objectweb.asm.signature.SignatureVisitor;

/* JADX INFO: loaded from: classes.dex */
public class ParcelHelper {
    private static final int CACHE_SIZE = 101;
    private Class arrr;
    private Map<String, Integer> cache;
    private String id;

    public ParcelHelper(String id, Context ctxt) {
        this.id = null;
        this.arrr = null;
        this.cache = null;
        this.id = id.replace('.', '_').replace(SignatureVisitor.SUPER, '_');
        try {
            this.arrr = Class.forName(ctxt.getPackageName() + ".R");
            this.cache = Collections.synchronizedMap(new Cache());
        } catch (Throwable t) {
            throw new RuntimeException("Exception finding R class", t);
        }
    }

    public int[] getStyleableArray(String name) {
        Field fld;
        try {
            Class clazz = getResourceClass("styleable");
            if (clazz != null && (fld = clazz.getDeclaredField(name)) != null) {
                Object o = fld.get(clazz);
                if (o instanceof int[]) {
                    int[] result = new int[Array.getLength(o)];
                    for (int i = 0; i < Array.getLength(o); i++) {
                        result[i] = Array.getInt(o, i);
                    }
                    return result;
                }
            }
            return new int[0];
        } catch (Throwable t) {
            throw new RuntimeException("Exception finding styleable", t);
        }
    }

    public int getStyleableId(String component, String attr) {
        return getIdentifier(component + "_" + attr, "styleable", false);
    }

    public int getLayoutId(String layout) {
        return getIdentifier(layout, "layout", true);
    }

    public int getItemId(String item) {
        return getIdentifier(item, "id", false);
    }

    public int getMenuId(String menu) {
        return getIdentifier(menu, "menu", true);
    }

    public int getDrawableId(String drawable) {
        return getIdentifier(drawable, "drawable", true);
    }

    public int getIdentifier(String name, String defType) {
        return getIdentifier(name, defType, true);
    }

    public int getIdentifier(String name, String defType, boolean mungeName) {
        Field fld;
        int result = -1;
        StringBuilder cacheKey = new StringBuilder(name);
        cacheKey.append('|');
        cacheKey.append(defType);
        Integer cacheHit = this.cache.get(cacheKey.toString());
        if (cacheHit != null) {
            return cacheHit.intValue();
        }
        if (!name.startsWith(this.id) && mungeName) {
            name = this.id + '_' + name;
        }
        try {
            Class clazz = getResourceClass(defType);
            if (clazz != null && (fld = clazz.getDeclaredField(name)) != null) {
                result = fld.getInt(clazz);
                this.cache.put(cacheKey.toString(), Integer.valueOf(result));
            }
            return result;
        } catch (Throwable t) {
            throw new RuntimeException("Exception finding resource identifier", t);
        }
    }

    private Class getResourceClass(String defType) {
        for (Class<?> cls : this.arrr.getClasses()) {
            if (defType.equals(cls.getSimpleName())) {
                return cls;
            }
        }
        return null;
    }

    public class Cache extends LinkedHashMap<String, Integer> {
        public Cache() {
            super(101, 1.1f, true);
        }

        @Override // java.util.LinkedHashMap
        protected boolean removeEldestEntry(Map.Entry<String, Integer> entry) {
            return size() > 101;
        }
    }
}
