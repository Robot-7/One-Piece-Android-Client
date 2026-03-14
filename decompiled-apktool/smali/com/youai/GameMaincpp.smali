.class public Lcom/youai/GameMaincpp;
.super Ljava/lang/Object;
.source "GameMaincpp.java"


# static fields
.field public static enPlatform:Ljava/lang/String;

.field static gamePlatformConfig:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-string v0, "{\'appid\':\'421383273655\',\'gid\':\'71\',\'cpid\':\'42\',\'private\':\'987f7af09f4cf1810ee5f695d414446d\',\'enshortname\':\'pipaw_\',\'platformname\':\'Android_PiPaw\',\'enPlatform\':\'36\'}"

    sput-object v0, Lcom/youai/GameMaincpp;->gamePlatformConfig:Ljava/lang/String;

    .line 11
    const-string v0, ""

    sput-object v0, Lcom/youai/GameMaincpp;->enPlatform:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPlatformInfoByType(I)Lcom/youai/sdks/beans/PlatformInfo;
    .locals 5
    .param p0, "type"    # I

    .prologue
    .line 14
    sget-object v2, Lcom/youai/GameMaincpp;->gamePlatformConfig:Ljava/lang/String;

    .line 15
    .local v2, "infoStr":Ljava/lang/String;
    new-instance v3, Lcom/youai/sdks/beans/PlatformInfo;

    invoke-direct {v3}, Lcom/youai/sdks/beans/PlatformInfo;-><init>()V

    .line 16
    .local v3, "mGameInfo":Lcom/youai/sdks/beans/PlatformInfo;
    const v4, 0x7f020004

    iput v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->Rid:I

    .line 17
    iput p0, v3, Lcom/youai/sdks/beans/PlatformInfo;->platform:I

    .line 18
    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->isDebug:Z

    .line 19
    const-string v4, "\u4f1f\u5927\u822a\u8def"

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->gameName:Ljava/lang/String;

    .line 21
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .local v0, "dataJsonObj":Lorg/json/JSONObject;
    const-string v4, "appid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 23
    const-string v4, "appid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    .line 25
    :cond_0
    const-string v4, "appkey"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 26
    const-string v4, "appkey"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->appkey:Ljava/lang/String;

    .line 28
    :cond_1
    const-string v4, "appsecret"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 29
    const-string v4, "appsecret"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->appsecret:Ljava/lang/String;

    .line 31
    :cond_2
    const-string v4, "cpid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 32
    const-string v4, "cpid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->cpID:I

    .line 35
    :cond_3
    const-string v4, "gid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 36
    const-string v4, "gid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->gameID:Ljava/lang/String;

    .line 38
    :cond_4
    const-string v4, "svrid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 39
    const-string v4, "svrid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->svrID:I

    .line 42
    :cond_5
    const-string v4, "payid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 43
    const-string v4, "payid"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->payidstr:Ljava/lang/String;

    .line 45
    :cond_6
    const-string v4, "private"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 46
    const-string v4, "private"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->privatestr:Ljava/lang/String;

    .line 48
    :cond_7
    const-string v4, "public"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 49
    const-string v4, "public"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->publicstr:Ljava/lang/String;

    .line 51
    :cond_8
    const-string v4, "payaddr"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 52
    const-string v4, "payaddr"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->payaddr:Ljava/lang/String;

    .line 54
    :cond_9
    const-string v4, "enshortname"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 55
    const-string v4, "enshortname"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    .line 57
    :cond_a
    const-string v4, "platformname"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 58
    const-string v4, "platformname"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->platformName:Ljava/lang/String;

    .line 60
    :cond_b
    const-string v4, "bbsurl"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 61
    const-string v4, "bbsurl"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->BBSUrl:Ljava/lang/String;

    .line 63
    :cond_c
    const-string v4, "enPlatform"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 64
    const-string v4, "enPlatform"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/youai/GameMaincpp;->enPlatform:Ljava/lang/String;

    .line 66
    :cond_d
    const-string v4, "companyName"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 67
    const-string v4, "\u5317\u4eac\u6709\u7231\u4e92\u52a8\u79d1\u6280\u6709\u9650\u516c\u53f8"

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->companyName:Ljava/lang/String;

    .line 69
    :cond_e
    const-string v4, "gameName"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 70
    const-string v4, "gameName"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/youai/sdks/beans/PlatformInfo;->gameName:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .end local v0    # "dataJsonObj":Lorg/json/JSONObject;
    :cond_f
    :goto_0
    return-object v3

    .line 72
    :catch_0
    move-exception v1

    .line 73
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
