package com.youai.push.adapters;

import android.content.Context;
import com.youai.push.pushsdk.PushAdapter;
import com.youai.push.pushsdk.PushManager;

/* JADX INFO: loaded from: classes.dex */
public class GeTuiAdapter extends PushAdapter {
    @Override // com.youai.push.pushsdk.PushAdapter
    public PushAdapter initAdapter() {
        return this;
    }

    public static void load(PushManager registry) {
        try {
            if (Class.forName("com.igexin.sdk.PushManager") != null) {
                registry.registerClass(new GeTuiAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youai.push.pushsdk.PushAdapter
    public void onCreate(Context context) {
        super.onCreate(context);
        com.igexin.sdk.PushManager.getInstance().initialize(context);
    }
}
