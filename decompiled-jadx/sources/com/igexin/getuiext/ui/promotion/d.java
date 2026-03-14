package com.igexin.getuiext.ui.promotion;

import android.R;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.PorterDuff;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.igexin.getuiext.data.Consts;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class d extends c {
    private final String f;
    private final int g;
    private final int h;
    private final int i;
    private final int j;
    private final int k;
    private ArrayList l;
    private SparseArray m;
    private RelativeLayout n;

    public d(Context context, m mVar) {
        super(context, mVar);
        this.f = "GetuiExt-PromotionApp";
        this.g = 201;
        this.h = 300;
        this.i = 310;
        this.j = 320;
        this.k = 4;
        this.l = new ArrayList();
        this.m = new SparseArray();
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    public View a(int i, int i2) {
        int size = this.l.size();
        if (size == 0) {
            return null;
        }
        int i3 = size > 4 ? 4 : size;
        this.n = new RelativeLayout(this.b);
        int i4 = this.d + this.c;
        this.n.setPadding(i4, i4, i4, i4);
        TextView textView = new TextView(this.b);
        textView.setTextSize(2, 12.0f);
        textView.setTextColor(-16777216);
        textView.setText("猜你喜欢");
        textView.setId(201);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.topMargin = this.c * 3;
        this.n.addView(textView, layoutParams);
        LinearLayout linearLayout = new LinearLayout(this.b);
        linearLayout.setOrientation(0);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(3, 201);
        layoutParams2.topMargin = this.c + this.c;
        this.n.addView(linearLayout, layoutParams2);
        linearLayout.setWeightSum(4.0f);
        for (int i5 = 0; i5 < i3; i5++) {
            f fVar = (f) this.l.get(i5);
            com.igexin.getuiext.service.c.a().a(fVar.b, fVar);
            RelativeLayout relativeLayout = new RelativeLayout(this.b);
            relativeLayout.setTag(fVar);
            relativeLayout.setOnClickListener(this);
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(0, -2);
            layoutParams3.weight = 1.0f;
            linearLayout.addView(relativeLayout, layoutParams3);
            UrlImageView urlImageView = new UrlImageView(this.b);
            urlImageView.a(fVar.f);
            urlImageView.setId(i5 + 300);
            RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(this.d * 16, this.d * 16);
            layoutParams4.addRule(14);
            relativeLayout.addView(urlImageView, layoutParams4);
            TextView textView2 = new TextView(this.b);
            textView2.setTextSize(2, 6.0f);
            textView2.setPadding(this.d, this.d, this.d, this.d);
            textView2.setTextColor(-16777216);
            textView2.setText("点击下载");
            textView2.setGravity(17);
            textView2.setId(i5 + 310);
            textView2.setBackgroundDrawable(this.e.b("inc_setup_bg.png"));
            RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams5.addRule(8, urlImageView.getId());
            layoutParams5.bottomMargin = this.d;
            layoutParams5.addRule(14);
            relativeLayout.addView(textView2, layoutParams5);
            ProgressBar progressBar = new ProgressBar(this.b, null, R.attr.progressBarStyleHorizontal);
            progressBar.setId(i5 + 320);
            progressBar.getProgressDrawable().setColorFilter(-256, PorterDuff.Mode.MULTIPLY);
            progressBar.setMax(100);
            RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(this.d * 12, this.d * 2);
            layoutParams6.addRule(3, textView2.getId());
            layoutParams6.addRule(14);
            relativeLayout.addView(progressBar, layoutParams6);
            progressBar.setVisibility(4);
            TextView textView3 = new TextView(this.b);
            textView3.setTextSize(2, 15.0f);
            textView3.setTextColor(-16777216);
            textView3.setText(fVar.a);
            textView3.setSingleLine();
            textView3.setEllipsize(TextUtils.TruncateAt.END);
            RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams7.addRule(3, progressBar.getId());
            layoutParams7.addRule(14);
            relativeLayout.addView(textView3, layoutParams7);
            fVar.j = b();
            fVar.k = c();
            fVar.m = i5 + 1;
            com.igexin.getuiext.service.a.a(this.b, com.igexin.getuiext.service.a.a(fVar, 1), Consts.BITYPE_RECOMMEND);
        }
        return this.n;
    }

    public void a(int i, int i2, String str) {
        f fVar = (f) this.m.get(i);
        if (fVar == null) {
            return;
        }
        int iIndexOf = this.l.indexOf(fVar);
        if (i2 < 100) {
            ProgressBar progressBar = (ProgressBar) this.n.findViewById(iIndexOf + 320);
            if (progressBar != null) {
                progressBar.setProgress(i2);
                return;
            }
            return;
        }
        if (str == null || str.equals(StatConstants.MTA_COOPERATION_TAG)) {
            return;
        }
        fVar.e = str;
        this.m.remove(i);
        fVar.n = com.igexin.getuiext.ui.d.DOWNLOADED;
        this.n.findViewById(iIndexOf + 320).setVisibility(4);
        ((TextView) this.n.findViewById(iIndexOf + 310)).setText("点击安装");
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    protected void b(View view) {
        Object tag = view.getTag();
        if (tag instanceof f) {
            f fVar = (f) tag;
            int iIndexOf = this.l.indexOf(fVar);
            TextView textView = (TextView) this.n.findViewById(iIndexOf + 310);
            ProgressBar progressBar = (ProgressBar) this.n.findViewById(iIndexOf + 320);
            switch (e.a[fVar.n.ordinal()]) {
                case 1:
                    int iA = com.igexin.getuiext.ui.b.a(this.b, (com.igexin.getuiext.data.a.d) fVar, false);
                    fVar.l = iA;
                    this.m.put(iA, fVar);
                    com.igexin.getuiext.service.a.a(this.b, fVar, 2);
                    fVar.n = com.igexin.getuiext.ui.d.DOWNLOADING;
                    progressBar.setVisibility(0);
                    textView.setText("点击暂停");
                    break;
                case 2:
                    com.igexin.getuiext.ui.b.a(this.b, fVar.l, (com.igexin.getuiext.data.a.d) fVar);
                    fVar.n = com.igexin.getuiext.ui.d.PAUSE;
                    textView.setText("点击继续");
                    break;
                case 3:
                    com.igexin.getuiext.ui.b.a(this.b, fVar.l, (com.igexin.getuiext.data.a.a) fVar);
                    fVar.n = com.igexin.getuiext.ui.d.DOWNLOADING;
                    textView.setText("点击暂停");
                    break;
                case 4:
                    if (!TextUtils.isEmpty(fVar.e)) {
                        com.igexin.getuiext.ui.b.a(this.b, fVar.e, fVar.l, fVar);
                        ((NotificationManager) this.b.getSystemService("notification")).cancel(fVar.l << 11);
                    }
                    break;
            }
        }
    }

    @Override // com.igexin.getuiext.ui.promotion.c
    public void c(String str) throws JSONException {
        this.l.clear();
        JSONArray jSONArray = new JSONArray(str);
        int length = jSONArray.length();
        for (int i = 0; i < length; i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            String string = jSONObject.getString("pkgname");
            if (!com.igexin.getuiext.util.h.c(this.b, string)) {
                f fVar = new f();
                fVar.b = string;
                fVar.f = jSONObject.getString("logo_url");
                fVar.a = jSONObject.getString("name");
                fVar.g = jSONObject.getString("url");
                fVar.i = jSONObject.getLong("size");
                this.l.add(fVar);
            }
        }
    }
}
