.class Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;
.super Landroid/os/Handler;
.source "DownloadApk.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "HandlerLeak"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/DownloadApk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DownLoadHandler"
.end annotation


# instance fields
.field progress:I

.field final synthetic this$0:Lcom/youai/dreamonepiece/DownloadApk;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/DownloadApk;)V
    .locals 1

    .prologue
    .line 367
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 368
    const/4 v0, 0x0

    iput v0, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/high16 v7, 0x100000

    const/4 v5, 0x1

    const/4 v8, 0x0

    .line 372
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 374
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 446
    :cond_0
    :goto_0
    return-void

    .line 376
    :pswitch_0
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 378
    .local v3, "status":I
    invoke-static {v3}, Lcom/youai/dreamonepiece/DownloadApk;->isDownloading(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 379
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->show()V

    .line 380
    const-string v4, "isDownloading"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "isDownloading"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    iget v4, p1, Landroid/os/Message;->arg2:I

    if-ltz v4, :cond_0

    .line 385
    const-string v1, ""

    .line 386
    .local v1, "maxSize":Ljava/lang/String;
    const-string v2, ""

    .line 387
    .local v2, "progressSize":Ljava/lang/String;
    iget v4, p1, Landroid/os/Message;->arg2:I

    if-gtz v4, :cond_1

    .line 388
    const/4 v0, 0x0

    .line 389
    .local v0, "max":I
    iput v8, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    .line 391
    .end local v0    # "max":I
    :cond_1
    iget v4, p1, Landroid/os/Message;->arg2:I

    if-lt v4, v7, :cond_2

    .line 392
    iget v4, p1, Landroid/os/Message;->arg2:I

    div-int v0, v4, v7

    .line 393
    .restart local v0    # "max":I
    iget v4, p1, Landroid/os/Message;->arg1:I

    div-int/2addr v4, v7

    iput v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    .line 394
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "MB"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 395
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "MB"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 408
    :goto_1
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 409
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    iget v5, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 410
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u6b63\u5728\u4e0b\u8f7d\u6700\u65b0\u7248\u672c\u5b89\u88c5\u5305\uff0c\u9700\u8981\u8f83\u957f\u65f6\u95f4\uff0c\u662f\u5426\u5207\u6362\u540e\u53f0\u4e0b\u8f7d?\r\n\u4e0b\u8f7d\uff1a"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 397
    .end local v0    # "max":I
    :cond_2
    iget v4, p1, Landroid/os/Message;->arg2:I

    const/16 v5, 0x400

    if-lt v4, v5, :cond_3

    .line 398
    iget v4, p1, Landroid/os/Message;->arg2:I

    div-int/lit16 v0, v4, 0x400

    .line 399
    .restart local v0    # "max":I
    iget v4, p1, Landroid/os/Message;->arg1:I

    div-int/lit16 v4, v4, 0x400

    iput v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    .line 400
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "KB"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 401
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "KB"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 403
    .end local v0    # "max":I
    :cond_3
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 404
    .restart local v0    # "max":I
    iget v4, p1, Landroid/os/Message;->arg1:I

    iput v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    .line 405
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "B"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 406
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "B"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 415
    .end local v0    # "max":I
    .end local v1    # "maxSize":Ljava/lang/String;
    .end local v2    # "progressSize":Ljava/lang/String;
    :cond_4
    const/16 v4, 0x10

    if-ne v3, v4, :cond_7

    .line 416
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$200(Lcom/youai/dreamonepiece/DownloadApk;)I

    move-result v4

    if-ne v4, v5, :cond_6

    .line 417
    iget v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->progress:I

    if-nez v4, :cond_5

    .line 418
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 419
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$900(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/DownloadManager;

    move-result-object v4

    new-array v5, v5, [J

    iget-object v6, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v6}, Lcom/youai/dreamonepiece/DownloadApk;->access$600(Lcom/youai/dreamonepiece/DownloadApk;)J

    move-result-wide v6

    aput-wide v6, v5, v8

    invoke-virtual {v4, v5}, Landroid/app/DownloadManager;->remove([J)I

    .line 420
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4, v8}, Lcom/youai/dreamonepiece/DownloadApk;->access$202(Lcom/youai/dreamonepiece/DownloadApk;I)I

    .line 421
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    iget-object v5, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v5}, Lcom/youai/dreamonepiece/DownloadApk;->access$300(Lcom/youai/dreamonepiece/DownloadApk;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/youai/dreamonepiece/DownloadApk;->onCreate(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 423
    :cond_5
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 424
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$900(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/DownloadManager;

    move-result-object v4

    new-array v5, v5, [J

    iget-object v6, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v6}, Lcom/youai/dreamonepiece/DownloadApk;->access$600(Lcom/youai/dreamonepiece/DownloadApk;)J

    move-result-wide v6

    aput-wide v6, v5, v8

    invoke-virtual {v4, v5}, Landroid/app/DownloadManager;->remove([J)I

    .line 425
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$400(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v4

    const-string v5, "\u5b58\u50a8\u7a7a\u95f4\u4e0d\u8db3  \u4e0b\u8f7d\u5931\u8d25"

    invoke-static {v4, v5, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 429
    :cond_6
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$200(Lcom/youai/dreamonepiece/DownloadApk;)I

    move-result v4

    if-nez v4, :cond_0

    .line 430
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 431
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$900(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/DownloadManager;

    move-result-object v4

    new-array v5, v5, [J

    iget-object v6, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v6}, Lcom/youai/dreamonepiece/DownloadApk;->access$600(Lcom/youai/dreamonepiece/DownloadApk;)J

    move-result-wide v6

    aput-wide v6, v5, v8

    invoke-virtual {v4, v5}, Landroid/app/DownloadManager;->remove([J)I

    .line 432
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$400(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v4

    const-string v5, "\u5b58\u50a8\u7a7a\u95f4\u4e0d\u8db3  \u4e0b\u8f7d\u5931\u8d25"

    invoke-static {v4, v5, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 437
    :cond_7
    const/16 v4, 0x8

    if-ne v3, v4, :cond_0

    .line 439
    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$400(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v4

    const-string v5, "\u4e0b\u8f7d\u6210\u529f"

    invoke-static {v4, v5, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 374
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
