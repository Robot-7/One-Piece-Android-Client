.class Lcom/youai/dreamonepiece/DownloadApk$1;
.super Landroid/os/Handler;
.source "DownloadApk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/DownloadApk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/DownloadApk;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/DownloadApk;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 68
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 86
    :goto_0
    return-void

    .line 70
    :pswitch_0
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v1}, Lcom/youai/dreamonepiece/DownloadApk;->access$000(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v1}, Lcom/youai/dreamonepiece/DownloadApk;->access$000(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v1}, Lcom/youai/dreamonepiece/DownloadApk;->access$000(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 73
    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 74
    .local v0, "status":I
    const/16 v1, 0xc8

    if-ne v0, v1, :cond_1

    .line 75
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    iget-object v2, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v2}, Lcom/youai/dreamonepiece/DownloadApk;->access$100(Lcom/youai/dreamonepiece/DownloadApk;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/DownloadApk;->onCreate(Ljava/lang/String;)V

    goto :goto_0

    .line 77
    :cond_1
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/youai/dreamonepiece/DownloadApk;->access$202(Lcom/youai/dreamonepiece/DownloadApk;I)I

    .line 78
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    iget-object v2, p0, Lcom/youai/dreamonepiece/DownloadApk$1;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v2}, Lcom/youai/dreamonepiece/DownloadApk;->access$300(Lcom/youai/dreamonepiece/DownloadApk;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/DownloadApk;->onCreate(Ljava/lang/String;)V

    goto :goto_0

    .line 68
    nop

    :pswitch_data_0
    .packed-switch 0x2710
        :pswitch_0
    .end packed-switch
.end method
