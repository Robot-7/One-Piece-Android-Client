package com.igexin.getuiext.service;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import java.util.HashMap;
import org.apache.http.MethodNotSupportedException;

/* JADX INFO: loaded from: classes.dex */
class e extends AsyncTask {
    final /* synthetic */ d a;

    e(d dVar) {
        this.a = dVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public Void doInBackground(String... strArr) {
        String str = strArr[0];
        String str2 = strArr[1];
        try {
            Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(com.igexin.getuiext.util.c.a("GET", str, (HashMap) null));
            if (bitmapDecodeStream != null) {
                c.a().a(str2, bitmapDecodeStream);
            }
        } catch (MethodNotSupportedException e) {
        }
        return null;
    }
}
