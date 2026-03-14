package com.youai.sdks.platform;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import com.youai.sdks.beans.LoginInfo;
import com.youai.sdks.beans.PayInfo;
import com.youai.sdks.beans.PlatformContacts;
import com.youai.sdks.beans.PlatformInfo;
import com.youai.sdks.beans.ShareInfo;
import com.youai.sdks.beans.YALastLoginHelp;
import com.youai.sdks.callback.YASdkInterface;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public abstract class PlatformBase {
    protected YASdkInterface sdkInterface;
    protected Activity context = null;
    protected JSONObject mUserData = null;
    protected boolean mIsLogined = false;
    protected boolean isEnteredGame = false;
    protected PlatformInfo platformInfo = null;
    protected LoginInfo login_info = null;
    protected PayInfo pay_info = null;

    public abstract void callAccountManage(Activity activity);

    public abstract void callCheckVersionUpate();

    public abstract void callLogin(Activity activity);

    public abstract void callLogout(Activity activity);

    public abstract int callPayRecharge(Activity activity, PayInfo payInfo);

    public abstract int callPlatformFeedback(Activity activity, YALastLoginHelp yALastLoginHelp);

    public abstract void callPlatformGameBBS(Activity activity, String str);

    public abstract void callPlatformSupportThirdShare(Activity activity, ShareInfo shareInfo);

    public abstract PlatformInfo getPlatformInfo();

    public abstract boolean isLogin();

    public abstract int isSupportInSDKGameUpdate();

    public abstract void setDebugMode(boolean z);

    public abstract void setScreenOrientation(PlatformContacts.ScreenOrientation screenOrientation);

    public void init(Activity context, PlatformInfo platformInfo, YASdkInterface sdkInterface) {
        this.context = context;
        this.platformInfo = platformInfo;
        this.sdkInterface = sdkInterface;
        this.login_info = new LoginInfo();
    }

    public void unInit() {
        this.context = null;
        this.platformInfo = null;
        this.login_info = null;
        this.pay_info = null;
        this.sdkInterface = null;
    }

    public boolean isEnteredGame() {
        return this.isEnteredGame;
    }

    public void setEnteredGame(boolean isEnteredGame, JSONObject jsonData) {
        this.isEnteredGame = isEnteredGame;
        this.mUserData = jsonData;
    }

    public LoginInfo getLoginInfo() {
        return this.login_info;
    }

    public void reserve() {
        this.mIsLogined = false;
        this.isEnteredGame = false;
    }

    public void callToolBar(boolean visible) {
    }

    public boolean isTryUser() {
        return false;
    }

    public void callNewIntent(Intent intent, Handler mhandler, Context mContext) {
    }

    public void callDestroy() {
    }

    public void callDestroy(Activity activity) {
    }

    public void callStart() {
    }

    public void callStart(Activity activity) {
    }

    public void callStop() {
    }

    public void callStop(Activity activity) {
    }

    public void callReStart() {
    }

    public void callReStart(Activity activity) {
    }

    public void callPause(Activity activity) {
    }

    public void callResume(Activity activity) {
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
    }

    public void attachBaseContext(Context base, PlatformInfo platformInfo) {
    }

    public void callCreate(Context base, PlatformInfo platformInfo) {
    }

    public void callCreate(Activity activity, PlatformInfo platformInfo) {
    }

    public void onGameExit() {
    }

    public void onWindowFocusChanged(boolean hasFocus) {
    }
}
