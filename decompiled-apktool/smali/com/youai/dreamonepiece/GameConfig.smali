.class public Lcom/youai/dreamonepiece/GameConfig;
.super Ljava/lang/Object;
.source "GameConfig.java"


# instance fields
.field private mGameActivity:Lcom/youai/IGameActivity;

.field public mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;


# direct methods
.method public constructor <init>(Lcom/youai/IGameActivity;I)V
    .locals 9
    .param p1, "gameActivity"    # Lcom/youai/IGameActivity;
    .param p2, "platform_type"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 26
    .local v4, "start":J
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameActivity:Lcom/youai/IGameActivity;

    .line 27
    new-instance v6, Lcom/youai/PlatformAndGameInfo$GameInfo;

    invoke-direct {v6}, Lcom/youai/PlatformAndGameInfo$GameInfo;-><init>()V

    iput-object v6, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    .line 29
    iget-object v6, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iput p2, v6, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    .line 30
    iget-object v6, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    invoke-static {p2}, Lcom/youai/PlatformAndGameInfo;->getPlatformTypeStr(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    .line 33
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameConfig;->loadGameConfig()V

    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 40
    .local v0, "end":J
    sub-long v2, v0, v4

    .line 41
    .local v2, "span":J
    const-string v6, "GameConfig"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "GameConfig cost time: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " millis"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    return-void
.end method

.method public static native nativeReadGameAppID(I)I
.end method

.method public static native nativeReadGameAppKey(I)Ljava/lang/String;
.end method

.method public static native nativeReadGameAppSecret(I)Ljava/lang/String;
.end method

.method public static native nativeReadGamePlatformInfo(I)Ljava/lang/String;
.end method

.method private parseGamePlatformInfo(Ljava/lang/String;)V
    .locals 5
    .param p1, "infoStr"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x1b

    .line 62
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 66
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 68
    .local v0, "dataJsonObj":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v3, 0x5

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_2

    .line 71
    :cond_0
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 72
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 287
    .end local v0    # "dataJsonObj":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    return-void

    .line 73
    .restart local v0    # "dataJsonObj":Lorg/json/JSONObject;
    :cond_2
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_4

    .line 75
    :cond_3
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 76
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 77
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "cpid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->cp_id:I

    .line 78
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "svrid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->svr_id:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 283
    .end local v0    # "dataJsonObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 284
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 79
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "dataJsonObj":Lorg/json/JSONObject;
    :cond_4
    :try_start_1
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v3, 0x7

    if-eq v2, v3, :cond_5

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0xe

    if-ne v2, v3, :cond_6

    .line 81
    :cond_5
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 82
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 83
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto :goto_0

    .line 84
    :cond_6
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x6f

    if-ne v2, v3, :cond_7

    .line 85
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 86
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 87
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 90
    :cond_7
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x11

    if-ne v2, v3, :cond_8

    .line 91
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 92
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 93
    :cond_8
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0xd

    if-ne v2, v3, :cond_9

    .line 94
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 95
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 96
    :cond_9
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x17

    if-ne v2, v3, :cond_a

    .line 97
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 98
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 99
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 101
    :cond_a
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x10

    if-ne v2, v3, :cond_b

    .line 102
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 103
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 104
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 105
    :cond_b
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0xa

    if-ne v2, v3, :cond_c

    .line 106
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 107
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 108
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 109
    :cond_c
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x18

    if-ne v2, v3, :cond_d

    .line 110
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 111
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 112
    :cond_d
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x1a

    if-eq v2, v3, :cond_e

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x2b

    if-ne v2, v3, :cond_f

    .line 114
    :cond_e
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 115
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 116
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payaddr"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    goto/16 :goto_0

    .line 117
    :cond_f
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x19

    if-ne v2, v3, :cond_10

    .line 118
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 119
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 120
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payaddr"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    goto/16 :goto_0

    .line 121
    :cond_10
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    if-ne v2, v4, :cond_11

    .line 122
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 123
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 124
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 125
    :cond_11
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x1d

    if-ne v2, v3, :cond_12

    .line 126
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 127
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 128
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 129
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "svrid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->svr_id:I

    goto/16 :goto_0

    .line 130
    :cond_12
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    if-ne v2, v4, :cond_13

    .line 131
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 132
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 133
    :cond_13
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x1c

    if-ne v2, v3, :cond_14

    .line 134
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 135
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "cpid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 136
    :cond_14
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x1e

    if-ne v2, v3, :cond_15

    .line 137
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 138
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "gameid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->gameid:I

    .line 139
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 140
    :cond_15
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x1f

    if-ne v2, v3, :cond_16

    .line 141
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 142
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    .line 143
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "private"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->private_str:Ljava/lang/String;

    .line 144
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "public"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    .line 145
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payaddr"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    .line 146
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "buoykey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 147
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "cpid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->cp_id_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 148
    :cond_16
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x20

    if-ne v2, v3, :cond_17

    .line 149
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 150
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 151
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 152
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payaddr"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    goto/16 :goto_0

    .line 153
    :cond_17
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x23

    if-ne v2, v3, :cond_18

    .line 154
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 155
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 156
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 157
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    .line 158
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "private"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->private_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 159
    :cond_18
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x21

    if-ne v2, v3, :cond_19

    .line 160
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 161
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 162
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payaddr"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    goto/16 :goto_0

    .line 163
    :cond_19
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x22

    if-ne v2, v3, :cond_1a

    .line 164
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 165
    :cond_1a
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x24

    if-ne v2, v3, :cond_1b

    .line 166
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "cpid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->cp_id:I

    .line 167
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "gameid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->gameid:I

    .line 168
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 169
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "privateKey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->private_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 171
    :cond_1b
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x26

    if-ne v2, v3, :cond_1c

    .line 172
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "waresid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 173
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 174
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 175
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 176
    :cond_1c
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x25

    if-ne v2, v3, :cond_1d

    .line 177
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 178
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 179
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "app_secret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 180
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "pay_id_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    .line 181
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "public_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 183
    :cond_1d
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x2c

    if-ne v2, v3, :cond_1e

    .line 184
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 185
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 186
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "app_secret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 187
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "pay_id_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    .line 188
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "public_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 189
    :cond_1e
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x28

    if-ne v2, v3, :cond_1f

    .line 190
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 191
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 192
    :cond_1f
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x27

    if-ne v2, v3, :cond_20

    .line 193
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 194
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 195
    :cond_20
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x2a

    if-ne v2, v3, :cond_21

    .line 197
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 198
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 199
    :cond_21
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x85

    if-ne v2, v3, :cond_22

    .line 200
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 201
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 202
    :cond_22
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x29

    if-ne v2, v3, :cond_23

    .line 203
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 204
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 205
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 206
    :cond_23
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_24

    .line 207
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 208
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 209
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 210
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "pay_id_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    .line 211
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "privateKey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->private_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 212
    :cond_24
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_25

    .line 213
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 214
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 215
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 216
    :cond_25
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x30

    if-ne v2, v3, :cond_26

    .line 217
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 218
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 219
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "private"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->private_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 220
    :cond_26
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x31

    if-eq v2, v3, :cond_1

    .line 222
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x32

    if-ne v2, v3, :cond_27

    .line 223
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 224
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 225
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "cpid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->cp_id:I

    goto/16 :goto_0

    .line 226
    :cond_27
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x33

    if-ne v2, v3, :cond_28

    .line 227
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 228
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "publicKey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 229
    :cond_28
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x34

    if-ne v2, v3, :cond_29

    .line 230
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 231
    :cond_29
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x35

    if-ne v2, v3, :cond_2a

    .line 232
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 233
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 234
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 235
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "rechargeurl"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    .line 236
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "public_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 237
    :cond_2a
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x36

    if-ne v2, v3, :cond_2b

    .line 238
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 239
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 240
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 241
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "rechargeurl"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    .line 242
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "public_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 243
    :cond_2b
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x39

    if-ne v2, v3, :cond_2c

    .line 245
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 246
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "storekey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 247
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "storeid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 248
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "payaddr"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    goto/16 :goto_0

    .line 249
    :cond_2c
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x3b

    if-ne v2, v3, :cond_2d

    .line 250
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 251
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 252
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 253
    :cond_2d
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x3d

    if-ne v2, v3, :cond_2e

    .line 254
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 255
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 256
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    goto/16 :goto_0

    .line 257
    :cond_2e
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x43

    if-ne v2, v3, :cond_2f

    .line 258
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 259
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 260
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appsecret"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_secret:Ljava/lang/String;

    .line 261
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid_cool"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id_str:Ljava/lang/String;

    .line 262
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey_cool"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->public_str:Ljava/lang/String;

    .line 263
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "rechargeurl"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    goto/16 :goto_0

    .line 264
    :cond_2f
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x3c

    if-ne v2, v3, :cond_30

    .line 265
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 266
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "pay_id_str"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 267
    :cond_30
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x4a

    if-ne v2, v3, :cond_31

    .line 268
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "gameid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->gameid:I

    .line 269
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "cpid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->cp_id:I

    .line 270
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "key"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    .line 271
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "rechargeurl"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_addr:Ljava/lang/String;

    .line 273
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "validateurl"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->pay_id_str:Ljava/lang/String;

    goto/16 :goto_0

    .line 274
    :cond_31
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x49

    if-ne v2, v3, :cond_32

    .line 275
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 276
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 277
    :cond_32
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x4d

    if-ne v2, v3, :cond_33

    .line 278
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "youaidreamonepiece"

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;

    goto/16 :goto_0

    .line 279
    :cond_33
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v2, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v3, 0x4e

    if-ne v2, v3, :cond_1

    .line 280
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_id:I

    .line 281
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    const-string v3, "appkey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/youai/PlatformAndGameInfo$GameInfo;->app_key:Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method public loadGameConfig()V
    .locals 7

    .prologue
    .line 303
    new-instance v0, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v5}, Lcom/youai/IGameActivity;->getAppFilesRootPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/game.properties"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 305
    .local v0, "cfg":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 306
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 307
    .local v1, "cfgIni":Ljava/util/Properties;
    const/4 v2, 0x0

    .line 308
    .local v2, "platformType":Ljava/lang/String;
    const/4 v3, 0x0

    .line 310
    .local v3, "usePlatformSdkType":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 311
    const-string v4, "platformType"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 312
    const-string v4, "usePlatformSdkType"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 321
    :goto_0
    const/4 v0, 0x0

    .line 322
    const/4 v1, 0x0

    .line 324
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v5, v5, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    invoke-static {v2, v5}, Lcom/youai/PlatformAndGameInfo;->readGameInfoPlatformType(Ljava/lang/String;I)I

    move-result v5

    iput v5, v4, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    .line 327
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v5, v5, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    iget-object v6, p0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v6, v6, Lcom/youai/PlatformAndGameInfo$GameInfo;->use_platform_sdk_type:I

    invoke-static {v3, v5, v6}, Lcom/youai/PlatformAndGameInfo;->readGameInfoUsePlatformSdkType(Ljava/lang/String;II)I

    move-result v5

    iput v5, v4, Lcom/youai/PlatformAndGameInfo$GameInfo;->use_platform_sdk_type:I

    .line 333
    .end local v1    # "cfgIni":Ljava/util/Properties;
    .end local v2    # "platformType":Ljava/lang/String;
    .end local v3    # "usePlatformSdkType":Ljava/lang/String;
    :cond_0
    return-void

    .line 317
    .restart local v1    # "cfgIni":Ljava/util/Properties;
    .restart local v2    # "platformType":Ljava/lang/String;
    .restart local v3    # "usePlatformSdkType":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0

    .line 315
    :catch_1
    move-exception v4

    goto :goto_0
.end method
