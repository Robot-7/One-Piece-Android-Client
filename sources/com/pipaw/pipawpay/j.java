package com.pipaw.pipawpay;

import android.os.AsyncTask;
import com.igexin.download.Downloads;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class j extends AsyncTask {
    final /* synthetic */ PipawUserActivity a;

    j(PipawUserActivity pipawUserActivity) {
        this.a = pipawUserActivity;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(String... strArr) {
        return this.a.d(strArr);
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
                JSONObject jSONObject = new JSONObject(str);
                String string = jSONObject.getString("is_mobile");
                String string2 = jSONObject.getString(Downloads.COLUMN_STATUS);
                if (string.equals("1")) {
                    if (string2.equals("1")) {
                        com.pipaw.a.k.a(this.a, "验证码已经发送,请注意查收.");
                    } else {
                        com.pipaw.a.k.a(this.a, "验证码发送失败");
                    }
                } else if (string.equals("-1")) {
                    com.pipaw.a.k.a(this.a, "输入的不是已绑定的手机号码");
                } else if (string.equals("-2")) {
                    com.pipaw.a.k.a(this.a, "您没有绑定手机号码,无法为您找回密码.");
                }
            } catch (Exception e) {
                com.pipaw.a.d.a(PipawUserActivity.a, e);
                com.pipaw.a.k.a(this.a, "系统异常");
            }
        }
        super.onPostExecute(str);
    }
}
