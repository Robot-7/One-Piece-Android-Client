package com.youai.push.adapters;

import android.content.Context;
import com.tencent.android.tpush.XGPushManager;
import com.youai.push.pushsdk.PushAdapter;
import com.youai.push.pushsdk.PushManager;

/* JADX INFO: loaded from: classes.dex */
public class TXxingeAdapter extends PushAdapter {
    @Override // com.youai.push.pushsdk.PushAdapter
    public PushAdapter initAdapter() {
        return this;
    }

    public static void load(PushManager registry) {
        try {
            if (Class.forName("com.tencent.android.tpush.XGPushManager") != null) {
                registry.registerClass(new TXxingeAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youai.push.pushsdk.PushAdapter
    public void onCreate(Context context) {
        XGPushManager.registerPush(context);
        super.onCreate(context);
    }
}
