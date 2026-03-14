package com.igexin.getuiext.ui.promotion;

import android.R;
import android.graphics.Bitmap;
import android.view.animation.AnimationUtils;

/* JADX INFO: loaded from: classes.dex */
class p implements Runnable {
    final /* synthetic */ o a;
    private Bitmap b;

    public p(o oVar, Bitmap bitmap) {
        this.a = oVar;
        this.b = bitmap;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.a.a.setImageBitmap(this.b);
        this.a.a.invalidate();
        this.a.a.startAnimation(AnimationUtils.loadAnimation(this.a.a.getContext(), R.anim.fade_in));
    }
}
