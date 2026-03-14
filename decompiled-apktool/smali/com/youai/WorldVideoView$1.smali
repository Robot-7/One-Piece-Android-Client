.class Lcom/youai/WorldVideoView$1;
.super Ljava/lang/Object;
.source "WorldVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


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
    .line 232
    iput-object p1, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 234
    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/youai/WorldVideoView;->access$002(Lcom/youai/WorldVideoView;I)I

    .line 235
    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/youai/WorldVideoView;->access$102(Lcom/youai/WorldVideoView;I)I

    .line 237
    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$200(Lcom/youai/WorldVideoView;)Lcom/youai/WorldVideoView$MySizeChangeLinstener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$200(Lcom/youai/WorldVideoView;)Lcom/youai/WorldVideoView$MySizeChangeLinstener;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/WorldVideoView$MySizeChangeLinstener;->doMyThings()V

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$000(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0}, Lcom/youai/WorldVideoView;->access$100(Lcom/youai/WorldVideoView;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 242
    iget-object v0, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/WorldVideoView;->access$000(Lcom/youai/WorldVideoView;)I

    move-result v1

    iget-object v2, p0, Lcom/youai/WorldVideoView$1;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v2}, Lcom/youai/WorldVideoView;->access$100(Lcom/youai/WorldVideoView;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 244
    :cond_1
    return-void
.end method
