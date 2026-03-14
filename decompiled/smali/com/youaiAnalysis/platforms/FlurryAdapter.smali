.class public Lcom/youaiAnalysis/platforms/FlurryAdapter;
.super Lcom/youaiAnalysis/AnalysisBaseAdapter;
.source "FlurryAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;-><init>()V

    return-void
.end method

.method public static load(Lcom/youaiAnalysis/AnalysisManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youaiAnalysis/AnalysisManager;

    .prologue
    .line 9
    :try_start_0
    const-string v0, "com.appsflyer.AppsFlyerLib"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 10
    new-instance v0, Lcom/youaiAnalysis/platforms/FlurryAdapter;

    invoke-direct {v0}, Lcom/youaiAnalysis/platforms/FlurryAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/FlurryAdapter;->initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youaiAnalysis/AnalysisManager;->registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    :cond_0
    :goto_0
    return-void

    .line 12
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;
    .locals 0

    .prologue
    .line 17
    return-object p0
.end method
