package com.igexin.getuiext.ui;

import android.content.Context;
import android.os.AsyncTask;
import com.igexin.getuiext.data.Consts;

/* JADX INFO: loaded from: classes.dex */
final class c extends AsyncTask {
    final /* synthetic */ com.igexin.getuiext.data.a.d a;
    final /* synthetic */ Context b;

    c(com.igexin.getuiext.data.a.d dVar, Context context) {
        this.a = dVar;
        this.b = context;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(Void... voidArr) {
        String strA;
        String str = this.a.h;
        if (str == null || !str.startsWith("http") || (strA = com.igexin.getuiext.util.c.a(str, Consts.DEFAULT_RETRY_TIMES)) == null || strA.contains("data_error")) {
            return null;
        }
        return strA;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public void onPostExecute(String str) {
        super.onPostExecute(str);
        if (str != null) {
            com.igexin.getuiext.service.a.a(this.b, this.a, 13);
        }
    }
}
