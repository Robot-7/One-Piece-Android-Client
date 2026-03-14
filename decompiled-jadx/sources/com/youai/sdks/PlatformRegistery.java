package com.youai.sdks;

import android.util.SparseArray;
import com.youai.sdks.beans.PlatformContacts;
import com.youai.sdks.utils.YALog;
import java.lang.reflect.Field;

/* JADX INFO: loaded from: classes.dex */
public class PlatformRegistery {
    private static PlatformRegistery mInstance = null;
    public SparseArray<String> sparseArray;

    private PlatformRegistery() {
        this.sparseArray = null;
        this.sparseArray = new SparseArray<>();
    }

    public static PlatformRegistery getInstance() {
        if (mInstance == null) {
            mInstance = new PlatformRegistery();
            mInstance.loadAdapters();
        }
        return mInstance;
    }

    private void loadAdapters() {
        Field[] fields = PlatformContacts.Platforms.class.getFields();
        for (Field f : fields) {
            try {
                registerPlatform(Integer.valueOf(f.getInt(null)), f.getName());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        YALog.i(this.sparseArray.toString());
    }

    public void registerPlatform(Integer type, String className) {
        this.sparseArray.put(type.intValue(), "com.youai.sdks.platform." + className);
    }

    public String getPlatformClassForType(Integer adType) {
        return this.sparseArray.get(adType.intValue());
    }

    public int getPlatformTypeByName(String name) {
        int size = this.sparseArray.size();
        for (int i = 0; i < size; i++) {
            if (this.sparseArray.valueAt(i).equals(name)) {
                return this.sparseArray.keyAt(i);
            }
        }
        return -1;
    }
}
