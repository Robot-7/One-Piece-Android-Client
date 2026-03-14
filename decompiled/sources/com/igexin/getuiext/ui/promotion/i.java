package com.igexin.getuiext.ui.promotion;

import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class i extends c {
    private String f;
    private String g;
    private String h;
    private a i;
    private com.igexin.getuiext.data.a.d j;
    private int k;

    public i(Context context, m mVar) {
        super(context, mVar);
        this.i = a.UNKNOWN;
        this.k = -1;
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    public View a(int i, int i2) {
        RelativeLayout relativeLayout = new RelativeLayout(this.b);
        UrlImageView urlImageView = new UrlImageView(this.b);
        urlImageView.setPadding(this.d, this.d, this.d, this.d);
        urlImageView.setOnClickListener(this);
        urlImageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        if (this.g != null) {
            urlImageView.setImageBitmap(BitmapFactory.decodeFile(this.g));
        } else {
            urlImageView.a(this.f);
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i, i2);
        layoutParams.addRule(13);
        relativeLayout.addView(urlImageView, layoutParams);
        urlImageView.setOnClickListener(this);
        com.igexin.getuiext.service.a.a(this.b, a(), 1, b(), c());
        return relativeLayout;
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    protected void b(View view) {
        com.igexin.getuiext.service.a.a(this.b, a(), 2, b(), c());
        if (this.h != null) {
            switch (this.i) {
                case DOWNLOAD:
                    if (this.j.g != null) {
                        if (this.k != -1) {
                            Toast.makeText(this.b, "应用下载已经开始，请查看通知栏进度。", 0).show();
                        } else {
                            this.k = com.igexin.getuiext.ui.b.a(this.b, this.j, false);
                        }
                    }
                    break;
                case OPEN_LINK:
                    if (!this.h.startsWith("http://") && !this.h.startsWith("https://")) {
                        this.h = "http://" + this.h;
                    }
                    Intent intent = new Intent("android.intent.action.VIEW");
                    intent.setData(Uri.parse(this.h));
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
        if (jSONObject.has("imgUrl")) {
            this.f = jSONObject.getString("imgUrl");
        }
        if (jSONObject.has("linkUrl")) {
            this.h = jSONObject.getString("linkUrl");
        }
        if (jSONObject.has("imgPath")) {
            this.g = jSONObject.getString("imgPath");
        }
        if (jSONObject.has("action")) {
            this.i = a.a(jSONObject.getString("action"));
        }
        if (this.i.equals(a.DOWNLOAD)) {
            this.j = new com.igexin.getuiext.data.a.d();
            this.j.a = jSONObject.getString("linkAppName");
            this.j.b = jSONObject.getString("linkAppPkg");
            this.j.f = jSONObject.getString("linkAppLogo");
            this.j.g = this.h;
        }
    }
}
