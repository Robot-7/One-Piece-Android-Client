.class public Lcom/youai/dreamonepiece/GameLogoState;
.super Ljava/lang/Object;
.source "GameLogoState.java"

# interfaces
.implements Lcom/youai/IGameActivityState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;,
        Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;,
        Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;
    }
.end annotation


# static fields
.field private static final HANDLER_MSG_TO_MAINTHREAD_DeleteDirtyFileDirectoryDelay:I = 0x4

.field private static final HANDLER_MSG_TO_MAINTHREAD_DoEnterDelay:I = 0x7

.field private static final HANDLER_MSG_TO_MAINTHREAD_ExternalStorageNotOK:I = 0x6

.field private static final HANDLER_MSG_TO_MAINTHREAD_NetwrokNotOK:I = 0x1

.field private static final HANDLER_MSG_TO_MAINTHREAD_ShowLogoViewDelay:I = 0x3

.field private static final HANDLER_MSG_TO_MAINTHREAD_UpdateMoveAssetResProgress:I = 0x0

.field private static final HANDLER_MSG_TO_MAINTHREAD_UpdateMoveAssetResText:I = 0x5

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mAppFilesPath:Ljava/lang/String;

.field private mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

.field private mAssetsUnzipTextView:Landroid/widget/TextView;

.field private mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

.field private mExternalStorageEnough:Z

.field private mExternalStorageOK:Z

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

.field private mNetworkOK:Z

.field private mStateMgr:Lcom/youai/IStateManager;

.field private mUnzipedAssets:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-class v0, Lcom/youai/dreamonepiece/GameLogoState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/IStateManager;Lcom/youai/IGameActivity;Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;)V
    .locals 3
    .param p1, "pStateMgr"    # Lcom/youai/IStateManager;
    .param p2, "pGameActivity"    # Lcom/youai/IGameActivity;
    .param p3, "pCallback"    # Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1199
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    .line 1202
    iput-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mUnzipedAssets:Z

    .line 1205
    iput-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    .line 1208
    iput-boolean v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageOK:Z

    .line 1209
    iput-boolean v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageEnough:Z

    .line 1212
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

    .line 1213
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    .line 1309
    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    .line 174
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mStateMgr:Lcom/youai/IStateManager;

    .line 175
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 176
    iput-object p3, p0, Lcom/youai/dreamonepiece/GameLogoState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

    .line 177
    return-void
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IStateManager;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mStateMgr:Lcom/youai/IStateManager;

    return-object v0
.end method

.method static synthetic access$102(Lcom/youai/dreamonepiece/GameLogoState;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mUnzipedAssets:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/youai/dreamonepiece/GameLogoState;Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;
    .param p1, "x1"    # Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameLogoState;->showDialog(Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/youai/dreamonepiece/GameLogoState;)V
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->requestUnzipAssetToExternalStorageResources()V

    return-void
.end method

.method static synthetic access$1300(Lcom/youai/dreamonepiece/GameLogoState;)V
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->doEnter()V

    return-void
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/GameLogoState;)V
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->checkStorageStatus()V

    return-void
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/GameLogoState;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/GameLogoState;)V
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->saveConfigFileFirstTime()V

    return-void
.end method

.method static synthetic access$600(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    return-object v0
.end method

.method static synthetic access$700(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$800(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/youai/dreamonepiece/GameLogoState;)Z
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameLogoState;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    return v0
.end method

.method private checkExternalStorageResourcesStatus()Z
    .locals 14

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1081
    const/4 v7, 0x1

    .line 1082
    .local v7, "isForceUnzipAssets":Z
    new-instance v2, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "/config.properties"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v2, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1083
    .local v2, "cfg":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 1084
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 1085
    .local v3, "cfgIni":Ljava/util/Properties;
    const/4 v6, 0x0

    .line 1087
    .local v6, "forceUnzip":Ljava/lang/String;
    :try_start_0
    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v3, v11}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 1088
    const-string v11, "forceUnzipAssets"

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1090
    if-eqz v6, :cond_0

    const-string v11, "true"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 1091
    const-string v11, "forceUnzipAssets"

    const-string v12, "false"

    invoke-virtual {v3, v11, v12}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 1092
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v12, "auto save, change from true to false"

    invoke-virtual {v3, v11, v12}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1102
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 1103
    const/4 v3, 0x0

    .line 1105
    if-eqz v6, :cond_3

    const-string v11, "true"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 1106
    const/4 v7, 0x1

    .line 1127
    .end local v6    # "forceUnzip":Ljava/lang/String;
    :goto_1
    new-instance v8, Ljava/io/File;

    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v11}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1128
    .local v8, "resources":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v8}, Ljava/io/File;->canRead()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v8}, Ljava/io/File;->canWrite()Z

    move-result v11

    if-nez v11, :cond_6

    .line 1130
    :cond_1
    sget-object v11, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "AppDataExternalStorageResourcesFullPath: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v13}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " is not OK!"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1132
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 1133
    const/4 v8, 0x0

    .line 1134
    if-eqz v7, :cond_5

    .line 1182
    :cond_2
    :goto_2
    return v9

    .line 1108
    .end local v8    # "resources":Ljava/io/File;
    .restart local v6    # "forceUnzip":Ljava/lang/String;
    :cond_3
    const/4 v7, 0x0

    goto :goto_1

    .line 1111
    .end local v3    # "cfgIni":Ljava/util/Properties;
    .end local v6    # "forceUnzip":Ljava/lang/String;
    :cond_4
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 1112
    .restart local v3    # "cfgIni":Ljava/util/Properties;
    const-string v11, "forceUnzipAssets"

    const-string v12, "false"

    invoke-virtual {v3, v11, v12}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 1114
    :try_start_1
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v12, "auto save, default false"

    invoke-virtual {v3, v11, v12}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1122
    :goto_3
    const/4 v2, 0x0

    .line 1123
    goto :goto_1

    .restart local v8    # "resources":Ljava/io/File;
    :cond_5
    move v9, v10

    .line 1137
    goto :goto_2

    .line 1141
    :cond_6
    if-nez v7, :cond_7

    .line 1142
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->checkExternalStorageResourcesVersion()Z

    move-result v7

    .line 1146
    :cond_7
    iget-object v11, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v11}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v11

    invoke-virtual {v11}, Lcom/youai/dreamonepiece/GameActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 1150
    .local v0, "assetMgr":Landroid/content/res/AssetManager;
    :try_start_2
    const-string v11, ""

    invoke-virtual {v0, v11}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1151
    .local v1, "assets":[Ljava/lang/String;
    invoke-virtual {v8}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v5

    .line 1153
    .local v5, "files":[Ljava/lang/String;
    const/4 v8, 0x0

    .line 1155
    sget-object v11, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "assets.length: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    array-length v13, v1

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " resources.length: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    array-length v13, v5

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1158
    array-length v11, v5

    array-length v12, v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    if-ge v11, v12, :cond_8

    .line 1159
    if-nez v7, :cond_2

    move v9, v10

    .line 1162
    goto :goto_2

    .line 1170
    .end local v1    # "assets":[Ljava/lang/String;
    .end local v5    # "files":[Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 1173
    .local v4, "e":Ljava/io/IOException;
    if-nez v7, :cond_2

    move v9, v10

    .line 1176
    goto :goto_2

    .line 1179
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v1    # "assets":[Ljava/lang/String;
    .restart local v5    # "files":[Ljava/lang/String;
    :cond_8
    if-nez v7, :cond_2

    move v9, v10

    .line 1182
    goto :goto_2

    .line 1118
    .end local v0    # "assetMgr":Landroid/content/res/AssetManager;
    .end local v1    # "assets":[Ljava/lang/String;
    .end local v5    # "files":[Ljava/lang/String;
    .end local v8    # "resources":Ljava/io/File;
    :catch_1
    move-exception v11

    goto :goto_3

    .line 1116
    :catch_2
    move-exception v11

    goto :goto_3

    .line 1098
    .restart local v6    # "forceUnzip":Ljava/lang/String;
    :catch_3
    move-exception v11

    goto/16 :goto_0

    .line 1096
    :catch_4
    move-exception v11

    goto/16 :goto_0
.end method

.method private checkExternalStorageResourcesVersion()Z
    .locals 20

    .prologue
    .line 954
    new-instance v16, Ljava/io/File;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/version_android.cfg"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 956
    .local v16, "version_cfg":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v17

    if-nez v17, :cond_0

    .line 957
    const/16 v16, 0x0

    .line 958
    const/16 v17, 0x1

    .line 1056
    :goto_0
    return v17

    .line 961
    :cond_0
    const/16 v17, 0x1000

    move/from16 v0, v17

    new-array v5, v0, [B

    .line 963
    .local v5, "buf1":[B
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 964
    .local v8, "inp1":Ljava/io/FileInputStream;
    invoke-virtual {v8, v5}, Ljava/io/FileInputStream;->read([B)I

    .line 965
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 974
    new-instance v13, Ljava/lang/String;

    invoke-direct {v13, v5}, Ljava/lang/String;-><init>([B)V

    .line 975
    .local v13, "str1":Ljava/lang/String;
    const-string v12, ""

    .line 978
    .local v12, "local_version":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONTokener;

    invoke-direct {v10, v13}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 980
    .local v10, "jsonParser":Lorg/json/JSONTokener;
    :try_start_1
    invoke-virtual {v10}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/json/JSONObject;

    .line 981
    .local v15, "version":Lorg/json/JSONObject;
    const-string v17, "localVerson"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v12

    .line 991
    const/4 v13, 0x0

    .line 992
    const/4 v5, 0x0

    .line 994
    const/16 v17, 0x1000

    move/from16 v0, v17

    new-array v6, v0, [B

    .line 995
    .local v6, "buf2":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/youai/dreamonepiece/GameActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 997
    .local v4, "assetMgr":Landroid/content/res/AssetManager;
    :try_start_2
    const-string v17, "version_android.cfg"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9

    .line 998
    .local v9, "inp2":Ljava/io/InputStream;
    invoke-virtual {v9, v6}, Ljava/io/InputStream;->read([B)I

    .line 999
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1007
    new-instance v14, Ljava/lang/String;

    invoke-direct {v14, v6}, Ljava/lang/String;-><init>([B)V

    .line 1008
    .local v14, "str2":Ljava/lang/String;
    const-string v3, ""

    .line 1011
    .local v3, "apk_version":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONTokener;

    .end local v10    # "jsonParser":Lorg/json/JSONTokener;
    invoke-direct {v10, v14}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 1013
    .restart local v10    # "jsonParser":Lorg/json/JSONTokener;
    :try_start_3
    invoke-virtual {v10}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "version":Lorg/json/JSONObject;
    check-cast v15, Lorg/json/JSONObject;

    .line 1014
    .restart local v15    # "version":Lorg/json/JSONObject;
    const-string v17, "localVerson"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v3

    .line 1023
    const/4 v14, 0x0

    .line 1024
    const/4 v6, 0x0

    .line 1025
    const-string v17, "\\."

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1026
    .local v2, "apkVer":[Ljava/lang/String;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v19, 0x0

    aget-object v19, v2, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x1

    aget-object v19, v2, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x2

    aget-object v19, v2, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1027
    const-string v17, "\\."

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 1028
    .local v11, "localVer":[Ljava/lang/String;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v19, 0x0

    aget-object v19, v11, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x1

    aget-object v19, v11, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x2

    aget-object v19, v11, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1030
    const/16 v17, 0x0

    :try_start_4
    aget-object v17, v2, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, 0x0

    aget-object v18, v11, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_1

    .line 1031
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 967
    .end local v2    # "apkVer":[Ljava/lang/String;
    .end local v3    # "apk_version":Ljava/lang/String;
    .end local v4    # "assetMgr":Landroid/content/res/AssetManager;
    .end local v6    # "buf2":[B
    .end local v8    # "inp1":Ljava/io/FileInputStream;
    .end local v9    # "inp2":Ljava/io/InputStream;
    .end local v10    # "jsonParser":Lorg/json/JSONTokener;
    .end local v11    # "localVer":[Ljava/lang/String;
    .end local v12    # "local_version":Ljava/lang/String;
    .end local v13    # "str1":Ljava/lang/String;
    .end local v14    # "str2":Ljava/lang/String;
    .end local v15    # "version":Lorg/json/JSONObject;
    :catch_0
    move-exception v7

    .line 969
    .local v7, "e":Ljava/lang/Exception;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v18, "local unzip storage version_android.cfg file not exist!"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 971
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 982
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v8    # "inp1":Ljava/io/FileInputStream;
    .restart local v10    # "jsonParser":Lorg/json/JSONTokener;
    .restart local v12    # "local_version":Ljava/lang/String;
    .restart local v13    # "str1":Ljava/lang/String;
    :catch_1
    move-exception v7

    .line 984
    .local v7, "e":Lorg/json/JSONException;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v18, "local unzip storage version.cfg file json parse failed!"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 986
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 1001
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v4    # "assetMgr":Landroid/content/res/AssetManager;
    .restart local v6    # "buf2":[B
    .restart local v15    # "version":Lorg/json/JSONObject;
    :catch_2
    move-exception v7

    .line 1003
    .local v7, "e":Ljava/io/IOException;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v18, "apk assets version_android.cfg file not exist!"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1004
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 1015
    .end local v7    # "e":Ljava/io/IOException;
    .end local v15    # "version":Lorg/json/JSONObject;
    .restart local v3    # "apk_version":Ljava/lang/String;
    .restart local v9    # "inp2":Ljava/io/InputStream;
    .restart local v14    # "str2":Ljava/lang/String;
    :catch_3
    move-exception v7

    .line 1017
    .local v7, "e":Lorg/json/JSONException;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v18, "apk assets version_android.cfg file parse failed!"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1018
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 1032
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v2    # "apkVer":[Ljava/lang/String;
    .restart local v11    # "localVer":[Ljava/lang/String;
    .restart local v15    # "version":Lorg/json/JSONObject;
    :cond_1
    const/16 v17, 0x0

    :try_start_5
    aget-object v17, v2, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, 0x0

    aget-object v18, v11, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_2

    .line 1034
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 1036
    :cond_2
    const/16 v17, 0x1

    aget-object v17, v2, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, 0x1

    aget-object v18, v11, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_3

    .line 1037
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 1038
    :cond_3
    const/16 v17, 0x1

    aget-object v17, v2, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, 0x1

    aget-object v18, v11, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_4

    .line 1040
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 1042
    :cond_4
    const/16 v17, 0x2

    aget-object v17, v2, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, 0x2

    aget-object v18, v11, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_5

    .line 1043
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 1047
    :catch_4
    move-exception v7

    .line 1048
    .local v7, "e":Ljava/lang/Exception;
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v18, "compare apkversion and localversion failed"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1049
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 1051
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_5
    sget-object v17, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "apk_version:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ", local_version:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1056
    const/16 v17, 0x0

    goto/16 :goto_0
.end method

.method private checkNetworkStatus()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 915
    iget-object v3, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v3}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v3

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Lcom/youai/dreamonepiece/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 917
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v6}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 918
    .local v2, "niWiFi":Landroid/net/NetworkInfo;
    invoke-virtual {v0, v5}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 921
    .local v1, "niMobile":Landroid/net/NetworkInfo;
    if-nez v2, :cond_1

    if-eqz v1, :cond_1

    .line 922
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 923
    iput-boolean v6, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    .line 944
    :goto_0
    return-void

    .line 925
    :cond_0
    iput-boolean v5, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    goto :goto_0

    .line 928
    :cond_1
    if-nez v1, :cond_3

    if-eqz v2, :cond_3

    .line 929
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 930
    iput-boolean v6, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    goto :goto_0

    .line 932
    :cond_2
    iput-boolean v5, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    goto :goto_0

    .line 935
    :cond_3
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_4
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_6

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_6

    .line 940
    :cond_5
    iput-boolean v5, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    goto :goto_0

    .line 942
    :cond_6
    iput-boolean v6, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    goto :goto_0
.end method

.method private checkStorageStatus()V
    .locals 19

    .prologue
    .line 245
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v7

    .line 246
    .local v7, "exStorageState":Ljava/lang/String;
    sget-object v15, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Environment.getExternalStorageState():"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const-string v15, "mounted"

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    const-string v15, "shared"

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 249
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageOK:Z

    .line 371
    :goto_0
    return-void

    .line 255
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v15}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v15

    const-string v16, "ResourcesInfo"

    const/16 v17, 0x0

    invoke-virtual/range {v15 .. v17}, Lcom/youai/dreamonepiece/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 257
    .local v12, "sp":Landroid/content/SharedPreferences;
    const-string v15, "StorageFullPath"

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-interface {v12, v15, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 258
    .local v13, "spath":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 259
    .local v3, "dir":Ljava/io/File;
    const-string v15, "UnzipedAssets"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-interface {v12, v15, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    .line 260
    .local v14, "unziped":Z
    if-nez v14, :cond_7

    .line 261
    const-string v15, ""

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 262
    invoke-static {v3}, Lcom/youai/StorageUtil;->removeFileDirectory(Ljava/io/File;)V

    .line 263
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 265
    :cond_1
    const-string v13, ""

    .line 281
    :cond_2
    :goto_1
    const/4 v3, 0x0

    .line 283
    const-string v15, ""

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 284
    const/4 v2, 0x0

    .line 285
    .local v2, "appFilesPath":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v15}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v15

    invoke-virtual {v15}, Lcom/youai/dreamonepiece/GameActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 287
    .local v1, "appFilesDir":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v15

    const-string v16, "mounted"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_c

    .line 289
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    .line 291
    .local v8, "externalStorageDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->canRead()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-virtual {v8}, Ljava/io/File;->canWrite()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-virtual {v8}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v15

    const-wide/32 v17, 0xc800000

    cmp-long v15, v15, v17

    if-gez v15, :cond_b

    .line 294
    :cond_3
    const-wide/32 v15, 0xfa00000

    invoke-static/range {v15 .. v16}, Lcom/youai/StorageUtil;->getSecondStorageWithFreeSize(J)Ljava/lang/String;

    move-result-object v11

    .line 296
    .local v11, "secondPath":Ljava/lang/String;
    if-eqz v11, :cond_9

    .line 297
    move-object v2, v11

    .line 324
    .end local v11    # "secondPath":Ljava/lang/String;
    :cond_4
    :goto_2
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_10

    .line 325
    new-instance v9, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/Android/Data"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v9, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 326
    .local v9, "file1":Ljava/io/File;
    new-instance v10, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/Android/data"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v10, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 327
    .local v10, "file2":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_d

    .line 328
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/Android/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/files"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 348
    .end local v9    # "file1":Ljava/io/File;
    .end local v10    # "file2":Ljava/io/File;
    :goto_3
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 349
    .local v6, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v15, "StorageFullPath"

    invoke-interface {v6, v15, v13}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 350
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 353
    .end local v1    # "appFilesDir":Ljava/io/File;
    .end local v2    # "appFilesPath":Ljava/lang/String;
    .end local v6    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v8    # "externalStorageDir":Ljava/io/File;
    :cond_5
    if-nez v14, :cond_6

    .line 356
    new-instance v5, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/config.properties"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v5, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 357
    .local v5, "dir2":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_6

    .line 358
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 359
    const/4 v14, 0x1

    .line 367
    .end local v5    # "dir2":Ljava/io/File;
    :cond_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/youai/dreamonepiece/GameLogoState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

    invoke-interface {v15, v13}, Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;->initAppDataPath(Ljava/lang/String;)V

    .line 369
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    .line 370
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/youai/dreamonepiece/GameLogoState;->mUnzipedAssets:Z

    goto/16 :goto_0

    .line 267
    :cond_7
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_8

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v15

    if-nez v15, :cond_2

    .line 268
    :cond_8
    const-string v13, ""

    .line 270
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 271
    .restart local v6    # "edit":Landroid/content/SharedPreferences$Editor;
    const-string v15, "UnzipedAssets"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-interface {v6, v15, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 272
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 274
    const/4 v14, 0x0

    .line 276
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 277
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto/16 :goto_1

    .line 299
    .end local v6    # "edit":Landroid/content/SharedPreferences$Editor;
    .restart local v1    # "appFilesDir":Ljava/io/File;
    .restart local v2    # "appFilesPath":Ljava/lang/String;
    .restart local v8    # "externalStorageDir":Ljava/io/File;
    .restart local v11    # "secondPath":Ljava/lang/String;
    :cond_9
    invoke-virtual {v8}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v15

    const-wide/16 v17, 0x2

    mul-long v15, v15, v17

    invoke-static/range {v15 .. v16}, Lcom/youai/StorageUtil;->getSecondStorageWithFreeSize(J)Ljava/lang/String;

    move-result-object v11

    .line 302
    if-eqz v11, :cond_a

    .line 303
    move-object v2, v11

    .line 308
    :goto_4
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 309
    .local v4, "dir1":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v15

    const-wide/32 v17, 0xa00000

    cmp-long v15, v15, v17

    if-gez v15, :cond_4

    .line 310
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 311
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageEnough:Z

    goto/16 :goto_0

    .line 305
    .end local v4    # "dir1":Ljava/io/File;
    :cond_a
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 316
    .end local v11    # "secondPath":Ljava/lang/String;
    :cond_b
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2

    .line 319
    .end local v8    # "externalStorageDir":Ljava/io/File;
    :cond_c
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 320
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageOK:Z

    goto/16 :goto_0

    .line 331
    .restart local v8    # "externalStorageDir":Ljava/io/File;
    .restart local v9    # "file1":Ljava/io/File;
    .restart local v10    # "file2":Ljava/io/File;
    :cond_d
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_e

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_e

    .line 332
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/Android/Data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/files"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_3

    .line 335
    :cond_e
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_f

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v15

    if-eqz v15, :cond_f

    .line 336
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/Android/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/files"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_3

    .line 340
    :cond_f
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/Android/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/files"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_3

    .line 345
    .end local v9    # "file1":Ljava/io/File;
    .end local v10    # "file2":Ljava/io/File;
    :cond_10
    move-object v13, v2

    goto/16 :goto_3
.end method

.method private doEnter()V
    .locals 5

    .prologue
    const/4 v4, 0x6

    const v3, 0x7f0a0004

    .line 69
    sget-object v1, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v2, "doEnter GameLogoState"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    const v2, 0x7f090051

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    .line 74
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->checkNetworkStatus()V

    .line 75
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->checkStorageStatus()V

    .line 77
    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageOK:Z

    if-nez v1, :cond_0

    .line 78
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, v4}, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 85
    .local v0, "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    invoke-direct {p0, v0}, Lcom/youai/dreamonepiece/GameLogoState;->showDialog(Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V

    .line 146
    .end local v0    # "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    :goto_0
    return-void

    .line 87
    :cond_0
    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mExternalStorageEnough:Z

    if-nez v1, :cond_1

    .line 88
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, v4}, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 98
    .restart local v0    # "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    invoke-direct {p0, v0}, Lcom/youai/dreamonepiece/GameLogoState;->showDialog(Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V

    goto :goto_0

    .line 102
    .end local v0    # "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    :cond_1
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-static {v1}, Lcom/youai/dreamonepiece/LastLoginHelp;->setActivity(Lcom/youai/dreamonepiece/GameActivity;)V

    .line 106
    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mUnzipedAssets:Z

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->checkExternalStorageResourcesStatus()Z

    move-result v1

    if-nez v1, :cond_4

    .line 108
    :cond_2
    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mUnzipedAssets:Z

    if-nez v1, :cond_3

    .line 109
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->saveConfigFileFirstTime()V

    .line 111
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    const-string v2, "\u89e3\u538b\u8d44\u6e90\uff0c\u4e0d\u9700\u6d41\u91cf\uff0c\u8bf7\u7a0d\u540e"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->requestUnzipAssetToExternalStorageResources()V

    goto :goto_0

    .line 123
    :cond_3
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    const-string v2, "\u6e05\u9664\u672c\u5730\u65e7\u76ee\u5f55\uff0c\u8bf7\u7a0d\u540e"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->removeExistDirtyFileDirectory()V

    goto :goto_0

    .line 129
    :cond_4
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->makeSureUnzipMusicSoundFiles()V

    .line 131
    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mNetworkOK:Z

    if-eqz v1, :cond_5

    .line 132
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    const/4 v2, 0x3

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 135
    :cond_5
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v2}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0005

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 142
    .restart local v0    # "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    invoke-direct {p0, v0}, Lcom/youai/dreamonepiece/GameLogoState;->showDialog(Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V

    goto/16 :goto_0
.end method

.method private makeSureUnzipMusicSoundFiles()V
    .locals 9

    .prologue
    .line 646
    sget-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v1, "makeSureUnzipMusicSoundFiles"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    new-instance v6, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/config.properties"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 650
    .local v6, "cfg":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 651
    new-instance v7, Ljava/util/Properties;

    invoke-direct {v7}, Ljava/util/Properties;-><init>()V

    .line 652
    .local v7, "cfgIni":Ljava/util/Properties;
    const/4 v8, 0x0

    .line 654
    .local v8, "hasUnzipSound":Ljava/lang/String;
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v7, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 655
    const-string v0, "hasUnzipSound"

    const/4 v1, 0x0

    invoke-virtual {v7, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 663
    :goto_0
    const/4 v6, 0x0

    .line 664
    const/4 v7, 0x0

    .line 666
    if-eqz v8, :cond_0

    const-string v0, "true"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 909
    .end local v7    # "cfgIni":Ljava/util/Properties;
    .end local v8    # "hasUnzipSound":Ljava/lang/String;
    :goto_1
    return-void

    .line 672
    :cond_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v3

    .line 673
    .local v3, "theActivity":Landroid/app/Activity;
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    .line 674
    .local v5, "appFilesPath":Ljava/lang/String;
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v4

    .line 677
    .local v4, "appFilesResourcesPath":Ljava/lang/String;
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$3;

    const-string v2, "MoveSoundFilesToExternalStorageThread"

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/youai/dreamonepiece/GameLogoState$3;-><init>(Lcom/youai/dreamonepiece/GameLogoState;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameLogoState$3;->start()V

    goto :goto_1

    .line 659
    .end local v3    # "theActivity":Landroid/app/Activity;
    .end local v4    # "appFilesResourcesPath":Ljava/lang/String;
    .end local v5    # "appFilesPath":Ljava/lang/String;
    .restart local v7    # "cfgIni":Ljava/util/Properties;
    .restart local v8    # "hasUnzipSound":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_0

    .line 657
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method private removeExistDirtyFileDirectory()V
    .locals 2

    .prologue
    .line 183
    sget-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v1, "removeExistDirtyFileDirectory"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$1;

    const-string v1, "RemoveExistDirtyFileDirectoryThread"

    invoke-direct {v0, p0, v1}, Lcom/youai/dreamonepiece/GameLogoState$1;-><init>(Lcom/youai/dreamonepiece/GameLogoState;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameLogoState$1;->start()V

    .line 239
    return-void
.end method

.method private requestUnzipAssetToExternalStorageResources()V
    .locals 10

    .prologue
    .line 376
    sget-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v1, "requestUnzipAssetToExternalStorageResources"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v4

    .line 384
    .local v4, "appFilesResourcesPath":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    .local v6, "dir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v0

    const-wide/32 v8, 0x6400000

    cmp-long v0, v0, v8

    if-gez v0, :cond_0

    .line 386
    sget-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v1, "not enough usable storage space"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameLogoState;->makeSureUnzipMusicSoundFiles()V

    .line 391
    new-instance v7, Landroid/os/Message;

    invoke-direct {v7}, Landroid/os/Message;-><init>()V

    .line 392
    .local v7, "msg":Landroid/os/Message;
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    const/16 v1, 0x64

    const-string v2, ", starting game"

    invoke-direct {v0, v1, v2}, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;-><init>(ILjava/lang/String;)V

    iput-object v0, v7, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 393
    const/4 v0, 0x0

    iput v0, v7, Landroid/os/Message;->what:I

    .line 394
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    const-wide/16 v1, 0x7d0

    invoke-virtual {v0, v7, v1, v2}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 397
    const/4 v6, 0x0

    .line 638
    .end local v7    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 403
    :cond_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v3

    .line 404
    .local v3, "theActivity":Landroid/app/Activity;
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    .line 408
    .local v5, "theHandler":Landroid/os/Handler;
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$2;

    const-string v2, "MoveAssetToExternalStorageThread"

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/youai/dreamonepiece/GameLogoState$2;-><init>(Lcom/youai/dreamonepiece/GameLogoState;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameLogoState$2;->start()V

    goto :goto_0
.end method

.method private saveConfigFileFirstTime()V
    .locals 4

    .prologue
    .line 1060
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAppFilesPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/config.properties"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1061
    .local v0, "cfg":Ljava/io/File;
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 1062
    .local v1, "cfgIni":Ljava/util/Properties;
    const-string v2, "forceUnzipAssets"

    const-string v3, "false"

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 1064
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v3, "auto save, default false"

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1071
    :goto_0
    const/4 v0, 0x0

    .line 1072
    const/4 v1, 0x0

    .line 1073
    return-void

    .line 1067
    :catch_0
    move-exception v2

    goto :goto_0

    .line 1065
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private showDialog(Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V
    .locals 7
    .param p1, "msg"    # Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;

    .prologue
    .line 1315
    iget-object v3, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 1316
    .local v3, "theActivity":Lcom/youai/IGameActivity;
    iget v2, p1, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;->msgId:I

    .line 1318
    .local v2, "tag":I
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-interface {v3}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v5, p1, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;->titile:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    iget-object v5, p1, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;->message:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "\u786e\u5b9a"

    new-instance v6, Lcom/youai/dreamonepiece/GameLogoState$5;

    invoke-direct {v6, p0, v2, v3}, Lcom/youai/dreamonepiece/GameLogoState$5;-><init>(Lcom/youai/dreamonepiece/GameLogoState;ILcom/youai/IGameActivity;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lcom/youai/dreamonepiece/GameLogoState$4;

    invoke-direct {v5, p0, v2, v3}, Lcom/youai/dreamonepiece/GameLogoState$4;-><init>(Lcom/youai/dreamonepiece/GameLogoState;ILcom/youai/IGameActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1352
    .local v0, "dlg":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 1354
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1355
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1356
    return-void
.end method


# virtual methods
.method public enter()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameActivity;->setCanPressBack(Z)V

    .line 54
    sget-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v1, "enter GameLogoState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    const v1, 0x7f030005

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameActivity;->setContentView(I)V

    .line 59
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    const v1, 0x7f090052

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

    .line 61
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 63
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;-><init>(Lcom/youai/dreamonepiece/GameLogoState;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    .line 64
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    const/4 v1, 0x7

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 66
    return-void
.end method

.method public exit()V
    .locals 3

    .prologue
    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 150
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 151
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 153
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipProgressBar:Landroid/widget/ProgressBar;

    .line 154
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mAssetsUnzipTextView:Landroid/widget/TextView;

    .line 156
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mStateMgr:Lcom/youai/IStateManager;

    .line 157
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mGameActivity:Lcom/youai/IGameActivity;

    .line 158
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mCallback:Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

    .line 160
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->removeMessages(I)V

    .line 161
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->removeMessages(I)V

    .line 162
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->removeMessages(I)V

    .line 164
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameLogoState;->mHandler:Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    .line 166
    sget-object v0, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    const-string v1, "exit GameLogoState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    return-void
.end method
