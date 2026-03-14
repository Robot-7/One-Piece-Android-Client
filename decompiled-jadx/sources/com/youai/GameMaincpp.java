package com.youai;

import com.tencent.stat.common.StatConstants;
import com.youai.dreamonepiece.platform.pipaw.R;
import com.youai.sdks.beans.PlatformInfo;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class GameMaincpp {
    static String gamePlatformConfig = "{'appid':'421383273655','gid':'71','cpid':'42','private':'987f7af09f4cf1810ee5f695d414446d','enshortname':'pipaw_','platformname':'Android_PiPaw','enPlatform':'36'}";
    public static String enPlatform = StatConstants.MTA_COOPERATION_TAG;

    public static PlatformInfo getPlatformInfoByType(int type) {
        String infoStr = gamePlatformConfig;
        PlatformInfo mGameInfo = new PlatformInfo();
        mGameInfo.Rid = R.drawable.ic_launcher;
        mGameInfo.platform = type;
        mGameInfo.isDebug = false;
        mGameInfo.gameName = "伟大航路";
        try {
            JSONObject dataJsonObj = new JSONObject(infoStr);
            if (dataJsonObj.has("appid")) {
                mGameInfo.appID = dataJsonObj.getString("appid");
            }
            if (dataJsonObj.has("appkey")) {
                mGameInfo.appkey = dataJsonObj.getString("appkey");
            }
            if (dataJsonObj.has("appsecret")) {
                mGameInfo.appsecret = dataJsonObj.getString("appsecret");
            }
            if (dataJsonObj.has("cpid")) {
                mGameInfo.cpID = Integer.parseInt(dataJsonObj.getString("cpid"));
            }
            if (dataJsonObj.has("gid")) {
                mGameInfo.gameID = dataJsonObj.getString("gid");
            }
            if (dataJsonObj.has("svrid")) {
                mGameInfo.svrID = Integer.parseInt(dataJsonObj.getString("svrid"));
            }
            if (dataJsonObj.has("payid")) {
                mGameInfo.payidstr = dataJsonObj.getString("payid");
            }
            if (dataJsonObj.has("private")) {
                mGameInfo.privatestr = dataJsonObj.getString("private");
            }
            if (dataJsonObj.has("public")) {
                mGameInfo.publicstr = dataJsonObj.getString("public");
            }
            if (dataJsonObj.has("payaddr")) {
                mGameInfo.payaddr = dataJsonObj.getString("payaddr");
            }
            if (dataJsonObj.has("enshortname")) {
                mGameInfo.enShortName = dataJsonObj.getString("enshortname");
            }
            if (dataJsonObj.has("platformname")) {
                mGameInfo.platformName = dataJsonObj.getString("platformname");
            }
            if (dataJsonObj.has("bbsurl")) {
                mGameInfo.BBSUrl = dataJsonObj.getString("bbsurl");
            }
            if (dataJsonObj.has("enPlatform")) {
                enPlatform = dataJsonObj.getString("enPlatform");
            }
            if (dataJsonObj.has("companyName")) {
                mGameInfo.companyName = "北京有爱互动科技有限公司";
            }
            if (dataJsonObj.has("gameName")) {
                mGameInfo.gameName = dataJsonObj.getString("gameName");
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return mGameInfo;
    }
}
