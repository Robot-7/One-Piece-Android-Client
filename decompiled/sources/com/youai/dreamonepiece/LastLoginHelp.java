package com.youai.dreamonepiece;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import com.igexin.sdk.PushManager;
import com.igexin.sdk.Tag;
import com.tencent.stat.common.StatConstants;
import com.youai.PlatformAndGameInfo;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
public class LastLoginHelp {
    static GameActivity mGameActivity;
    public static String mGameid;
    public static String mPlatform;
    public static int mPlayerId;
    public static String mPlayerName;
    public static int mPlayervl;
    public static String mPuid;
    public static int mServerID;
    public static int mVipLvl;
    public static int mlv;

    public static void setActivity(GameActivity pGameActivity) {
        mGameActivity = pGameActivity;
        YouaiLastLoginHelp.setYouaiLastLoginHelp(mGameActivity);
    }

    public static void updateServerInfo(int serverID, String playerName, int playerID, int lvl, int vipLvl, int coin1, int coin2, boolean pushSvr) throws Throwable {
        String channelName;
        mServerID = serverID;
        mPlayerId = playerID;
        mPlayerName = playerName;
        mVipLvl = vipLvl;
        mPlayervl = vipLvl;
        mlv = lvl;
        YouaiServerInfo _youaiServerInfo = new YouaiServerInfo();
        if (mPlatform == null) {
            mPlatform = mGameActivity.getClientChannel();
        }
        _youaiServerInfo.setPlatform(mPlatform);
        _youaiServerInfo.setPlayerName(playerName);
        _youaiServerInfo.setPlayerId(playerID);
        _youaiServerInfo.setVipLv1(vipLvl);
        _youaiServerInfo.setPlayerLv1(lvl);
        _youaiServerInfo.setGameCoin1(coin1);
        _youaiServerInfo.setGameCoin2(coin2);
        _youaiServerInfo.setServerId(serverID);
        mGameActivity.getMainThreadHandler().post(new Runnable() { // from class: com.youai.dreamonepiece.LastLoginHelp.1
            @Override // java.lang.Runnable
            public void run() {
                LastLoginHelp.mGameActivity.getPlatformSDK().onLoginGame();
            }
        });
        if (GexinSdkMsgReceiver.stStrGexinClientId != null && !GexinSdkMsgReceiver.stStrGexinClientId.isEmpty() && mPlatform != null && !mPlatform.isEmpty() && mPuid != null && !mPuid.isEmpty() && playerName != null && !playerName.isEmpty()) {
            PlatformAndGameInfo.GameInfo gameInfo = mGameActivity.getGameInfo();
            Context ctx = GameActivity.mContext;
            StringBuffer strTags = new StringBuffer();
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
            strTags.append(gameInfo.platform_type_str + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag0_platform:\t", gameInfo.platform_type_str);
            tags[1].setName(channelName);
            strTags.append(channelName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag1_channelName:\t", channelName);
            Calendar now = Calendar.getInstance();
            TimeZone timeZone = now.getTimeZone();
            tags[2].setName(timeZone.getDisplayName(false, 0, Locale.US));
            strTags.append(timeZone.getDisplayName(false, 0, Locale.US) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag2_timeZone:\t", timeZone.getDisplayName(false, 0, Locale.US));
            String manufacturer = Build.MANUFACTURER.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-");
            String model = Build.MODEL.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-");
            String sdkversion = StatConstants.MTA_COOPERATION_TAG + Build.VERSION.SDK_INT;
            tags[3].setName(manufacturer);
            strTags.append(manufacturer + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag3_manufacturer:\t", manufacturer);
            tags[4].setName(model);
            strTags.append(model + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag4_model:\t", model);
            tags[5].setName(manufacturer + "-" + model);
            strTags.append(manufacturer + "-" + model + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag5_manufacturer-model:\t", manufacturer + "-" + model);
            tags[6].setName("sdklvl-" + sdkversion);
            strTags.append("sdklvl-" + sdkversion + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag6_sdklvl:\t", "sdklvl-" + sdkversion);
            tags[7].setName("android-" + gameInfo.platform_type);
            strTags.append("android-" + gameInfo.platform_type + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag7_android:\t", "android-" + gameInfo.platform_type);
            tags[8].setName(StatConstants.MTA_COOPERATION_TAG + gameInfo.platform_type + "-" + serverID + "-" + playerID);
            strTags.append(StatConstants.MTA_COOPERATION_TAG + gameInfo.platform_type + "-" + serverID + "-" + playerID + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag8_platformidnum-serverID-playerID:\t", StatConstants.MTA_COOPERATION_TAG + gameInfo.platform_type + "-" + serverID + "-" + playerID);
            tags[9].setName(StatConstants.MTA_COOPERATION_TAG + gameInfo.platform_type + "-" + serverID + "-" + playerName);
            strTags.append(StatConstants.MTA_COOPERATION_TAG + gameInfo.platform_type + "-" + serverID + "-" + playerName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag9_platformidnum-serverID-playerName:\t", StatConstants.MTA_COOPERATION_TAG + gameInfo.platform_type + "-" + serverID + "-" + playerName);
            tags[10].setName(mPuid + "-" + serverID + "-" + playerID);
            strTags.append(mPuid + "-" + serverID + "-" + playerID + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag10_puid-serverID-playerID:\t", mPuid + "-" + serverID + "-" + playerID);
            tags[11].setName(mPuid + "-" + serverID + "-" + playerName);
            strTags.append(mPuid + "-" + serverID + "-" + playerName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag11_puid-serverID-playerName:\t", mPuid + "-" + serverID + "-" + playerName);
            tags[12].setName(mPuid);
            strTags.append(mPuid + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag12_puid:\t", mPuid);
            tags[13].setName("lvl-" + lvl);
            strTags.append("lvl-" + lvl + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag13_lvl-lvlnum:\t", "lvl-" + lvl);
            tags[14].setName("viplvl-" + vipLvl);
            strTags.append("viplvl-" + vipLvl + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag14_viplvl-viplvlnum:\t", "viplvl-" + vipLvl);
            Tag[] tags = {new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag(), new Tag()};
            tags[15].setName(mPuid + "-" + serverID);
            strTags.append(mPuid + "-" + serverID + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            Log.d("GeXinTag15_puid-serverID:\t", mPuid + "-" + serverID);
            int ret = PushManager.getInstance().setTag(GameActivity.mContext, tags);
            Log.d("GeXinSetTag2 ret code:\t", StatConstants.MTA_COOPERATION_TAG + ret);
            Log.e("GeXinTags:\t", strTags.toString());
            YouaiLastLoginHelp.setGexingClientId(GexinSdkMsgReceiver.stStrGexinClientId);
            YouaiLastLoginHelp.setGexingTags(strTags.toString());
        }
        YouaiLastLoginHelp.updateServerInfo(serverID, _youaiServerInfo, pushSvr);
    }

    public static void refreshServerInfo(String gameid, String puid, boolean getSvr) {
        mGameid = gameid;
        mPuid = puid;
        YouaiServerInfo _youaiServerInfo = new YouaiServerInfo();
        _youaiServerInfo.setPlatform(mGameActivity.getClientChannel());
        YouaiLastLoginHelp.refreshServerInfo(gameid, puid, _youaiServerInfo, getSvr);
    }

    public static int getServerInfoCount() {
        return YouaiLastLoginHelp.getServerInfoCount();
    }

    public static int getServerUserByIndex(int index) {
        return YouaiLastLoginHelp.getServerUserByIndex(index);
    }
}
