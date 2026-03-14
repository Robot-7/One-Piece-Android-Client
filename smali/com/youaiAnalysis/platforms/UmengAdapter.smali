.class public Lcom/youaiAnalysis/platforms/UmengAdapter;
.super Lcom/youaiAnalysis/AnalysisBaseAdapter;
.source "UmengAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;-><init>()V

    return-void
.end method

.method public static load(Lcom/youaiAnalysis/AnalysisManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youaiAnalysis/AnalysisManager;

    .prologue
    .line 13
    :try_start_0
    const-string v0, "com.umeng.analytics.MobclickAgent"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 14
    new-instance v0, Lcom/youaiAnalysis/platforms/UmengAdapter;

    invoke-direct {v0}, Lcom/youaiAnalysis/platforms/UmengAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/UmengAdapter;->initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youaiAnalysis/AnalysisManager;->registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    :cond_0
    :goto_0
    return-void

    .line 16
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;
    .locals 0

    .prologue
    .line 20
    return-object p0
.end method

.method public onEnvent(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-static {p1, p2}, Lcom/umeng/analytics/MobclickAgent;->onEvent(Landroid/content/Context;Ljava/lang/String;)V

    .line 37
    invoke-super {p0, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEnvent(Landroid/app/Activity;Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-static {p1, p2}, Lcom/umeng/analytics/MobclickAgent;->onEventBegin(Landroid/content/Context;Ljava/lang/String;)V

    .line 42
    invoke-super {p0, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-static {p1, p2}, Lcom/umeng/analytics/MobclickAgent;->onEventEnd(Landroid/content/Context;Ljava/lang/String;)V

    .line 47
    invoke-super {p0, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-static {p1}, Lcom/umeng/analytics/MobclickAgent;->onPause(Landroid/content/Context;)V

    .line 32
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onPause(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method public onResume(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-static {p1}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 27
    invoke-super {p0, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onResume(Landroid/content/Context;)V

    .line 28
    return-void
.end method
