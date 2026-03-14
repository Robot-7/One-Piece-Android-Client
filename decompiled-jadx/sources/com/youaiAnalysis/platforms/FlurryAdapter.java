package com.youaiAnalysis.platforms;

import com.youaiAnalysis.AnalysisBaseAdapter;
import com.youaiAnalysis.AnalysisManager;

/* JADX INFO: loaded from: classes.dex */
public class FlurryAdapter extends AnalysisBaseAdapter {
    public static void load(AnalysisManager registry) {
        try {
            if (Class.forName("com.appsflyer.AppsFlyerLib") != null) {
                registry.registerClass(new FlurryAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public AnalysisBaseAdapter initAdapter() {
        return this;
    }
}
