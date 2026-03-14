.class public Lcom/youai/dreamonepiece/LastLoginHelp;
.super Ljava/lang/Object;
.source "LastLoginHelp.java"


# static fields
.field static mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

.field public static mGameid:Ljava/lang/String;

.field public static mPlatform:Ljava/lang/String;

.field public static mPlayerId:I

.field public static mPlayerName:Ljava/lang/String;

.field public static mPlayervl:I

.field public static mPuid:Ljava/lang/String;

.field public static mServerID:I

.field public static mVipLvl:I

.field public static mlv:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getServerInfoCount()I
    .locals 1

    .prologue
    .line 225
    invoke-static {}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->getServerInfoCount()I

    move-result v0

    return v0
.end method

.method public static getServerUserByIndex(I)I
    .locals 1
    .param p0, "index"    # I

    .prologue
    .line 229
    invoke-static {p0}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->getServerUserByIndex(I)I

    move-result v0

    return v0
.end method

.method public static refreshServerInfo(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p0, "gameid"    # Ljava/lang/String;
    .param p1, "puid"    # Ljava/lang/String;
    .param p2, "getSvr"    # Z

    .prologue
    .line 216
    sput-object p0, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameid:Ljava/lang/String;

    .line 217
    sput-object p1, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    .line 218
    new-instance v0, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-direct {v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;-><init>()V

    .line 219
    .local v0, "_youaiServerInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    sget-object v1, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v1}, Lcom/youai/dreamonepiece/GameActivity;->getClientChannel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlatform(Ljava/lang/String;)V

    .line 220
    invoke-static {p0, p1, v0, p2}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->refreshServerInfo(Ljava/lang/String;Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiServerInfo;Z)V

    .line 222
    return-void
.end method

.method public static setActivity(Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 1
    .param p0, "pGameActivity"    # Lcom/youai/dreamonepiece/GameActivity;

    .prologue
    .line 34
    sput-object p0, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    .line 35
    sget-object v0, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-static {v0}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->setYouaiLastLoginHelp(Lcom/youai/dreamonepiece/GameActivity;)V

    .line 37
    return-void
.end method

.method public static updateServerInfo(ILjava/lang/String;IIIIIZ)V
    .locals 22
    .param p0, "serverID"    # I
    .param p1, "playerName"    # Ljava/lang/String;
    .param p2, "playerID"    # I
    .param p3, "lvl"    # I
    .param p4, "vipLvl"    # I
    .param p5, "coin1"    # I
    .param p6, "coin2"    # I
    .param p7, "pushSvr"    # Z

    .prologue
    .line 42
    sput p0, Lcom/youai/dreamonepiece/LastLoginHelp;->mServerID:I

    .line 43
    sput p2, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerId:I

    .line 44
    sput-object p1, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerName:Ljava/lang/String;

    .line 45
    sput p4, Lcom/youai/dreamonepiece/LastLoginHelp;->mVipLvl:I

    .line 46
    sput p4, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayervl:I

    .line 47
    sput p3, Lcom/youai/dreamonepiece/LastLoginHelp;->mlv:I

    .line 48
    new-instance v4, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-direct {v4}, Lcom/youai/dreamonepiece/YouaiServerInfo;-><init>()V

    .line 49
    .local v4, "_youaiServerInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    if-nez v18, :cond_0

    .line 50
    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual/range {v18 .. v18}, Lcom/youai/dreamonepiece/GameActivity;->getClientChannel()Ljava/lang/String;

    move-result-object v18

    sput-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    .line 51
    :cond_0
    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlatform(Ljava/lang/String;)V

    .line 52
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerName(Ljava/lang/String;)V

    .line 53
    move/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerId(I)V

    .line 54
    move/from16 v0, p4

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setVipLv1(I)V

    .line 55
    move/from16 v0, p3

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerLv1(I)V

    .line 56
    move/from16 v0, p5

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameCoin1(I)V

    .line 57
    move/from16 v0, p6

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    invoke-virtual {v4, v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameCoin2(J)V

    .line 58
    move/from16 v0, p0

    invoke-virtual {v4, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setServerId(I)V

    .line 65
    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual/range {v18 .. v18}, Lcom/youai/dreamonepiece/GameActivity;->getMainThreadHandler()Landroid/os/Handler;

    move-result-object v18

    new-instance v19, Lcom/youai/dreamonepiece/LastLoginHelp$1;

    invoke-direct/range {v19 .. v19}, Lcom/youai/dreamonepiece/LastLoginHelp$1;-><init>()V

    invoke-virtual/range {v18 .. v19}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 72
    sget-object v18, Lcom/youai/dreamonepiece/GexinSdkMsgReceiver;->stStrGexinClientId:Ljava/lang/String;

    if-eqz v18, :cond_1

    sget-object v18, Lcom/youai/dreamonepiece/GexinSdkMsgReceiver;->stStrGexinClientId:Ljava/lang/String;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_1

    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    if-eqz v18, :cond_1

    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_1

    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    if-eqz v18, :cond_1

    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_1

    .line 77
    sget-object v18, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual/range {v18 .. v18}, Lcom/youai/dreamonepiece/GameActivity;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v9

    .line 78
    .local v9, "gameInfo":Lcom/youai/PlatformAndGameInfo$GameInfo;
    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    .line 80
    .local v7, "ctx":Landroid/content/Context;
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    .line 81
    .local v15, "strTags":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .line 83
    .local v5, "appInfo":Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v18

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x80

    invoke-virtual/range {v18 .. v20}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 88
    :goto_0
    const-string v6, ""

    .line 89
    .local v6, "channelName":Ljava/lang/String;
    if-eqz v5, :cond_2

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v18, v0

    if-eqz v18, :cond_2

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "youai_channel"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v18

    if-eqz v18, :cond_2

    .line 91
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "_"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v19, v0

    const-string v20, "youai_channel"

    invoke-virtual/range {v19 .. v20}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 97
    :goto_1
    const/16 v18, 0x10

    move/from16 v0, v18

    new-array v0, v0, [Lcom/igexin/sdk/Tag;

    move-object/from16 v16, v0

    .line 99
    .local v16, "tags":[Lcom/igexin/sdk/Tag;
    const/16 v18, 0x0

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 100
    const/16 v18, 0x0

    aget-object v18, v16, v18

    iget-object v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 101
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 102
    const-string v18, "GeXinTag0_platform:\t"

    iget-object v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    const/16 v18, 0x1

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 105
    const/16 v18, 0x1

    aget-object v18, v16, v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 106
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 107
    const-string v18, "GeXinTag1_channelName:\t"

    move-object/from16 v0, v18

    invoke-static {v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v12

    .line 110
    .local v12, "now":Ljava/util/Calendar;
    invoke-virtual {v12}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v17

    .line 111
    .local v17, "timeZone":Ljava/util/TimeZone;
    const/16 v18, 0x2

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 112
    const/16 v18, 0x2

    aget-object v18, v16, v18

    const/16 v19, 0x0

    const/16 v20, 0x0

    sget-object v21, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 114
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v19, 0x0

    const/16 v20, 0x0

    sget-object v21, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    const-string v18, "GeXinTag2_timeZone:\t"

    const/16 v19, 0x0

    const/16 v20, 0x0

    sget-object v21, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    sget-object v18, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v19, " "

    const-string v20, "-"

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 120
    .local v10, "manufacturer":Ljava/lang/String;
    sget-object v18, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v19, " "

    const-string v20, "-"

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 121
    .local v11, "model":Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 123
    .local v14, "sdkversion":Ljava/lang/String;
    const/16 v18, 0x3

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 124
    const/16 v18, 0x3

    aget-object v18, v16, v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 125
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    const-string v18, "GeXinTag3_manufacturer:\t"

    move-object/from16 v0, v18

    invoke-static {v0, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    const/16 v18, 0x4

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 129
    const/16 v18, 0x4

    aget-object v18, v16, v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 130
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    const-string v18, "GeXinTag4_model:\t"

    move-object/from16 v0, v18

    invoke-static {v0, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    const/16 v18, 0x5

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 134
    const/16 v18, 0x5

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 135
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    const-string v18, "GeXinTag5_manufacturer-model:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    const/16 v18, 0x6

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 139
    const/16 v18, 0x6

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "sdklvl-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 140
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "sdklvl-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    const-string v18, "GeXinTag6_sdklvl:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "sdklvl-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    const/16 v18, 0x7

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 144
    const/16 v18, 0x7

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "android-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 145
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "android-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    const-string v18, "GeXinTag7_android:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "android-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const/16 v18, 0x8

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 151
    const/16 v18, 0x8

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 153
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 155
    const-string v18, "GeXinTag8_platformidnum-serverID-playerID:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    const/16 v18, 0x9

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 159
    const/16 v18, 0x9

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 161
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 163
    const-string v18, "GeXinTag9_platformidnum-serverID-playerName:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget v0, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const/16 v18, 0xa

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 168
    const/16 v18, 0xa

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v20, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 169
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v19, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    const-string v18, "GeXinTag10_puid-serverID-playerID:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v20, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    const/16 v18, 0xb

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 174
    const/16 v18, 0xb

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v20, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 175
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v19, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 176
    const-string v18, "GeXinTag11_puid-serverID-playerName:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v20, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    const/16 v18, 0xc

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 180
    const/16 v18, 0xc

    aget-object v18, v16, v18

    sget-object v19, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 181
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v19, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    const-string v18, "GeXinTag12_puid:\t"

    sget-object v19, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    const/16 v18, 0xd

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 185
    const/16 v18, 0xd

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "lvl-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 186
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "lvl-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    const-string v18, "GeXinTag13_lvl-lvlnum:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "lvl-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    const/16 v18, 0xe

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 190
    const/16 v18, 0xe

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "viplvl-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 191
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "viplvl-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    const-string v18, "GeXinTag14_viplvl-viplvlnum:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "viplvl-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    const/16 v18, 0xf

    new-instance v19, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v19 .. v19}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v19, v16, v18

    .line 195
    const/16 v18, 0xf

    aget-object v18, v16, v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v20, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 196
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v19, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 197
    const-string v18, "GeXinTag15_puid-serverID:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v20, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    invoke-static {}, Lcom/igexin/sdk/PushManager;->getInstance()Lcom/igexin/sdk/PushManager;

    move-result-object v18

    sget-object v19, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/igexin/sdk/PushManager;->setTag(Landroid/content/Context;[Lcom/igexin/sdk/Tag;)I

    move-result v13

    .line 202
    .local v13, "ret":I
    const-string v18, "GeXinSetTag2 ret code:\t"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const-string v18, "GeXinTags:\t"

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    sget-object v18, Lcom/youai/dreamonepiece/GexinSdkMsgReceiver;->stStrGexinClientId:Ljava/lang/String;

    invoke-static/range {v18 .. v18}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->setGexingClientId(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->setGexingTags(Ljava/lang/String;)V

    .line 210
    .end local v5    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v6    # "channelName":Ljava/lang/String;
    .end local v7    # "ctx":Landroid/content/Context;
    .end local v9    # "gameInfo":Lcom/youai/PlatformAndGameInfo$GameInfo;
    .end local v10    # "manufacturer":Ljava/lang/String;
    .end local v11    # "model":Ljava/lang/String;
    .end local v12    # "now":Ljava/util/Calendar;
    .end local v13    # "ret":I
    .end local v14    # "sdkversion":Ljava/lang/String;
    .end local v15    # "strTags":Ljava/lang/StringBuffer;
    .end local v16    # "tags":[Lcom/igexin/sdk/Tag;
    .end local v17    # "timeZone":Ljava/util/TimeZone;
    :cond_1
    move/from16 v0, p0

    move/from16 v1, p7

    invoke-static {v0, v4, v1}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->updateServerInfo(ILcom/youai/dreamonepiece/YouaiServerInfo;Z)V

    .line 212
    return-void

    .line 85
    .restart local v5    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v7    # "ctx":Landroid/content/Context;
    .restart local v9    # "gameInfo":Lcom/youai/PlatformAndGameInfo$GameInfo;
    .restart local v15    # "strTags":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v8

    .line 86
    .local v8, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v8}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 94
    .end local v8    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v6    # "channelName":Ljava/lang/String;
    :cond_2
    iget-object v6, v9, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    goto/16 :goto_1
.end method
