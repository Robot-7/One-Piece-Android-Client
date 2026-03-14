.class public Lcom/youaiAnalysis/platforms/ReyunAdapter;
.super Lcom/youaiAnalysis/AnalysisBaseAdapter;
.source "ReyunAdapter.java"


# instance fields
.field private isActive:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youaiAnalysis/platforms/ReyunAdapter;->isActive:Z

    .line 10
    return-void
.end method

.method public static load(Lcom/youaiAnalysis/AnalysisManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youaiAnalysis/AnalysisManager;

    .prologue
    .line 16
    :try_start_0
    const-string v0, "com.reyun.sdk.ReYun"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 17
    new-instance v0, Lcom/youaiAnalysis/platforms/ReyunAdapter;

    invoke-direct {v0}, Lcom/youaiAnalysis/platforms/ReyunAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/ReyunAdapter;->initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youaiAnalysis/AnalysisManager;->registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    :cond_0
    :goto_0
    return-void

    .line 19
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;
    .locals 0

    .prologue
    .line 23
    return-object p0
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "RY_APPID"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 28
    .local v0, "RY_APPID":Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 29
    const-string v2, "Analysis  SDK error"

    const-string v3, "\u9009\u62e9\u4e86\u70ed\u4e91\u7edf\u8ba1\uff0c\u4f46\u662f\u6ca1\u6709\u914d\u7f6e\u53c2\u6570"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    :cond_0
    const/4 v2, 0x0

    :try_start_0
    invoke-static {p1, v0, v2}, Lcom/reyun/sdk/ReYun;->initWithKeyAndChannelId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :goto_0
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onCreate(Landroid/content/Context;)V

    .line 39
    return-void

    .line 33
    :catch_0
    move-exception v1

    .line 34
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onPause(Landroid/content/Context;)V

    .line 58
    invoke-static {}, Lcom/reyun/sdk/ReYun;->isAppOnForeground()Z

    move-result v0

    if-nez v0, :cond_0

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youaiAnalysis/platforms/ReyunAdapter;->isActive:Z

    .line 62
    :cond_0
    return-void
.end method

.method public onResume(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onResume(Landroid/content/Context;)V

    .line 49
    iget-boolean v0, p0, Lcom/youaiAnalysis/platforms/ReyunAdapter;->isActive:Z

    if-nez v0, :cond_0

    .line 51
    invoke-static {p1}, Lcom/reyun/sdk/ReYun;->startHeartBeat(Landroid/content/Context;)V

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/youaiAnalysis/platforms/ReyunAdapter;->isActive:Z

    .line 54
    :cond_0
    return-void
.end method

.method public purchase(Landroid/content/Context;F)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "price"    # F

    .prologue
    const/4 v0, 0x0

    .line 41
    const-string v2, "RMB"

    const/4 v4, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    move-object v1, v0

    move v3, p2

    move-object v5, v0

    invoke-static/range {v0 .. v8}, Lcom/reyun/sdk/ReYun;->setPayment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FFLjava/lang/String;JI)V

    .line 42
    return-void
.end method
