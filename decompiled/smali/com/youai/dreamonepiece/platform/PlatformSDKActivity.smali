.class public Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;
.super Lcom/youai/dreamonepiece/GameActivity;
.source "PlatformSDKActivity.java"


# static fields
.field public static platformInfo:Lcom/youai/sdks/beans/PlatformInfo;


# instance fields
.field private doInitWeChat:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameActivity;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->doInitWeChat:Z

    .line 29
    new-instance v0, Lcom/youai/dreamonepiece/GameConfig;

    sget-object v1, Lcom/youai/GameMaincpp;->enPlatform:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/youai/dreamonepiece/GameConfig;-><init>(Lcom/youai/IGameActivity;I)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    .line 30
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 65
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/youai/sdks/PlatformSdk;->onActivityResult(IILandroid/content/Intent;)V

    .line 67
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/youai/dreamonepiece/GameActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-static {}, Lcom/youai/push/pushsdk/PushManager;->getInstance()Lcom/youai/push/pushsdk/PushManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/youai/push/pushsdk/PushManager;->onCreate(Landroid/content/Context;)V

    .line 36
    invoke-static {}, Lcom/youaiAnalysis/AnalysisManager;->getInstance()Lcom/youaiAnalysis/AnalysisManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/youaiAnalysis/AnalysisManager;->onCreate(Landroid/content/Context;)V

    .line 37
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v2

    sget-object v3, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    invoke-virtual {v2, p0, v3}, Lcom/youai/sdks/PlatformSdk;->onActivityCreate(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 38
    invoke-static {p0}, Lcom/testin/agent/TestinAgent;->init(Landroid/content/Context;)V

    .line 39
    iget-boolean v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->doInitWeChat:Z

    if-nez v2, :cond_1

    .line 40
    const/4 v1, 0x0

    .line 42
    .local v1, "appInfo":Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 48
    :goto_0
    if-eqz v1, :cond_0

    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v2, :cond_0

    .line 49
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "WX_APP_ID"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 50
    .local v0, "WX_APP_ID":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 51
    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->WX_APP_ID:Ljava/lang/String;

    .line 55
    .end local v0    # "WX_APP_ID":Ljava/lang/String;
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->doInitWeChat:Z

    .line 57
    .end local v1    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_1
    sget-object v2, Lcom/youai/dreamonepiece/YouaiConfig;->WX_APP_ID:Ljava/lang/String;

    if-eqz v2, :cond_2

    sget-object v2, Lcom/youai/dreamonepiece/YouaiConfig;->WX_APP_ID:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 58
    sget-object v2, Lcom/youai/dreamonepiece/YouaiConfig;->WX_APP_ID:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Lcom/tencent/mm/sdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;Z)Lcom/tencent/mm/sdk/openapi/IWXAPI;

    move-result-object v2

    sput-object v2, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    .line 59
    sget-object v2, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    sget-object v3, Lcom/youai/dreamonepiece/YouaiConfig;->WX_APP_ID:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 61
    :cond_2
    return-void

    .line 44
    .restart local v1    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 113
    invoke-super {p0}, Lcom/youai/dreamonepiece/GameActivity;->onDestroy()V

    .line 114
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youai/sdks/PlatformSdk;->onDestroy(Landroid/app/Activity;)V

    .line 115
    invoke-static {}, Lcom/youaiAnalysis/AnalysisManager;->getInstance()Lcom/youaiAnalysis/AnalysisManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/youaiAnalysis/AnalysisManager;->onDestroy()V

    .line 116
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 84
    invoke-super {p0}, Lcom/youai/dreamonepiece/GameActivity;->onPause()V

    .line 85
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youai/sdks/PlatformSdk;->onPause(Landroid/app/Activity;)V

    .line 86
    invoke-static {}, Lcom/youaiAnalysis/AnalysisManager;->getInstance()Lcom/youaiAnalysis/AnalysisManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youaiAnalysis/AnalysisManager;->onPause(Landroid/content/Context;)V

    .line 87
    return-void
.end method

.method protected onRestart()V
    .locals 1

    .prologue
    .line 99
    invoke-super {p0}, Lcom/youai/dreamonepiece/GameActivity;->onStart()V

    .line 100
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youai/sdks/PlatformSdk;->onRestart(Landroid/app/Activity;)V

    .line 101
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 77
    invoke-super {p0}, Lcom/youai/dreamonepiece/GameActivity;->onResume()V

    .line 78
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youai/sdks/PlatformSdk;->onResume(Landroid/app/Activity;)V

    .line 79
    invoke-static {}, Lcom/youaiAnalysis/AnalysisManager;->getInstance()Lcom/youaiAnalysis/AnalysisManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youaiAnalysis/AnalysisManager;->onResume(Landroid/content/Context;)V

    .line 80
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 91
    invoke-super {p0}, Lcom/youai/dreamonepiece/GameActivity;->onStart()V

    .line 92
    invoke-static {p0}, Lcom/testin/agent/TestinAgent;->onStart(Landroid/content/Context;)V

    .line 93
    invoke-static {}, Lcom/youaiAnalysis/AnalysisManager;->getInstance()Lcom/youaiAnalysis/AnalysisManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youaiAnalysis/AnalysisManager;->onStart(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youai/sdks/PlatformSdk;->onStart(Landroid/app/Activity;)V

    .line 95
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 105
    invoke-super {p0}, Lcom/youai/dreamonepiece/GameActivity;->onStop()V

    .line 106
    invoke-static {p0}, Lcom/testin/agent/TestinAgent;->onStop(Landroid/content/Context;)V

    .line 107
    invoke-static {}, Lcom/youaiAnalysis/AnalysisManager;->getInstance()Lcom/youaiAnalysis/AnalysisManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youaiAnalysis/AnalysisManager;->onStop(Landroid/content/Context;)V

    .line 108
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/youai/sdks/PlatformSdk;->onStop(Landroid/app/Activity;)V

    .line 109
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 71
    invoke-super {p0, p1}, Lcom/youai/dreamonepiece/GameActivity;->onWindowFocusChanged(Z)V

    .line 72
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/youai/sdks/PlatformSdk;->onWindowFocusChanged(Z)V

    .line 73
    return-void
.end method
