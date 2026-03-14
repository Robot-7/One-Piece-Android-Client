.class Lcom/youai/WorldVideoView$2;
.super Ljava/lang/Object;
.source "WorldVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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
    .line 247
    iput-object p1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 4
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 250
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0, v2}, Lcom/youai/WorldVideoView;->access$302(Lcom/youai/WorldVideoView;Z)Z

    .line 251
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$400(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$400(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 255
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 257
    :cond_1
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/youai/WorldVideoView;->access$002(Lcom/youai/WorldVideoView;I)I

    .line 258
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/youai/WorldVideoView;->access$102(Lcom/youai/WorldVideoView;I)I

    .line 259
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$000(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$100(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-eqz v0, :cond_6

    .line 262
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$000(Lcom/youai/WorldVideoView;)I

    move-result v1

    iget-object v2, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v2}, Lcom/youai/WorldVideoView;->access$100(Lcom/youai/WorldVideoView;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 263
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$700(Lcom/youai/WorldVideoView;)I

    move-result v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$000(Lcom/youai/WorldVideoView;)I

    move-result v1

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$800(Lcom/youai/WorldVideoView;)I

    move-result v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$100(Lcom/youai/WorldVideoView;)I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 270
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$900(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-eqz v0, :cond_2

    .line 271
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$900(Lcom/youai/WorldVideoView;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 272
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0, v3}, Lcom/youai/WorldVideoView;->access$902(Lcom/youai/WorldVideoView;I)I

    .line 274
    :cond_2
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$1000(Lcom/youai/WorldVideoView;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 275
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 276
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0, v3}, Lcom/youai/WorldVideoView;->access$1002(Lcom/youai/WorldVideoView;Z)Z

    .line 277
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 278
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    .line 301
    :cond_3
    :goto_0
    return-void

    .line 280
    :cond_4
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$900(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->getCurrentPosition()I

    move-result v0

    if-lez v0, :cond_3

    .line 282
    :cond_5
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 285
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/MediaController;->show(I)V

    goto :goto_0

    .line 292
    :cond_6
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$900(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-eqz v0, :cond_7

    .line 293
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$900(Lcom/youai/WorldVideoView;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 294
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0, v3}, Lcom/youai/WorldVideoView;->access$902(Lcom/youai/WorldVideoView;I)I

    .line 296
    :cond_7
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$1000(Lcom/youai/WorldVideoView;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 297
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 298
    iget-object v0, p0, Lcom/youai/WorldVideoView$2;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0, v3}, Lcom/youai/WorldVideoView;->access$1002(Lcom/youai/WorldVideoView;Z)Z

    goto :goto_0
.end method
