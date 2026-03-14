package com.youaiAnalysis.platforms;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import com.dataeye.DCAgent;
import com.dataeye.DCVirtualCurrency;
import com.tencent.stat.common.StatConstants;
import com.youaiAnalysis.AnalysisBaseAdapter;
import com.youaiAnalysis.AnalysisManager;

/* JADX INFO: loaded from: classes.dex */
public class DataeyeAdapter extends AnalysisBaseAdapter {
    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onCreate(Context context) {
        String DC_APPID = context.getApplicationInfo().metaData.getString("DC_APPID");
        String DC_CHANNEL = context.getApplicationInfo().metaData.getString("DC_CHANNEL");
        if (DC_APPID.equals(StatConstants.MTA_COOPERATION_TAG)) {
            Log.e("Analysis  SDK error", "选择了热云统计，但是没有配置参数");
        }
        DCAgent.initConfig(context, DC_APPID, DC_CHANNEL);
        super.onCreate(context);
    }

    public static void load(AnalysisManager registry) {
        try {
            if (Class.forName("com.dataeye.DCAgent") != null) {
                registry.registerClass(new DataeyeAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void payAcount(Context context, String orderId, double currencyAmount, String currencyType, String paymentType) {
        DCVirtualCurrency.paymentSuccess(orderId, currencyAmount, currencyType, paymentType);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void purchase(Context context, float price) {
        DCVirtualCurrency.paymentSuccess(price, "RMB", (String) null);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public AnalysisBaseAdapter initAdapter() {
        return this;
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void login(Context context) {
        super.login(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void converData(Activity context, String appkey, String platform_type_str, String sdkVersion) {
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onResume(Context context) {
        DCAgent.onResume(context);
        super.onResume(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onPause(Context context) {
        DCAgent.onPause(context);
        super.onPause(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onDestroy() {
        DCAgent.onKillProcessOrExit();
        super.onDestroy();
    }
}
