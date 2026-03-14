package com.youai.dreamonepiece;

import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class YouaiConfig {
    public static long timestamp;
    public static String urlroot = "http://pc.com4loves.com:6520/";
    public static String urlrootDebug = "http://223.203.216.6:8261/";
    public static String urlrootRelease = "http://pc.com4loves.com:6520/";
    public static String getPlayerList = urlroot + "gameplayer/getplayerlist";
    public static String pushforclient = urlroot + "gameplayer/pushforclient";
    public static String UrlFeedBack = urlroot + "feedback/querydetailbygameinfo";
    public static String md5key = "-com4loves";
    public static boolean encryptData = true;
    public static String error_net = "网络错误";
    public static String WX_APP_ID = StatConstants.MTA_COOPERATION_TAG;

    public static class ShowMsgActivity {
        public static final String BAThumbData = "showmsg_thumb_data";
        public static final String SMessage = "showmsg_message";
        public static final String STitle = "showmsg_title";
    }

    public enum THIRD_PLATFORM {
        SINA,
        RENREN,
        DOUBAN,
        QQ,
        TAOBAO
    }

    public static void reCreate() {
        getPlayerList = urlroot + "gameplayer/getplayerlist";
        pushforclient = urlroot + "gameplayer/pushforclient";
        UrlFeedBack = urlroot + "feedback/querydetailbygameinfo";
    }
}
