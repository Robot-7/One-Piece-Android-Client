.class public Lcom/youai/sdks/platform/PlatformPipaw;
.super Lcom/youai/sdks/platform/PlatformBase;
.source "PlatformPipaw.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/youai/sdks/platform/PlatformBase;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 333
    invoke-direct {p0, p1, p2}, Lcom/youai/sdks/platform/PlatformPipaw;->returnLoginState(Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/youai/sdks/platform/PlatformPipaw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0, p1, p2, p3}, Lcom/youai/sdks/platform/PlatformPipaw;->getUid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 343
    invoke-direct {p0, p1, p2}, Lcom/youai/sdks/platform/PlatformPipaw;->returnpayState(Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    return-void
.end method

.method public static getMd5(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 312
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 314
    .local v5, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 315
    .local v3, "md":Ljava/security/MessageDigest;
    const-string v6, "UTF-8"

    invoke-virtual {p0, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/security/MessageDigest;->update([B)V

    .line 316
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 318
    .local v2, "hash":[B
    array-length v7, v2
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v6, 0x0

    :goto_0
    if-lt v6, v7, :cond_0

    .line 330
    .end local v2    # "hash":[B
    .end local v3    # "md":Ljava/security/MessageDigest;
    :goto_1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 318
    .restart local v2    # "hash":[B
    .restart local v3    # "md":Ljava/security/MessageDigest;
    :cond_0
    :try_start_1
    aget-byte v0, v2, v6

    .line 319
    .local v0, "b":B
    and-int/lit16 v8, v0, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    .line 320
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_1

    .line 321
    const-string v8, "0"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    :cond_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 318
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 325
    .end local v0    # "b":B
    .end local v2    # "hash":[B
    .end local v3    # "md":Ljava/security/MessageDigest;
    .end local v4    # "s":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 326
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_1

    .line 327
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 328
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1
.end method

.method private getUid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;
    .param p3, "time"    # Ljava/lang/String;

    .prologue
    .line 243
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/youai/sdks/platform/PlatformPipaw$3;

    invoke-direct {v1, p0, p2, p1, p3}, Lcom/youai/sdks/platform/PlatformPipaw$3;-><init>(Lcom/youai/sdks/platform/PlatformPipaw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 308
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 309
    return-void
.end method

.method private returnLoginState(Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V
    .locals 2
    .param p1, "loginState"    # Lcom/youai/sdks/beans/PlatformContacts$LoginState;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 334
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->context:Landroid/app/Activity;

    new-instance v1, Lcom/youai/sdks/platform/PlatformPipaw$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/youai/sdks/platform/PlatformPipaw$4;-><init>(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 341
    return-void
.end method

.method private returnpayState(Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V
    .locals 2
    .param p1, "payState"    # Lcom/youai/sdks/beans/PlatformContacts$PayState;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 344
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->context:Landroid/app/Activity;

    new-instance v1, Lcom/youai/sdks/platform/PlatformPipaw$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/youai/sdks/platform/PlatformPipaw$5;-><init>(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 351
    return-void
.end method


# virtual methods
.method public callAccountManage(Landroid/app/Activity;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/youai/sdks/platform/PlatformPipaw;->isEnteredGame()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    const-string v0, "\u6682\u672a\u5f00\u901a"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 97
    :goto_0
    return-void

    .line 93
    :cond_0
    iget-boolean v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    if-eqz v0, :cond_1

    .line 94
    invoke-virtual {p0, p1}, Lcom/youai/sdks/platform/PlatformPipaw;->callLogout(Landroid/app/Activity;)V

    .line 96
    :cond_1
    invoke-virtual {p0, p1}, Lcom/youai/sdks/platform/PlatformPipaw;->callLogin(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public callCheckVersionUpate()V
    .locals 0

    .prologue
    .line 85
    return-void
.end method

.method public callLogin(Landroid/app/Activity;)V
    .locals 6
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 128
    iget-boolean v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    if-eqz v0, :cond_0

    .line 168
    :goto_0
    return-void

    .line 131
    :cond_0
    invoke-static {}, Lcom/pipaw/pipawpay/PipawSDK;->getInstance()Lcom/pipaw/pipawpay/PipawSDK;

    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget v1, v1, Lcom/youai/sdks/beans/PlatformInfo;->cpID:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iget-object v1, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v3, v1, Lcom/youai/sdks/beans/PlatformInfo;->gameID:Ljava/lang/String;

    .line 133
    iget-object v1, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v4, v1, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    new-instance v5, Lcom/youai/sdks/platform/PlatformPipaw$1;

    invoke-direct {v5, p0}, Lcom/youai/sdks/platform/PlatformPipaw$1;-><init>(Lcom/youai/sdks/platform/PlatformPipaw;)V

    move-object v1, p1

    .line 131
    invoke-virtual/range {v0 .. v5}, Lcom/pipaw/pipawpay/PipawSDK;->login(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/pipaw/pipawpay/PipawLoginListener;)V

    goto :goto_0
.end method

.method public callLogout(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    .line 80
    return-void
.end method

.method public callPayRecharge(Landroid/app/Activity;Lcom/youai/sdks/beans/PayInfo;)I
    .locals 8
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "pay_info"    # Lcom/youai/sdks/beans/PayInfo;

    .prologue
    .line 172
    iput-object p2, p0, Lcom/youai/sdks/platform/PlatformPipaw;->pay_info:Lcom/youai/sdks/beans/PayInfo;

    .line 173
    iget v5, p2, Lcom/youai/sdks/beans/PayInfo;->price:F

    invoke-static {v5}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    .line 174
    .local v4, "price":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p2, Lcom/youai/sdks/beans/PayInfo;->description:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p2, Lcom/youai/sdks/beans/PayInfo;->product_id:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 175
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 174
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "cpprivateinfo":Ljava/lang/String;
    new-instance v3, Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-direct {v3}, Lcom/pipaw/pipawpay/PipawPayRequest;-><init>()V

    .line 180
    .local v3, "pipawPayRequest":Lcom/pipaw/pipawpay/PipawPayRequest;
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget v5, v5, Lcom/youai/sdks/beans/PlatformInfo;->cpID:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/pipaw/pipawpay/PipawPayRequest;->setMerchantId(Ljava/lang/String;)V

    .line 181
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v5, v5, Lcom/youai/sdks/beans/PlatformInfo;->gameID:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/pipaw/pipawpay/PipawPayRequest;->setMerchantAppId(Ljava/lang/String;)V

    .line 182
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v5, v5, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/pipaw/pipawpay/PipawPayRequest;->setAppId(Ljava/lang/String;)V

    .line 183
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 183
    invoke-virtual {v3, v5}, Lcom/pipaw/pipawpay/PipawPayRequest;->setPayerId(Ljava/lang/String;)V

    .line 185
    iget-object v5, p2, Lcom/youai/sdks/beans/PayInfo;->order_serial:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/pipaw/pipawpay/PipawPayRequest;->setExOrderNo(Ljava/lang/String;)V

    .line 186
    iget-object v5, p2, Lcom/youai/sdks/beans/PayInfo;->product_name:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/pipaw/pipawpay/PipawPayRequest;->setSubject(Ljava/lang/String;)V

    .line 187
    invoke-virtual {v3, v4}, Lcom/pipaw/pipawpay/PipawPayRequest;->setPrice(Ljava/lang/String;)V

    .line 188
    invoke-virtual {v3, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->setExtraParam(Ljava/lang/String;)V

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .local v0, "content":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget v5, v5, Lcom/youai/sdks/beans/PlatformInfo;->cpID:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 196
    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/PlatformInfo;->gameID:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 197
    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 198
    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v7, v7, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    iget-object v7, v7, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 199
    iget-object v6, p2, Lcom/youai/sdks/beans/PayInfo;->order_serial:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p2, Lcom/youai/sdks/beans/PayInfo;->product_name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 200
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 201
    iget-object v6, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    iget-object v6, v6, Lcom/youai/sdks/beans/PlatformInfo;->privatestr:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    const-string v5, "pay"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "content "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/youai/sdks/platform/PlatformPipaw;->getMd5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 204
    .local v2, "merchantSign":Ljava/lang/String;
    const-string v5, "pay"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "merchantSign "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    invoke-virtual {v3, v2}, Lcom/pipaw/pipawpay/PipawPayRequest;->setMerchantSign(Ljava/lang/String;)V

    .line 209
    invoke-static {}, Lcom/pipaw/pipawpay/PipawSDK;->getInstance()Lcom/pipaw/pipawpay/PipawSDK;

    move-result-object v5

    .line 210
    new-instance v6, Lcom/youai/sdks/platform/PlatformPipaw$2;

    invoke-direct {v6, p0}, Lcom/youai/sdks/platform/PlatformPipaw$2;-><init>(Lcom/youai/sdks/platform/PlatformPipaw;)V

    .line 209
    invoke-virtual {v5, p1, v3, v6}, Lcom/pipaw/pipawpay/PipawSDK;->pay(Landroid/app/Activity;Lcom/pipaw/pipawpay/PipawPayRequest;Lcom/pipaw/pipawpay/PipawPayListener;)V

    .line 238
    const/4 v5, 0x0

    return v5
.end method

.method public callPlatformFeedback(Landroid/app/Activity;Lcom/youai/sdks/beans/YALastLoginHelp;)I
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "yaLastLoginHelp"    # Lcom/youai/sdks/beans/YALastLoginHelp;

    .prologue
    .line 102
    const/4 v0, 0x0

    return v0
.end method

.method public callPlatformGameBBS(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 114
    return-void
.end method

.method public callPlatformSupportThirdShare(Landroid/app/Activity;Lcom/youai/sdks/beans/ShareInfo;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "share_info"    # Lcom/youai/sdks/beans/ShareInfo;

    .prologue
    .line 109
    return-void
.end method

.method public getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Lcom/youai/sdks/platform/PlatformBase;->getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;

    move-result-object v0

    return-object v0
.end method

.method public getPlatformInfo()Lcom/youai/sdks/beans/PlatformInfo;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    return-object v0
.end method

.method public init(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;Lcom/youai/sdks/callback/YASdkInterface;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;
    .param p3, "sdkInterface"    # Lcom/youai/sdks/callback/YASdkInterface;

    .prologue
    .line 47
    invoke-super {p0, p1, p2, p3}, Lcom/youai/sdks/platform/PlatformBase;->init(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;Lcom/youai/sdks/callback/YASdkInterface;)V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    .line 49
    const/4 v0, 0x1

    invoke-interface {p3, v0}, Lcom/youai/sdks/callback/YASdkInterface;->onInitComplete(I)V

    .line 50
    return-void
.end method

.method public isLogin()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    return v0
.end method

.method public isSupportInSDKGameUpdate()I
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    return v0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 60
    return-void
.end method

.method public setScreenOrientation(Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;)V
    .locals 0
    .param p1, "orientation"    # Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    .prologue
    .line 124
    return-void
.end method

.method public unInit()V
    .locals 0

    .prologue
    .line 54
    invoke-super {p0}, Lcom/youai/sdks/platform/PlatformBase;->unInit()V

    .line 55
    return-void
.end method
