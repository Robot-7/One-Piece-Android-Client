.class public Lcom/youai/dreamonepiece/YouaiUpdateState;
.super Ljava/lang/Object;
.source "YouaiUpdateState.java"

# interfaces
.implements Lcom/youai/IGameActivityState;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mCallback:Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private mStateMgr:Lcom/youai/IStateManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-class v0, Lcom/youai/dreamonepiece/YouaiUpdateState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiUpdateState;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;)V
    .locals 0
    .param p1, "pStateMgr"    # Lcom/youai/IStateManager;
    .param p2, "pGameActivity"    # Lcom/youai/IGameActivity;
    .param p3, "pCallback"    # Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mStateMgr:Lcom/youai/IStateManager;

    .line 35
    iput-object p2, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 36
    iput-object p3, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;

    .line 37
    return-void
.end method


# virtual methods
.method public enter()V
    .locals 2

    .prologue
    .line 15
    sget-object v0, Lcom/youai/dreamonepiece/YouaiUpdateState;->TAG:Ljava/lang/String;

    const-string v1, "enter YouaiUpdateState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mStateMgr:Lcom/youai/IStateManager;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/youai/IStateManager;->changeState(I)V

    .line 18
    return-void
.end method

.method public exit()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mStateMgr:Lcom/youai/IStateManager;

    .line 23
    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 24
    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiUpdateState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;

    .line 26
    sget-object v0, Lcom/youai/dreamonepiece/YouaiUpdateState;->TAG:Ljava/lang/String;

    const-string v1, "exit YouaiUpdateState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    return-void
.end method
