.class Lcom/youai/dreamonepiece/GameLogoState$3;
.super Ljava/lang/Thread;
.source "GameLogoState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameLogoState;->makeSureUnzipMusicSoundFiles()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private soundFilesPath:Ljava/util/ArrayList;
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

.field final synthetic val$appFilesPath:Ljava/lang/String;

.field final synthetic val$appFilesResourcesPath:Ljava/lang/String;

.field final synthetic val$theActivity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameLogoState;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 677
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    iput-object p3, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$theActivity:Landroid/app/Activity;

    iput-object p4, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesResourcesPath:Ljava/lang/String;

    iput-object p5, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesPath:Ljava/lang/String;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 680
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    return-void
.end method

.method private isContainFileList([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6
    .param p1, "files"    # [Ljava/lang/String;

    .prologue
    .line 683
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 684
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

    .line 685
    .local v1, "fileName":Ljava/lang/String;
    const-string v5, "filelist.txt"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 686
    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 690
    .end local v1    # "fileName":Ljava/lang/String;
    :cond_0
    return-object v4

    .line 684
    .restart local v1    # "fileName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private recursionSumAssetsFileNum(Ljava/lang/String;)I
    .locals 14
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v13, -0x1

    .line 695
    const/4 v8, 0x0

    .line 697
    .local v8, "num":I
    :try_start_0
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$theActivity:Landroid/app/Activity;

    invoke-virtual {v11}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 698
    .local v1, "assetMgr":Landroid/content/res/AssetManager;
    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 700
    .local v2, "assets":[Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v7, :cond_8

    aget-object v3, v0, v4

    .line 701
    .local v3, "filepath":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 700
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 703
    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    .line 705
    .local v9, "strTmp":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_2

    .line 706
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

    .line 708
    :cond_2
    const/16 v11, 0x2f

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 709
    .local v5, "idx":I
    const/16 v11, 0x2e

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 710
    .local v6, "idy":I
    if-ne v5, v13, :cond_3

    if-ne v6, v13, :cond_3

    .line 711
    invoke-direct {p0, v3}, Lcom/youai/dreamonepiece/GameLogoState$3;->recursionSumAssetsFileNum(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v8, v11

    .line 712
    new-instance v10, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesResourcesPath:Ljava/lang/String;

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

    .line 714
    .local v10, "temp":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    .line 715
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 744
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .end local v2    # "assets":[Ljava/lang/String;
    .end local v3    # "filepath":Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "idx":I
    .end local v6    # "idy":I
    .end local v7    # "len$":I
    .end local v9    # "strTmp":Ljava/lang/String;
    .end local v10    # "temp":Ljava/io/File;
    :catch_0
    move-exception v11

    .line 749
    :goto_2
    return v8

    .line 716
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .restart local v2    # "assets":[Ljava/lang/String;
    .restart local v3    # "filepath":Ljava/lang/String;
    .restart local v4    # "i$":I
    .restart local v5    # "idx":I
    .restart local v6    # "idy":I
    .restart local v7    # "len$":I
    .restart local v9    # "strTmp":Ljava/lang/String;
    :cond_3
    if-lez v5, :cond_5

    if-le v6, v5, :cond_5

    .line 717
    const-string v11, ".MP3"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_4

    const-string v11, ".WAV"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_4

    const-string v11, ".MP4"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 720
    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 721
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_1

    .line 746
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .end local v2    # "assets":[Ljava/lang/String;
    .end local v3    # "filepath":Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "idx":I
    .end local v6    # "idy":I
    .end local v7    # "len$":I
    .end local v9    # "strTmp":Ljava/lang/String;
    :catchall_0
    move-exception v11

    throw v11

    .line 723
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "assetMgr":Landroid/content/res/AssetManager;
    .restart local v2    # "assets":[Ljava/lang/String;
    .restart local v3    # "filepath":Ljava/lang/String;
    .restart local v4    # "i$":I
    .restart local v5    # "idx":I
    .restart local v6    # "idy":I
    .restart local v7    # "len$":I
    .restart local v9    # "strTmp":Ljava/lang/String;
    :cond_5
    if-ne v5, v13, :cond_7

    if-lez v6, :cond_7

    .line 724
    :try_start_1
    const-string v11, ".MP3"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    const-string v11, ".WAV"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    const-string v11, ".MP4"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 727
    :cond_6
    add-int/lit8 v8, v8, 0x1

    .line 728
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 730
    :cond_7
    if-lez v5, :cond_0

    if-ge v6, v5, :cond_0

    .line 731
    invoke-direct {p0, v3}, Lcom/youai/dreamonepiece/GameLogoState$3;->recursionSumAssetsFileNum(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v8, v11

    .line 732
    new-instance v10, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesResourcesPath:Ljava/lang/String;

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

    .line 734
    .restart local v10    # "temp":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    .line 735
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    goto/16 :goto_1

    .line 739
    .end local v3    # "filepath":Ljava/lang/String;
    .end local v5    # "idx":I
    .end local v6    # "idy":I
    .end local v9    # "strTmp":Ljava/lang/String;
    .end local v10    # "temp":Ljava/io/File;
    :cond_8
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    const-string v12, "Imageset.txt"

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 740
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    const-string v12, "version_android.cfg"

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 741
    add-int/lit8 v8, v8, 0x1

    .line 742
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2
.end method

.method private recursionSumAssetsFileNumByFileList(Ljava/lang/String;)I
    .locals 14
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 753
    const-string v10, ""

    .line 754
    .local v10, "result":Ljava/lang/String;
    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$theActivity:Landroid/app/Activity;

    invoke-virtual {v12}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 756
    .local v1, "assetMgr":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    .line 757
    .local v7, "is":Ljava/io/InputStream;
    invoke-virtual {v7}, Ljava/io/InputStream;->available()I

    move-result v9

    .line 758
    .local v9, "lenght":I
    new-array v2, v9, [B

    .line 759
    .local v2, "buffer":[B
    invoke-virtual {v7, v2}, Ljava/io/InputStream;->read([B)I

    .line 760
    const-string v12, "UTF-8"

    invoke-static {v2, v12}, Lorg/apache/http/util/EncodingUtils;->getString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 761
    const-string v12, ","

    invoke-virtual {v10, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 762
    .local v4, "fileList":[Ljava/lang/String;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v8, v0

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v8, :cond_2

    aget-object v5, v0, v6

    .line 763
    .local v5, "fileName":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v11

    .line 764
    .local v11, "strTmp":Ljava/lang/String;
    const-string v12, ".MP3"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, ".ini"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, ".WAV"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, "TXT/"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, ".EL"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, ".MP4"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 769
    :cond_0
    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 762
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 772
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v11    # "strTmp":Ljava/lang/String;
    :cond_2
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 773
    const/4 v7, 0x0

    .line 775
    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    const-string v13, "Imageset.txt"

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 776
    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    const-string v13, "version_android.cfg"

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 781
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "buffer":[B
    .end local v4    # "fileList":[Ljava/lang/String;
    .end local v6    # "i$":I
    .end local v7    # "is":Ljava/io/InputStream;
    .end local v8    # "len$":I
    .end local v9    # "lenght":I
    :goto_1
    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    return v12

    .line 778
    :catch_0
    move-exception v3

    .line 779
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 27

    .prologue
    .line 788
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$theActivity:Landroid/app/Activity;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 789
    .local v4, "assetMgr":Landroid/content/res/AssetManager;
    const/4 v13, 0x0

    .line 790
    .local v13, "idx":I
    const/4 v14, 0x0

    .line 791
    .local v14, "in":Ljava/io/BufferedInputStream;
    const/16 v16, 0x0

    .line 795
    .local v16, "out":Ljava/io/BufferedOutputStream;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    .line 797
    .local v19, "s1":J
    const/4 v5, 0x0

    .line 800
    .local v5, "assetsFileNum":I
    :try_start_0
    const-string v23, ""

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 801
    .local v3, "array":[Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/youai/dreamonepiece/GameLogoState$3;->isContainFileList([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v23

    if-eqz v23, :cond_5

    .line 802
    const-string v23, "filelist.txt"

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$3;->recursionSumAssetsFileNumByFileList(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 812
    .end local v3    # "array":[Ljava/lang/String;
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v21

    .line 813
    .local v21, "s2":J
    sget-object v23, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "cost time is :"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    sub-long v25, v21, v19

    invoke-virtual/range {v24 .. v26}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 815
    const/4 v6, 0x0

    .line 816
    .local v6, "buf":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v23

    if-lez v23, :cond_0

    .line 817
    const/16 v23, 0x2800

    move/from16 v0, v23

    new-array v6, v0, [B

    .line 819
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$3;->soundFilesPath:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_b

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 820
    .local v11, "filepath":Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 821
    add-int/lit8 v13, v13, 0x1

    .line 823
    new-instance v10, Ljava/io/File;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesResourcesPath:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "/"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-direct {v10, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 825
    .local v10, "file_tmp":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v23

    if-nez v23, :cond_1

    .line 827
    :try_start_1
    new-instance v15, Ljava/io/BufferedInputStream;

    const/16 v23, 0x2

    move/from16 v0, v23

    invoke-virtual {v4, v11, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v23

    const v24, 0xa000

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v15, v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 830
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .local v15, "in":Ljava/io/BufferedInputStream;
    :try_start_2
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v23

    if-nez v23, :cond_2

    .line 831
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 832
    invoke-virtual {v10}, Ljava/io/File;->createNewFile()Z

    move-result v23

    if-nez v23, :cond_2

    .line 833
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 834
    invoke-virtual {v10}, Ljava/io/File;->createNewFile()Z

    .line 837
    :cond_2
    new-instance v17, Ljava/io/BufferedOutputStream;

    new-instance v23, Ljava/io/FileOutputStream;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesResourcesPath:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const v24, 0xa000

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_c
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_9
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 841
    .end local v16    # "out":Ljava/io/BufferedOutputStream;
    .local v17, "out":Ljava/io/BufferedOutputStream;
    const/16 v18, 0x0

    .line 844
    .local v18, "readNum":I
    :goto_2
    const/16 v23, 0x0

    :try_start_3
    array-length v0, v6

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v15, v6, v0, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v18

    .line 845
    if-gtz v18, :cond_6

    .line 853
    invoke-virtual/range {v17 .. v17}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_a
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 860
    if-eqz v15, :cond_3

    .line 861
    :try_start_4
    invoke-virtual {v15}, Ljava/io/BufferedInputStream;->close()V

    .line 862
    :cond_3
    if-eqz v17, :cond_4

    .line 863
    invoke-virtual/range {v17 .. v17}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    :cond_4
    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v16    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .line 870
    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_1

    .line 804
    .end local v6    # "buf":[B
    .end local v10    # "file_tmp":Ljava/io/File;
    .end local v11    # "filepath":Ljava/lang/String;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v18    # "readNum":I
    .end local v21    # "s2":J
    .restart local v3    # "array":[Ljava/lang/String;
    :cond_5
    :try_start_5
    const-string v23, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$3;->recursionSumAssetsFileNum(Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    move-result v5

    goto/16 :goto_0

    .line 807
    .end local v3    # "array":[Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 808
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    .line 809
    const-string v23, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$3;->recursionSumAssetsFileNum(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_0

    .line 849
    .end local v9    # "e":Ljava/io/IOException;
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v16    # "out":Ljava/io/BufferedOutputStream;
    .restart local v6    # "buf":[B
    .restart local v10    # "file_tmp":Ljava/io/File;
    .restart local v11    # "filepath":Ljava/lang/String;
    .restart local v12    # "i$":Ljava/util/Iterator;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v18    # "readNum":I
    .restart local v21    # "s2":J
    :cond_6
    const/16 v23, 0x0

    :try_start_6
    move-object/from16 v0, v17

    move/from16 v1, v23

    move/from16 v2, v18

    invoke-virtual {v0, v6, v1, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_a
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_2

    .line 854
    :catch_1
    move-exception v23

    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v16    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .line 860
    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .end local v18    # "readNum":I
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    :goto_3
    if-eqz v14, :cond_7

    .line 861
    :try_start_7
    invoke-virtual {v14}, Ljava/io/BufferedInputStream;->close()V

    .line 862
    :cond_7
    if-eqz v16, :cond_1

    .line 863
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto/16 :goto_1

    .line 868
    :catch_2
    move-exception v23

    goto/16 :goto_1

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v16    # "out":Ljava/io/BufferedOutputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v18    # "readNum":I
    :catch_3
    move-exception v23

    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v16    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .line 871
    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_1

    .line 856
    .end local v18    # "readNum":I
    :catch_4
    move-exception v23

    .line 860
    :goto_4
    if-eqz v14, :cond_8

    .line 861
    :try_start_8
    invoke-virtual {v14}, Ljava/io/BufferedInputStream;->close()V

    .line 862
    :cond_8
    if-eqz v16, :cond_1

    .line 863
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto/16 :goto_1

    .line 868
    :catch_5
    move-exception v23

    goto/16 :goto_1

    .line 859
    :catchall_0
    move-exception v23

    .line 860
    :goto_5
    if-eqz v14, :cond_9

    .line 861
    :try_start_9
    invoke-virtual {v14}, Ljava/io/BufferedInputStream;->close()V

    .line 862
    :cond_9
    if-eqz v16, :cond_a

    .line 863
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_8

    .line 870
    :cond_a
    :goto_6
    throw v23

    .line 877
    .end local v10    # "file_tmp":Ljava/io/File;
    .end local v11    # "filepath":Ljava/lang/String;
    :cond_b
    const/4 v6, 0x0

    .line 879
    if-lt v13, v5, :cond_d

    .line 880
    new-instance v7, Ljava/io/File;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState$3;->val$appFilesPath:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "/config.properties"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 881
    .local v7, "cfg":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v23

    if-eqz v23, :cond_c

    .line 882
    new-instance v8, Ljava/util/Properties;

    invoke-direct {v8}, Ljava/util/Properties;-><init>()V

    .line 884
    .local v8, "cfgIni":Ljava/util/Properties;
    :try_start_a
    new-instance v23, Ljava/io/FileInputStream;

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v23

    invoke-virtual {v8, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 885
    const-string v23, "hasUnzipSound"

    const-string v24, "true"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v8, v0, v1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 887
    new-instance v23, Ljava/io/FileOutputStream;

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v24, "last upzip sound files"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v8, v0, v1}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6

    .line 895
    :goto_7
    const/4 v7, 0x0

    .line 899
    .end local v8    # "cfgIni":Ljava/util/Properties;
    :cond_c
    sget-object v23, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v24, "UnzipedMusicSoundFiles"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 906
    .end local v7    # "cfg":Ljava/io/File;
    :cond_d
    return-void

    .line 891
    .restart local v7    # "cfg":Ljava/io/File;
    .restart local v8    # "cfgIni":Ljava/util/Properties;
    :catch_6
    move-exception v23

    goto :goto_7

    .line 889
    :catch_7
    move-exception v23

    goto :goto_7

    .line 868
    .end local v7    # "cfg":Ljava/io/File;
    .end local v8    # "cfgIni":Ljava/util/Properties;
    .restart local v10    # "file_tmp":Ljava/io/File;
    .restart local v11    # "filepath":Ljava/lang/String;
    :catch_8
    move-exception v24

    goto :goto_6

    .line 859
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    :catchall_1
    move-exception v23

    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto :goto_5

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v16    # "out":Ljava/io/BufferedOutputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v18    # "readNum":I
    :catchall_2
    move-exception v23

    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v16    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto :goto_5

    .line 856
    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v18    # "readNum":I
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    :catch_9
    move-exception v23

    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_4

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .end local v16    # "out":Ljava/io/BufferedOutputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v18    # "readNum":I
    :catch_a
    move-exception v23

    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/BufferedOutputStream;
    .restart local v16    # "out":Ljava/io/BufferedOutputStream;
    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_4

    .line 854
    .end local v18    # "readNum":I
    :catch_b
    move-exception v23

    goto/16 :goto_3

    .end local v14    # "in":Ljava/io/BufferedInputStream;
    .restart local v15    # "in":Ljava/io/BufferedInputStream;
    :catch_c
    move-exception v23

    move-object v14, v15

    .end local v15    # "in":Ljava/io/BufferedInputStream;
    .restart local v14    # "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_3
.end method
