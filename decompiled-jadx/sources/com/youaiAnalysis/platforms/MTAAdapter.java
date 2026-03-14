package com.youaiAnalysis.platforms;

import android.app.Activity;
import android.content.Context;
import com.tencent.stat.MtaSDkException;
import com.tencent.stat.StatService;
import com.tencent.stat.common.StatConstants;
import com.youaiAnalysis.AnalysisBaseAdapter;
import com.youaiAnalysis.AnalysisManager;

/* JADX INFO: loaded from: classes.dex */
public class MTAAdapter extends AnalysisBaseAdapter {
    public static void load(AnalysisManager registry) {
        try {
            if (Class.forName("com.tencent.stat.StatService") != null) {
                registry.registerClass(new MTAAdapter().initAdapter());
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
        try {
            StatService.startStatService(context, null, StatConstants.VERSION);
        } catch (MtaSDkException e) {
            e.printStackTrace();
        }
        super.onCreate(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onResume(Context context) {
        StatService.onResume(context);
        super.onResume(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onPause(Context context) {
        StatService.onPause(context);
        super.onPause(context);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onEnvent(Activity context, String envent) {
        StatService.trackCustomEvent(context, envent, envent);
        super.onEnvent(context, envent);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onEventBegin(Activity context, String envent) {
        StatService.trackCustomBeginEvent(context, envent, envent);
        super.onEventBegin(context, envent);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onEventEnd(Activity context, String envent) {
        StatService.trackCustomEndEvent(context, envent, envent);
        super.onEventEnd(context, envent);
    }
}
