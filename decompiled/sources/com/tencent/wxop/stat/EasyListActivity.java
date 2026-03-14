package com.tencent.wxop.stat;

import android.app.ListActivity;

/* JADX INFO: loaded from: classes.dex */
public class EasyListActivity extends ListActivity {
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
