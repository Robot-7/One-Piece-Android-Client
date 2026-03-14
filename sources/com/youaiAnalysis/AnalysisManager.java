package com.youaiAnalysis;

import android.app.Activity;
import android.content.Context;
import com.youaiAnalysis.platforms.AppsFlyerAdapter;
import com.youaiAnalysis.platforms.DataeyeAdapter;
import com.youaiAnalysis.platforms.FlurryAdapter;
import com.youaiAnalysis.platforms.MTAAdapter;
import com.youaiAnalysis.platforms.ReyunAdapter;
import com.youaiAnalysis.platforms.UmengAdapter;
import java.util.LinkedList;

/* JADX INFO: loaded from: classes.dex */
public class AnalysisManager {
    private static AnalysisManager mInstance = null;
    private LinkedList<AnalysisBaseAdapter> sparseArray;

    private AnalysisManager() {
        this.sparseArray = null;
        this.sparseArray = new LinkedList<>();
    }

    public static AnalysisManager getInstance() {
        if (mInstance == null) {
            mInstance = new AnalysisManager();
            mInstance.loadAdapters();
        }
        return mInstance;
    }

    private void loadAdapters() {
        try {
            AppsFlyerAdapter.load(this);
        } catch (Error e) {
        }
        try {
            FlurryAdapter.load(this);
        } catch (Error e2) {
        }
        try {
            MTAAdapter.load(this);
        } catch (Error e3) {
        }
        try {
            UmengAdapter.load(this);
        } catch (Error e4) {
        }
        try {
            ReyunAdapter.load(this);
        } catch (Error e5) {
        }
        try {
            DataeyeAdapter.load(this);
        } catch (Error e6) {
        }
    }

    public void registerClass(AnalysisBaseAdapter adapterClass) {
        this.sparseArray.add(adapterClass);
    }

    public void onCreate(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onCreate(context);
        }
    }

    public void onResume(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onResume(context);
        }
    }

    public void onPause(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onPause(context);
        }
    }

    public void onStop(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onStop(context);
        }
    }

    public void onDestroy() {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onDestroy();
        }
    }

    public void onStart(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onStart(context);
        }
    }

    public void onEnvent(Activity context, String envent) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onEnvent(context, envent);
        }
    }

    public void onEventBegin(Activity context, String envent) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onEventBegin(context, envent);
        }
    }

    public void onEventEnd(Activity context, String envent) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).onEventEnd(context, envent);
        }
    }

    public void converData(Activity context, String appkey, String platform_type_str, String sdkVersion) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).converData(context, appkey, platform_type_str, sdkVersion);
        }
    }

    public void register(Context context, String type) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).register(context, type);
        }
    }

    public void login(Context context) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).login(context);
        }
    }

    public void purchase(Context context, float price) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).purchase(context, price);
        }
    }

    public void setDeviceTrackingDisabled(boolean boo) {
        for (int i = 0; i < this.sparseArray.size(); i++) {
            this.sparseArray.get(i).setDeviceTrackingDisabled(boo);
        }
    }
}
