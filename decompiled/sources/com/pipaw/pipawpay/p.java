package com.pipaw.pipawpay;

import android.os.AsyncTask;
import com.igexin.download.Downloads;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class p extends AsyncTask {
    final /* synthetic */ PipawUserActivity a;

    p(PipawUserActivity pipawUserActivity) {
        this.a = pipawUserActivity;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(String... strArr) {
        return this.a.e(strArr);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public void onPostExecute(String str) {
        com.pipaw.a.f.a(this.a.i);
        if (com.pipaw.a.j.a(str)) {
            com.pipaw.a.k.a(this.a, "网络连接异常");
        } else {
            try {
                String string = new JSONObject(str).getString(Downloads.COLUMN_STATUS);
                if (string.equals("1")) {
                    this.a.n();
                    com.pipaw.a.k.a(this.a, "修改成功");
                } else if (string.equals("0")) {
                    this.a.n();
                    com.pipaw.a.k.a(this.a, "修改失败,请重试.");
                } else if (string.equals("-9")) {
                    com.pipaw.a.k.a(this.a, "修改超时,请重试.");
                    this.a.n();
                }
            } catch (Exception e) {
                com.pipaw.a.d.a(PipawUserActivity.a, e);
                com.pipaw.a.k.a(this.a, "系统异常");
            }
        }
        super.onPostExecute(str);
    }
}
