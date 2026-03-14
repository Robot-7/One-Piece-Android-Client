package com.pipaw.pipawpay;

import android.os.AsyncTask;
import com.igexin.download.Downloads;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class h extends AsyncTask {
    final /* synthetic */ PipawUserActivity a;

    h(PipawUserActivity pipawUserActivity) {
        this.a = pipawUserActivity;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(String... strArr) {
        return this.a.c(strArr);
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
                if (new JSONObject(str).getString(Downloads.COLUMN_STATUS).equals("1")) {
                    com.pipaw.a.k.a(this.a, "绑定成功");
                    if (com.pipaw.a.j.a(this.a.aW)) {
                        this.a.n();
                    } else {
                        this.a.a(PipawSDK.LOGIN_SUCCESS, this.a.aW);
                    }
                } else {
                    com.pipaw.a.k.a(this.a, "绑定失败,验证码错误,请重试.");
                }
            } catch (Exception e) {
                com.pipaw.a.d.a(PipawUserActivity.a, e);
                com.pipaw.a.k.a(this.a, "系统异常");
            }
        }
        super.onPostExecute(str);
    }
}
