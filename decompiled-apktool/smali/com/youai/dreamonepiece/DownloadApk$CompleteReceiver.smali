.class Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadApk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/DownloadApk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CompleteReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/DownloadApk;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/DownloadApk;)V
    .locals 0

    .prologue
    .line 343
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const-wide/16 v7, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 351
    const-string v5, "extra_download_id"

    invoke-virtual {p2, v5, v7, v8}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 353
    .local v0, "completeDownloadId":J
    iget-object v5, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v5}, Lcom/youai/dreamonepiece/DownloadApk;->access$600(Lcom/youai/dreamonepiece/DownloadApk;)J

    move-result-wide v5

    cmp-long v5, v0, v5

    if-nez v5, :cond_1

    move v5, v3

    :goto_0
    cmp-long v6, v0, v7

    if-eqz v6, :cond_2

    :goto_1
    and-int/2addr v3, v5

    if-eqz v3, :cond_0

    .line 354
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v3}, Lcom/youai/dreamonepiece/DownloadApk;->access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->dismiss()V

    .line 356
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v3}, Lcom/youai/dreamonepiece/DownloadApk;->access$800(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/DownloadManagerPro;

    move-result-object v3

    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$600(Lcom/youai/dreamonepiece/DownloadApk;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getStatusById(J)I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_0

    .line 358
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v3}, Lcom/youai/dreamonepiece/DownloadApk;->access$800(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/DownloadManagerPro;

    move-result-object v3

    iget-object v4, p0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v4}, Lcom/youai/dreamonepiece/DownloadApk;->access$600(Lcom/youai/dreamonepiece/DownloadApk;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getFileName(J)Ljava/lang/String;

    move-result-object v2

    .line 359
    .local v2, "path":Ljava/lang/String;
    const-string v3, "path"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v3}, Lcom/youai/dreamonepiece/DownloadApk;->install(Landroid/content/Context;Ljava/io/File;)Z

    .line 363
    .end local v2    # "path":Ljava/lang/String;
    :cond_0
    return-void

    :cond_1
    move v5, v4

    .line 353
    goto :goto_0

    :cond_2
    move v3, v4

    goto :goto_1
.end method
