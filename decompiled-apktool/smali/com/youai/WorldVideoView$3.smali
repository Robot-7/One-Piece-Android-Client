.class Lcom/youai/WorldVideoView$3;
.super Ljava/lang/Object;
.source "WorldVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


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
    .line 304
    iput-object p1, p0, Lcom/youai/WorldVideoView$3;->this$0:Lcom/youai/WorldVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/youai/WorldVideoView$3;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 307
    iget-object v0, p0, Lcom/youai/WorldVideoView$3;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView$3;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$1100(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 310
    iget-object v0, p0, Lcom/youai/WorldVideoView$3;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$1100(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$3;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/media/MediaPlayer$OnCompletionListener;->onCompletion(Landroid/media/MediaPlayer;)V

    .line 312
    :cond_1
    return-void
.end method
