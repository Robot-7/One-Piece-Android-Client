package com.pipaw.pipawpay;

import android.app.Activity;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
public class PipawSDK {
    public static final int LOGIN_EXIT = 2000;
    public static final int LOGIN_FAIL = 2002;
    public static final int LOGIN_SUCCESS = 2001;
    public static final int PAY_CANCEL = 1000;
    public static final int PAY_CHECK_SIGN_FAIL = 1003;
    public static final int PAY_FAIL = 1002;
    public static final int PAY_SUCCESS = 1001;
    public static final int REQUEST_LOGIN = 200;
    public static final int REQUEST_PAY = 100;
    private static final String TAG = com.pipaw.a.d.a(PipawSDK.class);
    private static volatile PipawSDK instance;
    private Activity mLoginActivity;
    private Activity mPayActivity;
    private PipawLoginListener mPipawLoginListener;
    private PipawPayListener mPipawPayListener;

    private PipawSDK() {
    }

    public static PipawSDK getInstance() {
        if (instance == null) {
            synchronized (PipawSDK.class) {
                if (instance == null) {
                    instance = new PipawSDK();
                }
            }
        }
        return instance;
    }

    public void login(Activity activity, String str, String str2, String str3, PipawLoginListener pipawLoginListener) {
        this.mLoginActivity = activity;
        this.mPipawLoginListener = pipawLoginListener;
        Intent intent = new Intent(activity, (Class<?>) PipawUserActivity.class);
        intent.putExtra("merchantId", str);
        intent.putExtra("merchantAppId", str2);
        intent.putExtra("appId", str3);
        activity.startActivity(intent);
    }

    void loginCallback(int i, String str) {
        if (this.mLoginActivity == null || this.mPipawLoginListener == null) {
            return;
        }
        this.mLoginActivity.runOnUiThread(new e(this, i, str));
    }

    public void pay(Activity activity, PipawPayRequest pipawPayRequest, PipawPayListener pipawPayListener) {
        this.mPayActivity = activity;
        this.mPipawPayListener = pipawPayListener;
        Intent intent = new Intent(activity, (Class<?>) PipawPayActivity.class);
        intent.putExtra("pay_request", pipawPayRequest);
        activity.startActivity(intent);
    }

    void payCallback(int i, String str) {
        com.pipaw.a.d.a(TAG);
        if (this.mPayActivity == null || this.mPipawPayListener == null) {
            return;
        }
        this.mPayActivity.runOnUiThread(new d(this, i, str));
    }
}
