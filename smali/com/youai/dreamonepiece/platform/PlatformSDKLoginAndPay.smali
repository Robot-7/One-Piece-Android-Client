.class public Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;
.super Ljava/lang/Object;
.source "PlatformSDKLoginAndPay.java"

# interfaces
.implements Lcom/youai/IPlatformLoginAndPay;


# static fields
.field private static mInstance:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;


# instance fields
.field private game_ctx:Landroid/app/Activity;

.field private game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

.field private isLogin:Z

.field private login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

.field private mCallback1:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

.field private mCallback2:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

.field private mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

.field private mGameActivity:Lcom/youai/IGameActivity;

.field private pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

.field private version_info:Lcom/youai/PlatformAndGameInfo$VersionInfo;

.field yaSdkInterface:Lcom/youai/sdks/callback/YASdkInterface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    sput-object v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mInstance:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    .line 52
    iput-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

    .line 53
    new-instance v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;

    invoke-direct {v0}, Lcom/youai/PlatformAndGameInfo$LoginInfo;-><init>()V

    iput-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 54
    iput-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->version_info:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .line 56
    iput-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->isLogin:Z

    .line 91
    new-instance v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;-><init>(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->yaSdkInterface:Lcom/youai/sdks/callback/YASdkInterface;

    .line 63
    return-void
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    return-object v0
.end method

.method static synthetic access$002(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Lcom/youai/PlatformAndGameInfo$LoginInfo;)Lcom/youai/PlatformAndGameInfo$LoginInfo;
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;
    .param p1, "x1"    # Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    return-object p1
.end method

.method static synthetic access$102(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->isLogin:Z

    return p1
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$PayInfo;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

    return-object v0
.end method

.method static synthetic access$202(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Lcom/youai/PlatformAndGameInfo$PayInfo;)Lcom/youai/PlatformAndGameInfo$PayInfo;
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;
    .param p1, "x1"    # Lcom/youai/PlatformAndGameInfo$PayInfo;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

    return-object p1
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$400(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback1:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/IGameActivity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mGameActivity:Lcom/youai/IGameActivity;

    return-object v0
.end method

.method public static getInstance()Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;
    .locals 2

    .prologue
    .line 67
    sget-object v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mInstance:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    if-nez v0, :cond_0

    .line 68
    const-class v1, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    monitor-enter v1

    .line 69
    :try_start_0
    new-instance v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-direct {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;-><init>()V

    sput-object v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mInstance:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    .line 70
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    :cond_0
    sget-object v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mInstance:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    return-object v0

    .line 70
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 8
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 398
    const/4 v2, 0x0

    .line 400
    .local v2, "inputStreamReader":Ljava/io/InputStreamReader;
    :try_start_0
    new-instance v3, Ljava/io/InputStreamReader;

    const-string v7, "utf-8"

    invoke-direct {v3, p1, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .local v3, "inputStreamReader":Ljava/io/InputStreamReader;
    move-object v2, v3

    .line 404
    .end local v3    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    :goto_0
    new-instance v5, Ljava/io/BufferedReader;

    invoke-direct {v5, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 405
    .local v5, "reader":Ljava/io/BufferedReader;
    new-instance v6, Ljava/lang/StringBuffer;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 408
    .local v6, "sb":Ljava/lang/StringBuffer;
    :goto_1
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 409
    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 410
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 412
    .end local v4    # "line":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 413
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 415
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 401
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .end local v6    # "sb":Ljava/lang/StringBuffer;
    :catch_1
    move-exception v1

    .line 402
    .local v1, "e1":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method private getWaresId(Lcom/youai/PlatformAndGameInfo$PayInfo;)Ljava/lang/String;
    .locals 16
    .param p1, "payInfo"    # Lcom/youai/PlatformAndGameInfo$PayInfo;

    .prologue
    .line 454
    const/4 v4, 0x0

    .line 455
    .local v4, "exist":Z
    const-string v12, "0"

    .line 457
    .local v12, "waresId":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v14}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    .line 458
    .local v10, "manager":Landroid/content/res/AssetManager;
    const-string v14, ""

    invoke-virtual {v10, v14}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 459
    .local v11, "names":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v14, v11

    if-ge v5, v14, :cond_0

    .line 460
    aget-object v14, v11, v5

    const-string v15, "PayInfo.txt"

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 461
    const/4 v4, 0x1

    .line 465
    :cond_0
    if-nez v4, :cond_2

    move-object v13, v12

    .line 491
    .end local v5    # "i":I
    .end local v10    # "manager":Landroid/content/res/AssetManager;
    .end local v11    # "names":[Ljava/lang/String;
    .end local v12    # "waresId":Ljava/lang/String;
    .local v13, "waresId":Ljava/lang/String;
    :goto_1
    return-object v13

    .line 459
    .end local v13    # "waresId":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v10    # "manager":Landroid/content/res/AssetManager;
    .restart local v11    # "names":[Ljava/lang/String;
    .restart local v12    # "waresId":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 468
    :cond_2
    new-instance v6, Ljava/io/InputStreamReader;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v14}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v14

    const-string v15, "PayInfo.txt"

    invoke-virtual {v14, v15}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    invoke-direct {v6, v14}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 470
    .local v6, "inputReader":Ljava/io/InputStreamReader;
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 471
    .local v2, "bufReader":Ljava/io/BufferedReader;
    const-string v9, ""

    .line 472
    .local v9, "line":Ljava/lang/String;
    const-string v1, ""

    .line 473
    .local v1, "Result":Ljava/lang/String;
    :goto_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 474
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 476
    :cond_3
    const-string v14, ""

    if-ne v1, v14, :cond_4

    move-object v13, v12

    .line 477
    .end local v12    # "waresId":Ljava/lang/String;
    .restart local v13    # "waresId":Ljava/lang/String;
    goto :goto_1

    .line 479
    .end local v13    # "waresId":Ljava/lang/String;
    .restart local v12    # "waresId":Ljava/lang/String;
    :cond_4
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 480
    .local v8, "jsonObject":Lorg/json/JSONObject;
    invoke-virtual {v8}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 481
    .local v7, "iterator":Ljava/util/Iterator;
    :cond_5
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 482
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_id:Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 483
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_id:Ljava/lang/String;

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v12

    goto :goto_3

    .line 486
    .end local v1    # "Result":Ljava/lang/String;
    .end local v2    # "bufReader":Ljava/io/BufferedReader;
    .end local v5    # "i":I
    .end local v6    # "inputReader":Ljava/io/InputStreamReader;
    .end local v7    # "iterator":Ljava/util/Iterator;
    .end local v8    # "jsonObject":Lorg/json/JSONObject;
    .end local v9    # "line":Ljava/lang/String;
    .end local v10    # "manager":Landroid/content/res/AssetManager;
    .end local v11    # "names":[Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 487
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .end local v3    # "e":Ljava/io/IOException;
    :cond_6
    :goto_4
    move-object v13, v12

    .line 491
    .end local v12    # "waresId":Ljava/lang/String;
    .restart local v13    # "waresId":Ljava/lang/String;
    goto :goto_1

    .line 488
    .end local v13    # "waresId":Ljava/lang/String;
    .restart local v12    # "waresId":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 489
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_4
.end method


# virtual methods
.method public callAccountManage()V
    .locals 2

    .prologue
    .line 343
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/youai/sdks/PlatformSdk;->switchAccount(Landroid/app/Activity;)V

    .line 344
    return-void
.end method

.method public callBindTryToOkUser()V
    .locals 0

    .prologue
    .line 445
    return-void
.end method

.method public callCheckVersionUpate()V
    .locals 1

    .prologue
    .line 307
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/youai/sdks/PlatformSdk;->callCheckVersionUpate()V

    .line 308
    return-void
.end method

.method public callLogin()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 251
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    const/4 v1, 0x1

    const-string v2, "\u6b63\u5728\u767b\u5f55"

    invoke-interface {v0, v1, v3, v2}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->showWaitingViewImp(ZILjava/lang/String;)V

    .line 252
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/youai/sdks/PlatformSdk;->login(Landroid/app/Activity;)V

    .line 253
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    const/4 v1, 0x0

    const-string v2, "\u6b63\u5728\u767b\u5f55"

    invoke-interface {v0, v1, v3, v2}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->showWaitingViewImp(ZILjava/lang/String;)V

    .line 254
    return-void
.end method

.method public callLogout()V
    .locals 2

    .prologue
    .line 300
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 301
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/youai/sdks/PlatformSdk;->logout(Landroid/app/Activity;)V

    .line 303
    :cond_0
    return-void
.end method

.method public callPayRecharge(Lcom/youai/PlatformAndGameInfo$PayInfo;)I
    .locals 3
    .param p1, "pay_info"    # Lcom/youai/PlatformAndGameInfo$PayInfo;

    .prologue
    .line 321
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

    .line 322
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

    .line 323
    new-instance v0, Lcom/youai/sdks/beans/PayInfo;

    invoke-direct {v0}, Lcom/youai/sdks/beans/PayInfo;-><init>()V

    .line 324
    .local v0, "payinfo":Lcom/youai/sdks/beans/PayInfo;
    iget v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->count:I

    iput v1, v0, Lcom/youai/sdks/beans/PayInfo;->count:I

    .line 325
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->description:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/sdks/beans/PayInfo;->description:Ljava/lang/String;

    .line 326
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->order_serial:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/sdks/beans/PayInfo;->order_serial:Ljava/lang/String;

    .line 327
    iget v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->orignal_price:F

    iput v1, v0, Lcom/youai/sdks/beans/PayInfo;->orignal_price:F

    .line 328
    iget v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->price:F

    iput v1, v0, Lcom/youai/sdks/beans/PayInfo;->price:F

    .line 329
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_id:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/sdks/beans/PayInfo;->product_id:Ljava/lang/String;

    .line 330
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_name:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/sdks/beans/PayInfo;->product_name:Ljava/lang/String;

    .line 331
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getWaresId(Lcom/youai/PlatformAndGameInfo$PayInfo;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/youai/sdks/beans/PayInfo;->waresId:Ljava/lang/String;

    .line 332
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v1, v2, v0}, Lcom/youai/sdks/PlatformSdk;->showPay(Landroid/app/Activity;Lcom/youai/sdks/beans/PayInfo;)I

    .line 333
    const/4 v1, 0x0

    return v1
.end method

.method public callPlatformFeedback()V
    .locals 4

    .prologue
    .line 353
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeHasEnterMainFrame()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 355
    new-instance v1, Lcom/youai/sdks/beans/YALastLoginHelp;

    invoke-direct {v1}, Lcom/youai/sdks/beans/YALastLoginHelp;-><init>()V

    .line 356
    .local v1, "yaLastLoginHelp":Lcom/youai/sdks/beans/YALastLoginHelp;
    sget-object v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mPuid:Ljava/lang/String;

    .line 357
    sget-object v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameid:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mGameid:Ljava/lang/String;

    .line 358
    sget v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mServerID:I

    iput v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mServerID:I

    .line 359
    sget v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerId:I

    iput v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mPlayerId:I

    .line 360
    sget-object v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerName:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mPlayerName:Ljava/lang/String;

    .line 361
    sget v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mVipLvl:I

    iput v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mVipLvl:I

    .line 362
    sget-object v2, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/sdks/beans/YALastLoginHelp;->mPlatform:Ljava/lang/String;

    .line 363
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v2

    iget-object v3, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v2, v3, v1}, Lcom/youai/sdks/PlatformSdk;->showFeedBack(Landroid/app/Activity;Lcom/youai/sdks/beans/YALastLoginHelp;)I

    move-result v2

    if-nez v2, :cond_0

    .line 365
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/youai/dreamonepiece/YouaiConfig;->UrlFeedBack:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?puid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mPuid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&gameId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&serverId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mServerID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&playerId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&playerName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&vipLvl="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mVipLvl:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&platformId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlatform:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 373
    .local v0, "_url":Ljava/lang/String;
    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-static {v2, v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->getInstance(Landroid/app/Activity;Ljava/lang/String;)Lcom/youai/dreamonepiece/FeedBackDialog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/youai/dreamonepiece/FeedBackDialog;->show()V

    .line 377
    .end local v0    # "_url":Ljava/lang/String;
    .end local v1    # "yaLastLoginHelp":Lcom/youai/sdks/beans/YALastLoginHelp;
    :cond_0
    return-void
.end method

.method public callPlatformGameBBS()V
    .locals 4

    .prologue
    .line 391
    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f050000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    .line 393
    .local v0, "inputStream":Ljava/io/InputStream;
    invoke-direct {p0, v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .line 394
    .local v1, "url":Ljava/lang/String;
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v2

    iget-object v3, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v2, v3, v1}, Lcom/youai/sdks/PlatformSdk;->showBBS(Landroid/app/Activity;Ljava/lang/String;)V

    .line 395
    return-void
.end method

.method public callPlatformSupportThirdShare(Lcom/youai/PlatformAndGameInfo$ShareInfo;)V
    .locals 3
    .param p1, "share_info"    # Lcom/youai/PlatformAndGameInfo$ShareInfo;

    .prologue
    .line 381
    new-instance v0, Lcom/youai/sdks/beans/ShareInfo;

    invoke-direct {v0}, Lcom/youai/sdks/beans/ShareInfo;-><init>()V

    .line 382
    .local v0, "shareinfo":Lcom/youai/sdks/beans/ShareInfo;
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$ShareInfo;->bitmap:Landroid/graphics/Bitmap;

    iput-object v1, v0, Lcom/youai/sdks/beans/ShareInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 383
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$ShareInfo;->content:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/sdks/beans/ShareInfo;->content:Ljava/lang/String;

    .line 384
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$ShareInfo;->img_path:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/sdks/beans/ShareInfo;->img_path:Ljava/lang/String;

    .line 386
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v1, v2, v0}, Lcom/youai/sdks/PlatformSdk;->shareToThirdPlatForm(Landroid/app/Activity;Lcom/youai/sdks/beans/ShareInfo;)V

    .line 387
    return-void
.end method

.method public callToolBar(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 434
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/youai/sdks/PlatformSdk;->callToolBar(Z)V

    .line 435
    return-void
.end method

.method public generateNewOrderSerial()Ljava/lang/String;
    .locals 3

    .prologue
    .line 348
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "-"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

    return-object v0
.end method

.method public getLoginInfo()Lcom/youai/PlatformAndGameInfo$LoginInfo;
    .locals 2

    .prologue
    .line 274
    iget-boolean v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->isLogin:Z

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    const/4 v1, 0x0

    iput v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    .line 279
    :goto_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    return-object v0

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    const/4 v1, 0x1

    iput v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    goto :goto_0
.end method

.method public getPlatformLogoLayoutId()I
    .locals 1

    .prologue
    .line 226
    const v0, 0x7f030006

    return v0
.end method

.method public init(Lcom/youai/IGameActivity;Lcom/youai/PlatformAndGameInfo$GameInfo;)V
    .locals 5
    .param p1, "game_ctx"    # Lcom/youai/IGameActivity;
    .param p2, "game_info"    # Lcom/youai/PlatformAndGameInfo$GameInfo;

    .prologue
    const/4 v0, 0x1

    .line 78
    iput-object p2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

    .line 79
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mGameActivity:Lcom/youai/IGameActivity;

    .line 80
    iput v0, p2, Lcom/youai/PlatformAndGameInfo$GameInfo;->use_platform_sdk_type:I

    .line 81
    iput v0, p2, Lcom/youai/PlatformAndGameInfo$GameInfo;->debug_mode:I

    .line 82
    invoke-interface {p1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    .line 83
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

    sget-object v1, Lcom/youai/GameMaincpp;->enPlatform:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    .line 84
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

    sget-object v1, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v1, v1, Lcom/youai/sdks/beans/PlatformInfo;->platformName:Ljava/lang/String;

    iput-object v1, v0, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->isLogin:Z

    .line 86
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-interface {p1}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v4, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->yaSdkInterface:Lcom/youai/sdks/callback/YASdkInterface;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/youai/sdks/PlatformSdk;->init(Landroid/app/Activity;Lcom/youai/sdks/beans/AppInfo;Lcom/youai/sdks/beans/PlatformInfo;Lcom/youai/sdks/callback/YASdkInterface;)V

    .line 89
    return-void
.end method

.method public isSupportInSDKGameUpdate()I
    .locals 1

    .prologue
    .line 221
    const/4 v0, 0x0

    return v0
.end method

.method public isTryUser()Z
    .locals 1

    .prologue
    .line 439
    const/4 v0, 0x0

    return v0
.end method

.method public notifyLoginResult(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V
    .locals 3
    .param p1, "login_result"    # Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .prologue
    .line 258
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 259
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 261
    if-eqz p1, :cond_1

    .line 262
    sget-object v0, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v0, v0, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, ""

    sget-object v1, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v1, v1, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 263
    :cond_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    invoke-interface {v0, v1}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyLoginResut(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V

    .line 270
    :cond_1
    :goto_0
    return-void

    .line 265
    :cond_2
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v2, v2, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    iget-object v2, v2, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid_str:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid_str:Ljava/lang/String;

    .line 267
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    invoke-interface {v0, v1}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyLoginResut(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V

    goto :goto_0
.end method

.method public notifyPayRechargeRequestResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V
    .locals 1
    .param p1, "pay_info"    # Lcom/youai/PlatformAndGameInfo$PayInfo;

    .prologue
    .line 338
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    invoke-interface {v0, p1}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyPayRechargeResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V

    .line 339
    return-void
.end method

.method public notifyVersionUpateInfo(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V
    .locals 1
    .param p1, "version_info"    # Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .prologue
    .line 312
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->version_info:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .line 313
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->version_info:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .line 314
    if-eqz p1, :cond_0

    .line 315
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback2:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    invoke-interface {v0, p1}, Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;->notifyVersionCheckResult(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V

    .line 317
    :cond_0
    return-void
.end method

.method public onGameExit()V
    .locals 1

    .prologue
    .line 429
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/youai/sdks/PlatformSdk;->onGameExit()V

    .line 430
    return-void
.end method

.method public onGamePause()V
    .locals 0

    .prologue
    .line 420
    return-void
.end method

.method public onGameResume()V
    .locals 0

    .prologue
    .line 425
    return-void
.end method

.method public onLoginGame()V
    .locals 5

    .prologue
    .line 284
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 286
    .local v1, "jsonData":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "roldId"

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerId:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 287
    const-string v2, "roldName"

    sget-object v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mPlayerName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 288
    const-string v2, "roldLevel"

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mlv:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 289
    const-string v2, "zoneId"

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mServerID:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 290
    const-string v2, "zoneName"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u68a6\u60f3"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/youai/dreamonepiece/LastLoginHelp;->mServerID:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\u670d"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 291
    const-string v2, "viplvl"

    sget v3, Lcom/youai/dreamonepiece/LastLoginHelp;->mVipLvl:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    :goto_0
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v1}, Lcom/youai/sdks/PlatformSdk;->setEnterGame(ZLorg/json/JSONObject;)V

    .line 296
    return-void

    .line 292
    :catch_0
    move-exception v0

    .line 293
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public receiveGameSvrBindTryToOkUserResult(I)V
    .locals 0
    .param p1, "result"    # I

    .prologue
    .line 450
    return-void
.end method

.method public setGameAppStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;)V
    .locals 0
    .param p1, "callback3"    # Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    .line 217
    return-void
.end method

.method public setGameUpdateStateCallback(Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;)V
    .locals 0
    .param p1, "callback2"    # Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback2:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    .line 212
    return-void
.end method

.method public setPlatformSDKStateCallback(Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;)V
    .locals 0
    .param p1, "callback1"    # Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback1:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    .line 207
    return-void
.end method

.method public unInit()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 231
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/youai/sdks/PlatformSdk;->unInit(Landroid/app/Activity;)V

    .line 232
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mGameActivity:Lcom/youai/IGameActivity;

    .line 233
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback1:Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    .line 234
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback2:Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    .line 235
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->mCallback3:Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    .line 237
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_ctx:Landroid/app/Activity;

    .line 238
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->game_info:Lcom/youai/PlatformAndGameInfo$GameInfo;

    .line 239
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->login_info:Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 240
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->version_info:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .line 241
    iput-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->pay_info:Lcom/youai/PlatformAndGameInfo$PayInfo;

    .line 242
    return-void
.end method
