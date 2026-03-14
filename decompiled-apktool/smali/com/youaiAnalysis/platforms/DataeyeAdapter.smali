.class public Lcom/youaiAnalysis/platforms/DataeyeAdapter;
.super Lcom/youaiAnalysis/AnalysisBaseAdapter;
.source "DataeyeAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;-><init>()V

    return-void
.end method

.method public static load(Lcom/youaiAnalysis/AnalysisManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youaiAnalysis/AnalysisManager;

    .prologue
    .line 29
    :try_start_0
    const-string v0, "com.dataeye.DCAgent"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 30
    new-instance v0, Lcom/youaiAnalysis/platforms/DataeyeAdapter;

    invoke-direct {v0}, Lcom/youaiAnalysis/platforms/DataeyeAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/DataeyeAdapter;->initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youaiAnalysis/AnalysisManager;->registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    :cond_0
    :goto_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public converData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "appkey"    # Ljava/lang/String;
    .param p3, "platform_type_str"    # Ljava/lang/String;
    .param p4, "sdkVersion"    # Ljava/lang/String;

    .prologue
    .line 60
    return-void
.end method

.method public initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;
    .locals 0

    .prologue
    .line 50
    return-object p0
.end method

.method public login(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->login(Landroid/content/Context;)V

    .line 56
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "DC_APPID"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 19
    .local v0, "DC_APPID":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "DC_CHANNEL"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 20
    .local v1, "DC_CHANNEL":Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 21
    const-string v2, "Analysis  SDK error"

    const-string v3, "\u9009\u62e9\u4e86\u70ed\u4e91\u7edf\u8ba1\uff0c\u4f46\u662f\u6ca1\u6709\u914d\u7f6e\u53c2\u6570"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    :cond_0
    invoke-static {p1, v0, v1}, Lcom/dataeye/DCAgent;->initConfig(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onCreate(Landroid/content/Context;)V

    .line 25
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 75
    invoke-static {}, Lcom/dataeye/DCAgent;->onKillProcessOrExit()V

    .line 76
    invoke-super {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onDestroy()V

    .line 77
    return-void
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    invoke-static {p1}, Lcom/dataeye/DCAgent;->onPause(Landroid/content/Context;)V

    .line 71
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onPause(Landroid/content/Context;)V

    .line 72
    return-void
.end method

.method public onResume(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-static {p1}, Lcom/dataeye/DCAgent;->onResume(Landroid/content/Context;)V

    .line 66
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onResume(Landroid/content/Context;)V

    .line 67
    return-void
.end method

.method public payAcount(Landroid/content/Context;Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orderId"    # Ljava/lang/String;
    .param p3, "currencyAmount"    # D
    .param p5, "currencyType"    # Ljava/lang/String;
    .param p6, "paymentType"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-static {p2, p3, p4, p5, p6}, Lcom/dataeye/DCVirtualCurrency;->paymentSuccess(Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public purchase(Landroid/content/Context;F)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "price"    # F

    .prologue
    .line 44
    float-to-double v0, p2

    const-string v2, "RMB"

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/dataeye/DCVirtualCurrency;->paymentSuccess(DLjava/lang/String;Ljava/lang/String;)V

    .line 45
    return-void
.end method
