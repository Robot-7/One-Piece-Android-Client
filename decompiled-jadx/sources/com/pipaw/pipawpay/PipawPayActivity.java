package com.pipaw.pipawpay;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.stat.common.StatConstants;
import java.util.HashMap;
import org.apache.http.util.EncodingUtils;

/* JADX INFO: loaded from: classes.dex */
public class PipawPayActivity extends Activity implements View.OnClickListener {
    private static final String a = com.pipaw.a.d.a(PipawPayActivity.class);
    private PipawPayRequest b;
    private String c;
    private String d;
    private String e;
    private String f;
    private String h;
    private String i;
    private String j;
    private String k;
    private String l;
    private int m;
    private ImageView n;
    private TextView o;
    private ProgressBar p;
    private WebView q;
    private String r;
    private String s;
    private String t;
    private String u;
    private String g = "true";
    private WebViewClient v = new WebViewClient() { // from class: com.pipaw.pipawpay.PipawPayActivity.1
        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            return super.shouldOverrideUrlLoading(webView, str);
        }
    };
    private WebChromeClient w = new WebChromeClient() { // from class: com.pipaw.pipawpay.PipawPayActivity.2
        @Override // android.webkit.WebChromeClient
        public boolean onJsAlert(WebView webView, String str, String str2, JsResult jsResult) {
            new AlertDialog.Builder(PipawPayActivity.this).setTitle("提示").setMessage(str2).setPositiveButton("确认", new DialogInterface.OnClickListener() { // from class: com.pipaw.pipawpay.PipawPayActivity.2.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i) {
                }
            }).create().show();
            jsResult.confirm();
            return true;
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView webView, int i) {
            com.pipaw.a.d.a(PipawPayActivity.a, "newProgress " + i);
            PipawPayActivity.this.p.setProgress(i);
            if (i == 100) {
                PipawPayActivity.this.p.setVisibility(8);
            } else {
                PipawPayActivity.this.p.setVisibility(0);
            }
            super.onProgressChanged(webView, i);
        }
    };

    class PayJs {
        private PipawPayActivity activity;

        public PayJs(PipawPayActivity pipawPayActivity) {
            this.activity = pipawPayActivity;
        }

        @JavascriptInterface
        public void payClose() {
            com.pipaw.a.d.a(PipawPayActivity.a);
            this.activity.finish();
        }

        @JavascriptInterface
        public void payFail(String str) {
            com.pipaw.a.d.a(PipawPayActivity.a);
            this.activity.a(PipawSDK.PAY_FAIL, str);
        }

        @JavascriptInterface
        public void paySuccess() {
            com.pipaw.a.d.a(PipawPayActivity.a);
            this.activity.a(PipawSDK.PAY_SUCCESS, StatConstants.MTA_COOPERATION_TAG);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(int i, String str) {
        PipawSDK.getInstance().payCallback(i, str);
        com.pipaw.a.d.a(a, "finish");
        finish();
    }

    private void b() {
        com.pipaw.a.a.a(this, "提示", "确定取消本次支付？", "确定", new DialogInterface.OnClickListener() { // from class: com.pipaw.pipawpay.PipawPayActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                PipawPayActivity.this.a(PipawSDK.PAY_CANCEL, StatConstants.MTA_COOPERATION_TAG);
            }
        }, "取消", null, false);
    }

    private boolean c() {
        if (this.b == null) {
            return false;
        }
        this.l = this.b.getExtraParam();
        if (com.pipaw.a.j.a(this.l)) {
            this.l = StatConstants.MTA_COOPERATION_TAG;
        }
        this.c = this.b.getMerchantId();
        this.d = this.b.getMerchantAppId();
        this.e = this.b.getAppId();
        this.f = this.b.getPayerId();
        this.h = this.b.getExOrderNo();
        this.i = this.b.getSubject();
        this.j = this.b.getPrice();
        this.k = this.b.getMerchantSign();
        return (com.pipaw.a.j.a(this.c) || com.pipaw.a.j.a(this.d) || com.pipaw.a.j.a(this.e) || !com.pipaw.a.j.a(this.f, 15) || !com.pipaw.a.j.a(this.h, 50) || !com.pipaw.a.j.a(this.i, 30) || com.pipaw.a.j.a(this.j) || com.pipaw.a.j.a(this.k)) ? false : true;
    }

    private String d() {
        try {
            HashMap map = new HashMap();
            map.put("merchantId", this.c);
            map.put("merchantAppId", this.d);
            map.put("appId", this.e);
            map.put("payerId", this.f);
            map.put("isPipawId", this.g);
            map.put("exOrderNo", this.h);
            map.put("subject", this.i);
            map.put("amount", this.j);
            map.put("extraParam", this.l);
            map.put("merchantSign", this.k);
            map.put("channelId", String.valueOf(this.m));
            map.put("pipawUid", this.r);
            map.put("pipawUsername", this.s);
            map.put("sid", this.t);
            map.put("time", this.u);
            map.put("version", "2.4");
            StringBuffer stringBuffer = new StringBuffer();
            boolean z = true;
            for (String str : map.keySet()) {
                if (z) {
                    stringBuffer.append(String.valueOf(str) + "=" + ((String) map.get(str)));
                    z = false;
                } else {
                    stringBuffer.append("&" + str + "=" + ((String) map.get(str)));
                }
            }
            return stringBuffer.toString();
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() == com.pipaw.a.h.b(this, "back_iv")) {
            b();
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(com.pipaw.a.h.c(this, "pipaw_pay"));
        this.b = (PipawPayRequest) getIntent().getParcelableExtra("pay_request");
        this.m = com.pipaw.a.g.a(this, "PIPAW_ID");
        if (this.m == 0) {
            this.m = -1;
        }
        this.r = com.pipaw.a.i.a(this, "pipaw", "uid", StatConstants.MTA_COOPERATION_TAG);
        this.s = com.pipaw.a.i.a(this, "pipaw", "pipawun", StatConstants.MTA_COOPERATION_TAG);
        this.t = a.a();
        this.u = a.b();
        if (com.pipaw.a.j.a(this.r) || com.pipaw.a.j.a(this.s)) {
            a(PipawSDK.PAY_FAIL, "用户未登录");
            return;
        }
        if (!c()) {
            a(PipawSDK.PAY_FAIL, "数据格式不正确");
            return;
        }
        this.n = (ImageView) findViewById(com.pipaw.a.h.b(this, "back_iv"));
        this.n.setOnClickListener(this);
        this.o = (TextView) findViewById(com.pipaw.a.h.b(this, "title_tv"));
        this.o.setText("琵琶网支付中心");
        this.p = (ProgressBar) findViewById(R.id.progressBar);
        this.q = (WebView) findViewById(com.pipaw.a.h.b(this, "webView"));
        this.q.setVerticalScrollBarEnabled(false);
        this.q.getSettings().setSupportZoom(false);
        this.q.getSettings().setSaveFormData(false);
        this.q.getSettings().setSavePassword(false);
        this.q.getSettings().setJavaScriptEnabled(true);
        this.q.getSettings().setDefaultTextEncodingName("UTF-8");
        this.q.addJavascriptInterface(new PayJs(this), "pay");
        this.q.setWebViewClient(this.v);
        this.q.setWebChromeClient(this.w);
        this.q.requestFocus();
        String strD = d();
        if (com.pipaw.a.j.a(strD)) {
            return;
        }
        this.q.postUrl("http://sdk.pipaw.com/wap/order", EncodingUtils.getBytes(strD, "UTF-8"));
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i != 4) {
            return super.onKeyDown(i, keyEvent);
        }
        b();
        return true;
    }
}
