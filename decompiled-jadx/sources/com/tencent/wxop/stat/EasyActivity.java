package com.tencent.wxop.stat;

import android.app.Activity;

/* JADX INFO: loaded from: classes.dex */
public class EasyActivity extends Activity {
    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        f.m(this);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        f.l(this);
    }
}
