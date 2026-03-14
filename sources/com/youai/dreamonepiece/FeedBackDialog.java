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
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.RelativeLayout;
import com.tencent.stat.common.StatConstants;
import com.youai.NetworkUtil;

/* JADX INFO: loaded from: classes.dex */
public class FeedBackDialog extends Dialog {
    private static final int BACKMAIN = 1;
    private static String mRequestUrl;
    private static Resources mRes;
    private RelativeLayout boxRl;
    RelativeLayout.LayoutParams lp;
    private Button mBtnOk;
    private Context mContext;
    private Handler mMainHandler;
    private ProgressDialog mSpinner;
    private WebView mWebView;
    private static final String TAG = FeedBackDialog.class.toString();
    private static int theme = R.style.Theme.Translucent.NoTitleBar;
    private static FeedBackDialog AInstance = null;

    private FeedBackDialog(Activity context, String url) {
        super(context, theme);
        this.lp = new RelativeLayout.LayoutParams(-1, -1);
        this.mMainHandler = new Handler() { // from class: com.youai.dreamonepiece.FeedBackDialog.1
            @Override // android.os.Handler
            public void dispatchMessage(Message msg) {
                Log.i(FeedBackDialog.TAG, "dispatchMessage" + msg.what);
                switch (msg.what) {
                    case 1:
                        FeedBackDialog.this.onBack();
                        break;
                }
            }
        };
        mRes = context.getResources();
        this.mContext = context;
        if (!url.equalsIgnoreCase(StatConstants.MTA_COOPERATION_TAG) && url != null) {
            mRequestUrl = url;
        }
    }

    public static FeedBackDialog getInstance(Activity pContext, String url) {
        if (pContext == null) {
            return null;
        }
        mRes = pContext.getResources();
        if (AInstance == null && mRequestUrl != url && !url.equalsIgnoreCase(StatConstants.MTA_COOPERATION_TAG) && url != null) {
            AInstance = new FeedBackDialog(pContext, url);
        } else {
            mRequestUrl = url;
            AInstance = null;
            AInstance = new FeedBackDialog(pContext, url);
        }
        return AInstance;
    }

    private FeedBackDialog(Activity context) {
        super(context, theme);
        this.lp = new RelativeLayout.LayoutParams(-1, -1);
        this.mMainHandler = new Handler() { // from class: com.youai.dreamonepiece.FeedBackDialog.1
            @Override // android.os.Handler
            public void dispatchMessage(Message msg) {
                Log.i(FeedBackDialog.TAG, "dispatchMessage" + msg.what);
                switch (msg.what) {
                    case 1:
                        FeedBackDialog.this.onBack();
                        break;
                }
            }
        };
    }

    @Override // android.app.Dialog
    public void onBackPressed() {
        onBack();
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
        this.mSpinner.setOnKeyListener(new DialogInterface.OnKeyListener() { // from class: com.youai.dreamonepiece.FeedBackDialog.2
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                if (keyCode != 4) {
                    return false;
                }
                FeedBackDialog.this.onBack();
                return true;
            }
        });
        setUpWebView();
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        getWindow().setFeatureDrawableAlpha(0, 0);
        setContentView(com.youai.dreamonepiece.platform.pipaw.R.layout.feedback_dialog);
        this.mBtnOk = (Button) findViewById(com.youai.dreamonepiece.platform.pipaw.R.id.u2_back);
        this.mBtnOk.setOnClickListener(new View.OnClickListener() { // from class: com.youai.dreamonepiece.FeedBackDialog.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                try {
                    FeedBackDialog.this.mSpinner.dismiss();
                    if (FeedBackDialog.this.mWebView != null) {
                        FeedBackDialog.this.mWebView.stopLoading();
                    }
                } catch (Exception e) {
                }
                FeedBackDialog.this.dismiss();
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
        this.boxRl = (RelativeLayout) findViewById(com.youai.dreamonepiece.platform.pipaw.R.id.feedback_webrl);
        this.mWebView = (WebView) findViewById(com.youai.dreamonepiece.platform.pipaw.R.id.webView1);
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
        InJavaScriptLocalObj backGameJs = new InJavaScriptLocalObj();
        this.mWebView.addJavascriptInterface(backGameJs, "localjs");
        this.mWebView.loadUrl(mRequestUrl);
    }

    final class InJavaScriptLocalObj {
        InJavaScriptLocalObj() {
        }

        public void goBackGame() {
            FeedBackDialog.this.mMainHandler.sendEmptyMessage(1);
        }
    }

    private class WeiboWebViewClient extends WebViewClient {
        boolean haveErr;

        private WeiboWebViewClient() {
            this.haveErr = false;
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Log.d(FeedBackDialog.TAG, "shouldOverrideUrlLoading URL: " + url);
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
            FeedBackDialog.this.mSpinner.show();
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            Log.d(FeedBackDialog.TAG, "onPageFinished URL: " + url);
            super.onPageFinished(view, url);
            if (FeedBackDialog.this.mSpinner.isShowing()) {
                FeedBackDialog.this.mSpinner.dismiss();
            }
            if (!this.haveErr) {
                FeedBackDialog.this.boxRl.setVisibility(0);
                FeedBackDialog.this.mWebView.setVisibility(0);
            } else {
                FeedBackDialog.this.onBack();
                FeedBackDialog.this.boxRl.setVisibility(4);
                FeedBackDialog.this.mWebView.setVisibility(4);
            }
            this.haveErr = false;
        }
    }
}
