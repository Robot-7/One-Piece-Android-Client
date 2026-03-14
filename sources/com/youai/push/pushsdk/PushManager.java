package com.youai.push.pushsdk;

import android.content.Context;
import com.youai.push.adapters.GeTuiAdapter;
import com.youai.push.adapters.TXxingeAdapter;
import java.util.LinkedList;

/* JADX INFO: loaded from: classes.dex */
public class PushManager {
    private static PushManager mInstance = null;
    private LinkedList<PushAdapter> sparseArray;

    PushManager() {
        this.sparseArray = null;
        this.sparseArray = new LinkedList<>();
    }

    public static PushManager getInstance() {
        if (mInstance == null) {
            mInstance = new PushManager();
            mInstance.loadAdapters();
        }
        return mInstance;
    }

    private void loadAdapters() {
        try {
            TXxingeAdapter.load(this);
        } catch (Error e) {
        }
        try {
            GeTuiAdapter.load(this);
        } catch (Error e2) {
        }
    }

    public void registerClass(PushAdapter adapterClass) {
        this.sparseArray.add(adapterClass);
    }

    public void onCreate(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onCreate(context);
        }
    }
}
