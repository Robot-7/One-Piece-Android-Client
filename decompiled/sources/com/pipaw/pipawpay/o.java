package com.pipaw.pipawpay;

import android.os.AsyncTask;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class o extends AsyncTask {
    final /* synthetic */ PipawUserActivity a;

    o(PipawUserActivity pipawUserActivity) {
        this.a = pipawUserActivity;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(String... strArr) {
        return this.a.g(strArr);
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
                int i = new JSONObject(str).getInt("uid");
                if (i == -1) {
                    com.pipaw.a.k.a(this.a, "该帐号不合法");
                } else if (i == -2) {
                    com.pipaw.a.k.a(this.a, "该帐号包含不允许注册的词语");
                } else if (i == -3) {
                    com.pipaw.a.k.a(this.a, "该帐号已经存在");
                } else if (i == -7) {
                    com.pipaw.a.k.a(this.a, "密码不合法");
                } else if (i > 0) {
                    com.pipaw.a.k.a(this.a, "注册成功");
                    a.a(this.a, this.a.ay, this.a.az, true);
                    this.a.a(this.a.ay, this.a.az);
                } else {
                    com.pipaw.a.k.a(this.a, "注册不成功");
                }
            } catch (Exception e) {
                com.pipaw.a.d.a(PipawUserActivity.a, e);
                com.pipaw.a.k.a(this.a, "系统异常");
            }
        }
        super.onPostExecute(str);
    }
}
