.class public interface abstract Lcom/youai/IPlatformLoginAndPay;
.super Ljava/lang/Object;
.source "IPlatformLoginAndPay.java"


# virtual methods
.method public abstract callAccountManage()V
.end method

.method public abstract callBindTryToOkUser()V
.end method

.method public abstract callCheckVersionUpate()V
.end method

.method public abstract callLogin()V
.end method

.method public abstract callLogout()V
.end method

.method public abstract callPayRecharge(Lcom/youai/PlatformAndGameInfo$PayInfo;)I
.end method

.method public abstract callPlatformFeedback()V
.end method

.method public abstract callPlatformGameBBS()V
.end method

.method public abstract callPlatformSupportThirdShare(Lcom/youai/PlatformAndGameInfo$ShareInfo;)V
.end method

.method public abstract callToolBar(Z)V
.end method

.method public abstract generateNewOrderSerial()Ljava/lang/String;
.end method

.method public abstract getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;
.end method

.method public abstract getLoginInfo()Lcom/youai/PlatformAndGameInfo$LoginInfo;
.end method

.method public abstract getPlatformLogoLayoutId()I
.end method

.method public abstract init(Lcom/youai/IGameActivity;Lcom/youai/PlatformAndGameInfo$GameInfo;)V
.end method

.method public abstract isSupportInSDKGameUpdate()I
.end method

.method public abstract isTryUser()Z
.end method

.method public abstract notifyLoginResult(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V
.end method

.method public abstract notifyPayRechargeRequestResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V
.end method

.method public abstract notifyVersionUpateInfo(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V
.end method

.method public abstract onGameExit()V
.end method

.method public abstract onGamePause()V
.end method

.method public abstract onGameResume()V
.end method

.method public abstract onLoginGame()V
.end method

.method public abstract receiveGameSvrBindTryToOkUserResult(I)V
.end method

.method public abstract setGameAppStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;)V
.end method

.method public abstract setGameUpdateStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;)V
.end method

.method public abstract setPlatformSDKStateCallback(Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;)V
.end method

.method public abstract unInit()V
.end method
