.class public Lcom/youai/dreamonepiece/GameContextState;
.super Ljava/lang/Object;
.source "GameContextState.java"

# interfaces
.implements Lcom/youai/IGameActivityState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private mHandler:Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;

.field private mStateMgr:Lcom/youai/IStateManager;

.field private mText:Landroid/widget/TextView;

.field private mUpdate:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/youai/dreamonepiece/GameContextState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameContextState;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;)V
    .locals 2
    .param p1, "pStateMgr"    # Lcom/youai/IStateManager;
    .param p2, "pGameActivity"    # Lcom/youai/IGameActivity;
    .param p3, "pCallback"    # Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;-><init>(Lcom/youai/dreamonepiece/GameContextState;Lcom/youai/dreamonepiece/GameContextState$1;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mHandler:Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;

    .line 121
    new-instance v0, Lcom/youai/dreamonepiece/GameContextState$1;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/GameContextState$1;-><init>(Lcom/youai/dreamonepiece/GameContextState;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mUpdate:Ljava/lang/Runnable;

    .line 82
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameContextState;->mStateMgr:Lcom/youai/IStateManager;

    .line 83
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 84
    iput-object p3, p0, Lcom/youai/dreamonepiece/GameContextState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;

    .line 85
    return-void
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/GameContextState;)Lcom/youai/IStateManager;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameContextState;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mStateMgr:Lcom/youai/IStateManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/GameContextState;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameContextState;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/GameContextState;)Lcom/youai/IGameActivity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameContextState;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    return-object v0
.end method


# virtual methods
.method public enter()V
    .locals 6

    .prologue
    .line 24
    sget-object v2, Lcom/youai/dreamonepiece/GameContextState;->TAG:Ljava/lang/String;

    const-string v3, "enter GameContextState"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    const/high16 v3, 0x7f030000

    invoke-virtual {v2, v3}, Lcom/youai/dreamonepiece/GameActivity;->setContentView(I)V

    .line 28
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    const v3, 0x7f090007

    invoke-virtual {v2, v3}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mText:Landroid/widget/TextView;

    .line 30
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mText:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 31
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameContextState;->mUpdate:Ljava/lang/Runnable;

    const-wide/16 v4, 0x12c

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 43
    :cond_0
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    const v3, 0x7f090003

    invoke-virtual {v2, v3}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    .line 45
    .local v1, "glView":Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    const v3, 0x7f090002

    invoke-virtual {v2, v3}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxEditText;

    .line 54
    .local v0, "editText":Lorg/cocos2dx/lib/Cocos2dxEditText;
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameContextState;->mHandler:Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;

    invoke-interface {v2, v1, v0, v3}, Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;->initCocos2dxAndroidContext(Landroid/view/View;Landroid/view/View;Landroid/os/Handler;)V

    .line 57
    return-void
.end method

.method public exit()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 61
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameContextState;->mUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 62
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mUpdate:Ljava/lang/Runnable;

    .line 63
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState;->mText:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 65
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mText:Landroid/widget/TextView;

    .line 68
    :cond_0
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mStateMgr:Lcom/youai/IStateManager;

    .line 69
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 70
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;

    .line 72
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameContextState;->mHandler:Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;

    .line 74
    sget-object v0, Lcom/youai/dreamonepiece/GameContextState;->TAG:Ljava/lang/String;

    const-string v1, "exit GameContextState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    return-void
.end method
