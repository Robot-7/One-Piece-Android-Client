package com.igexin.getuiext.activity;

import android.R;
import android.app.Activity;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.NinePatchDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.igexin.download.Downloads;
import com.igexin.getuiext.data.a.e;
import com.igexin.getuiext.ui.b;
import com.igexin.getuiext.ui.d;
import com.igexin.getuiext.ui.f;
import com.igexin.getuiext.ui.promotion.UrlImageView;
import com.igexin.getuiext.ui.promotion.c;
import com.igexin.getuiext.ui.promotion.g;
import com.igexin.getuiext.ui.promotion.m;
import com.igexin.getuiext.util.h;
import com.pipaw.pipawpay.PipawSDK;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
public class GetuiExtActivity extends Activity implements View.OnClickListener, View.OnTouchListener {
    private int a;
    private int b;
    private int c;
    private int d;
    private f e;
    private UpgradeProgressReceiver f;
    private c g;
    private RelativeLayout h;
    private e i;
    private int j;
    private d k = d.SLEEP;
    private ProgressBar l;
    private ImageView m;
    private TextView n;
    private RelativeLayout o;
    private String p;
    private int q;

    public class UpgradeProgressReceiver extends BroadcastReceiver {
        public UpgradeProgressReceiver() {
        }

        private void a(int i, int i2, String str) {
            if (i != GetuiExtActivity.this.j) {
                if (GetuiExtActivity.this.g instanceof com.igexin.getuiext.ui.promotion.d) {
                    ((com.igexin.getuiext.ui.promotion.d) GetuiExtActivity.this.g).a(i, i2, str);
                }
            } else {
                if (i2 == -1) {
                    GetuiExtActivity.this.k = d.ERROR;
                    GetuiExtActivity.this.a();
                    return;
                }
                GetuiExtActivity.this.l.setProgress(i2);
                if (i2 >= 100) {
                    GetuiExtActivity.this.k = d.DOWNLOADED;
                    GetuiExtActivity.this.p = str;
                    GetuiExtActivity.this.a();
                }
            }
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("com.igexin.getuiext.ui.upgrade_progress".equals(intent.getAction())) {
                a(intent.getIntExtra("download_id", -1), intent.getIntExtra("progress", 0), intent.getStringExtra("file_path"));
            }
        }
    }

    private e a(Bundle bundle) {
        e eVar = new e();
        eVar.f = bundle.getString("logo_url");
        eVar.j = bundle.getString("sendId");
        eVar.k = bundle.getString("taskid");
        eVar.a = bundle.getString("name");
        eVar.g = bundle.getString("url");
        eVar.r = bundle.getString(Downloads.COLUMN_DESCRIPTION);
        eVar.o = bundle.getLong("diffSize");
        eVar.i = bundle.getLong("fullSize");
        eVar.h = bundle.getString("originalUrl");
        eVar.b = bundle.getString("pkgname");
        eVar.n = com.igexin.getuiext.data.a.f.a(bundle.getString("updateType"));
        eVar.d = bundle.getInt("versionCode");
        eVar.c = bundle.getString("versionName");
        eVar.m = bundle.getInt("previous_version_code");
        return eVar;
    }

    private c b(Bundle bundle) {
        m mVar = m.UNKNOWN;
        String string = bundle.getString("recommendType");
        if ("img".equals(string)) {
            mVar = m.IMG;
        } else if ("app".equals(string)) {
            mVar = m.APP;
        } else if ("txt".equals(string)) {
            mVar = m.TEXT;
        }
        if (mVar == m.UNKNOWN) {
            return null;
        }
        c cVarA = g.a(this, mVar);
        cVarA.b(this.i.k);
        cVarA.a(this.i.j);
        try {
            cVarA.c(bundle.getString("promotion_attrs"));
            return cVarA;
        } catch (JSONException e) {
            return null;
        }
    }

    private void b() {
        this.e = f.a(getApplicationContext());
        this.a = com.igexin.getuiext.ui.a.a(this, 10.0f);
        this.b = com.igexin.getuiext.ui.a.a(this, 3.0f);
        this.c = com.igexin.getuiext.ui.a.a(this, 2.0f);
        this.d = com.igexin.getuiext.ui.a.a(this, 1.0f);
    }

    private void c() {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        int i = displayMetrics.widthPixels;
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams(2003);
        int i2 = (int) (((double) i) * 0.9d);
        layoutParams.width = i2;
        this.q = i2;
        layoutParams.height = -2;
        getWindow().setAttributes(layoutParams);
    }

    private void d() {
        if (this.g != null) {
            View viewA = this.g.a(com.igexin.getuiext.ui.a.a(this, 386.0f), com.igexin.getuiext.ui.a.a(this, 146.0f));
            if (viewA == null) {
                Log.w("GetuiExt-UpgradeActivity", "No Promotion Applications, Hide Promotion View");
                return;
            }
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, com.igexin.getuiext.ui.a.a(this, 146.0f));
            layoutParams.addRule(3, 1012);
            layoutParams.addRule(5, 1012);
            layoutParams.setMargins(this.a, this.b, this.a, this.b);
            this.h.addView(viewA, layoutParams);
        }
    }

    private void e() {
        Intent intent = new Intent();
        int i = Build.VERSION.SDK_INT;
        if (i >= 9) {
            intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.setData(Uri.fromParts("package", this.i.b, null));
        } else {
            String str = i == 8 ? "pkg" : "com.android.settings.ApplicationPkgName";
            intent.setAction("android.intent.action.VIEW");
            intent.setClassName("com.android.settings", "com.android.settings.InstalledAppDetails");
            intent.putExtra(str, this.i.b);
        }
        startActivity(intent);
        if (this.i != null) {
            com.igexin.getuiext.service.a.a(this, this.i, 10);
        }
    }

    private RelativeLayout f() {
        RelativeLayout relativeLayout = new RelativeLayout(this);
        relativeLayout.setId(1012);
        ImageView imageView = new ImageView(this);
        imageView.setScaleType(ImageView.ScaleType.FIT_XY);
        imageView.setImageBitmap(this.e.c("inc_icon_close.png"));
        relativeLayout.addView(imageView, new RelativeLayout.LayoutParams(this.a * 3, this.a * 3));
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) imageView.getLayoutParams();
        layoutParams.addRule(11);
        imageView.setLayoutParams(layoutParams);
        imageView.setId(PipawSDK.PAY_SUCCESS);
        imageView.setOnClickListener(this);
        TextView textView = new TextView(this);
        textView.setTextSize(2, 18.0f);
        textView.setTextColor(-16777216);
        textView.setText(this.i.a + "正在升级");
        textView.setEllipsize(TextUtils.TruncateAt.END);
        textView.setSingleLine();
        relativeLayout.addView(textView, 0, new RelativeLayout.LayoutParams(-1, -2));
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) textView.getLayoutParams();
        layoutParams2.addRule(10);
        layoutParams2.addRule(0, PipawSDK.PAY_SUCCESS);
        layoutParams2.topMargin = this.a;
        layoutParams2.leftMargin = this.b + this.c + this.c;
        textView.setLayoutParams(layoutParams2);
        textView.setId(PipawSDK.PAY_CANCEL);
        TextView textView2 = new TextView(this);
        textView2.setBackgroundColor(-16711936);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, this.d);
        layoutParams3.topMargin = this.b + this.b;
        relativeLayout.addView(textView2, 2, layoutParams3);
        layoutParams3.addRule(3, PipawSDK.PAY_CANCEL);
        textView2.setId(PipawSDK.PAY_FAIL);
        RelativeLayout relativeLayout2 = new RelativeLayout(this);
        relativeLayout2.setPadding(this.b, this.b, this.b, this.b);
        relativeLayout2.setId(PipawSDK.PAY_CHECK_SIGN_FAIL);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams4.addRule(3, PipawSDK.PAY_FAIL);
        layoutParams4.topMargin = this.c + this.b;
        relativeLayout.addView(relativeLayout2, layoutParams4);
        UrlImageView urlImageView = new UrlImageView(this);
        urlImageView.a(this.i.f);
        urlImageView.setId(1005);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams5.addRule(15);
        relativeLayout2.addView(urlImageView, layoutParams5);
        if (com.igexin.getuiext.data.a.f.DIFF.equals(this.i.n)) {
            ImageView imageView2 = new ImageView(this);
            imageView2.setImageBitmap(this.e.c("inc_province.png"));
            RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams6.addRule(8, 1005);
            layoutParams6.addRule(6, 1005);
            layoutParams6.addRule(5, 1005);
            layoutParams6.addRule(7, 1005);
            relativeLayout2.addView(imageView2, layoutParams6);
        }
        RelativeLayout relativeLayout3 = new RelativeLayout(this);
        relativeLayout3.setId(1011);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams7.addRule(11);
        layoutParams7.addRule(15);
        layoutParams7.rightMargin = this.b + this.c;
        relativeLayout2.addView(relativeLayout3, layoutParams7);
        this.m = new ImageView(this);
        this.m.setImageBitmap(this.e.c("inc_pause.png"));
        this.m.setId(1016);
        RelativeLayout.LayoutParams layoutParams8 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams8.addRule(14);
        relativeLayout3.addView(this.m, layoutParams8);
        this.m.setOnClickListener(this);
        this.n = new TextView(this);
        this.n.setTextColor(-16777216);
        this.n.setTextSize(2, 12.0f);
        this.n.setText("暂停");
        this.n.setId(1017);
        RelativeLayout.LayoutParams layoutParams9 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams9.addRule(3, 1016);
        layoutParams9.setMargins(0, this.b + this.b, 0, 0);
        layoutParams9.addRule(14);
        relativeLayout3.addView(this.n, layoutParams9);
        RelativeLayout relativeLayout4 = new RelativeLayout(this);
        relativeLayout4.setPadding(this.b, this.b, this.b, this.b);
        relativeLayout4.setId(1004);
        RelativeLayout.LayoutParams layoutParams10 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams10.addRule(1, 1005);
        layoutParams10.addRule(15);
        layoutParams10.addRule(0, 1011);
        layoutParams10.leftMargin = this.b + this.b;
        layoutParams10.rightMargin = layoutParams10.leftMargin;
        relativeLayout2.addView(relativeLayout4, layoutParams10);
        TextView textView3 = new TextView(this);
        textView3.setTextColor(-16777216);
        textView3.setTextSize(2, 15.0f);
        textView3.setText(this.i.a);
        textView3.setEms(6);
        textView3.setEllipsize(TextUtils.TruncateAt.END);
        textView3.setSingleLine();
        textView3.setId(1006);
        relativeLayout4.addView(textView3, new RelativeLayout.LayoutParams(-2, -2));
        TextView textView4 = new TextView(this);
        textView4.setTextSize(2, 12.0f);
        textView4.setTextColor(-16777216);
        textView4.setSingleLine();
        textView4.setEllipsize(TextUtils.TruncateAt.END);
        textView4.setText("版本:" + this.i.c);
        textView4.setId(1007);
        RelativeLayout.LayoutParams layoutParams11 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams11.leftMargin = this.c + this.b;
        layoutParams11.addRule(1, 1006);
        layoutParams11.addRule(4, 1006);
        relativeLayout4.addView(textView4, layoutParams11);
        TextView textView5 = new TextView(this);
        textView5.setTextSize(2, 12.0f);
        textView5.setTextColor(-16777216);
        textView5.setId(1008);
        if (this.i.n.equals(com.igexin.getuiext.data.a.f.DIFF)) {
            textView5.getPaint().setFlags(17);
        }
        textView5.setText("大小:" + String.format("%.2f", Float.valueOf(this.i.i / 1048576.0f)) + "M");
        RelativeLayout.LayoutParams layoutParams12 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams12.addRule(3, 1006);
        layoutParams12.addRule(5, 1006);
        relativeLayout4.addView(textView5, layoutParams12);
        TextView textView6 = new TextView(this);
        textView6.setTextSize(2, 12.0f);
        textView6.setTextColor(-16777216);
        textView6.setSingleLine();
        textView6.setId(1009);
        textView6.setText("只需:" + String.format("%.2f", Float.valueOf(this.i.o / 1048576.0f)) + "M");
        RelativeLayout.LayoutParams layoutParams13 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams13.addRule(1, 1008);
        layoutParams13.addRule(4, 1008);
        layoutParams13.leftMargin = this.c + this.b;
        relativeLayout4.addView(textView6, layoutParams13);
        if (this.i.n.equals(com.igexin.getuiext.data.a.f.FULL)) {
            textView6.setVisibility(8);
        }
        this.l = new ProgressBar(this, null, R.attr.progressBarStyleHorizontal);
        this.l.setId(1010);
        this.l.getProgressDrawable().setColorFilter(-256, PorterDuff.Mode.MULTIPLY);
        this.l.setMax(100);
        this.l.setProgress(0);
        RelativeLayout.LayoutParams layoutParams14 = new RelativeLayout.LayoutParams(-1, this.b);
        layoutParams14.addRule(3, 1008);
        layoutParams14.addRule(5, 1008);
        layoutParams14.topMargin = this.b;
        relativeLayout4.addView(this.l, layoutParams14);
        TextView textView7 = new TextView(this);
        textView7.setTextSize(2, 12.0f);
        textView7.setTextColor(-16777216);
        textView7.setLines(2);
        textView7.setEllipsize(TextUtils.TruncateAt.END);
        textView7.setText("更新说明：" + this.i.r);
        textView7.setId(1013);
        RelativeLayout.LayoutParams layoutParams15 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams15.addRule(5, PipawSDK.PAY_CHECK_SIGN_FAIL);
        layoutParams15.addRule(3, PipawSDK.PAY_CHECK_SIGN_FAIL);
        layoutParams15.topMargin = this.c + this.b;
        layoutParams15.leftMargin = layoutParams15.topMargin;
        relativeLayout.addView(textView7, layoutParams15);
        this.o = new RelativeLayout(this);
        this.o.setBackgroundColor(Color.parseColor("#8a8a8a"));
        this.o.setId(1018);
        RelativeLayout.LayoutParams layoutParams16 = new RelativeLayout.LayoutParams(-1, 0);
        layoutParams16.addRule(3, 1013);
        layoutParams16.topMargin = this.a;
        relativeLayout.addView(this.o, layoutParams16);
        TextView textView8 = new TextView(this);
        textView8.setTextColor(-1);
        textView8.setText("还可以进行下列操作：");
        textView8.setTextSize(2, 12.0f);
        textView8.setId(1022);
        RelativeLayout.LayoutParams layoutParams17 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams17.topMargin = this.b + this.b;
        layoutParams17.bottomMargin = this.b + this.b;
        layoutParams17.leftMargin = this.b + this.b;
        this.o.addView(textView8, layoutParams17);
        Button button = new Button(this);
        button.setBackgroundDrawable(this.e.b("inc_btn_normal.png"));
        int i = this.q / 9;
        button.setText("管理此应用");
        button.setSingleLine();
        button.setTextSize(2, 12.0f);
        button.setId(1019);
        button.setOnClickListener(this);
        button.setOnTouchListener(this);
        RelativeLayout.LayoutParams layoutParams18 = new RelativeLayout.LayoutParams(i * 3, i);
        layoutParams18.leftMargin = i;
        layoutParams18.addRule(3, 1022);
        this.o.addView(button, layoutParams18);
        Button button2 = new Button(this);
        button2.setBackgroundDrawable(this.e.b("inc_btn_emphasize_normal.png"));
        button2.setText("WiFi下下载");
        button2.setSingleLine();
        button2.setTextSize(2, 12.0f);
        button2.setId(1020);
        button2.setOnClickListener(this);
        button2.setOnTouchListener(this);
        RelativeLayout.LayoutParams layoutParams19 = new RelativeLayout.LayoutParams(i * 3, i);
        layoutParams19.rightMargin = i;
        layoutParams19.addRule(3, 1022);
        layoutParams19.addRule(11);
        this.o.addView(button2, layoutParams19);
        View view = new View(this);
        RelativeLayout.LayoutParams layoutParams20 = new RelativeLayout.LayoutParams(i, this.d);
        layoutParams20.addRule(1, 1019);
        layoutParams20.addRule(0, 1020);
        layoutParams20.addRule(3, 1022);
        this.o.addView(view, layoutParams20);
        Button button3 = new Button(this);
        button3.setBackgroundColor(0);
        button3.getPaint().setFlags(9);
        button3.setText("下次再说");
        button3.setTextColor(-1);
        button3.setId(1021);
        button3.setTextSize(2, 12.0f);
        RelativeLayout.LayoutParams layoutParams21 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams21.rightMargin = i;
        layoutParams21.addRule(3, 1020);
        layoutParams21.addRule(11);
        this.o.addView(button3, layoutParams21);
        button3.setOnClickListener(this);
        RelativeLayout relativeLayout5 = new RelativeLayout(this);
        relativeLayout5.setBackgroundDrawable(this.e.a("inc_more.9.png"));
        relativeLayout5.setId(1014);
        RelativeLayout.LayoutParams layoutParams22 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams22.addRule(3, 1018);
        relativeLayout.addView(relativeLayout5, layoutParams22);
        ImageView imageView3 = new ImageView(this);
        imageView3.setImageBitmap(this.e.c("inc_click_down.png"));
        imageView3.setId(1015);
        imageView3.setOnClickListener(this);
        imageView3.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        RelativeLayout.LayoutParams layoutParams23 = new RelativeLayout.LayoutParams(32, 32);
        layoutParams23.addRule(14);
        relativeLayout5.addView(imageView3, layoutParams23);
        return relativeLayout;
    }

    public void a() {
        switch (this.k) {
            case SLEEP:
                this.n.setText("更新");
                this.m.setImageBitmap(this.e.c("inc_update.png"));
                break;
            case DOWNLOADING:
                this.n.setText("暂停");
                this.m.setImageBitmap(this.e.c("inc_pause.png"));
                break;
            case PAUSE:
                this.n.setText("继续");
                this.m.setImageBitmap(this.e.c("inc_update.png"));
                break;
            case DOWNLOADED:
                this.n.setText("安装");
                this.m.setImageBitmap(this.e.c("inc_setup.png"));
                break;
            case INSTALLED:
                this.n.setText("打开");
                this.m.setImageBitmap(this.e.c("inc_open.png"));
                break;
            case ERROR:
                this.n.setText("错误");
                this.m.setImageBitmap(this.e.c("inc_icon_close.png"));
                break;
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        switch (view.getId()) {
            case PipawSDK.PAY_SUCCESS /* 1001 */:
                finish();
                break;
            case 1015:
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.o.getLayoutParams();
                ImageView imageView = (ImageView) view;
                if (layoutParams.height == 0) {
                    layoutParams.height = -2;
                    imageView.setImageBitmap(this.e.c("inc_click_up.png"));
                } else {
                    layoutParams.height = 0;
                    imageView.setImageBitmap(this.e.c("inc_click_down.png"));
                }
                this.o.setLayoutParams(layoutParams);
                break;
            case 1016:
                switch (this.k) {
                    case SLEEP:
                        this.k = d.DOWNLOADING;
                        this.j = b.a((Context) this, (com.igexin.getuiext.data.a.d) this.i, false);
                        com.igexin.getuiext.service.a.a(this, this.i, 3);
                        break;
                    case DOWNLOADING:
                        b.a((Context) this, this.j, (com.igexin.getuiext.data.a.d) this.i);
                        this.k = d.PAUSE;
                        break;
                    case PAUSE:
                        b.a((Context) this, this.j, (com.igexin.getuiext.data.a.a) this.i);
                        this.k = d.DOWNLOADING;
                    case DOWNLOADED:
                        ((NotificationManager) getSystemService("notification")).cancel(this.j << 11);
                        if (this.p != null) {
                            b.a(this, this.p, this.j, this.i);
                        }
                        break;
                    case INSTALLED:
                        b.a(this, this.i.b);
                        finish();
                        break;
                    case ERROR:
                        Toast.makeText(this, "下载失败", 0).show();
                        break;
                }
                a();
                break;
            case 1019:
                e();
                break;
            case 1020:
                if (this.j == -1 && !h.b(this)) {
                    b.a((Context) this, (com.igexin.getuiext.data.a.d) this.i, true);
                }
                com.igexin.getuiext.service.a.a(this, this.i, 11);
                finish();
                break;
            case 1021:
                com.igexin.getuiext.service.a.a(this, this.i, 12);
                finish();
                break;
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        b();
        Bundle extras = getIntent().getExtras();
        this.i = a(extras);
        this.g = b(extras);
        c();
        com.igexin.getuiext.service.a.a(this, this.i, 2);
        this.j = -1;
        if (h.b(this)) {
            this.k = d.DOWNLOADING;
            this.j = b.a((Context) this, (com.igexin.getuiext.data.a.d) this.i, true);
            com.igexin.getuiext.service.a.a(this, this.i, 3);
        }
        this.h = new RelativeLayout(this);
        NinePatchDrawable ninePatchDrawableA = this.e.a("inc_bg.9.png");
        if (ninePatchDrawableA != null) {
            this.h.setBackgroundDrawable(ninePatchDrawableA);
        }
        setContentView(this.h, new RelativeLayout.LayoutParams(-1, -2));
        this.h.addView(f(), -1, -2);
        if (this.g != null) {
            d();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        com.igexin.getuiext.service.a.a(this, this.i, 7);
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        unregisterReceiver(this.f);
        this.f = null;
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.f == null) {
            this.f = new UpgradeProgressReceiver();
        }
        registerReceiver(this.f, new IntentFilter("com.igexin.getuiext.ui.upgrade_progress"));
        a();
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        switch (view.getId()) {
            case 1019:
                if (action == 0) {
                    view.setBackgroundDrawable(this.e.b("inc_btn_pressed.png"));
                } else if (action == 3 || action == 1 || action == 4) {
                    view.setBackgroundDrawable(this.e.b("inc_btn_normal.png"));
                }
                break;
            case 1020:
                if (action == 0) {
                    view.setBackgroundDrawable(this.e.b("inc_btn_emphasize_pressed.png"));
                } else if (action == 3 || action == 1 || action == 4) {
                    view.setBackgroundDrawable(this.e.b("inc_btn_emphasize_normal.png"));
                }
                break;
        }
        return false;
    }
}
