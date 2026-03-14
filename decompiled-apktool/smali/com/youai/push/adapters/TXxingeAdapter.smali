.class public Lcom/youai/push/adapters/TXxingeAdapter;
.super Lcom/youai/push/pushsdk/PushAdapter;
.source "TXxingeAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/youai/push/pushsdk/PushAdapter;-><init>()V

    return-void
.end method

.method public static load(Lcom/youai/push/pushsdk/PushManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youai/push/pushsdk/PushManager;

    .prologue
    .line 19
    :try_start_0
    const-string v0, "com.tencent.android.tpush.XGPushManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 20
    new-instance v0, Lcom/youai/push/adapters/TXxingeAdapter;

    invoke-direct {v0}, Lcom/youai/push/adapters/TXxingeAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youai/push/adapters/TXxingeAdapter;->initAdapter()Lcom/youai/push/pushsdk/PushAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youai/push/pushsdk/PushManager;->registerClass(Lcom/youai/push/pushsdk/PushAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    :cond_0
    :goto_0
    return-void

    .line 22
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public initAdapter()Lcom/youai/push/pushsdk/PushAdapter;
    .locals 0

    .prologue
    .line 14
    return-object p0
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-static {p1}, Lcom/tencent/android/tpush/XGPushManager;->registerPush(Landroid/content/Context;)V

    .line 29
    invoke-super {p0, p1}, Lcom/youai/push/pushsdk/PushAdapter;->onCreate(Landroid/content/Context;)V

    .line 30
    return-void
.end method
