package com.youai.dreamonepiece;

import android.R;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageButton;
import android.widget.RelativeLayout;
import com.tencent.stat.common.StatConstants;
import com.youai.NetworkUtil;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;

/* JADX INFO: loaded from: classes.dex */
public class GameAnnounceDialog extends Dialog {
    private static final String mDefaultUrl = "http://mxhzw.com/notice.php";
    private static String mRequestUrl;
    private static Resources mRes;
    private RelativeLayout boxRl;
    RelativeLayout.LayoutParams lp;
    private ImageButton mBtnOk;
    private Context mContext;
    private ProgressDialog mSpinner;
    private RelativeLayout mWebRl;
    private WebView mWebView;
    private static final String TAG = GameAnnounceDialog.class.toString();
    private static int theme = R.style.Theme.Translucent.NoTitleBar;

    public GameAnnounceDialog(Activity context, String url) {
        super(context, theme);
        this.lp = new RelativeLayout.LayoutParams(-1, -1);
        mRes = context.getResources();
        this.mContext = context;
        if (!url.equalsIgnoreCase(StatConstants.MTA_COOPERATION_TAG) && url != null) {
            mRequestUrl = url;
            show();
        } else {
            cancel();
            mRequestUrl = mDefaultUrl;
        }
    }

    private GameAnnounceDialog(Activity context) {
        super(context, theme);
        this.lp = new RelativeLayout.LayoutParams(-1, -1);
    }

    @Override // android.app.Dialog
    public void onBackPressed() {
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        super.dismiss();
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        if (!NetworkUtil.detect(this.mContext)) {
            dismiss();
            return;
        }
        this.mSpinner = new ProgressDialog(getContext());
        this.mSpinner.requestWindowFeature(1);
        this.mSpinner.setMessage("加载中...");
        this.mSpinner.setOnKeyListener(new DialogInterface.OnKeyListener() { // from class: com.youai.dreamonepiece.GameAnnounceDialog.1
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                GameAnnounceDialog.this.onBack();
                return false;
            }
        });
        setUpWebView();
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        getWindow().setFeatureDrawableAlpha(0, 0);
        setContentView(com.youai.dreamonepiece.platform.pipaw.R.layout.announce_dialog);
        this.mBtnOk = (ImageButton) findViewById(com.youai.dreamonepiece.platform.pipaw.R.id.announce_btnok);
        this.mBtnOk.setOnClickListener(new View.OnClickListener() { // from class: com.youai.dreamonepiece.GameAnnounceDialog.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                try {
                    GameAnnounceDialog.this.mSpinner.dismiss();
                    if (GameAnnounceDialog.this.mWebView != null) {
                        GameAnnounceDialog.this.mWebView.stopLoading();
                        GameAnnounceDialog.this.mWebRl.removeAllViews();
                    }
                } catch (Exception e) {
                }
                GameAnnounceDialog.this.dismiss();
            }
        });
    }

    protected void onBack() {
        try {
            this.mSpinner.dismiss();
            if (this.mWebView != null) {
                this.mWebView.stopLoading();
            }
        } catch (Exception e) {
        }
        cancel();
    }

    @SuppressLint({"SetJavaScriptEnabled", "SdCardPath"})
    private void setUpWebView() {
        this.mWebRl = (RelativeLayout) findViewById(com.youai.dreamonepiece.platform.pipaw.R.id.announce_webview);
        this.boxRl = (RelativeLayout) findViewById(com.youai.dreamonepiece.platform.pipaw.R.id.announce_webrl);
        this.mWebView = new WebView(getContext());
        this.mWebView.setWebViewClient(new WeiboWebViewClient());
        WebSettings webSettings = this.mWebView.getSettings();
        webSettings.setDomStorageEnabled(true);
        webSettings.setJavaScriptEnabled(true);
        webSettings.setSupportMultipleWindows(true);
        webSettings.setJavaScriptCanOpenWindowsAutomatically(true);
        webSettings.setAppCacheMaxSize(16777216L);
        webSettings.setAppCacheEnabled(true);
        String appCachePath = this.mContext.getApplicationContext().getCacheDir().getAbsolutePath();
        webSettings.setAppCachePath(appCachePath);
        webSettings.setAllowFileAccess(true);
        webSettings.setCacheMode(-1);
        webSettings.setDatabaseEnabled(false);
        String databasePath = "/data/data/" + this.mContext.getPackageName() + "/databases/";
        webSettings.setDatabasePath(databasePath);
        webSettings.setGeolocationEnabled(true);
        webSettings.setSaveFormData(true);
        if (mRequestUrl != null) {
            this.mWebView.loadUrl(mRequestUrl);
            mRequestUrl = null;
        } else {
            this.mWebView.loadUrl(mDefaultUrl);
        }
        int screenDensity = mRes.getDisplayMetrics().densityDpi;
        Log.i(TAG, "screenDensity" + screenDensity);
        switch (screenDensity) {
            case Opcodes.ISHL /* 120 */:
                this.mWebView.setInitialScale(30);
                break;
            case 160:
                this.mWebView.setInitialScale(35);
                break;
            case 240:
                this.mWebView.setInitialScale(40);
                break;
            case 320:
                this.mWebView.setInitialScale(45);
                break;
            case 480:
                this.mWebView.setInitialScale(50);
                break;
            default:
                this.mWebView.setInitialScale(45);
                break;
        }
        this.mWebRl.addView(this.mWebView, this.lp);
    }

    private class WeiboWebViewClient extends WebViewClient {
        boolean haveErr;

        private WeiboWebViewClient() {
            this.haveErr = false;
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Log.d(GameAnnounceDialog.TAG, "shouldOverrideUrlLoading URL: " + url);
            return super.shouldOverrideUrlLoading(view, url);
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            super.onReceivedError(view, errorCode, description, failingUrl);
            this.haveErr = true;
            Log.i("error", "error+" + errorCode + description);
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            super.onPageStarted(view, url, favicon);
            GameAnnounceDialog.this.mSpinner.show();
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            Log.d(GameAnnounceDialog.TAG, "onPageFinished URL: " + url);
            super.onPageFinished(view, url);
            if (GameAnnounceDialog.this.mSpinner.isShowing()) {
                GameAnnounceDialog.this.mSpinner.dismiss();
            }
            if (!this.haveErr) {
                GameAnnounceDialog.this.boxRl.setVisibility(0);
                GameAnnounceDialog.this.mWebView.setVisibility(0);
                GameAnnounceDialog.this.mBtnOk.setVisibility(0);
                GameAnnounceDialog.this.mWebRl.setVisibility(0);
            } else {
                GameAnnounceDialog.this.onBack();
                GameAnnounceDialog.this.boxRl.setVisibility(4);
                GameAnnounceDialog.this.mWebView.setVisibility(4);
                GameAnnounceDialog.this.mBtnOk.setVisibility(4);
                GameAnnounceDialog.this.mWebRl.setVisibility(4);
            }
            this.haveErr = false;
        }
    }
}
