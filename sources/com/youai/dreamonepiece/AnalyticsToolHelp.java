package com.youai.dreamonepiece;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import com.flurry.android.FlurryAgent;
import com.tencent.stat.StatConfig;
import com.tencent.stat.StatReportStrategy;
import com.tencent.stat.StatService;
import com.youai.PlatformAndGameInfo;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class AnalyticsToolHelp {
    private static final String AppId_Tencent = "A1HGLES644LU";
    private static final boolean isStatisticsOpen = true;
    private static Context activityCtx = null;
    private static String appId = null;
    private static String userId = null;
    private static final boolean isDebugTencent = false;
    private static boolean bpair = isDebugTencent;
    private static HashMap<String, String> paramsMap = new HashMap<>();

    public static void onCreate(Context ctx, PlatformAndGameInfo.GameInfo gameInfo) {
        String channelName;
        activityCtx = ctx;
        FlurryAgent.setCaptureUncaughtExceptions(true);
        ApplicationInfo appInfo = null;
        try {
            appInfo = ctx.getPackageManager().getApplicationInfo(ctx.getPackageName(), 128);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        if (appInfo != null && appInfo.metaData != null && appInfo.metaData.getInt("youai_channel") != 0) {
            channelName = gameInfo.platform_type_str + "_" + appInfo.metaData.getInt("youai_channel");
        } else {
            channelName = gameInfo.platform_type_str;
        }
        StatConfig.setAppKey(AppId_Tencent);
        StatConfig.setInstallChannel(channelName);
        StatConfig.setDebugEnable(isDebugTencent);
        StatConfig.setAutoExceptionCaught(true);
        StatConfig.setStatSendStrategy(StatReportStrategy.APP_LAUNCH);
    }

    public static void onStart() {
        if (!bpair && appId != null && !appId.isEmpty()) {
            bpair = true;
            FlurryAgent.onStartSession(activityCtx, appId);
        }
    }

    public static void onResume() {
        StatService.onResume(activityCtx);
    }

    public static void onPause() {
        StatService.onPause(activityCtx);
    }

    public static void onStop() {
        if (bpair && appId != null && !appId.isEmpty()) {
            bpair = isDebugTencent;
            FlurryAgent.onEndSession(activityCtx);
        }
    }

    public static void initAnalytics(String appid) {
        appId = "TK2K9PJM8XDGXWD9BPM5";
        onStart();
    }

    public static void initAnalyticsUserID(String userid) {
        userId = userid;
        FlurryAgent.setUserId(userid);
    }

    public static void analyticsLogEvent(String event) {
        StatService.trackCustomEvent(activityCtx, event, event);
        if (bpair && appId != null && userId != null && !appId.isEmpty() && !userId.isEmpty() && !event.isEmpty()) {
            FlurryAgent.logEvent(event);
        }
    }

    public static void clearParamsMap() {
        paramsMap.clear();
    }

    public static void addParamsMapOnePair(String key, String value) {
        paramsMap.put(key, value);
    }

    public static void analyticsLogMapParamsEvent(String event, boolean timed) {
        if (bpair) {
            paramsMap.put("userId", userId);
            if (appId != null && userId != null && !appId.isEmpty() && !userId.isEmpty() && !event.isEmpty()) {
                FlurryAgent.logEvent(event, paramsMap, timed);
            }
        }
    }

    public static void analyticsLogEndTimeEvent(String event) {
        if (bpair && appId != null && userId != null && !appId.isEmpty() && !userId.isEmpty() && !event.isEmpty()) {
            FlurryAgent.endTimedEvent(event);
        }
    }
}
