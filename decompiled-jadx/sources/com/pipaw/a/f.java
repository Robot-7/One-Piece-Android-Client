package com.pipaw.a;

import android.app.ProgressDialog;

/* JADX INFO: loaded from: classes.dex */
public class f {
    private static final String a = d.a(f.class);

    public static void a(ProgressDialog progressDialog) {
        if (progressDialog != null) {
            try {
                progressDialog.dismiss();
            } catch (Exception e) {
                d.a(a, e);
            }
        }
    }
}
