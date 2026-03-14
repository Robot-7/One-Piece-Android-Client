.class public Lcom/youai/push/pushsdk/PushManager;
.super Ljava/lang/Object;
.source "PushManager.java"


# static fields
.field private static mInstance:Lcom/youai/push/pushsdk/PushManager;


# instance fields
.field private sparseArray:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/youai/push/pushsdk/PushAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/youai/push/pushsdk/PushManager;->mInstance:Lcom/youai/push/pushsdk/PushManager;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/push/pushsdk/PushManager;->sparseArray:Ljava/util/LinkedList;

    .line 17
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/youai/push/pushsdk/PushManager;->sparseArray:Ljava/util/LinkedList;

    .line 18
    return-void
.end method

.method public static getInstance()Lcom/youai/push/pushsdk/PushManager;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/youai/push/pushsdk/PushManager;->mInstance:Lcom/youai/push/pushsdk/PushManager;

    if-nez v0, :cond_0

    .line 22
    new-instance v0, Lcom/youai/push/pushsdk/PushManager;

    invoke-direct {v0}, Lcom/youai/push/pushsdk/PushManager;-><init>()V

    sput-object v0, Lcom/youai/push/pushsdk/PushManager;->mInstance:Lcom/youai/push/pushsdk/PushManager;

    .line 23
    sget-object v0, Lcom/youai/push/pushsdk/PushManager;->mInstance:Lcom/youai/push/pushsdk/PushManager;

    invoke-direct {v0}, Lcom/youai/push/pushsdk/PushManager;->loadAdapters()V

    .line 26
    :cond_0
    sget-object v0, Lcom/youai/push/pushsdk/PushManager;->mInstance:Lcom/youai/push/pushsdk/PushManager;

    return-object v0
.end method

.method private loadAdapters()V
    .locals 1

    .prologue
    .line 31
    :try_start_0
    invoke-static {p0}, Lcom/youai/push/adapters/TXxingeAdapter;->load(Lcom/youai/push/pushsdk/PushManager;)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    :try_start_1
    invoke-static {p0}, Lcom/youai/push/adapters/GeTuiAdapter;->load(Lcom/youai/push/pushsdk/PushManager;)V
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1

    .line 39
    :goto_1
    return-void

    .line 32
    :catch_0
    move-exception v0

    goto :goto_0

    .line 36
    :catch_1
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public onCreate(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/youai/push/pushsdk/PushManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 49
    return-void

    .line 47
    :cond_0
    iget-object v1, p0, Lcom/youai/push/pushsdk/PushManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/youai/push/pushsdk/PushAdapter;

    invoke-virtual {v1, p1}, Lcom/youai/push/pushsdk/PushAdapter;->onCreate(Landroid/content/Context;)V

    .line 46
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public registerClass(Lcom/youai/push/pushsdk/PushAdapter;)V
    .locals 1
    .param p1, "adapterClass"    # Lcom/youai/push/pushsdk/PushAdapter;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/youai/push/pushsdk/PushManager;->sparseArray:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 43
    return-void
.end method
