.class public Lcom/youai/dreamonepiece/YouaiServerInfo;
.super Ljava/lang/Object;
.source "YouaiServerInfo.java"


# instance fields
.field private gameCoin1:I

.field private gameCoin2:J

.field private gameId:Ljava/lang/String;

.field private lastLoginTime:Ljava/lang/Long;

.field private platform:Ljava/lang/String;

.field private playerId:I

.field private playerLv1:I

.field private playerName:Ljava/lang/String;

.field private puid:Ljava/lang/String;

.field private serverId:I

.field private vipLv1:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->puid:Ljava/lang/String;

    .line 6
    iput v1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->serverId:I

    .line 7
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerName:Ljava/lang/String;

    .line 8
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameId:Ljava/lang/String;

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->platform:Ljava/lang/String;

    .line 11
    iput v1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerId:I

    .line 13
    iput v1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameCoin1:I

    .line 14
    iput-wide v2, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameCoin2:J

    .line 15
    iput v1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->vipLv1:I

    .line 16
    iput v1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerLv1:I

    .line 17
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->lastLoginTime:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public getGameCoin1()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameCoin1:I

    return v0
.end method

.method public getGameCoin2()J
    .locals 2

    .prologue
    .line 68
    iget-wide v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameCoin2:J

    return-wide v0
.end method

.method public getGameId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameId:Ljava/lang/String;

    return-object v0
.end method

.method public getLastLoginTime()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->lastLoginTime:Ljava/lang/Long;

    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->platform:Ljava/lang/String;

    return-object v0
.end method

.method public getPlayerId()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerId:I

    return v0
.end method

.method public getPlayerLv1()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerLv1:I

    return v0
.end method

.method public getPlayerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerName:Ljava/lang/String;

    return-object v0
.end method

.method public getPuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->puid:Ljava/lang/String;

    return-object v0
.end method

.method public getServerId()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->serverId:I

    return v0
.end method

.method public getVipLv1()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->vipLv1:I

    return v0
.end method

.method public setGameCoin1(I)V
    .locals 0
    .param p1, "gameCoin1"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameCoin1:I

    .line 65
    return-void
.end method

.method public setGameCoin2(J)V
    .locals 0
    .param p1, "gameCoin2"    # J

    .prologue
    .line 72
    iput-wide p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameCoin2:J

    .line 73
    return-void
.end method

.method public setGameId(Ljava/lang/String;)V
    .locals 0
    .param p1, "gameId"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameId:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setLastLoginTime(Ljava/lang/Long;)V
    .locals 0
    .param p1, "lastLoginTime"    # Ljava/lang/Long;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->lastLoginTime:Ljava/lang/Long;

    .line 41
    return-void
.end method

.method public setPlatform(Ljava/lang/String;)V
    .locals 0
    .param p1, "platform"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->platform:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setPlayerId(I)V
    .locals 0
    .param p1, "playerId"    # I

    .prologue
    .line 108
    iput p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerId:I

    .line 109
    return-void
.end method

.method public setPlayerLv1(I)V
    .locals 0
    .param p1, "playerLv1"    # I

    .prologue
    .line 88
    iput p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerLv1:I

    .line 89
    return-void
.end method

.method public setPlayerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "playerName"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->playerName:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public setPuid(Ljava/lang/String;)V
    .locals 0
    .param p1, "puid"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->puid:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public setServerId(I)V
    .locals 0
    .param p1, "serverId"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->serverId:I

    .line 49
    return-void
.end method

.method public setVipLv1(I)V
    .locals 0
    .param p1, "vipLv1"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->vipLv1:I

    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/youai/dreamonepiece/YouaiServerInfo;->gameId:Ljava/lang/String;

    return-object v0
.end method
