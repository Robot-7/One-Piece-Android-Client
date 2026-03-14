.class public Lcom/youai/dreamonepiece/GameStateManager;
.super Ljava/lang/Object;
.source "GameStateManager.java"

# interfaces
.implements Lcom/youai/IStateManager;


# instance fields
.field private mCurrentStateID:I

.field private mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

.field private mStates:[Lcom/youai/IGameActivityState;


# direct methods
.method public constructor <init>(ILcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;)V
    .locals 2
    .param p1, "count"    # I
    .param p2, "pGameActivity"    # Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    .line 83
    const/4 v0, 0x0

    iput v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mCurrentStateID:I

    .line 87
    iput-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    .line 38
    new-array v0, p1, [Lcom/youai/IGameActivityState;

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    .line 39
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    .line 40
    return-void
.end method

.method private createStateByID(I)Lcom/youai/IGameActivityState;
    .locals 3
    .param p1, "stateID"    # I

    .prologue
    .line 46
    const/4 v0, 0x0

    .line 47
    .local v0, "pState":Lcom/youai/IGameActivityState;
    packed-switch p1, :pswitch_data_0

    .line 73
    :goto_0
    return-object v0

    .line 49
    :pswitch_0
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState;

    .end local v0    # "pState":Lcom/youai/IGameActivityState;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/GameLogoState;-><init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;)V

    .line 50
    .restart local v0    # "pState":Lcom/youai/IGameActivityState;
    goto :goto_0

    .line 53
    :pswitch_1
    new-instance v0, Lcom/youai/dreamonepiece/YouaiUpdateState;

    .end local v0    # "pState":Lcom/youai/IGameActivityState;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/YouaiUpdateState;-><init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;)V

    .line 54
    .restart local v0    # "pState":Lcom/youai/IGameActivityState;
    goto :goto_0

    .line 57
    :pswitch_2
    new-instance v0, Lcom/youai/dreamonepiece/PlatformSDKState;

    .end local v0    # "pState":Lcom/youai/IGameActivityState;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/PlatformSDKState;-><init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;)V

    .line 58
    .restart local v0    # "pState":Lcom/youai/IGameActivityState;
    goto :goto_0

    .line 61
    :pswitch_3
    new-instance v0, Lcom/youai/dreamonepiece/GameUpdateState;

    .end local v0    # "pState":Lcom/youai/IGameActivityState;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/GameUpdateState;-><init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;)V

    .line 62
    .restart local v0    # "pState":Lcom/youai/IGameActivityState;
    goto :goto_0

    .line 65
    :pswitch_4
    new-instance v0, Lcom/youai/dreamonepiece/GameContextState;

    .end local v0    # "pState":Lcom/youai/IGameActivityState;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/GameContextState;-><init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;)V

    .line 66
    .restart local v0    # "pState":Lcom/youai/IGameActivityState;
    goto :goto_0

    .line 69
    :pswitch_5
    new-instance v0, Lcom/youai/dreamonepiece/GameAppState;

    .end local v0    # "pState":Lcom/youai/IGameActivityState;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameStateManager;->mGameActivity:Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/GameAppState;-><init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;)V

    .restart local v0    # "pState":Lcom/youai/IGameActivityState;
    goto :goto_0

    .line 47
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public changeState(I)V
    .locals 2
    .param p1, "stateID"    # I

    .prologue
    .line 11
    if-ltz p1, :cond_0

    const/4 v0, 0x7

    if-lt p1, v0, :cond_1

    .line 32
    :cond_0
    :goto_0
    return-void

    .line 16
    :cond_1
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    aget-object v0, v0, p1

    if-nez v0, :cond_2

    .line 17
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameStateManager;->createStateByID(I)Lcom/youai/IGameActivityState;

    move-result-object v1

    aput-object v1, v0, p1

    .line 20
    :cond_2
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    iget v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mCurrentStateID:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_3

    .line 21
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    iget v1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mCurrentStateID:I

    aget-object v0, v0, v1

    invoke-interface {v0}, Lcom/youai/IGameActivityState;->exit()V

    .line 28
    :cond_3
    iput p1, p0, Lcom/youai/dreamonepiece/GameStateManager;->mCurrentStateID:I

    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameStateManager;->mStates:[Lcom/youai/IGameActivityState;

    aget-object v0, v0, p1

    invoke-interface {v0}, Lcom/youai/IGameActivityState;->enter()V

    goto :goto_0
.end method
