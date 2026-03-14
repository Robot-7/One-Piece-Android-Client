.class public Lcom/youaiAnalysis/platforms/MTAAdapter;
.super Lcom/youaiAnalysis/AnalysisBaseAdapter;
.source "MTAAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;-><init>()V

    return-void
.end method

.method public static load(Lcom/youaiAnalysis/AnalysisManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youaiAnalysis/AnalysisManager;

    .prologue
    .line 15
    :try_start_0
    const-string v0, "com.tencent.stat.StatService"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 16
    new-instance v0, Lcom/youaiAnalysis/platforms/MTAAdapter;

    invoke-direct {v0}, Lcom/youaiAnalysis/platforms/MTAAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/MTAAdapter;->initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youaiAnalysis/AnalysisManager;->registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :cond_0
    :goto_0
    return-void

    .line 18
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
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const/4 v1, 0x0

    :try_start_0
    const-string v2, "2.0.0"

    invoke-static {p1, v1, v2}, Lcom/tencent/stat/StatService;->startStatService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Lcom/tencent/stat/MtaSDkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :goto_0
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onCreate(Landroid/content/Context;)V

    .line 34
    return-void

    .line 30
    :catch_0
    move-exception v0

    .line 31
    .local v0, "e":Lcom/tencent/stat/MtaSDkException;
    invoke-virtual {v0}, Lcom/tencent/stat/MtaSDkException;->printStackTrace()V

    goto :goto_0
.end method

.method public onEnvent(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 47
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p1, p2, v0}, Lcom/tencent/stat/StatService;->trackCustomEvent(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V

    .line 48
    invoke-super {p0, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEnvent(Landroid/app/Activity;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 52
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p1, p2, v0}, Lcom/tencent/stat/StatService;->trackCustomBeginEvent(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V

    .line 53
    invoke-super {p0, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 57
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p1, p2, v0}, Lcom/tencent/stat/StatService;->trackCustomEndEvent(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V

    .line 58
    invoke-super {p0, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-static {p1}, Lcom/tencent/stat/StatService;->onPause(Landroid/content/Context;)V

    .line 43
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onPause(Landroid/content/Context;)V

    .line 44
    return-void
.end method

.method public onResume(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-static {p1}, Lcom/tencent/stat/StatService;->onResume(Landroid/content/Context;)V

    .line 38
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onResume(Landroid/content/Context;)V

    .line 39
    return-void
.end method
