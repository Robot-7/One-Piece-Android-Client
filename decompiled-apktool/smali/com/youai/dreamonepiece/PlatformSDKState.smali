.class public Lcom/youai/dreamonepiece/PlatformSDKState;
.super Ljava/lang/Object;
.source "PlatformSDKState.java"

# interfaces
.implements Lcom/youai/IGameActivityState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/PlatformSDKState$1;,
        Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;,
        Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;
    }
.end annotation


# static fields
.field private static final PlatformSDKState_MainThreadMsg_DoInitAfterSetView:I

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mCallback:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

.field private mHandler:Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;

.field private mPlatform:Lcom/youai/IPlatformLoginAndPay;

.field private mStateMgr:Lcom/youai/IStateManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/PlatformSDKState;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;)V
    .locals 0
    .param p1, "pStateMgr"    # Lcom/youai/IStateManager;
    .param p2, "pGameActivity"    # Lcom/youai/IGameActivity;
    .param p3, "pCallback"    # Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mStateMgr:Lcom/youai/IStateManager;

    .line 69
    iput-object p2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 70
    iput-object p3, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    .line 71
    return-void
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/IGameActivity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    return-object v0
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/PlatformAndGameInfo$GameInfo;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    return-object v0
.end method

.method static synthetic access$400(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/IPlatformLoginAndPay;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    return-object v0
.end method

.method static synthetic access$600(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/IStateManager;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mStateMgr:Lcom/youai/IStateManager;

    return-object v0
.end method

.method private createPlatformSDKByType(I)Lcom/youai/IPlatformLoginAndPay;
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 77
    invoke-static {}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getInstance()Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    move-result-object v0

    .line 78
    .local v0, "platform":Lcom/youai/IPlatformLoginAndPay;
    return-object v0
.end method


# virtual methods
.method public enter()V
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 20
    sget-object v1, Lcom/youai/dreamonepiece/PlatformSDKState;->TAG:Ljava/lang/String;

    const-string v2, "enter PlatformSDKState"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    .line 24
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v1, v1, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    invoke-direct {p0, v1}, Lcom/youai/dreamonepiece/PlatformSDKState;->createPlatformSDKByType(I)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 26
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    iget-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v1, v2}, Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;->initPlatformSDK(Lcom/youai/IPlatformLoginAndPay;)V

    .line 28
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    new-instance v2, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;

    invoke-direct {v2, p0, v3}, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;-><init>(Lcom/youai/dreamonepiece/PlatformSDKState;Lcom/youai/dreamonepiece/PlatformSDKState$1;)V

    invoke-interface {v1, v2}, Lcom/youai/IPlatformLoginAndPay;->setPlatformSDKStateCallback(Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;)V

    .line 30
    new-instance v1, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;

    invoke-direct {v1, p0, v3}, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;-><init>(Lcom/youai/dreamonepiece/PlatformSDKState;Lcom/youai/dreamonepiece/PlatformSDKState$1;)V

    iput-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mHandler:Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;

    .line 32
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v1}, Lcom/youai/IPlatformLoginAndPay;->getPlatformLogoLayoutId()I

    move-result v0

    .line 33
    .local v0, "layoutId":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 34
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    iget-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    iget-object v3, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    invoke-interface {v1, v2, v3}, Lcom/youai/IPlatformLoginAndPay;->init(Lcom/youai/IGameActivity;Lcom/youai/PlatformAndGameInfo$GameInfo;)V

    .line 44
    :goto_0
    return-void

    .line 35
    :cond_0
    if-nez v0, :cond_1

    .line 36
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    iget-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    iget-object v3, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    invoke-interface {v1, v2, v3}, Lcom/youai/IPlatformLoginAndPay;->init(Lcom/youai/IGameActivity;Lcom/youai/PlatformAndGameInfo$GameInfo;)V

    goto :goto_0

    .line 38
    :cond_1
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/youai/dreamonepiece/GameActivity;->setContentView(I)V

    .line 40
    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mHandler:Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;

    const/4 v2, 0x0

    const-wide/16 v3, 0x5dc

    invoke-virtual {v1, v2, v3, v4}, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method public exit()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 49
    iput-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mStateMgr:Lcom/youai/IStateManager;

    .line 50
    iput-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 51
    iput-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    .line 53
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0, v2}, Lcom/youai/IPlatformLoginAndPay;->setPlatformSDKStateCallback(Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;)V

    .line 54
    iput-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 56
    iput-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    .line 57
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mHandler:Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;->removeMessages(I)V

    .line 58
    iput-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState;->mHandler:Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;

    .line 60
    sget-object v0, Lcom/youai/dreamonepiece/PlatformSDKState;->TAG:Ljava/lang/String;

    const-string v1, "exit PlatformSDKState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    return-void
.end method
