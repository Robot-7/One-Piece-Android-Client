.class Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;
.super Ljava/lang/Object;
.source "PlatformSDKState.java"

# interfaces
.implements Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/PlatformSDKState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlatformSDKStateCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/PlatformSDKState;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/PlatformSDKState;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/PlatformSDKState;Lcom/youai/dreamonepiece/PlatformSDKState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/PlatformSDKState$1;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;-><init>(Lcom/youai/dreamonepiece/PlatformSDKState;)V

    return-void
.end method


# virtual methods
.method public initPlatformSDK(Lcom/youai/IPlatformLoginAndPay;)V
    .locals 0
    .param p1, "platform"    # Lcom/youai/IPlatformLoginAndPay;

    .prologue
    .line 126
    return-void
.end method

.method public notifyInitPlatformSDKComplete()V
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/PlatformSDKState;->access$500(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;->notifyInitPlatformSDKComplete()V

    .line 133
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateCallback;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/PlatformSDKState;->access$600(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/IStateManager;

    move-result-object v0

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lcom/youai/IStateManager;->changeState(I)V

    .line 134
    return-void
.end method
