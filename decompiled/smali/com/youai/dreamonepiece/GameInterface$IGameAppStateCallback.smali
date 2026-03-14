.class public interface abstract Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;
.super Ljava/lang/Object;
.source "GameInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IGameAppStateCallback"
.end annotation


# virtual methods
.method public abstract notifyEnterGameAppState(Landroid/os/Handler;)V
.end method

.method public abstract notifyLoginResut(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V
.end method

.method public abstract notifyOnTempShortPause()V
.end method

.method public abstract notifyPayRechargeResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V
.end method

.method public abstract notifyTryUserRegistSuccess()V
.end method

.method public abstract requestBindTryToOkUser(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract showWaitingViewImp(ZILjava/lang/String;)V
.end method
