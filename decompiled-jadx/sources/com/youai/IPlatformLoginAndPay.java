package com.youai;

import com.youai.PlatformAndGameInfo;
import com.youai.dreamonepiece.GameInterface;

/* JADX INFO: loaded from: classes.dex */
public interface IPlatformLoginAndPay {
    void callAccountManage();

    void callBindTryToOkUser();

    void callCheckVersionUpate();

    void callLogin();

    void callLogout();

    int callPayRecharge(PlatformAndGameInfo.PayInfo payInfo);

    void callPlatformFeedback();

    void callPlatformGameBBS();

    void callPlatformSupportThirdShare(PlatformAndGameInfo.ShareInfo shareInfo);

    void callToolBar(boolean z);

    String generateNewOrderSerial();

    PlatformAndGameInfo.GameInfo getGameInfo();

    PlatformAndGameInfo.LoginInfo getLoginInfo();

    int getPlatformLogoLayoutId();

    void init(IGameActivity iGameActivity, PlatformAndGameInfo.GameInfo gameInfo);

    int isSupportInSDKGameUpdate();

    boolean isTryUser();

    void notifyLoginResult(PlatformAndGameInfo.LoginInfo loginInfo);

    void notifyPayRechargeRequestResult(PlatformAndGameInfo.PayInfo payInfo);

    void notifyVersionUpateInfo(PlatformAndGameInfo.VersionInfo versionInfo);

    void onGameExit();

    void onGamePause();

    void onGameResume();

    void onLoginGame();

    void receiveGameSvrBindTryToOkUserResult(int i);

    void setGameAppStateCallback(GameInterface.IGameAppStateCallback iGameAppStateCallback);

    void setGameUpdateStateCallback(GameInterface.IGameUpdateStateCallback iGameUpdateStateCallback);

    void setPlatformSDKStateCallback(GameInterface.IPlatformSDKStateCallback iPlatformSDKStateCallback);

    void unInit();
}
