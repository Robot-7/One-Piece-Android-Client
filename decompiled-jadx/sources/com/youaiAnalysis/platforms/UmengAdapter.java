package com.youaiAnalysis.platforms;

import android.app.Activity;
import android.content.Context;
import com.umeng.analytics.MobclickAgent;
import com.youaiAnalysis.AnalysisBaseAdapter;
import com.youaiAnalysis.AnalysisManager;

/* JADX INFO: loaded from: classes.dex */
public class UmengAdapter extends AnalysisBaseAdapter {
    public static void load(AnalysisManager registry) {
        try {
            if (Class.forName("com.umeng.analytics.MobclickAgent") != null) {
                registry.registerClass(new UmengAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public AnalysisBaseAdapter initAdapter() {
        return this;
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onResume(Context context) {
        MobclickAgent.onResume(context);
        super.onResume(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onPause(Context context) {
        MobclickAgent.onPause(context);
        super.onPause(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onEnvent(Activity context, String envent) {
        MobclickAgent.onEvent(context, envent);
        super.onEnvent(context, envent);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onEventBegin(Activity context, String envent) {
        MobclickAgent.onEventBegin(context, envent);
        super.onEventBegin(context, envent);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onEventEnd(Activity context, String envent) {
        MobclickAgent.onEventEnd(context, envent);
        super.onEventEnd(context, envent);
    }
}
