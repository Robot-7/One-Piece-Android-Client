package com.youai.sdks.utils;

import android.app.Activity;
import android.widget.Toast;

/* JADX INFO: loaded from: classes.dex */
public class YAToast {
    public static void showMsg(final Activity activity, final String message) {
        if (activity != null && message != null) {
            try {
                activity.runOnUiThread(new Runnable() { // from class: com.youai.sdks.utils.YAToast.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Toast.makeText(activity, message, 0).show();
                    }
                });
            } catch (Exception e) {
            }
        }
    }
}
