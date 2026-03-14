package com.pipaw.pipawpay;

import android.os.AsyncTask;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class k extends AsyncTask {
    final /* synthetic */ PipawUserActivity a;
    private String b;
    private String c;

    public k(PipawUserActivity pipawUserActivity, String str, String str2) {
        this.a = pipawUserActivity;
        this.b = str;
        this.c = str2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(String... strArr) {
        return this.a.a(strArr);
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
                String string = jSONObject.getString("uid");
                String string2 = jSONObject.getString("username");
                String string3 = jSONObject.getString("sid");
                String string4 = jSONObject.getString("time");
                String string5 = jSONObject.getString("is_bind");
                if (string3.equals("-1")) {
                    com.pipaw.a.k.a(this.a, "帐号不存在");
                } else if (string3.equals("-2")) {
                    com.pipaw.a.k.a(this.a, "帐号或密码错误");
                } else {
                    com.pipaw.a.i.b(this.a, "pipaw", "uid", string);
                    a.a(string3);
                    a.b(string4);
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("username", string2);
                    jSONObject2.put("sid", string3);
                    jSONObject2.put("time", string4);
                    this.a.aW = jSONObject2.toString();
                    if (this.a.q.isChecked()) {
                        a.a(this.a, this.b, this.c, true);
                    } else {
                        a.a(this.a, this.b, this.c, false);
                    }
                    com.pipaw.a.k.a(this.a, "登录成功");
                    if (string5.equals("1")) {
                        this.a.a(PipawSDK.LOGIN_SUCCESS, this.a.aW);
                    } else if (string5.equals("0")) {
                        if (a.c(this.a, this.b)) {
                            this.a.a(PipawSDK.LOGIN_SUCCESS, this.a.aW);
                        } else {
                            this.a.o();
                        }
                    }
                }
            } catch (Exception e) {
                com.pipaw.a.d.a(PipawUserActivity.a, e);
                com.pipaw.a.k.a(this.a, "系统异常");
            }
        }
        super.onPostExecute(str);
    }
}
