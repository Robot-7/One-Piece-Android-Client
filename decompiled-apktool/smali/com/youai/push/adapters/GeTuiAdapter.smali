.class public Lcom/youai/push/adapters/GeTuiAdapter;
.super Lcom/youai/push/pushsdk/PushAdapter;
.source "GeTuiAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/youai/push/pushsdk/PushAdapter;-><init>()V

    return-void
.end method

.method public static load(Lcom/youai/push/pushsdk/PushManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youai/push/pushsdk/PushManager;

    .prologue
    .line 20
    :try_start_0
    const-string v0, "com.igexin.sdk.PushManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 21
    new-instance v0, Lcom/youai/push/adapters/GeTuiAdapter;

    invoke-direct {v0}, Lcom/youai/push/adapters/GeTuiAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youai/push/adapters/GeTuiAdapter;->initAdapter()Lcom/youai/push/pushsdk/PushAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youai/push/pushsdk/PushManager;->registerClass(Lcom/youai/push/pushsdk/PushAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    :cond_0
    :goto_0
    return-void

    .line 23
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public initAdapter()Lcom/youai/push/pushsdk/PushAdapter;
    .locals 0

    .prologue
    .line 15
    return-object p0
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-super {p0, p1}, Lcom/youai/push/pushsdk/PushAdapter;->onCreate(Landroid/content/Context;)V

    .line 31
    invoke-static {}, Lcom/igexin/sdk/PushManager;->getInstance()Lcom/igexin/sdk/PushManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/igexin/sdk/PushManager;->initialize(Landroid/content/Context;)V

    .line 32
    return-void
.end method
