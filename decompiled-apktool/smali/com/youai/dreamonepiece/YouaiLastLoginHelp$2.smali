.class final Lcom/youai/dreamonepiece/YouaiLastLoginHelp$2;
.super Ljava/lang/Object;
.source "YouaiLastLoginHelp.java"

# interfaces
.implements Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->getFromNet(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 492
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Ljava/lang/String;)V
    .locals 28
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 505
    const-string v25, "onComplete"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "onComplete"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    :try_start_0
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 509
    .local v14, "jsonServer":Lorg/json/JSONObject;
    const-string v25, "error"

    move-object/from16 v0, v25

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 511
    .local v10, "error":Ljava/lang/String;
    const-string v25, "200"

    move-object/from16 v0, v25

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 512
    const-string v25, "data"

    move-object/from16 v0, v25

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v25

    const-string v26, "players"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v17

    .line 515
    .local v17, "players":Lorg/json/JSONArray;
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v15

    .line 516
    .local v15, "length":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    if-ge v11, v15, :cond_4

    .line 517
    new-instance v19, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-direct/range {v19 .. v19}, Lcom/youai/dreamonepiece/YouaiServerInfo;-><init>()V

    .line 518
    .local v19, "serverUser":Lcom/youai/dreamonepiece/YouaiServerInfo;
    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    const-string v26, "name"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 520
    .local v16, "playerName":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    const-string v26, "serverId"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    .line 522
    .local v18, "serverId":I
    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerName(Ljava/lang/String;)V

    .line 523
    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameId(Ljava/lang/String;)V

    .line 524
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setServerId(I)V

    .line 526
    const/4 v7, 0x0

    .line 527
    .local v7, "bContinue":Z
    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_1

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/youai/dreamonepiece/YouaiServerInfo;

    .line 528
    .local v13, "info":Lcom/youai/dreamonepiece/YouaiServerInfo;
    invoke-virtual {v13}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getServerId()I

    move-result v25

    move/from16 v0, v25

    move/from16 v1, v18

    if-ne v0, v1, :cond_0

    .line 529
    const/4 v7, 0x1

    .line 533
    .end local v13    # "info":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :cond_1
    if-eqz v7, :cond_2

    .line 516
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 537
    :cond_2
    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 588
    .end local v7    # "bContinue":Z
    .end local v10    # "error":Ljava/lang/String;
    .end local v11    # "i":I
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v14    # "jsonServer":Lorg/json/JSONObject;
    .end local v15    # "length":I
    .end local v16    # "playerName":Ljava/lang/String;
    .end local v17    # "players":Lorg/json/JSONArray;
    .end local v18    # "serverId":I
    .end local v19    # "serverUser":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :catch_0
    move-exception v8

    .line 589
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    .line 592
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_3
    :goto_2
    return-void

    .line 541
    .restart local v10    # "error":Ljava/lang/String;
    .restart local v11    # "i":I
    .restart local v14    # "jsonServer":Lorg/json/JSONObject;
    .restart local v15    # "length":I
    .restart local v17    # "players":Lorg/json/JSONArray;
    :cond_4
    :try_start_1
    new-instance v22, Lorg/json/JSONObject;

    invoke-direct/range {v22 .. v22}, Lorg/json/JSONObject;-><init>()V

    .line 542
    .local v22, "tosaveObj":Lorg/json/JSONObject;
    new-instance v23, Lorg/json/JSONArray;

    invoke-direct/range {v23 .. v23}, Lorg/json/JSONArray;-><init>()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 545
    .local v23, "tosavearray":Lorg/json/JSONArray;
    const-wide/16 v4, 0x0

    .line 546
    .local v4, "_lastTime":J
    const/4 v6, 0x0

    .line 548
    .local v6, "_yaUid":Ljava/lang/String;
    :try_start_2
    invoke-static {}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->access$000()Z

    move-result v25

    if-eqz v25, :cond_6

    .line 549
    const-string v25, "com4love"

    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v25 .. v26}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v6

    .line 558
    :goto_3
    :try_start_3
    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v25

    add-int/lit8 v11, v25, -0x1

    :goto_4
    if-ltz v11, :cond_7

    .line 560
    new-instance v24, Lorg/json/JSONObject;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONObject;-><init>()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 562
    .local v24, "tosaveitem":Lorg/json/JSONObject;
    :try_start_4
    const-string v25, "puid"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 563
    const-string v25, "gameId"

    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    invoke-virtual/range {v24 .. v26}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 564
    const-string v26, "playerName"

    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-virtual/range {v25 .. v25}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 566
    const-string v26, "serverId"

    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-virtual/range {v25 .. v25}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getServerId()I

    move-result v25

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 568
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    .line 569
    .local v20, "time":J
    const-string v25, "lastlogintime"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-wide/from16 v2, v20

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 570
    cmp-long v25, v20, v4

    if-nez v25, :cond_5

    .line 571
    const-wide/16 v25, 0x1

    add-long v20, v20, v25

    .line 572
    :cond_5
    move-wide/from16 v4, v20

    .line 573
    sget-object v25, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setLastLoginTime(Ljava/lang/Long;)V

    .line 574
    invoke-virtual/range {v23 .. v24}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v23

    .line 575
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result-object v22

    .line 558
    .end local v20    # "time":J
    :goto_5
    add-int/lit8 v11, v11, -0x1

    goto/16 :goto_4

    .line 551
    .end local v24    # "tosaveitem":Lorg/json/JSONObject;
    :cond_6
    :try_start_5
    sget-object v6, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_3

    .line 554
    :catch_1
    move-exception v9

    .line 555
    .local v9, "e1":Ljava/lang/Exception;
    :try_start_6
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 576
    .end local v9    # "e1":Ljava/lang/Exception;
    .restart local v24    # "tosaveitem":Lorg/json/JSONObject;
    :catch_2
    move-exception v8

    .line 577
    .restart local v8    # "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5

    .line 578
    .end local v8    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v8

    .line 579
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .line 584
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v24    # "tosaveitem":Lorg/json/JSONObject;
    :cond_7
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v25

    if-lez v25, :cond_3

    .line 585
    invoke-static/range {v22 .. v22}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->writeJSONObjectToSdCard(Lorg/json/JSONObject;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_2
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 500
    const-string v0, "onError"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    return-void
.end method

.method public onIOException(Ljava/io/IOException;)V
    .locals 3
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 495
    const-string v0, "onIOException"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onIOException"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    return-void
.end method
