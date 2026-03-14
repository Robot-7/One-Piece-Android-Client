package com.youaiAnalysis.platforms;

import android.content.Context;
import android.util.Log;
import com.reyun.sdk.ReYun;
import com.tencent.stat.common.StatConstants;
import com.youaiAnalysis.AnalysisBaseAdapter;
import com.youaiAnalysis.AnalysisManager;

/* JADX INFO: loaded from: classes.dex */
public class ReyunAdapter extends AnalysisBaseAdapter {
    private boolean isActive = false;

    public static void load(AnalysisManager registry) {
        try {
            if (Class.forName("com.reyun.sdk.ReYun") != null) {
                registry.registerClass(new ReyunAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public AnalysisBaseAdapter initAdapter() {
        return this;
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onCreate(Context context) {
        String RY_APPID = context.getApplicationInfo().metaData.getString("RY_APPID");
        if (RY_APPID.equals(StatConstants.MTA_COOPERATION_TAG)) {
            Log.e("Analysis  SDK error", "选择了热云统计，但是没有配置参数");
        }
        try {
            ReYun.initWithKeyAndChannelId(context, RY_APPID, (String) null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        super.onCreate(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void purchase(Context context, float price) {
        ReYun.setPayment((String) null, (String) null, "RMB", price, 0.0f, (String) null, 0L, 0);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onResume(Context context) {
        super.onResume(context);
        if (!this.isActive) {
            ReYun.startHeartBeat(context);
            this.isActive = true;
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onPause(Context context) {
        super.onPause(context);
        if (!ReYun.isAppOnForeground()) {
            this.isActive = false;
        }
    }
}
