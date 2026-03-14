package com.igexin.getuiext.a;

import android.content.Context;
import android.content.Intent;
import com.igexin.download.Downloads;
import com.igexin.download.SdkDownLoader;
import com.igexin.getuiext.data.Consts;

/* JADX INFO: loaded from: classes.dex */
public class f implements a {
    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("action");
        int intExtra = intent.getIntExtra("id", -1);
        if (Consts.verifyCode == intent.getIntExtra("verifyCode", -1) && intExtra != -1) {
            try {
                if ("run".equals(stringExtra)) {
                    SdkDownLoader.getInstantiate(context).updateTask(intExtra, Downloads.COLUMN_CONTROL, String.valueOf(0));
                } else {
                    SdkDownLoader.getInstantiate(context).pauseTask(intExtra);
                }
            } catch (Exception e) {
            }
        }
    }
}
