.class public Lcom/youai/dreamonepiece/GameUpdateState;
.super Ljava/lang/Object;
.source "GameUpdateState.java"

# interfaces
.implements Lcom/youai/IGameActivityState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameUpdateState$1;,
        Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private mPlatform:Lcom/youai/IPlatformLoginAndPay;

.field private mStateMgr:Lcom/youai/IStateManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/youai/dreamonepiece/GameUpdateState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameUpdateState;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;)V
    .locals 1
    .param p1, "pStateMgr"    # Lcom/youai/IStateManager;
    .param p2, "pGameActivity"    # Lcom/youai/IGameActivity;
    .param p3, "pCallback"    # Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mStateMgr:Lcom/youai/IStateManager;

    .line 56
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 57
    iput-object p3, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    .line 59
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 60
    return-void
.end method

.method static synthetic access$100(Lcom/youai/dreamonepiece/GameUpdateState;)Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameUpdateState;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    return-object v0
.end method


# virtual methods
.method public enter()V
    .locals 5

    .prologue
    .line 18
    sget-object v2, Lcom/youai/dreamonepiece/GameUpdateState;->TAG:Ljava/lang/String;

    const-string v3, "enter GameUpdateState"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v2}, Lcom/youai/IPlatformLoginAndPay;->isSupportInSDKGameUpdate()I

    move-result v0

    .line 21
    .local v0, "supportType":I
    if-nez v0, :cond_0

    .line 22
    new-instance v1, Lcom/youai/PlatformAndGameInfo$VersionInfo;

    invoke-direct {v1}, Lcom/youai/PlatformAndGameInfo$VersionInfo;-><init>()V

    .line 23
    .local v1, "versionInfo":Lcom/youai/PlatformAndGameInfo$VersionInfo;
    const/4 v2, 0x0

    iput v2, v1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    .line 24
    const-string v2, ""

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->download_url:Ljava/lang/String;

    .line 25
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    invoke-interface {v2, v1}, Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;->notifyVersionCheckResult(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V

    .line 34
    .end local v1    # "versionInfo":Lcom/youai/PlatformAndGameInfo$VersionInfo;
    :goto_0
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mStateMgr:Lcom/youai/IStateManager;

    const/4 v3, 0x5

    invoke-interface {v2, v3}, Lcom/youai/IStateManager;->changeState(I)V

    .line 35
    return-void

    .line 27
    :cond_0
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    new-instance v3, Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;-><init>(Lcom/youai/dreamonepiece/GameUpdateState;Lcom/youai/dreamonepiece/GameUpdateState$1;)V

    invoke-interface {v2, v3}, Lcom/youai/IPlatformLoginAndPay;->setGameUpdateStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;)V

    .line 29
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v2}, Lcom/youai/IPlatformLoginAndPay;->callCheckVersionUpate()V

    goto :goto_0
.end method

.method public exit()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mStateMgr:Lcom/youai/IStateManager;

    .line 41
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 45
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 47
    sget-object v0, Lcom/youai/dreamonepiece/GameUpdateState;->TAG:Ljava/lang/String;

    const-string v1, "exit GameUpdateState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    return-void
.end method
