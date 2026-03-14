package com.youai.dreamonepiece;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.igexin.sdk.PushConsts;
import com.igexin.sdk.PushManager;
import com.igexin.sdk.Tag;
import com.tencent.stat.common.StatConstants;
import com.youai.PlatformAndGameInfo;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
public class GexinSdkMsgReceiver extends BroadcastReceiver {
    public static String stStrGexinClientId = null;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String channelName;
        Bundle bundle = intent.getExtras();
        Log.d("GexinSdkDemo", "onReceive() action=" + bundle.getInt("action"));
        switch (bundle.getInt("action")) {
            case 10001:
                byte[] payload = bundle.getByteArray("payload");
                String taskid = bundle.getString("taskid");
                String messageid = bundle.getString("messageid");
                PushManager.getInstance().sendFeedbackMessage(context, taskid, messageid, PushConsts.MIN_FEEDBACK_ACTION);
                if (payload != null) {
                    String data = new String(payload);
                    Log.d("GexinSdkDemo", "Got Payload:" + data);
                }
                break;
            case 10002:
                stStrGexinClientId = bundle.getString("clientid");
                if (GameActivity.mContext != null && GameActivity.mGameApp != null) {
                    Context ctx = GameActivity.mContext;
                    PlatformAndGameInfo.GameInfo gameInfo = GameActivity.mGameApp.getGameInfo();
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
                    tags[0].setName(gameInfo.platform_type_str);
                    Log.d("GeXinTag0_platform:\t", gameInfo.platform_type_str);
                    tags[1].setName(channelName);
                    Log.d("GeXinTag1_channelName:\t", channelName);
                    Calendar now = Calendar.getInstance();
                    TimeZone timeZone = now.getTimeZone();
                    tags[2].setName(timeZone.getDisplayName(false, 0, Locale.US));
                    Log.d("GeXinTag2_timeZone:\t", timeZone.getDisplayName(false, 0, Locale.US));
                    String manufacturer = Build.MANUFACTURER.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-");
                    String model = Build.MODEL.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-");
                    String sdkversion = StatConstants.MTA_COOPERATION_TAG + Build.VERSION.SDK_INT;
                    tags[3].setName(manufacturer);
                    Log.d("GeXinTag3_manufacturer:\t", manufacturer);
                    tags[4].setName(model);
                    Log.d("GeXinTag4_model:\t", model);
                    Tag[] tags = {new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag()};
                    tags[5].setName(sdkversion);
                    Log.d("GeXinTag5_sdkversion:\t", sdkversion);
                    break;
                }
                break;
            case PushConsts.THIRDPART_FEEDBACK /* 10006 */:
                String appid = bundle.getString("appid");
                String taskid2 = bundle.getString("taskid");
                String actionid = bundle.getString("actionid");
                String result2 = bundle.getString("result");
                long timestamp = bundle.getLong("timestamp");
                Log.d("GexinSdkDemo", "appid:" + appid);
                Log.d("GexinSdkDemo", "taskid:" + taskid2);
                Log.d("GexinSdkDemo", "actionid:" + actionid);
                Log.d("GexinSdkDemo", "result:" + result2);
                Log.d("GexinSdkDemo", "timestamp:" + timestamp);
                break;
        }
    }
}
