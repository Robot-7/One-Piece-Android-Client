.class Lcom/youai/dreamonepiece/FeedBackDialog$1;
.super Landroid/os/Handler;
.source "FeedBackDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/FeedBackDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/FeedBackDialog;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/youai/dreamonepiece/FeedBackDialog$1;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 51
    invoke-static {}, Lcom/youai/dreamonepiece/FeedBackDialog;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchMessage"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 57
    :goto_0
    return-void

    .line 54
    :pswitch_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$1;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->onBack()V

    goto :goto_0

    .line 52
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
