.class public Lcom/youaiAnalysis/AnalysisManager;
.super Ljava/lang/Object;
.source "AnalysisManager.java"


# static fields
.field private static mInstance:Lcom/youaiAnalysis/AnalysisManager;


# instance fields
.field private sparseArray:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/youaiAnalysis/AnalysisBaseAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/youaiAnalysis/AnalysisManager;->mInstance:Lcom/youaiAnalysis/AnalysisManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    .line 22
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    .line 23
    return-void
.end method

.method public static getInstance()Lcom/youaiAnalysis/AnalysisManager;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/youaiAnalysis/AnalysisManager;->mInstance:Lcom/youaiAnalysis/AnalysisManager;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lcom/youaiAnalysis/AnalysisManager;

    invoke-direct {v0}, Lcom/youaiAnalysis/AnalysisManager;-><init>()V

    sput-object v0, Lcom/youaiAnalysis/AnalysisManager;->mInstance:Lcom/youaiAnalysis/AnalysisManager;

    .line 28
    sget-object v0, Lcom/youaiAnalysis/AnalysisManager;->mInstance:Lcom/youaiAnalysis/AnalysisManager;

    invoke-direct {v0}, Lcom/youaiAnalysis/AnalysisManager;->loadAdapters()V

    .line 31
    :cond_0
    sget-object v0, Lcom/youaiAnalysis/AnalysisManager;->mInstance:Lcom/youaiAnalysis/AnalysisManager;

    return-object v0
.end method

.method private loadAdapters()V
    .locals 1

    .prologue
    .line 35
    :try_start_0
    invoke-static {p0}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->load(Lcom/youaiAnalysis/AnalysisManager;)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    :goto_0
    :try_start_1
    invoke-static {p0}, Lcom/youaiAnalysis/platforms/FlurryAdapter;->load(Lcom/youaiAnalysis/AnalysisManager;)V
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1

    .line 37
    :goto_1
    :try_start_2
    invoke-static {p0}, Lcom/youaiAnalysis/platforms/MTAAdapter;->load(Lcom/youaiAnalysis/AnalysisManager;)V
    :try_end_2
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_2

    .line 38
    :goto_2
    :try_start_3
    invoke-static {p0}, Lcom/youaiAnalysis/platforms/UmengAdapter;->load(Lcom/youaiAnalysis/AnalysisManager;)V
    :try_end_3
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_3

    .line 39
    :goto_3
    :try_start_4
    invoke-static {p0}, Lcom/youaiAnalysis/platforms/ReyunAdapter;->load(Lcom/youaiAnalysis/AnalysisManager;)V
    :try_end_4
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_4

    .line 40
    :goto_4
    :try_start_5
    invoke-static {p0}, Lcom/youaiAnalysis/platforms/DataeyeAdapter;->load(Lcom/youaiAnalysis/AnalysisManager;)V
    :try_end_5
    .catch Ljava/lang/Error; {:try_start_5 .. :try_end_5} :catch_5

    .line 41
    :goto_5
    return-void

    .line 35
    :catch_0
    move-exception v0

    goto :goto_0

    .line 36
    :catch_1
    move-exception v0

    goto :goto_1

    .line 37
    :catch_2
    move-exception v0

    goto :goto_2

    .line 38
    :catch_3
    move-exception v0

    goto :goto_3

    .line 39
    :catch_4
    move-exception v0

    goto :goto_4

    .line 40
    :catch_5
    move-exception v0

    goto :goto_5
.end method


# virtual methods
.method public converData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "appkey"    # Ljava/lang/String;
    .param p3, "platform_type_str"    # Ljava/lang/String;
    .param p4, "sdkVersion"    # Ljava/lang/String;

    .prologue
    .line 101
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 104
    return-void

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->converData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public login(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 116
    return-void

    .line 114
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->login(Landroid/content/Context;)V

    .line 113
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 51
    return-void

    .line 49
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onCreate(Landroid/content/Context;)V

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 71
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 74
    return-void

    .line 72
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onDestroy()V

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onEnvent(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 83
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 86
    return-void

    .line 84
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEnvent(Landroid/app/Activity;Ljava/lang/String;)V

    .line 83
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 89
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 92
    return-void

    .line 90
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V

    .line 89
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 95
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 98
    return-void

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V

    .line 95
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 63
    return-void

    .line 61
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onPause(Landroid/content/Context;)V

    .line 60
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onResume(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 57
    return-void

    .line 55
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onResume(Landroid/content/Context;)V

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onStart(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 80
    return-void

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onStart(Landroid/content/Context;)V

    .line 77
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onStop(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 68
    return-void

    .line 66
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->onStop(Landroid/content/Context;)V

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public purchase(Landroid/content/Context;F)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "price"    # F

    .prologue
    .line 119
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 122
    return-void

    .line 120
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->purchase(Landroid/content/Context;F)V

    .line 119
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public register(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 110
    return-void

    .line 108
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1, p2}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->register(Landroid/content/Context;Ljava/lang/String;)V

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    .locals 1
    .param p1, "adapterClass"    # Lcom/youaiAnalysis/AnalysisBaseAdapter;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 45
    return-void
.end method

.method public setDeviceTrackingDisabled(Z)V
    .locals 2
    .param p1, "boo"    # Z

    .prologue
    .line 125
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 128
    return-void

    .line 126
    :cond_0
    iget-object v1, p0, Lcom/youaiAnalysis/AnalysisManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youaiAnalysis/AnalysisBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/youaiAnalysis/AnalysisBaseAdapter;->setDeviceTrackingDisabled(Z)V

    .line 125
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
