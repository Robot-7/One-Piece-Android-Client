package com.pipaw.pipawpay;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.TextView;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.message.BasicNameValuePair;

/* JADX INFO: loaded from: classes.dex */
public class PipawUserActivity extends Activity implements View.OnClickListener {
    private static final String a = com.pipaw.a.d.a(PipawUserActivity.class);
    private TextView A;
    private TextView B;
    private Button C;
    private Button D;
    private ImageView E;
    private TextView F;
    private EditText G;
    private ImageView H;
    private EditText I;
    private EditText J;
    private Button K;
    private EditText L;
    private Button M;
    private String N;
    private String O;
    private String P;
    private String Q;
    private ImageView R;
    private TextView S;
    private EditText T;
    private ImageView U;
    private EditText V;
    private Button W;
    private EditText X;
    private EditText Y;
    private EditText Z;
    private String aA;
    private ImageView aB;
    private TextView aC;
    private TextView aD;
    private TextView aE;
    private Button aF;
    private Button aG;
    private Animation aH;
    private Animation aI;
    private Animation aJ;
    private Animation aK;
    private String aL;
    private String aM;
    private String aN;
    private int aO;
    private String aP;
    private String aQ;
    private String aR;
    private String aS;
    private String aT;
    private String aU;
    private String aV;
    private String aW = StatConstants.MTA_COOPERATION_TAG;
    private int aX = 0;
    private Button aa;
    private String ab;
    private String ac;
    private String ad;
    private String ae;
    private String af;
    private ImageView ag;
    private TextView ah;
    private EditText ai;
    private ImageView aj;
    private EditText ak;
    private EditText al;
    private Button am;
    private String an;
    private String ao;
    private String ap;
    private ImageView aq;
    private TextView ar;
    private EditText as;
    private EditText at;
    private EditText au;
    private Button av;
    private CheckBox aw;
    private TextView ax;
    private String ay;
    private String az;
    private View b;
    private View c;
    private View d;
    private View e;
    private View f;
    private View g;
    private View h;
    private ProgressDialog i;
    private PopupWindow j;
    private EditText k;
    private EditText l;
    private EditText m;
    private ImageView n;
    private EditText o;
    private Button p;
    private CheckBox q;
    private TextView r;
    private TextView s;
    private TextView t;
    private TextView u;
    private String v;
    private String w;
    private ImageView x;
    private TextView y;
    private TextView z;

    /* JADX INFO: Access modifiers changed from: private */
    public String a(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("merchantId", this.aL));
        arrayList.add(new BasicNameValuePair("merchantAppId", this.aM));
        arrayList.add(new BasicNameValuePair("appId", this.aN));
        arrayList.add(new BasicNameValuePair("channelId", String.valueOf(this.aO)));
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("password", com.pipaw.a.b.b(strArr[1])));
        arrayList.add(new BasicNameValuePair("version", "2.4"));
        return com.pipaw.a.e.a(this.aP, "http://106.55.254.14:81/appuser/login.php", arrayList);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(int i, String str) {
        PipawSDK.getInstance().loginCallback(i, str);
        finish();
    }

    private void a(View view) {
        try {
            if (view.getVisibility() == 0) {
                view.setVisibility(8);
                view.startAnimation(this.aI);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str, String str2) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在登录,请稍候...", true, false, null);
            new k(this, str, str2).execute(str, str2);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    private void a(String str, String str2, String str3) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在发送验证码,请稍候...", true, false, null);
            new i(this).execute(str, str2, str3);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String b(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("password", strArr[1]));
        arrayList.add(new BasicNameValuePair("mobile", strArr[2]));
        return com.pipaw.a.e.a(this.aR, "http://106.55.254.14:81/appuser/mobilecode.php", arrayList);
    }

    private void b() {
        try {
            if (this.aX == 0) {
                this.k = this.m;
                this.l = this.o;
            } else if (this.aX == 2) {
                this.k = this.G;
                this.l = null;
            } else if (this.aX == 3) {
                this.k = this.T;
                this.l = null;
            } else if (this.aX == 4) {
                this.k = this.ai;
                this.l = null;
            }
            if (this.j == null) {
                c();
            }
            if (this.j.isShowing()) {
                this.j.dismiss();
            } else {
                this.j.showAsDropDown(this.k);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    private void b(View view) {
        try {
            if (view.getVisibility() != 0) {
                view.setVisibility(0);
                view.startAnimation(this.aH);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    private void b(String str, String str2) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在验证用户名和手机号码,请稍候...", true, false, null);
            new j(this).execute(str, str2);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    private void b(String str, String str2, String str3) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在绑定手机,请稍候...", true, false, null);
            new h(this).execute(str, str2, str3);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String c(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("mobile", strArr[1]));
        arrayList.add(new BasicNameValuePair("code", strArr[2]));
        return com.pipaw.a.e.a(this.aS, "http://106.55.254.14:81/appuser/bindmobile.php", arrayList);
    }

    private void c() {
        List listA = a.a(this);
        ListView listView = new ListView(this);
        listView.setAdapter((ListAdapter) new l(this, this, listA));
        listView.setOnItemClickListener(new g(this));
        this.j = new PopupWindow((View) listView, this.k.getWidth(), -2, true);
        this.j.setFocusable(true);
        this.j.setOutsideTouchable(true);
        this.j.setBackgroundDrawable(new BitmapDrawable());
    }

    private void c(View view) {
        try {
            if (view.getVisibility() == 0) {
                view.setVisibility(8);
                view.startAnimation(this.aK);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    private void c(String str, String str2) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在注册...", true, false, null);
            new o(this).execute(str, str2);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    private void c(String str, String str2, String str3) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在修改,请稍候...", true, false, null);
            new p(this).execute(str, str2, str3);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String d(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("mobile", strArr[1]));
        return com.pipaw.a.e.a(this.aT, "http://106.55.254.14:81/appuser/findPassword.php", arrayList);
    }

    private void d() {
        com.pipaw.a.c.a(this);
        try {
            this.v = this.m.getText().toString();
            this.w = this.o.getText().toString();
            if (com.pipaw.a.j.a(this.v)) {
                com.pipaw.a.k.a(this, "请输入帐号");
            } else if (com.pipaw.a.j.a(this.w)) {
                com.pipaw.a.k.a(this, "请输入密码");
            } else {
                a(this.v, this.w);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    private void d(View view) {
        try {
            if (view.getVisibility() != 0) {
                view.setVisibility(0);
                view.startAnimation(this.aJ);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    private void d(String str, String str2, String str3) {
        try {
            this.i = ProgressDialog.show(this, StatConstants.MTA_COOPERATION_TAG, "正在修改,请稍候...", true, false, null);
            new q(this).execute(str, str2, str3);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            com.pipaw.a.f.a(this.i);
            com.pipaw.a.k.a(this, "程序异常");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String e(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("code", strArr[1]));
        arrayList.add(new BasicNameValuePair("password", strArr[2]));
        return com.pipaw.a.e.a(this.aU, "http://106.55.254.14:81/appuser/resetPassword.php", arrayList);
    }

    private void e() {
        a.c(this);
        a(PipawSDK.LOGIN_SUCCESS, this.aW);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String f(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("password", com.pipaw.a.b.b(strArr[1])));
        arrayList.add(new BasicNameValuePair("newpassword", strArr[2]));
        return com.pipaw.a.e.a(this.aV, "http://106.55.254.14:81/appuser/updatePwd.php", arrayList);
    }

    private void f() {
        com.pipaw.a.c.a(this);
        try {
            this.N = this.G.getText().toString();
            this.O = this.I.getText().toString();
            this.P = this.J.getText().toString();
            if (com.pipaw.a.j.a(this.N)) {
                com.pipaw.a.k.a(this, "请输入帐号");
            } else if (com.pipaw.a.j.a(this.O)) {
                com.pipaw.a.k.a(this, "请输入密码");
            } else if (com.pipaw.a.j.a(this.P)) {
                com.pipaw.a.k.a(this, "请输入手机号码");
            } else if (this.P.length() != 11) {
                com.pipaw.a.k.a(this, "请输入正确的手机号码");
            } else {
                a(this.N, this.O, this.P);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String g(String... strArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("merchantId", this.aL));
        arrayList.add(new BasicNameValuePair("merchantAppId", this.aM));
        arrayList.add(new BasicNameValuePair("appId", this.aN));
        arrayList.add(new BasicNameValuePair("channelId", String.valueOf(this.aO)));
        arrayList.add(new BasicNameValuePair("username", strArr[0]));
        arrayList.add(new BasicNameValuePair("password", strArr[1]));
        arrayList.add(new BasicNameValuePair("version", "2.4"));
        return com.pipaw.a.e.a(this.aQ, "http://106.55.254.14:81/appuser/register.php", arrayList);
    }

    private void g() {
        com.pipaw.a.c.a(this);
        try {
            this.Q = this.L.getText().toString();
            if (com.pipaw.a.j.a(this.Q)) {
                com.pipaw.a.k.a(this, "请输入短信验证码");
            } else {
                b(this.N, this.P, this.Q);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    private void h() {
        com.pipaw.a.c.a(this);
        try {
            this.ab = this.T.getText().toString();
            this.ac = this.V.getText().toString();
            if (com.pipaw.a.j.a(this.ab)) {
                com.pipaw.a.k.a(this, "请输入帐号");
            } else if (com.pipaw.a.j.a(this.ac)) {
                com.pipaw.a.k.a(this, "请输入手机号码");
            } else if (this.ac.length() != 11) {
                com.pipaw.a.k.a(this, "请输入正确的手机号码");
            } else {
                b(this.ab, this.ac);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    private void i() {
        com.pipaw.a.c.a(this);
        try {
            this.ab = this.T.getText().toString();
            this.ad = this.X.getText().toString();
            this.ae = this.Y.getText().toString();
            this.af = this.Z.getText().toString();
            if (com.pipaw.a.j.a(this.ab)) {
                com.pipaw.a.k.a(this, "请输入帐号");
            } else if (com.pipaw.a.j.a(this.ad)) {
                com.pipaw.a.k.a(this, "请输入短信验证码");
            } else if (com.pipaw.a.j.a(this.ae)) {
                com.pipaw.a.k.a(this, "请输入新密码");
            } else if (this.ae.length() < 8) {
                com.pipaw.a.k.a(this, "请输入至少8位的密码");
            } else if (com.pipaw.a.j.a(this.af)) {
                com.pipaw.a.k.a(this, "请确认新密码");
            } else if (this.af.equals(this.ae)) {
                c(this.ab, this.ad, this.ae);
            } else {
                com.pipaw.a.k.a(this, "两次输入的密码不一致");
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    private void j() {
        com.pipaw.a.c.a(this);
        try {
            this.an = this.ai.getText().toString();
            this.ao = this.ak.getText().toString();
            this.ap = this.al.getText().toString();
            if (com.pipaw.a.j.a(this.an)) {
                com.pipaw.a.k.a(this, "请输入帐号");
            } else if (com.pipaw.a.j.a(this.ao)) {
                com.pipaw.a.k.a(this, "请输入当前密码");
            } else if (com.pipaw.a.j.a(this.ap)) {
                com.pipaw.a.k.a(this, "请输入新密码");
            } else if (this.ap.length() < 8) {
                com.pipaw.a.k.a(this, "请输入至少8位的新密码");
            } else {
                d(this.an, this.ao, this.ap);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    private void k() {
        com.pipaw.a.c.a(this);
        try {
            this.ay = this.as.getText().toString();
            this.az = this.at.getText().toString();
            this.aA = this.au.getText().toString();
            if (com.pipaw.a.j.a(this.ay)) {
                com.pipaw.a.k.a(this, "请输入帐号");
            } else if (this.ay.length() < 6 || this.ay.length() > 15) {
                com.pipaw.a.k.a(this, "请输入6-15位的帐号");
            } else if (com.pipaw.a.j.a(this.az)) {
                com.pipaw.a.k.a(this, "请输入密码");
            } else if (this.az.length() < 8) {
                com.pipaw.a.k.a(this, "请输入至少8位的密码");
            } else if (com.pipaw.a.j.a(this.aA)) {
                com.pipaw.a.k.a(this, "请确认密码");
            } else if (!this.aA.equals(this.az)) {
                com.pipaw.a.k.a(this, "两次输入的密码不一致");
            } else if (this.aw.isChecked()) {
                c(this.ay, this.az);
            } else {
                com.pipaw.a.k.a(this, "请阅读并同意琵琶网服务条款");
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            a(PipawSDK.LOGIN_FAIL, "程序异常");
        }
    }

    private void l() {
        switch (this.aX) {
            case 0:
                a(2000, StatConstants.MTA_COOPERATION_TAG);
                break;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                n();
                break;
            case 6:
                t();
                break;
        }
    }

    private boolean m() {
        return (com.pipaw.a.j.a(this.aL) || com.pipaw.a.j.a(this.aM) || com.pipaw.a.j.a(this.aN)) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void n() {
        this.aX = 0;
        String strB = a.b(this);
        this.m.setText(strB);
        this.m.setSelection(strB.length());
        this.o.setText(a.b(this, strB));
        c(this.c);
        c(this.d);
        c(this.e);
        c(this.f);
        c(this.g);
        d(this.b);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void o() {
        this.aX = 1;
        a(this.b);
        a(this.d);
        a(this.e);
        a(this.f);
        a(this.g);
        b(this.c);
    }

    private void p() {
        this.aX = 2;
        String strB = a.b(this);
        this.G.setText(strB);
        this.G.setSelection(strB.length());
        this.I.setText(StatConstants.MTA_COOPERATION_TAG);
        this.J.setText(StatConstants.MTA_COOPERATION_TAG);
        this.L.setText(StatConstants.MTA_COOPERATION_TAG);
        a(this.b);
        a(this.c);
        a(this.e);
        a(this.f);
        a(this.g);
        a(this.h);
        b(this.d);
    }

    private void q() {
        this.aX = 3;
        String strB = a.b(this);
        this.T.setText(strB);
        this.T.setSelection(strB.length());
        this.V.setText(StatConstants.MTA_COOPERATION_TAG);
        this.X.setText(StatConstants.MTA_COOPERATION_TAG);
        this.Y.setText(StatConstants.MTA_COOPERATION_TAG);
        this.Z.setText(StatConstants.MTA_COOPERATION_TAG);
        a(this.b);
        a(this.c);
        a(this.d);
        a(this.f);
        a(this.g);
        a(this.h);
        b(this.e);
    }

    private void r() {
        this.aX = 4;
        String strB = a.b(this);
        this.ai.setText(strB);
        this.ai.setSelection(strB.length());
        this.ak.setText(StatConstants.MTA_COOPERATION_TAG);
        this.al.setText(StatConstants.MTA_COOPERATION_TAG);
        a(this.b);
        a(this.c);
        a(this.d);
        a(this.e);
        a(this.g);
        a(this.h);
        b(this.f);
    }

    private void s() {
        this.aX = 5;
        this.as.setText(StatConstants.MTA_COOPERATION_TAG);
        this.at.setText(StatConstants.MTA_COOPERATION_TAG);
        this.au.setText(StatConstants.MTA_COOPERATION_TAG);
        a(this.b);
        a(this.c);
        a(this.d);
        a(this.e);
        a(this.f);
        a(this.h);
        b(this.g);
    }

    private void t() {
        this.aX = 5;
        c(this.b);
        c(this.c);
        c(this.d);
        c(this.e);
        c(this.f);
        c(this.h);
        d(this.g);
    }

    private void u() {
        this.aX = 6;
        a(this.b);
        a(this.c);
        a(this.d);
        a(this.e);
        a(this.f);
        a(this.g);
        b(this.h);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == com.pipaw.a.h.b(this, "lg_arrow_iv")) {
            b();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "lg_login_btn")) {
            d();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "lg_forget_password_tv")) {
            q();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "lg_register_tv")) {
            s();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "lg_bind_mobile_tv")) {
            p();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "lg_reset_password_tv")) {
            r();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bt_back_iv")) {
            l();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bt_bind_btn")) {
            p();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bt_enter_btn")) {
            e();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bm_back_iv")) {
            l();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bm_arrow_iv")) {
            b();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bm_get_verify_code_btn")) {
            f();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "bm_bind_btn")) {
            g();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "fp_back_iv")) {
            l();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "fp_arrow_iv")) {
            b();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "fp_get_verify_code_btn")) {
            h();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "fp_verify_btn")) {
            i();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "rp_back_iv")) {
            l();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "rp_arrow_iv")) {
            b();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "rp_reset_btn")) {
            j();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "rg_back_iv")) {
            l();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "rg_register_btn")) {
            k();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "rg_terms_tv")) {
            u();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "terms_back_iv")) {
            l();
            return;
        }
        if (id == com.pipaw.a.h.b(this, "terms_agree_btn")) {
            l();
            this.aw.setChecked(true);
        } else if (id == com.pipaw.a.h.b(this, "terms_disagree_btn")) {
            l();
            this.aw.setChecked(false);
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(com.pipaw.a.h.c(this, "pipaw_user"));
        Intent intent = getIntent();
        this.aL = intent.getStringExtra("merchantId");
        this.aM = intent.getStringExtra("merchantAppId");
        this.aN = intent.getStringExtra("appId");
        this.aO = com.pipaw.a.g.a(this, "PIPAW_ID");
        if (this.aO == 0) {
            this.aO = -1;
        }
        if (!m()) {
            a(PipawSDK.LOGIN_FAIL, "数据格式不正确");
            return;
        }
        this.b = findViewById(com.pipaw.a.h.b(this, "login"));
        this.c = findViewById(com.pipaw.a.h.b(this, "bind_tip"));
        this.d = findViewById(com.pipaw.a.h.b(this, "bind_mobile"));
        this.e = findViewById(com.pipaw.a.h.b(this, "forget_password"));
        this.f = findViewById(com.pipaw.a.h.b(this, "reset_password"));
        this.g = findViewById(com.pipaw.a.h.b(this, "register"));
        this.h = findViewById(com.pipaw.a.h.b(this, "terms"));
        this.m = (EditText) findViewById(com.pipaw.a.h.b(this, "lg_username_et"));
        this.m.setHint("请输入帐号");
        this.n = (ImageView) findViewById(com.pipaw.a.h.b(this, "lg_arrow_iv"));
        this.n.setOnClickListener(this);
        this.o = (EditText) findViewById(com.pipaw.a.h.b(this, "lg_password_et"));
        this.o.setHint("请输入密码");
        this.p = (Button) findViewById(com.pipaw.a.h.b(this, "lg_login_btn"));
        this.p.setText("登录");
        this.p.setOnClickListener(this);
        this.q = (CheckBox) findViewById(com.pipaw.a.h.b(this, "lg_remember_password_cb"));
        this.q.setText("记住密码");
        this.r = (TextView) findViewById(com.pipaw.a.h.b(this, "lg_forget_password_tv"));
        this.r.setText("忘记密码?");
        this.r.setOnClickListener(this);
        this.s = (TextView) findViewById(com.pipaw.a.h.b(this, "lg_register_tv"));
        this.s.setText("注册帐号");
        this.s.setOnClickListener(this);
        this.t = (TextView) findViewById(com.pipaw.a.h.b(this, "lg_bind_mobile_tv"));
        this.t.setText("手机绑定");
        this.t.setOnClickListener(this);
        this.u = (TextView) findViewById(com.pipaw.a.h.b(this, "lg_reset_password_tv"));
        this.u.setText("修改密码");
        this.u.setOnClickListener(this);
        String strB = a.b(this);
        this.m.setText(strB);
        this.m.setSelection(strB.length());
        this.o.setText(a.b(this, strB));
        this.x = (ImageView) findViewById(com.pipaw.a.h.b(this, "bt_back_iv"));
        this.x.setOnClickListener(this);
        this.y = (TextView) findViewById(com.pipaw.a.h.b(this, "bt_title_tv"));
        this.y.setText("绑定提示");
        this.z = (TextView) findViewById(com.pipaw.a.h.b(this, "bt_security_tv"));
        this.z.setText("您的帐号安全级别:");
        this.A = (TextView) findViewById(com.pipaw.a.h.b(this, "bt_security_level_tv"));
        this.A.setText("低");
        this.B = (TextView) findViewById(com.pipaw.a.h.b(this, "bt_tip_tv"));
        this.B.setText("为了您的帐号安全,方便您忘记密码的时候能通过手机找回密码,建议您绑定手机!");
        this.C = (Button) findViewById(com.pipaw.a.h.b(this, "bt_bind_btn"));
        this.C.setText("立即绑定");
        this.C.setOnClickListener(this);
        this.D = (Button) findViewById(com.pipaw.a.h.b(this, "bt_enter_btn"));
        this.D.setText("以后绑定");
        this.D.setOnClickListener(this);
        this.E = (ImageView) findViewById(com.pipaw.a.h.b(this, "bm_back_iv"));
        this.E.setOnClickListener(this);
        this.F = (TextView) findViewById(com.pipaw.a.h.b(this, "bm_title_tv"));
        this.F.setText("绑定手机");
        this.G = (EditText) findViewById(com.pipaw.a.h.b(this, "bm_username_et"));
        this.G.setHint("请输入帐号");
        this.H = (ImageView) findViewById(com.pipaw.a.h.b(this, "bm_arrow_iv"));
        this.H.setOnClickListener(this);
        this.I = (EditText) findViewById(com.pipaw.a.h.b(this, "bm_password_et"));
        this.I.setHint("请输入密码");
        this.J = (EditText) findViewById(com.pipaw.a.h.b(this, "bm_phone_number_et"));
        this.J.setHint("请输入手机号码");
        this.K = (Button) findViewById(com.pipaw.a.h.b(this, "bm_get_verify_code_btn"));
        this.K.setText("获取验证码");
        this.K.setOnClickListener(this);
        this.L = (EditText) findViewById(com.pipaw.a.h.b(this, "bm_verify_code_et"));
        this.L.setHint("请输入短信验证码");
        this.M = (Button) findViewById(com.pipaw.a.h.b(this, "bm_bind_btn"));
        this.M.setText("绑定");
        this.M.setOnClickListener(this);
        this.R = (ImageView) findViewById(com.pipaw.a.h.b(this, "fp_back_iv"));
        this.R.setOnClickListener(this);
        this.S = (TextView) findViewById(com.pipaw.a.h.b(this, "fp_title_tv"));
        this.S.setText("找回密码");
        this.T = (EditText) findViewById(com.pipaw.a.h.b(this, "fp_username_et"));
        this.T.setHint("请输入帐号");
        this.U = (ImageView) findViewById(com.pipaw.a.h.b(this, "fp_arrow_iv"));
        this.U.setOnClickListener(this);
        this.V = (EditText) findViewById(com.pipaw.a.h.b(this, "fp_phone_number_et"));
        this.V.setHint("请输入手机号码");
        this.W = (Button) findViewById(com.pipaw.a.h.b(this, "fp_get_verify_code_btn"));
        this.W.setText("获取验证码");
        this.W.setOnClickListener(this);
        this.X = (EditText) findViewById(com.pipaw.a.h.b(this, "fp_verify_code_et"));
        this.X.setHint("请输入短信验证码");
        this.Y = (EditText) findViewById(com.pipaw.a.h.b(this, "fp_password_et"));
        this.Y.setHint("输入新的密码");
        this.Z = (EditText) findViewById(com.pipaw.a.h.b(this, "fp_confirm_password_et"));
        this.Z.setHint("请再次输入密码");
        this.aa = (Button) findViewById(com.pipaw.a.h.b(this, "fp_verify_btn"));
        this.aa.setText("确定");
        this.aa.setOnClickListener(this);
        this.ag = (ImageView) findViewById(com.pipaw.a.h.b(this, "rp_back_iv"));
        this.ag.setOnClickListener(this);
        this.ah = (TextView) findViewById(com.pipaw.a.h.b(this, "rp_title_tv"));
        this.ah.setText("修改密码");
        this.ai = (EditText) findViewById(com.pipaw.a.h.b(this, "rp_username_et"));
        this.ai.setHint("请输入帐号");
        this.aj = (ImageView) findViewById(com.pipaw.a.h.b(this, "rp_arrow_iv"));
        this.aj.setOnClickListener(this);
        this.ak = (EditText) findViewById(com.pipaw.a.h.b(this, "rp_password_et"));
        this.ak.setHint("请输入当前密码");
        this.al = (EditText) findViewById(com.pipaw.a.h.b(this, "rp_new_password_et"));
        this.al.setHint("请输入新的密码");
        this.am = (Button) findViewById(com.pipaw.a.h.b(this, "rp_reset_btn"));
        this.am.setText("提交");
        this.am.setOnClickListener(this);
        this.aq = (ImageView) findViewById(com.pipaw.a.h.b(this, "rg_back_iv"));
        this.aq.setOnClickListener(this);
        this.ar = (TextView) findViewById(com.pipaw.a.h.b(this, "rg_title_tv"));
        this.ar.setText("注册帐号");
        this.as = (EditText) findViewById(com.pipaw.a.h.b(this, "rg_username_et"));
        this.as.setHint("请输入6-15位字母或者数字");
        this.at = (EditText) findViewById(com.pipaw.a.h.b(this, "rg_password_et"));
        this.at.setHint("请设置最少8位密码");
        this.au = (EditText) findViewById(com.pipaw.a.h.b(this, "rg_confirm_password_et"));
        this.au.setHint("请再次输入密码");
        this.av = (Button) findViewById(com.pipaw.a.h.b(this, "rg_register_btn"));
        this.av.setText("注册");
        this.av.setOnClickListener(this);
        this.aw = (CheckBox) findViewById(com.pipaw.a.h.b(this, "rg_agree_terms_cb"));
        this.aw.setText("已阅读并同意");
        this.ax = (TextView) findViewById(com.pipaw.a.h.b(this, "rg_terms_tv"));
        this.ax.setText("《琵琶网服务条款》");
        this.ax.setOnClickListener(this);
        this.aB = (ImageView) findViewById(com.pipaw.a.h.b(this, "terms_back_iv"));
        this.aB.setOnClickListener(this);
        this.aC = (TextView) findViewById(com.pipaw.a.h.b(this, "terms_title_tv"));
        this.aC.setText("琵琶网支付中心");
        this.aD = (TextView) findViewById(com.pipaw.a.h.b(this, "terms_name_tv"));
        this.aD.setText("《琵琶网服务条款》");
        this.aE = (TextView) findViewById(com.pipaw.a.h.b(this, "terms_content_tv"));
        this.aE.setText("\t\t琵琶网创建于2011年4月份，我们专注于手机网游行业发展，立志打造成为手机网游第一门户。网站集android、ios双平台于一体，为用户提供各种新闻资讯、游戏下载、游戏评测、视频、以及相应的游戏攻略，礼包等服务，同时为广大的游戏开发者、代理商提供相应的游戏录入，资讯投稿等机会。\n\t\t在您加入琵琶网之前，应仔细阅读本协议。如您不同意此协议及其不时发布的修改，您可以主动取消琵琶网提供的服务；您一旦使用琵琶网的服务，即视为您已了解并完全同意用户协议的各项内容（包括琵琶网对用户协议随时所做的任何修改），并成为琵琶网的用户。 \n1.用户在使用琵琶网提供的服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动。\n2. 服务内容。\n2.1\u3000 琵琶网提供的网络服务具体内容由舜邦公司根据实际情况提供，例如网络游戏、文学、交友、论坛(BBS)、聊天室、电子邮件、发表新闻评论等。\n2.2\u3000 琵琶网提供的部分网络服务可能为收费的网络服务，用户使用收费网络服务需要向琵琶网支付一定的费用。对于收费的网络服务，琵琶网会在用户使用之前给予用户明确的提示，用户根据提示确认其愿意支付相关费用，用户才能使用该等收费网络服务。如用户拒绝支付相关费用，则琵琶网有权不向用户提供该等收费网络服务。\n2.3 \u3000用户理解，琵琶网仅提供相关的网络服务，除此之外与相关网络服务有关的设备（如个人电脑、手机、及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网、接受服务而支付的电话费及上网费、手机费）均应由用户自行负担。\n3. 服务变更、中断或终止。\n3.1\u3000 鉴于网络服务的特殊性，用户同意琵琶网有权随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。如变更、中断或终止的网络服务时，无需对任何用户或任何第三方承担任何责任，但琵琶网将尽可能事先进行通告。\n3.2 \u3000用户理解，琵琶网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，琵琶网无需为此承担任何责任，但琵琶网应尽可能事先进行通告。\n3.3 \u3000用户有下列行为之一的，琵琶网将暂停分配给用户帐号的登录和使用。若琵琶网认为用户行为严重程度较低的，琵琶网可能在采取暂停措施之前通知用户限期改正。若琵琶网通知客户改正的，用户应在所通知的期限内改正。用户未在琵琶网的通知期限内改正的，琵琶网有权随时中断或终止向用户提供本协议项下的网络服务（包括收费网络服务）而无需对用户或任何第三方承担任何责任：用户就琵琶网通知中所述的行为已经改正并经琵琶网确认的，琵琶网将恢复该帐号的登录和使用：\n3.3.1 \u3000用户严重违反本协议的行为；\n3.3.2 \u3000用户提供虚假注册身份信息的；\n3.3.3 \u3000用户违反本协议中规定的使用规则；\n3.3.4 \u3000用户在使用收费网络服务时未按规定向琵琶网支付相应的服务费；\n3.3.5 \u3000通过不正当手段使用琵琶网的产品和服务的；\n3.3.6 \u3000违反中华人民共和国的法律禁止性规定的；\n3.3.7 \u3000违背社会公德的行为。\n3.4 \u3000琵琶网适用3.3款项之规定暂停用户帐号等单方中止或终止合同履行的，若需要琵琶网举证，则琵琶网仅在琵琶网的现有技术限度内就用户违反法律禁止性规定和严重违反合同约定的事实承担举证责任。\n3.5 \u3000如用户注册的网络服务的帐号在任何连续180日内未实际使用，或者用户订购收费网络服务后连续180日内未实际使用，则琵琶网有权删除该帐号并停止为该用户提供相关的网络服务。\n4. 使用规则。\n4.1 \u3000用户同意以其真实身份注册成为琵琶网的用户，并保证所提供的个人身份资料信息真实、完整，依据法律规定和本协议约定对所提供的不实信息承担相应的法律责任和不利的法律后果。用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知琵琶网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，琵琶网不承担任何责任。\n4.2 \u3000用户注册成为琵琶网的用户后，需要修改、变更所提供的个人身份资料信息的应当根据琵琶网公布的方式通知琵琶网并提供相关证明。琵琶网收到通知并审核相关证明(未免疑问，琵琶网仅对相关文件承担形式审查责任，不对相关证明的审核承担实质性审查疑问)后，琵琶网将在合理的时间内为用户提供修改、变更服务。\n4.3 \u3000琵琶网有权审查用户注册所提供的身份信息是否真实，并采取必要的技术与管理等措施保障用户帐号的安全、有效。\n4.4 \u3000用户有义务妥善保管该用户帐号及密码，严格按照本协议的约定正确、安全地使用用户帐号及密码。用户因为自身原因造成密码遗失、帐号被盗而给自身和他人民事权利造成损害的，琵琶网不承担法律责任，用户自行承担相应责任，但法律另有规定和本协议另有约定的除外。\n4.5\u3000用户发现所分配的帐号或密码被他人非法使用或有使用异常的情况的，应及时根据琵琶网公布的方式通知琵琶网，并有权要求琵琶网采取措施暂停该帐号的登录和使用。\n4.6\u3000琵琶网用户申请采取措施暂停用户帐号的登录和使用的，用户应当向琵琶网提供有效的个人身份证件，并对用户提供的个人身份证件与其注册身份信息的一致性进行形式审查：\n4.6.1 \u3000琵琶网核实要求采取措施暂停该帐号的登录和使用的用户所提供的个人有效身份证件与所注册的身份信息相一致的，将暂停该用户帐号的登录和使用，并通知用户。\n4.6.2\u3000 若因可归责于琵琶网的原因，导致琵琶网未及时采取措施暂停用户帐号的登录和使用，而造成用户与此相关的直接损失的，琵琶网仅对未及时采取措施所导致的扩大的直接损失承担责任。\n4.6.3 \u3000用户未提供其个人有效身份证件或者用户提供的个人有效身份证件与所注册的身份信息不一致的，琵琶网将拒绝用户暂停该用户帐号的登录和使用的请求。\n4.7 \u3000用户为了维护其合法权益，向琵琶网提供与所注册的身份信息相一致的个人有效身份证件时，琵琶网将为用户提供必要的协助和支持，并根据需要向有关行政机关和司法机关提供相关证据信息资料。\n4.8 \u3000用户同意接受琵琶网通过电子邮件或其他方式向用户发送商品促销或其他相关商业信息。\n4.9 \u3000用户对于其创作并通过琵琶网网络服务（包括但不限于论坛、新闻评论、博客）上传到琵琶网网站上的内容依法享有版权及其他相关合法权利。对于用户通过琵琶网网络服务上传到琵琶网网站上可公开获取区域的任何内容，用户同意琵琶网在全世界范围内具有免费的、永久性的、不可撤销的权利和许可，以使用、复制、修改、翻译、据以创作衍生作品、传播、表演和展示此等内容。\n4.10 \u3000用户在使用琵琶网网络服务过程中，必须遵循以下原则：\n4.10.1 \u3000遵守中国有关的法律和法规；\n4.10.2 \u3000遵守琵琶网的所有网络协议、规定和程序；\n4.10.3 \u3000不得为任何非法目的而使用网络服务系统；\n4.10.4 \u3000不得利用琵琶网网络服务系统进行任何可能对互联网或琵琶网正常运转造成不利影响的行为；\n4.10.5 \u3000不得利用琵琶网提供的网络服务上传、展示或传播任何虚假的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料；\n4.10.6 \u3000不得侵犯其他任何第三方的专利权、著作权、商标权、名誉权或其他任何合法权益；\n4.10.7 \u3000如发现任何非法使用用户帐号或帐号出现安全漏洞的情况，应立即通告琵琶网。\n4.11 \u3000如用户在使用网络服务时违反任何上述规定，琵琶网或其授权的人有权要求用户改正或直接采取一切必要的措施（包括但不限于更改或删除用户张贴的内容等、暂停或终止用户使用网络服务的权利）以减轻用户不当行为造成的影响。琵琶网适用本款之规定暂停用户帐号等单方中止或终止合同履行的，若需要琵琶网举证，则琵琶网仅在琵琶网的现有技术限度内就用户违反法律禁止性规定和严重违反合同约定的事实承担举证责任。\n4.12 \u3000用户利用注册的琵琶网通行证接受琵琶网（及与琵琶网存在链接关系的网站）的提供的游戏、商城、文学、邮箱等相关服务时，应视为用户已同意相关游戏、商城、文学、邮箱等服务所特有（专用）的服务协议及相关规则并承诺予以遵守。上文所称的特有（专用）的服务协议及相关规则，用户应主动在相关服务的首页（官网）上查阅，如用户对该服务协议及相关规则有异议的，应主动终止相关的服务。\n4.13 \u3000琵琶网针对某些特定的琵琶网网络服务的使用通过各种方式（包括但不限于网页公告、电子邮件、短信提醒等）作出的任何声明、通知、警示等内容视为本协议的一部分，用户如使用该等琵琶网网络服务，视为用户同意该等声明、通知、警示的内容。如用户对该声明、通知、警示有异议的，应主动终止相关的服务。\n5. 知识产权。\n5.1 \u3000琵琶网提供的网络服务中包含的任何文本、图片、图形、音频和/或视频资料均受版权、商标和/或其它财产所有权法律的保护，未经相关权利人同意，上述资料均不得在任何媒体直接或间接发布、播放、出于播放或发布目的而改写或再发行，或者被用于其他任何商业目的。所有这些资料或资料的任何部分仅可作为私人和非商业用途而保存在某台计算机内。琵琶网不就由上述资料产生或在传送或递交全部或部分上述资料过程中产生的延误、不准确、错误和遗漏或从中产生或由此产生的任何损害赔偿，以任何形式，向用户或任何第三方负责。\n5.2 \u3000琵琶网为提供网络服务而使用的任何软件（包括但不限于软件中所含的任何图像、照片、动画、录像、录音、音乐、文字和附加程序、随附的帮助材料）的一切权利均属于该软件的著作权人，未经该软件的著作权人许可，用户不得对该软件进行反向工程（reverse engineer）、反向编译（decompile）或反汇编（disassemble）。\n6. 用户信息保护。\n6.1 \u3000用户提供与其个人身份有关的信息资料给琵琶网时，应当已了解并接受琵琶网的隐私权保护政策和个人信息利用政策。琵琶网将采取措施保护用户的个人信息资料的安全。\n6.2 \u3000未经用户许可，琵琶网不会向任何第三方公开或共享用户注册资料中的姓名、个人有效身份证件号码、联系方式、家庭住址等个人身份信息，但下列情况除外：\n6.2.1 \u3000用户或用户监护人授权琵琶网披露的；\n6.2.2 \u3000有关法律要求琵琶网披露的；\n6.2.3 \u3000司法机关或行政机关基于法定程序要求琵琶网提供的；\n6.2.4 \u3000应用户监护人的合法要求而提供用户个人身份信息时；\n6.2.5 \u3000琵琶网为维护自己的合法权益向用户提起诉讼或者仲裁时；\n6.2.6 \u3000其它需要提供用户个人身份信息的情况。\n6.3 \u3000琵琶网可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与琵琶网同等的保护用户隐私的责任，则琵琶网有权将用户的注册资料等提供给该第三方。\n6.4 \u3000在不透露单个用户隐私资料的前提下，琵琶网有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。\n7. 免责声明。\n7.1 \u3000琵琶网不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由琵琶网实际控制的任何网页上的内容，琵琶网不承担任何责任。\n7.2 \u3000琵琶网有权但无义务，改善或更正本服务任何部分之任何疏漏、错误。\n7.3 \u3000琵琶网不保证（包括但不限于）：\n7.3.1 \u3000网络服务适合用户的使用要求；\n7.3.2 \u3000网络服务不受干扰，及时、安全、可靠或不出现错误，包括黑客入侵，网络中断，电信问题及其他不可抗力等；\n7.3.3 \u3000用户经由网络服务取得的任何产品、服务或其他材料符合用户的期望；\n7.3.4 \u3000对于因不可抗力或琵琶网不能控制的原因造成的网络服务中断或其它缺陷，琵琶网不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。\n7.4 \u3000用户同意，对于琵琶网向用户提供的服务的质量缺陷本身及其引发的任何损失，琵琶网无需承担任何责任。\n7.5 \u3000由于用户经由琵琶网张贴或传送内容、违反本服务条款或侵害其他人的任何权利导致任何第三人提出权利主张，用户同意赔偿琵琶网及其分公司、关联公司、代理人或其他合作伙伴及员工，并使其免受损害。\n8. 协议修改。\n8.1 \u3000琵琶网有权随时修改本协议的任何条款，一旦本协议的内容发生变动，琵琶网将会通过网页公告等方式向用户提示修改内容。\n8.2 \u3000如果不同意琵琶网对本协议相关条款所做的修改，用户有权停止使用网络服务。如果用户继续使用网络服务，则视为用户接受琵琶网对本协议相关条款所做的修改。\n9. 通知送达。\n9.1 \u3000本协议项下琵琶网对于用户所有的通知均可通过网页公告、电子邮件等方式进行；该等通知于发送之日视为已送达收件人。\n9.2 \u3000用户对于琵琶网的通知应当通过琵琶网对外正式公布的通信地址、传真号码等联系信息进行送达。\n10. 青少年用户特别提示。\n青少年用户必须遵守全国青少年网络文明公约：\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\n11. 法律管辖。\n11.1 \u3000本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律并受中国法院管辖。\n11.2 \u3000如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向舜邦公司注册地的人民法院提起诉讼。\n12. 其他规定。\n12.1 \u3000本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。\n12.2 \u3000如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\n12.3 \u3000本协议中的标题仅为方便而设，在解释本协议时应被忽略。\n\t\t最后，该条款最终解释权威琵琶网所有，如有任何异议，请及时联系我们，谢谢。");
        this.aF = (Button) findViewById(com.pipaw.a.h.b(this, "terms_agree_btn"));
        this.aF.setText("同意");
        this.aF.setOnClickListener(this);
        this.aG = (Button) findViewById(com.pipaw.a.h.b(this, "terms_disagree_btn"));
        this.aG.setText("不同意");
        this.aG.setOnClickListener(this);
        this.aH = AnimationUtils.loadAnimation(this, com.pipaw.a.h.a(this, "appear_to_left"));
        this.aI = AnimationUtils.loadAnimation(this, com.pipaw.a.h.a(this, "disappear_to_left"));
        this.aJ = AnimationUtils.loadAnimation(this, com.pipaw.a.h.a(this, "appear_to_right"));
        this.aK = AnimationUtils.loadAnimation(this, com.pipaw.a.h.a(this, "disappear_to_right"));
        if (b.a(this)) {
            b.a(this, false);
            com.pipaw.a.f.a(this.i);
            d();
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            switch (this.aX) {
                case 0:
                    a(2000, StatConstants.MTA_COOPERATION_TAG);
                    return true;
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                    n();
                    return true;
                case 6:
                    t();
                    return true;
            }
        }
        return super.onKeyDown(i, keyEvent);
    }
}
