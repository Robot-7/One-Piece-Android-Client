package com.youai.sdks.beans;

import com.tencent.stat.common.StatConstants;
import com.youai.sdks.beans.PlatformContacts;

/* JADX INFO: loaded from: classes.dex */
public class PlatformInfo {
    public int Rid;
    public Class<?> cls;
    public int cpID;
    public boolean isDebug;
    public int platform;
    public PlatformContacts.ScreenOrientation screenOrientation;
    public int serviceId;
    public int svrID;
    public String appkey = StatConstants.MTA_COOPERATION_TAG;
    public String appSign = StatConstants.MTA_COOPERATION_TAG;
    public String appID = StatConstants.MTA_COOPERATION_TAG;
    public String gameID = StatConstants.MTA_COOPERATION_TAG;
    public String gameName = StatConstants.MTA_COOPERATION_TAG;
    public String payUrl = StatConstants.MTA_COOPERATION_TAG;
    public String BBSUrl = StatConstants.MTA_COOPERATION_TAG;
    public String appsecret = StatConstants.MTA_COOPERATION_TAG;
    public String payidstr = StatConstants.MTA_COOPERATION_TAG;
    public String companyName = StatConstants.MTA_COOPERATION_TAG;
    public String publicstr = StatConstants.MTA_COOPERATION_TAG;
    public String privatestr = StatConstants.MTA_COOPERATION_TAG;
    public String payaddr = StatConstants.MTA_COOPERATION_TAG;
    public String enShortName = StatConstants.MTA_COOPERATION_TAG;
    public String platformName = StatConstants.MTA_COOPERATION_TAG;
    public String loginUrl = StatConstants.MTA_COOPERATION_TAG;
    public String publicKey = StatConstants.MTA_COOPERATION_TAG;

    public String toString() {
        return "platformInfo = [ isDebug " + this.isDebug + " appkey " + this.appkey + " appSign " + this.appSign + " appID " + this.appID + " gameName " + this.gameName + " ]";
    }
}
