package com.igexin.push.c;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.igexin.a.a.b.a.a.g;
import com.igexin.a.a.b.c;
import com.igexin.a.a.b.f;

/* JADX INFO: loaded from: classes.dex */
public class a implements com.igexin.a.a.d.a.b {
    public ConnectivityManager a;
    public Context b;

    public a(Context context, ConnectivityManager connectivityManager) {
        this.a = connectivityManager;
        this.b = context;
    }

    @Override // com.igexin.a.a.d.a.b
    public f a(String str, Integer num, c cVar) {
        NetworkInfo activeNetworkInfo;
        if (!str.startsWith("socket")) {
            if (str.startsWith("disConnect")) {
                return new com.igexin.a.a.b.a.a.c(str);
            }
            return null;
        }
        if (this.a == null || (activeNetworkInfo = this.a.getActiveNetworkInfo()) == null || !activeNetworkInfo.isAvailable()) {
            return null;
        }
        return new g(str, cVar);
    }
}
