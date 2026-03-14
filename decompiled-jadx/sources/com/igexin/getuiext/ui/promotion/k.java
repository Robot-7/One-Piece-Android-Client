package com.igexin.getuiext.ui.promotion;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.igexin.download.Downloads;
import com.tencent.stat.common.StatConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class k extends c {
    private String f;
    private int g;
    private int h;
    private int i;
    private String j;
    private int k;
    private int l;
    private a m;
    private String n;
    private com.igexin.getuiext.data.a.d o;
    private int p;

    public k(Context context, m mVar) {
        super(context, mVar);
        this.g = 15;
        this.h = -16777216;
        this.j = StatConstants.MTA_COOPERATION_TAG;
        this.k = 12;
        this.l = -16777216;
        this.m = a.UNKNOWN;
        this.p = -1;
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    public View a(int i, int i2) {
        ScrollView scrollView = new ScrollView(this.b);
        scrollView.setVerticalFadingEdgeEnabled(true);
        scrollView.setVerticalScrollBarEnabled(true);
        RelativeLayout relativeLayout = new RelativeLayout(this.b);
        int i3 = this.c + this.d;
        relativeLayout.setPadding(i3, i3, i3, i3);
        scrollView.addView(relativeLayout, -1, -1);
        relativeLayout.setOnClickListener(this);
        TextView textView = new TextView(this.b);
        textView.setTextColor(this.h);
        textView.setTextSize(2, this.g);
        textView.setGravity(this.i);
        textView.setId(101);
        if (TextUtils.isEmpty(this.f)) {
            textView.setVisibility(8);
        } else {
            textView.setText(this.f);
        }
        relativeLayout.addView(textView, new RelativeLayout.LayoutParams(-1, -2));
        TextView textView2 = new TextView(this.b);
        textView2.setTextColor(this.l);
        textView2.setTextSize(2, this.k);
        textView2.setText(this.j);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(3, 101);
        layoutParams.topMargin = this.d * 2;
        relativeLayout.addView(textView2, layoutParams);
        com.igexin.getuiext.service.a.a(this.b, a(), 1, b(), c());
        return scrollView;
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    protected void b(View view) {
        com.igexin.getuiext.service.a.a(this.b, a(), 2, b(), c());
        if (this.n != null) {
            switch (this.m) {
                case DOWNLOAD:
                    if (this.o.g != null) {
                        if (this.p != -1) {
                            Toast.makeText(this.b, "应用下载已经开始，请查看通知栏进度。", 0).show();
                        } else {
                            this.p = com.igexin.getuiext.ui.b.a(this.b, this.o, false);
                        }
                    }
                    break;
                case OPEN_LINK:
                    if (!this.n.startsWith("http://") && !this.n.startsWith("https://")) {
                        this.n = "http://" + this.n;
                    }
                    Intent intent = new Intent("android.intent.action.VIEW");
                    intent.setData(Uri.parse(this.n));
                    intent.setFlags(268435456);
                    try {
                        this.b.startActivity(intent);
                    } catch (Exception e) {
                        return;
                    }
                    break;
            }
        }
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    public void c(String str) throws JSONException {
        JSONObject jSONObject = new JSONArray(str).getJSONObject(0);
        if (jSONObject.has(Downloads.COLUMN_TITLE)) {
            this.f = jSONObject.getString(Downloads.COLUMN_TITLE);
        }
        if (jSONObject.has("titleFontSize")) {
            this.g = jSONObject.getInt("titleFontSize");
        }
        if (jSONObject.has("titleFontColor")) {
            try {
                this.h = Color.parseColor(jSONObject.getString("titleFontColor"));
            } catch (Exception e) {
                this.h = -16777216;
            }
        }
        if (jSONObject.has("titleAlign")) {
            String string = jSONObject.getString("titleAlign");
            if ("right".equals(string)) {
                this.i = 5;
            } else if ("center".equals(string)) {
                this.i = 17;
            } else {
                this.i = 3;
            }
        }
        if (jSONObject.has("content")) {
            this.j = jSONObject.getString("content");
        }
        if (jSONObject.has("contentFontSize")) {
            this.k = jSONObject.getInt("contentFontSize");
        }
        if (jSONObject.has("contentFontColor")) {
            try {
                this.l = Color.parseColor(jSONObject.getString("contentFontColor"));
            } catch (Exception e2) {
                this.l = -16777216;
            }
        }
        if (jSONObject.has("action")) {
            if ("download".equals(jSONObject.getString("action"))) {
                this.m = a.DOWNLOAD;
            } else {
                this.m = a.OPEN_LINK;
            }
        }
        if (jSONObject.has("linkUrl")) {
            this.n = jSONObject.getString("linkUrl");
        }
        if (this.m.equals(a.DOWNLOAD)) {
            this.o = new com.igexin.getuiext.data.a.d();
            this.o.a = jSONObject.getString("linkAppName");
            this.o.f = jSONObject.getString("linkAppLogo");
            this.o.b = jSONObject.getString("linkAppPkg");
            this.o.g = this.n;
        }
    }
}
