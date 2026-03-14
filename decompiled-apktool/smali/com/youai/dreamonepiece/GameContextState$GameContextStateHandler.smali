.class Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;
.super Landroid/os/Handler;
.source "GameContextState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameContextState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameContextStateHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameContextState;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/GameContextState;)V
    .locals 0

    .prologue
    .line 109
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/GameContextState;Lcom/youai/dreamonepiece/GameContextState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/GameContextState;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/GameContextState$1;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;-><init>(Lcom/youai/dreamonepiece/GameContextState;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 111
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState$GameContextStateHandler;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameContextState;->access$000(Lcom/youai/dreamonepiece/GameContextState;)Lcom/youai/IStateManager;

    move-result-object v0

    const/4 v1, 0x6

    invoke-interface {v0, v1}, Lcom/youai/IStateManager;->changeState(I)V

    .line 114
    :cond_0
    return-void
.end method
