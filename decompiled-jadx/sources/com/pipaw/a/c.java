package com.pipaw.a;

import android.app.Activity;
import android.view.inputmethod.InputMethodManager;

/* JADX INFO: loaded from: classes.dex */
public class c {
    private static final String a = d.a(c.class);

    public static void a(Activity activity) {
        try {
            ((InputMethodManager) activity.getSystemService("input_method")).hideSoftInputFromWindow(activity.getCurrentFocus().getWindowToken(), 0);
        } catch (Exception e) {
            d.a(a, e);
        }
    }
}
