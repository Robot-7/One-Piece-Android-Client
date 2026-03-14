package com.youaiAnalysis;

import android.app.Activity;
import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public abstract class AnalysisBaseAdapter {
    public abstract AnalysisBaseAdapter initAdapter();

    public void onCreate(Context context) {
    }

    public void onResume(Context context) {
    }

    public void onPause(Context context) {
    }

    public void onDestroy() {
    }

    public void onStart(Context context) {
    }

    public void onStop(Context context) {
    }

    public void onEnvent(Activity context, String envent) {
    }

    public void onEventBegin(Activity context, String envent) {
    }

    public void onEventEnd(Activity context, String envent) {
    }

    public void converData(Activity context, String appkey, String platform_type_str, String sdkVersion) {
    }

    public void register(Context context, String type) {
    }

    public void login(Context context) {
    }

    public void purchase(Context context, float price) {
    }

    public void payAcount(Context context, String orderId, double currencyAmount, String currencyType, String paymentType) {
    }

    public void setDeviceTrackingDisabled(boolean boo) {
    }
}
