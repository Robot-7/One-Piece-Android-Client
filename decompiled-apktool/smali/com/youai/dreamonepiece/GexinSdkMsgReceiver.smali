.class public Lcom/youai/dreamonepiece/GexinSdkMsgReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GexinSdkMsgReceiver.java"


# static fields
.field public static stStrGexinClientId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/youai/dreamonepiece/GexinSdkMsgReceiver;->stStrGexinClientId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 31
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 30
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    .line 31
    .local v7, "bundle":Landroid/os/Bundle;
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "onReceive() action="

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "action"

    move-object/from16 v0, v29

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    const-string v27, "action"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v27

    packed-switch v27, :pswitch_data_0

    .line 135
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 37
    :pswitch_1
    const-string v27, "payload"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v17

    .line 38
    .local v17, "payload":[B
    const-string v27, "taskid"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 39
    .local v22, "taskid":Ljava/lang/String;
    const-string v27, "messageid"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 42
    .local v14, "messageid":Ljava/lang/String;
    invoke-static {}, Lcom/igexin/sdk/PushManager;->getInstance()Lcom/igexin/sdk/PushManager;

    move-result-object v27

    const v28, 0x15f91

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    move/from16 v3, v28

    invoke-virtual {v0, v1, v2, v14, v3}, Lcom/igexin/sdk/PushManager;->sendFeedbackMessage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v18

    .line 44
    .local v18, "result":Z
    if-eqz v17, :cond_0

    .line 45
    new-instance v10, Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Ljava/lang/String;-><init>([B)V

    .line 46
    .local v10, "data":Ljava/lang/String;
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "Got Payload:"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 53
    .end local v10    # "data":Ljava/lang/String;
    .end local v14    # "messageid":Ljava/lang/String;
    .end local v17    # "payload":[B
    .end local v18    # "result":Z
    .end local v22    # "taskid":Ljava/lang/String;
    :pswitch_2
    const-string v27, "clientid"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    sput-object v27, Lcom/youai/dreamonepiece/GexinSdkMsgReceiver;->stStrGexinClientId:Ljava/lang/String;

    .line 56
    sget-object v27, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    if-eqz v27, :cond_0

    sget-object v27, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    if-eqz v27, :cond_0

    .line 57
    sget-object v9, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    .line 58
    .local v9, "ctx":Landroid/content/Context;
    sget-object v27, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual/range {v27 .. v27}, Lcom/youai/dreamonepiece/GameActivity;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v12

    .line 60
    .local v12, "gameInfo":Lcom/youai/PlatformAndGameInfo$GameInfo;
    const/4 v5, 0x0

    .line 62
    .local v5, "appInfo":Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v27

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v28

    const/16 v29, 0x80

    invoke-virtual/range {v27 .. v29}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 67
    :goto_1
    const-string v8, ""

    .line 68
    .local v8, "channelName":Ljava/lang/String;
    if-eqz v5, :cond_1

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v27, v0

    if-eqz v27, :cond_1

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v27, v0

    const-string v28, "youai_channel"

    invoke-virtual/range {v27 .. v28}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v27

    if-eqz v27, :cond_1

    .line 70
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v12, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "_"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v28, v0

    const-string v29, "youai_channel"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 76
    :goto_2
    const/16 v27, 0x6

    move/from16 v0, v27

    new-array v0, v0, [Lcom/igexin/sdk/Tag;

    move-object/from16 v21, v0

    .line 78
    .local v21, "tags":[Lcom/igexin/sdk/Tag;
    const/16 v27, 0x0

    new-instance v28, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v28 .. v28}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v28, v21, v27

    .line 79
    const/16 v27, 0x0

    aget-object v27, v21, v27

    iget-object v0, v12, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 80
    const-string v27, "GeXinTag0_platform:\t"

    iget-object v0, v12, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    const/16 v27, 0x1

    new-instance v28, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v28 .. v28}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v28, v21, v27

    .line 83
    const/16 v27, 0x1

    aget-object v27, v21, v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 84
    const-string v27, "GeXinTag1_channelName:\t"

    move-object/from16 v0, v27

    invoke-static {v0, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v16

    .line 87
    .local v16, "now":Ljava/util/Calendar;
    invoke-virtual/range {v16 .. v16}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v24

    .line 88
    .local v24, "timeZone":Ljava/util/TimeZone;
    const/16 v27, 0x2

    new-instance v28, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v28 .. v28}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v28, v21, v27

    .line 89
    const/16 v27, 0x2

    aget-object v27, v21, v27

    const/16 v28, 0x0

    const/16 v29, 0x0

    sget-object v30, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v24

    move/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 91
    const-string v27, "GeXinTag2_timeZone:\t"

    const/16 v28, 0x0

    const/16 v29, 0x0

    sget-object v30, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v24

    move/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    sget-object v27, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v28, " "

    const-string v29, "-"

    invoke-virtual/range {v27 .. v29}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 95
    .local v13, "manufacturer":Ljava/lang/String;
    sget-object v27, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v28, " "

    const-string v29, "-"

    invoke-virtual/range {v27 .. v29}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 96
    .local v15, "model":Ljava/lang/String;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, ""

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 98
    .local v20, "sdkversion":Ljava/lang/String;
    const/16 v27, 0x3

    new-instance v28, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v28 .. v28}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v28, v21, v27

    .line 99
    const/16 v27, 0x3

    aget-object v27, v21, v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 100
    const-string v27, "GeXinTag3_manufacturer:\t"

    move-object/from16 v0, v27

    invoke-static {v0, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const/16 v27, 0x4

    new-instance v28, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v28 .. v28}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v28, v21, v27

    .line 103
    const/16 v27, 0x4

    aget-object v27, v21, v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v15}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 104
    const-string v27, "GeXinTag4_model:\t"

    move-object/from16 v0, v27

    invoke-static {v0, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    const/16 v27, 0x5

    new-instance v28, Lcom/igexin/sdk/Tag;

    invoke-direct/range {v28 .. v28}, Lcom/igexin/sdk/Tag;-><init>()V

    aput-object v28, v21, v27

    .line 107
    const/16 v27, 0x5

    aget-object v27, v21, v27

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/igexin/sdk/Tag;->setName(Ljava/lang/String;)V

    .line 108
    const-string v27, "GeXinTag5_sdkversion:\t"

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 64
    .end local v8    # "channelName":Ljava/lang/String;
    .end local v13    # "manufacturer":Ljava/lang/String;
    .end local v15    # "model":Ljava/lang/String;
    .end local v16    # "now":Ljava/util/Calendar;
    .end local v20    # "sdkversion":Ljava/lang/String;
    .end local v21    # "tags":[Lcom/igexin/sdk/Tag;
    .end local v24    # "timeZone":Ljava/util/TimeZone;
    :catch_0
    move-exception v11

    .line 65
    .local v11, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v11}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_1

    .line 73
    .end local v11    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v8    # "channelName":Ljava/lang/String;
    :cond_1
    iget-object v8, v12, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    goto/16 :goto_2

    .line 120
    .end local v5    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v8    # "channelName":Ljava/lang/String;
    .end local v9    # "ctx":Landroid/content/Context;
    .end local v12    # "gameInfo":Lcom/youai/PlatformAndGameInfo$GameInfo;
    :pswitch_3
    const-string v27, "appid"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 121
    .local v6, "appid":Ljava/lang/String;
    const-string v27, "taskid"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 122
    .local v23, "taskid2":Ljava/lang/String;
    const-string v27, "actionid"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 123
    .local v4, "actionid":Ljava/lang/String;
    const-string v27, "result"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 124
    .local v19, "result2":Ljava/lang/String;
    const-string v27, "timestamp"

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v25

    .line 126
    .local v25, "timestamp":J
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "appid:"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "taskid:"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "actionid:"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "result:"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const-string v27, "GexinSdkDemo"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "timestamp:"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-wide/from16 v1, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 32
    :pswitch_data_0
    .packed-switch 0x2711
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
