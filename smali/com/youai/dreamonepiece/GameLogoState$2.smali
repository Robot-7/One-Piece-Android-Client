.class Lcom/youai/dreamonepiece/GameLogoState$2;
.super Ljava/lang/Thread;
.source "GameLogoState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameLogoState;->requestUnzipAssetToExternalStorageResources()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private resFilesPath:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/youai/dreamonepiece/GameLogoState;

.field final synthetic val$appFilesResourcesPath:Ljava/lang/String;

.field final synthetic val$theActivity:Landroid/app/Activity;

.field final synthetic val$theHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameLogoState;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 1
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 408
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    iput-object p3, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theActivity:Landroid/app/Activity;

    iput-object p4, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    iput-object p5, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theHandler:Landroid/os/Handler;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 411
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    return-void
.end method

.method private isContainFileList([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6
    .param p1, "files"    # [Ljava/lang/String;

    .prologue
    .line 507
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 508
    .local v4, "result":Ljava/lang/Boolean;
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 509
    .local v1, "fileName":Ljava/lang/String;
    const-string v5, "filelist.txt"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 510
    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 514
    .end local v1    # "fileName":Ljava/lang/String;
    :cond_0
    return-object v4

    .line 508
    .restart local v1    # "fileName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private recursionSumAssetsFileNum(Ljava/lang/String;)I
    .locals 14
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 415
    const/4 v9, 0x0

    .line 417
    .local v9, "num":I
    :try_start_0
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theActivity:Landroid/app/Activity;

    invoke-virtual {v11}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 418
    .local v1, "assetMgr":Landroid/content/res/AssetManager;
    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 420
    .local v2, "assets":[Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v7, :cond_4

    aget-object v3, v0, v4

    .line 421
    .local v3, "filepath":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 420
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 424
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_2

    .line 425
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 427
    :cond_2
    const/16 v11, 0x2f

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 428
    .local v5, "idx":I
    const/16 v11, 0x2e

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 429
    .local v6, "idy":I
    const/4 v11, -0x1

    if-ne v5, v11, :cond_5

    const/4 v11, -0x1

    if-ne v6, v11, :cond_5

    .line 430
    invoke-direct {p0, v3}, Lcom/youai/dreamonepiece/GameLogoState$2;->recursionSumAssetsFileNum(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    .line 431
    new-instance v10, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 433
    .local v10, "temp":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_3

    .line 434
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 436
    :cond_3
    new-instance v8, Landroid/os/Message;

    invoke-direct {v8}, Landroid/os/Message;-><init>()V

    .line 437
    .local v8, "msg":Landroid/os/Message;
    new-instance v11, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    const/4 v12, 0x0

    const-string v13, "\u89e3\u538b\u8d44\u6e90\uff0c\u4e0d\u9700\u6d41\u91cf\uff0c\u8bf7\u7a0d\u540e.."

    invoke-direct {v11, v12, v13}, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;-><init>(ILjava/lang/String;)V

    iput-object v11, v8, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 438
    const/4 v11, 0x5

    iput v11, v8, Landroid/os/Message;->what:I

    .line 439
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theHandler:Landroid/os/Handler;

    invoke-virtual {v11, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 461
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .end local v2    # "assets":[Ljava/lang/String;
    .end local v3    # "filepath":Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "idx":I
    .end local v6    # "idy":I
    .end local v7    # "len$":I
    .end local v8    # "msg":Landroid/os/Message;
    .end local v10    # "temp":Ljava/io/File;
    :catch_0
    move-exception v11

    .line 466
    :cond_4
    return v9

    .line 440
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .restart local v2    # "assets":[Ljava/lang/String;
    .restart local v3    # "filepath":Ljava/lang/String;
    .restart local v4    # "i$":I
    .restart local v5    # "idx":I
    .restart local v6    # "idy":I
    .restart local v7    # "len$":I
    :cond_5
    if-lez v5, :cond_6

    if-le v6, v5, :cond_6

    .line 441
    add-int/lit8 v9, v9, 0x1

    .line 442
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_1

    .line 463
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .end local v2    # "assets":[Ljava/lang/String;
    .end local v3    # "filepath":Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "idx":I
    .end local v6    # "idy":I
    .end local v7    # "len$":I
    :catchall_0
    move-exception v11

    throw v11

    .line 443
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .restart local v2    # "assets":[Ljava/lang/String;
    .restart local v3    # "filepath":Ljava/lang/String;
    .restart local v4    # "i$":I
    .restart local v5    # "idx":I
    .restart local v6    # "idy":I
    .restart local v7    # "len$":I
    :cond_6
    const/4 v11, -0x1

    if-ne v5, v11, :cond_7

    if-lez v6, :cond_7

    .line 444
    add-int/lit8 v9, v9, 0x1

    .line 445
    :try_start_1
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 446
    :cond_7
    if-lez v5, :cond_0

    if-ge v6, v5, :cond_0

    .line 447
    invoke-direct {p0, v3}, Lcom/youai/dreamonepiece/GameLogoState$2;->recursionSumAssetsFileNum(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    .line 448
    new-instance v10, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 450
    .restart local v10    # "temp":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_8

    .line 451
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 453
    :cond_8
    new-instance v8, Landroid/os/Message;

    invoke-direct {v8}, Landroid/os/Message;-><init>()V

    .line 454
    .restart local v8    # "msg":Landroid/os/Message;
    new-instance v11, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    const/4 v12, 0x0

    const-string v13, "\u89e3\u538b\u8d44\u6e90\uff0c\u4e0d\u9700\u6d41\u91cf\uff0c\u8bf7\u7a0d\u540e...."

    invoke-direct {v11, v12, v13}, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;-><init>(ILjava/lang/String;)V

    iput-object v11, v8, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 456
    const/4 v11, 0x5

    iput v11, v8, Landroid/os/Message;->what:I

    .line 457
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theHandler:Landroid/os/Handler;

    invoke-virtual {v11, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1
.end method

.method private recursionSumAssetsFileNumByFileList(Ljava/lang/String;)I
    .locals 20
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 471
    new-instance v13, Landroid/os/Message;

    invoke-direct {v13}, Landroid/os/Message;-><init>()V

    .line 472
    .local v13, "msg":Landroid/os/Message;
    new-instance v17, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    const/16 v18, 0x0

    const-string v19, "\u89e3\u538b\u8d44\u6e90\uff0c\u4e0d\u9700\u6d41\u91cf\uff0c\u8bf7\u7a0d\u540e.."

    invoke-direct/range {v17 .. v19}, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, v17

    iput-object v0, v13, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 473
    const/16 v17, 0x5

    move/from16 v0, v17

    iput v0, v13, Landroid/os/Message;->what:I

    .line 474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theHandler:Landroid/os/Handler;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 475
    const-string v14, ""

    .line 476
    .local v14, "result":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theActivity:Landroid/app/Activity;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    .line 478
    .local v2, "assetMgr":Landroid/content/res/AssetManager;
    :try_start_0
    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v10

    .line 479
    .local v10, "is":Ljava/io/InputStream;
    invoke-virtual {v10}, Ljava/io/InputStream;->available()I

    move-result v12

    .line 480
    .local v12, "lenght":I
    new-array v3, v12, [B

    .line 481
    .local v3, "buffer":[B
    invoke-virtual {v10, v3}, Ljava/io/InputStream;->read([B)I

    .line 482
    const-string v17, "UTF-8"

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lorg/apache/http/util/EncodingUtils;->getString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 483
    const-string v17, ","

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 484
    .local v5, "fileList":[Ljava/lang/String;
    move-object v1, v5

    .local v1, "arr$":[Ljava/lang/String;
    array-length v11, v1

    .local v11, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_0
    if-ge v8, v11, :cond_2

    aget-object v7, v1, v8

    .line 485
    .local v7, "filepath":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 486
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_0

    .line 484
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 488
    :cond_0
    const/16 v17, 0x2f

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    .line 489
    .local v9, "idx":I
    if-lez v9, :cond_1

    .line 490
    new-instance v15, Ljava/io/File;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 492
    .local v15, "temp":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    .line 493
    .local v6, "filePath":Ljava/lang/String;
    new-instance v16, Ljava/io/File;

    move-object/from16 v0, v16

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 494
    .local v16, "tmep1":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v17

    if-nez v17, :cond_1

    .line 495
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->mkdirs()Z

    .line 497
    .end local v6    # "filePath":Ljava/lang/String;
    .end local v15    # "temp":Ljava/io/File;
    .end local v16    # "tmep1":Ljava/io/File;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 499
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v3    # "buffer":[B
    .end local v5    # "fileList":[Ljava/lang/String;
    .end local v7    # "filepath":Ljava/lang/String;
    .end local v8    # "i$":I
    .end local v9    # "idx":I
    .end local v10    # "is":Ljava/io/InputStream;
    .end local v11    # "len$":I
    .end local v12    # "lenght":I
    :catch_0
    move-exception v4

    .line 500
    .local v4, "e":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 503
    .end local v4    # "e":Ljava/io/IOException;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    return v17

    .line 501
    :catchall_0
    move-exception v17

    throw v17
.end method


# virtual methods
.method public run()V
    .locals 34

    .prologue
    .line 521
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    .line 523
    .local v27, "start":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theActivity:Landroid/app/Activity;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 524
    .local v4, "assetMgr":Landroid/content/res/AssetManager;
    const/4 v13, 0x0

    .line 525
    .local v13, "idx":I
    const/4 v14, 0x0

    .line 526
    .local v14, "in":Ljava/io/BufferedInputStream;
    const/16 v19, 0x0

    .line 528
    .local v19, "out":Ljava/io/BufferedOutputStream;
    :try_start_0
    const-string v31, ""

    move-object/from16 v0, v31

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 529
    .local v3, "array":[Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/youai/dreamonepiece/GameLogoState$2;->isContainFileList([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v31

    if-eqz v31, :cond_6

    .line 530
    const-string v31, "filelist.txt"

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$2;->recursionSumAssetsFileNumByFileList(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    .end local v3    # "array":[Ljava/lang/String;
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 541
    .local v9, "end1":J
    sub-long v25, v9, v27

    .line 542
    .local v25, "span1":J
    sget-object v31, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "recursionSumAssetsFileNum cost time: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-wide/from16 v1, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, " millis"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    const/4 v5, 0x0

    .line 546
    .local v5, "buf":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v31

    if-lez v31, :cond_0

    .line 547
    const/16 v31, 0x2800

    move/from16 v0, v31

    new-array v5, v0, [B

    .line 549
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v31

    if-eqz v31, :cond_e

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 550
    .local v11, "filepath":Ljava/lang/String;
    add-int/lit8 v13, v13, 0x1

    .line 553
    :try_start_1
    new-instance v15, Ljava/io/BufferedInputStream;

    const/16 v31, 0x2

    move/from16 v0, v31

    invoke-virtual {v4, v11, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v31

    const v32, 0xa000

    move-object/from16 v0, v31

    move/from16 v1, v32

    invoke-direct {v15, v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 555
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .local v15, "in":Ljava/io/BufferedInputStream;
    :try_start_2
    new-instance v20, Ljava/io/BufferedOutputStream;

    new-instance v31, Ljava/io/FileOutputStream;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "/"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const v32, 0xa000

    move-object/from16 v0, v20

    move-object/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 558
    .end local v19    # "out":Ljava/io/BufferedOutputStream;
    .local v20, "out":Ljava/io/BufferedOutputStream;
    const/16 v22, 0x0

    .line 561
    .local v22, "readNum":I
    :goto_2
    const/16 v31, 0x0

    :try_start_3
    array-length v0, v5

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    invoke-virtual {v15, v5, v0, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v22

    .line 562
    if-gtz v22, :cond_7

    .line 570
    invoke-virtual/range {v20 .. v20}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_8
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 585
    if-eqz v15, :cond_2

    .line 586
    :try_start_4
    invoke-virtual {v15}, Ljava/io/BufferedInputStream;->close()V

    .line 587
    :cond_2
    if-eqz v20, :cond_3

    .line 588
    invoke-virtual/range {v20 .. v20}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    :cond_3
    move-object/from16 v19, v20

    .end local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v19    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .line 598
    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .end local v22    # "readNum":I
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    :cond_4
    :goto_3
    rem-int/lit8 v16, v13, 0x14

    .line 599
    .local v16, "itmp":I
    if-nez v16, :cond_5

    .line 600
    mul-int/lit8 v31, v13, 0x64

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->size()I

    move-result v32

    div-int v21, v31, v32

    .line 601
    .local v21, "progress":I
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "/"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->size()I

    move-result v32

    invoke-static/range {v32 .. v32}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 604
    .local v29, "text":Ljava/lang/String;
    new-instance v17, Landroid/os/Message;

    invoke-direct/range {v17 .. v17}, Landroid/os/Message;-><init>()V

    .line 605
    .local v17, "msg":Landroid/os/Message;
    new-instance v31, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    move-object/from16 v0, v31

    move/from16 v1, v21

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 606
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, v17

    iput v0, v1, Landroid/os/Message;->what:I

    .line 607
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theHandler:Landroid/os/Handler;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 610
    .end local v17    # "msg":Landroid/os/Message;
    .end local v21    # "progress":I
    .end local v29    # "text":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->resFilesPath:Ljava/util/ArrayList;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v31

    move/from16 v0, v31

    if-lt v13, v0, :cond_1

    if-lez v16, :cond_1

    .line 612
    new-instance v17, Landroid/os/Message;

    invoke-direct/range {v17 .. v17}, Landroid/os/Message;-><init>()V

    .line 613
    .restart local v17    # "msg":Landroid/os/Message;
    new-instance v31, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    const/16 v32, 0x64

    const-string v33, ", starting game"

    invoke-direct/range {v31 .. v33}, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 614
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, v17

    iput v0, v1, Landroid/os/Message;->what:I

    .line 615
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$theHandler:Landroid/os/Handler;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 617
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 618
    .local v7, "end":J
    sub-long v23, v7, v27

    .line 619
    .local v23, "span":J
    sget-object v31, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "UnzipAssetToExternalStorageResources cost time: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, " millis"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 532
    .end local v5    # "buf":[B
    .end local v7    # "end":J
    .end local v9    # "end1":J
    .end local v11    # "filepath":Ljava/lang/String;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v16    # "itmp":I
    .end local v17    # "msg":Landroid/os/Message;
    .end local v23    # "span":J
    .end local v25    # "span1":J
    .restart local v3    # "array":[Ljava/lang/String;
    :cond_6
    :try_start_5
    const-string v31, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$2;->recursionSumAssetsFileNum(Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    .line 535
    .end local v3    # "array":[Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 536
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 537
    const-string v31, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$2;->recursionSumAssetsFileNum(Ljava/lang/String;)I

    goto/16 :goto_0

    .line 566
    .end local v6    # "e":Ljava/io/IOException;
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v19    # "out":Ljava/io/BufferedOutputStream;
    .restart local v5    # "buf":[B
    .restart local v9    # "end1":J
    .restart local v11    # "filepath":Ljava/lang/String;
    .restart local v12    # "i$":Ljava/util/Iterator;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v22    # "readNum":I
    .restart local v25    # "span1":J
    :cond_7
    const/16 v31, 0x0

    :try_start_6
    move-object/from16 v0, v20

    move/from16 v1, v31

    move/from16 v2, v22

    invoke-virtual {v0, v5, v1, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_8
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto/16 :goto_2

    .line 571
    :catch_1
    move-exception v6

    move-object/from16 v19, v20

    .end local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v19    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .line 572
    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .end local v22    # "readNum":I
    .restart local v6    # "e":Ljava/io/IOException;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    :goto_4
    :try_start_7
    new-instance v30, Ljava/io/File;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "/"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 574
    .local v30, "tmp":Ljava/io/File;
    invoke-virtual/range {v30 .. v30}, Ljava/io/File;->exists()Z

    move-result v31

    if-eqz v31, :cond_8

    .line 575
    invoke-virtual/range {v30 .. v30}, Ljava/io/File;->delete()Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 585
    :cond_8
    if-eqz v14, :cond_9

    .line 586
    :try_start_8
    invoke-virtual {v14}, Ljava/io/BufferedInputStream;->close()V

    .line 587
    :cond_9
    if-eqz v19, :cond_4

    .line 588
    invoke-virtual/range {v19 .. v19}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    goto/16 :goto_3

    .line 593
    :catch_2
    move-exception v31

    goto/16 :goto_3

    .end local v6    # "e":Ljava/io/IOException;
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v19    # "out":Ljava/io/BufferedOutputStream;
    .end local v30    # "tmp":Ljava/io/File;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v22    # "readNum":I
    :catch_3
    move-exception v31

    move-object/from16 v19, v20

    .end local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v19    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .line 596
    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_3

    .line 577
    .end local v22    # "readNum":I
    :catch_4
    move-exception v18

    .line 578
    .local v18, "omm":Ljava/lang/OutOfMemoryError;
    :goto_5
    :try_start_9
    new-instance v30, Ljava/io/File;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$2;->val$appFilesResourcesPath:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "/"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 580
    .restart local v30    # "tmp":Ljava/io/File;
    invoke-virtual/range {v30 .. v30}, Ljava/io/File;->exists()Z

    move-result v31

    if-eqz v31, :cond_a

    .line 581
    invoke-virtual/range {v30 .. v30}, Ljava/io/File;->delete()Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 585
    :cond_a
    if-eqz v14, :cond_b

    .line 586
    :try_start_a
    invoke-virtual {v14}, Ljava/io/BufferedInputStream;->close()V

    .line 587
    :cond_b
    if-eqz v19, :cond_4

    .line 588
    invoke-virtual/range {v19 .. v19}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5

    goto/16 :goto_3

    .line 593
    :catch_5
    move-exception v31

    goto/16 :goto_3

    .line 584
    .end local v18    # "omm":Ljava/lang/OutOfMemoryError;
    .end local v30    # "tmp":Ljava/io/File;
    :catchall_0
    move-exception v31

    .line 585
    :goto_6
    if-eqz v14, :cond_c

    .line 586
    :try_start_b
    invoke-virtual {v14}, Ljava/io/BufferedInputStream;->close()V

    .line 587
    :cond_c
    if-eqz v19, :cond_d

    .line 588
    invoke-virtual/range {v19 .. v19}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    .line 595
    :cond_d
    :goto_7
    throw v31

    .line 626
    .end local v11    # "filepath":Ljava/lang/String;
    :cond_e
    const/4 v5, 0x0

    .line 632
    return-void

    .line 593
    .restart local v11    # "filepath":Ljava/lang/String;
    :catch_6
    move-exception v32

    goto :goto_7

    .line 584
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    :catchall_1
    move-exception v31

    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto :goto_6

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v19    # "out":Ljava/io/BufferedOutputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v22    # "readNum":I
    :catchall_2
    move-exception v31

    move-object/from16 v19, v20

    .end local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v19    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto :goto_6

    .line 577
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v22    # "readNum":I
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    :catch_7
    move-exception v18

    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto :goto_5

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v19    # "out":Ljava/io/BufferedOutputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v22    # "readNum":I
    :catch_8
    move-exception v18

    move-object/from16 v19, v20

    .end local v20    # "out":Ljava/io/BufferedOutputStream;
    .restart local v19    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto :goto_5

    .line 571
    .end local v22    # "readNum":I
    :catch_9
    move-exception v6

    goto/16 :goto_4

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    :catch_a
    move-exception v6

    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_4
.end method
