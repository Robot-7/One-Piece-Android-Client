.class Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;
.super Landroid/database/ContentObserver;
.source "DownloadApk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/DownloadApk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DownloadChangeObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/DownloadApk;


# direct methods
.method public constructor <init>(Lcom/youai/dreamonepiece/DownloadApk;)V
    .locals 1

    .prologue
    .line 332
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    .line 333
    invoke-static {p1}, Lcom/youai/dreamonepiece/DownloadApk;->access$500(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 334
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .param p1, "selfChange"    # Z

    .prologue
    .line 338
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/DownloadApk;->updateView()V

    .line 339
    return-void
.end method
