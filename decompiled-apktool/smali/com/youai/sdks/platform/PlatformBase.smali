.class public abstract Lcom/youai/sdks/platform/PlatformBase;
.super Ljava/lang/Object;
.source "PlatformBase.java"


# instance fields
.field protected context:Landroid/app/Activity;

.field protected isEnteredGame:Z

.field protected login_info:Lcom/youai/sdks/beans/LoginInfo;

.field protected mIsLogined:Z

.field protected mUserData:Lorg/json/JSONObject;

.field protected pay_info:Lcom/youai/sdks/beans/PayInfo;

.field protected platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

.field protected sdkInterface:Lcom/youai/sdks/callback/YASdkInterface;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->context:Landroid/app/Activity;

    .line 21
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->mUserData:Lorg/json/JSONObject;

    .line 22
    iput-boolean v1, p0, Lcom/youai/sdks/platform/PlatformBase;->mIsLogined:Z

    .line 23
    iput-boolean v1, p0, Lcom/youai/sdks/platform/PlatformBase;->isEnteredGame:Z

    .line 25
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    .line 26
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    .line 27
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->pay_info:Lcom/youai/sdks/beans/PayInfo;

    .line 18
    return-void
.end method


# virtual methods
.method public attachBaseContext(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 0
    .param p1, "base"    # Landroid/content/Context;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 149
    return-void
.end method

.method public abstract callAccountManage(Landroid/app/Activity;)V
.end method

.method public abstract callCheckVersionUpate()V
.end method

.method public callCreate(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 155
    return-void
.end method

.method public callCreate(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 0
    .param p1, "base"    # Landroid/content/Context;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 152
    return-void
.end method

.method public callDestroy()V
    .locals 0

    .prologue
    .line 116
    return-void
.end method

.method public callDestroy(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 119
    return-void
.end method

.method public abstract callLogin(Landroid/app/Activity;)V
.end method

.method public abstract callLogout(Landroid/app/Activity;)V
.end method

.method public callNewIntent(Landroid/content/Intent;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "mhandler"    # Landroid/os/Handler;
    .param p3, "mContext"    # Landroid/content/Context;

    .prologue
    .line 113
    return-void
.end method

.method public callPause(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 140
    return-void
.end method

.method public abstract callPayRecharge(Landroid/app/Activity;Lcom/youai/sdks/beans/PayInfo;)I
.end method

.method public abstract callPlatformFeedback(Landroid/app/Activity;Lcom/youai/sdks/beans/YALastLoginHelp;)I
.end method

.method public abstract callPlatformGameBBS(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract callPlatformSupportThirdShare(Landroid/app/Activity;Lcom/youai/sdks/beans/ShareInfo;)V
.end method

.method public callReStart()V
    .locals 0

    .prologue
    .line 134
    return-void
.end method

.method public callReStart(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 137
    return-void
.end method

.method public callResume(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 143
    return-void
.end method

.method public callStart()V
    .locals 0

    .prologue
    .line 122
    return-void
.end method

.method public callStart(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 125
    return-void
.end method

.method public callStop()V
    .locals 0

    .prologue
    .line 128
    return-void
.end method

.method public callStop(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 131
    return-void
.end method

.method public callToolBar(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .prologue
    .line 98
    return-void
.end method

.method public getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    return-object v0
.end method

.method public abstract getPlatformInfo()Lcom/youai/sdks/beans/PlatformInfo;
.end method

.method public init(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;Lcom/youai/sdks/callback/YASdkInterface;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;
    .param p3, "sdkInterface"    # Lcom/youai/sdks/callback/YASdkInterface;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/youai/sdks/platform/PlatformBase;->context:Landroid/app/Activity;

    .line 37
    iput-object p2, p0, Lcom/youai/sdks/platform/PlatformBase;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    .line 38
    iput-object p3, p0, Lcom/youai/sdks/platform/PlatformBase;->sdkInterface:Lcom/youai/sdks/callback/YASdkInterface;

    .line 39
    new-instance v0, Lcom/youai/sdks/beans/LoginInfo;

    invoke-direct {v0}, Lcom/youai/sdks/beans/LoginInfo;-><init>()V

    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    .line 40
    return-void
.end method

.method public isEnteredGame()Z
    .locals 1

    .prologue
    .line 57
    iget-boolean v0, p0, Lcom/youai/sdks/platform/PlatformBase;->isEnteredGame:Z

    return v0
.end method

.method public abstract isLogin()Z
.end method

.method public abstract isSupportInSDKGameUpdate()I
.end method

.method public isTryUser()Z
    .locals 1

    .prologue
    .line 107
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 146
    return-void
.end method

.method public onGameExit()V
    .locals 0

    .prologue
    .line 158
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .prologue
    .line 161
    return-void
.end method

.method public reserve()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 72
    iput-boolean v0, p0, Lcom/youai/sdks/platform/PlatformBase;->mIsLogined:Z

    .line 73
    iput-boolean v0, p0, Lcom/youai/sdks/platform/PlatformBase;->isEnteredGame:Z

    .line 74
    return-void
.end method

.method public abstract setDebugMode(Z)V
.end method

.method public setEnteredGame(ZLorg/json/JSONObject;)V
    .locals 0
    .param p1, "isEnteredGame"    # Z
    .param p2, "jsonData"    # Lorg/json/JSONObject;

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/youai/sdks/platform/PlatformBase;->isEnteredGame:Z

    .line 62
    iput-object p2, p0, Lcom/youai/sdks/platform/PlatformBase;->mUserData:Lorg/json/JSONObject;

    .line 63
    return-void
.end method

.method public abstract setScreenOrientation(Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;)V
.end method

.method public unInit()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->context:Landroid/app/Activity;

    .line 44
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    .line 45
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    .line 46
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->pay_info:Lcom/youai/sdks/beans/PayInfo;

    .line 47
    iput-object v0, p0, Lcom/youai/sdks/platform/PlatformBase;->sdkInterface:Lcom/youai/sdks/callback/YASdkInterface;

    .line 48
    return-void
.end method
