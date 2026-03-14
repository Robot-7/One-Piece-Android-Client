package com.igexin.getuiext.ui.promotion;

import android.content.Context;
import android.widget.ImageView;

/* JADX INFO: loaded from: classes.dex */
public class UrlImageView extends ImageView {
    public UrlImageView(Context context) {
        super(context);
    }

    public void a(String str) {
        setImageResource(getContext().getApplicationInfo().icon);
        new o(this).execute(str);
    }
}
