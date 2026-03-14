.class public Lcom/youai/dreamonepiece/GameAppState;
.super Ljava/lang/Object;
.source "GameAppState.java"

# interfaces
.implements Lcom/youai/IGameActivityState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;,
        Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;
    }
.end annotation


# static fields
.field public static final HANDLER_MSG_TO_MAINTHREAD_CallNd91_TOOLBAR:I = 0x1e

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallNd91_TOOLBAR_KEY:Ljava/lang/String; = "ToolBar"

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private mOurTouchDelegate:Landroid/view/TouchDelegate;

.field private mOwnTouchDelegate:Landroid/view/TouchDelegate;

.field private mPlatform:Lcom/youai/IPlatformLoginAndPay;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mStateMgr:Lcom/youai/IStateManager;

.field private mWaitingText:Landroid/widget/TextView;

.field private mWaitingView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/youai/dreamonepiece/GameAppState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameAppState;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;)V
    .locals 1
    .param p1, "pStateMgr"    # Lcom/youai/IStateManager;
    .param p2, "pGameActivity"    # Lcom/youai/IGameActivity;
    .param p3, "pCallback"    # Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAppState;->mStateMgr:Lcom/youai/IStateManager;

    .line 92
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameAppState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 93
    iput-object p3, p0, Lcom/youai/dreamonepiece/GameAppState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    .line 95
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mActivity:Landroid/app/Activity;

    .line 96
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 97
    return-void
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAppState;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAppState;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    return-object v0
.end method

.method static synthetic access$400(Lcom/youai/dreamonepiece/GameAppState;ZILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAppState;
    .param p1, "x1"    # Z
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/youai/dreamonepiece/GameAppState;->showWaitingViewImp(ZILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IGameActivity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAppState;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mGameActivity:Lcom/youai/IGameActivity;

    return-object v0
.end method

.method private showWaitingViewImp(ZILjava/lang/String;)V
    .locals 4
    .param p1, "show"    # Z
    .param p2, "progress"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 278
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 310
    :goto_0
    return-void

    .line 280
    :cond_0
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mOwnTouchDelegate:Landroid/view/TouchDelegate;

    if-nez v1, :cond_1

    .line 281
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTouchDelegate()Landroid/view/TouchDelegate;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mOwnTouchDelegate:Landroid/view/TouchDelegate;

    .line 282
    :cond_1
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mOurTouchDelegate:Landroid/view/TouchDelegate;

    if-nez v1, :cond_2

    .line 283
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 284
    .local v0, "rt":Landroid/graphics/Rect;
    iput v3, v0, Landroid/graphics/Rect;->left:I

    iput v3, v0, Landroid/graphics/Rect;->top:I

    .line 285
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 286
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 288
    new-instance v1, Lcom/youai/dreamonepiece/GameAppState$1;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    invoke-direct {v1, p0, v0, v2}, Lcom/youai/dreamonepiece/GameAppState$1;-><init>(Lcom/youai/dreamonepiece/GameAppState;Landroid/graphics/Rect;Landroid/view/View;)V

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mOurTouchDelegate:Landroid/view/TouchDelegate;

    .line 297
    .end local v0    # "rt":Landroid/graphics/Rect;
    :cond_2
    if-eqz p1, :cond_3

    .line 299
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 300
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingText:Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 302
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameAppState;->mOurTouchDelegate:Landroid/view/TouchDelegate;

    invoke-virtual {v1, v2}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    goto :goto_0

    .line 305
    :cond_3
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 306
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingText:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameAppState;->mOwnTouchDelegate:Landroid/view/TouchDelegate;

    invoke-virtual {v1, v2}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    goto :goto_0
.end method


# virtual methods
.method public enter()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 40
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    .line 41
    invoke-static {v3}, Lcom/youai/dreamonepiece/GameActivity;->setCanPressBack(Z)V

    .line 42
    sget-object v1, Lcom/youai/dreamonepiece/GameAppState;->TAG:Ljava/lang/String;

    const-string v2, "enter GameAppState"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mActivity:Landroid/app/Activity;

    const v2, 0x7f090008

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    .line 47
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    const v2, 0x400f0f0f

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 49
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mActivity:Landroid/app/Activity;

    const v2, 0x7f090009

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mProgress:Landroid/widget/ProgressBar;

    .line 51
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mActivity:Landroid/app/Activity;

    const v2, 0x7f09000a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingText:Landroid/widget/TextView;

    .line 52
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingText:Landroid/widget/TextView;

    const v2, -0x20203

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mActivity:Landroid/app/Activity;

    const v2, 0x7f090004

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 55
    .local v0, "logoImg":Landroid/view/View;
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    const/4 v0, 0x0

    .line 58
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    new-instance v2, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;

    invoke-direct {v2, p0, v4}, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;-><init>(Lcom/youai/dreamonepiece/GameAppState;Lcom/youai/dreamonepiece/GameAppState$1;)V

    invoke-interface {v1, v2}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyEnterGameAppState(Landroid/os/Handler;)V

    .line 60
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    new-instance v2, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;

    invoke-direct {v2, p0, v4}, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;-><init>(Lcom/youai/dreamonepiece/GameAppState;Lcom/youai/dreamonepiece/GameAppState$1;)V

    invoke-interface {v1, v2}, Lcom/youai/IPlatformLoginAndPay;->setGameAppStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;)V

    .line 62
    const/4 v1, -0x1

    const-string v2, ""

    invoke-direct {p0, v3, v1, v2}, Lcom/youai/dreamonepiece/GameAppState;->showWaitingViewImp(ZILjava/lang/String;)V

    .line 63
    return-void
.end method

.method public exit()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 68
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mStateMgr:Lcom/youai/IStateManager;

    .line 69
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 70
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    .line 72
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mActivity:Landroid/app/Activity;

    .line 73
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0, v1}, Lcom/youai/IPlatformLoginAndPay;->setGameAppStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;)V

    .line 74
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 76
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingView:Landroid/view/View;

    .line 77
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mProgress:Landroid/widget/ProgressBar;

    .line 78
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mWaitingText:Landroid/widget/TextView;

    .line 80
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mOwnTouchDelegate:Landroid/view/TouchDelegate;

    .line 81
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameAppState;->mOurTouchDelegate:Landroid/view/TouchDelegate;

    .line 83
    sget-object v0, Lcom/youai/dreamonepiece/GameAppState;->TAG:Ljava/lang/String;

    const-string v1, "exit GameAppState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    return-void
.end method
