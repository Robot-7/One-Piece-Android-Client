.class Lcom/youai/WorldVideoView$4;
.super Ljava/lang/Object;
.source "WorldVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/WorldVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/WorldVideoView;


# direct methods
.method constructor <init>(Lcom/youai/WorldVideoView;)V
    .locals 0

    .prologue
    .line 315
    iput-object p1, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "framework_err"    # I
    .param p3, "impl_err"    # I

    .prologue
    const/4 v2, 0x1

    .line 318
    iget-object v0, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 319
    iget-object v0, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 323
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$1200(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 324
    iget-object v0, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$1200(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 361
    :cond_1
    :goto_0
    return v2

    .line 336
    :cond_2
    iget-object v0, p0, Lcom/youai/WorldVideoView$4;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_1

    goto :goto_0
.end method
