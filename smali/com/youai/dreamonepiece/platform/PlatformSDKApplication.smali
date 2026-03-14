.class public Lcom/youai/dreamonepiece/platform/PlatformSDKApplication;
.super Landroid/app/Application;
.source "PlatformSDKApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 2
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 31
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/platform/PlatformSDKApplication;->initWithManifest()V

    .line 32
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    sget-object v1, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    invoke-virtual {v0, p1, v1}, Lcom/youai/sdks/PlatformSdk;->attachBaseContext(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 34
    return-void
.end method

.method public initWithManifest()V
    .locals 6

    .prologue
    .line 18
    :try_start_0
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/platform/PlatformSDKApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Lcom/youai/dreamonepiece/platform/PlatformSDKApplication;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 20
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "YA_PLATFORM"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 21
    .local v2, "plat":I
    invoke-static {v2}, Lcom/youai/GameMaincpp;->getPlatformInfoByType(I)Lcom/youai/sdks/beans/PlatformInfo;

    move-result-object v3

    sput-object v3, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "plat":I
    :goto_0
    return-void

    .line 23
    :catch_0
    move-exception v1

    .line 24
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 38
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 39
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v0

    sget-object v1, Lcom/youai/dreamonepiece/platform/PlatformSDKActivity;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    invoke-virtual {v0, p0, v1}, Lcom/youai/sdks/PlatformSdk;->onApplicationCreate(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 41
    invoke-static {p0}, Lcom/youai/dreamonepiece/LogcatHelper;->getInstance(Landroid/content/Context;)Lcom/youai/dreamonepiece/LogcatHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/LogcatHelper;->start()V

    .line 42
    return-void
.end method
