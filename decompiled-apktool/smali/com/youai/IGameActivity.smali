.class public interface abstract Lcom/youai/IGameActivity;
.super Ljava/lang/Object;
.source "IGameActivity.java"


# virtual methods
.method public abstract getActivity()Lcom/youai/dreamonepiece/GameActivity;
.end method

.method public abstract getAppFilesCachePath()Ljava/lang/String;
.end method

.method public abstract getAppFilesResourcesPath()Ljava/lang/String;
.end method

.method public abstract getAppFilesRootPath()Ljava/lang/String;
.end method

.method public abstract getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;
.end method

.method public abstract getMainHandler()Landroid/os/Handler;
.end method

.method public abstract getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;
.end method

.method public abstract requestDestroy()V
.end method

.method public abstract showToastMsg(Ljava/lang/String;)V
.end method
