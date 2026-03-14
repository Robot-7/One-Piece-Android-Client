.class Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;
.super Landroid/os/Handler;
.source "PlatformSDKState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/PlatformSDKState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlatformSDKStateHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/PlatformSDKState;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/PlatformSDKState;)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/PlatformSDKState;Lcom/youai/dreamonepiece/PlatformSDKState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/PlatformSDKState;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/PlatformSDKState$1;

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;-><init>(Lcom/youai/dreamonepiece/PlatformSDKState;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 110
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/PlatformSDKState;->access$400(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-static {v1}, Lcom/youai/dreamonepiece/PlatformSDKState;->access$200(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/IGameActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/PlatformSDKState$PlatformSDKStateHandler;->this$0:Lcom/youai/dreamonepiece/PlatformSDKState;

    invoke-static {v2}, Lcom/youai/dreamonepiece/PlatformSDKState;->access$300(Lcom/youai/dreamonepiece/PlatformSDKState;)Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/youai/IPlatformLoginAndPay;->init(Lcom/youai/IGameActivity;Lcom/youai/PlatformAndGameInfo$GameInfo;)V

    .line 113
    :cond_0
    return-void
.end method
