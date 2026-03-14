.class Lcom/youai/WorldVideoView$5;
.super Ljava/lang/Object;
.source "WorldVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;


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
    .line 365
    iput-object p1, p0, Lcom/youai/WorldVideoView$5;->this$0:Lcom/youai/WorldVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 1
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 367
    iget-object v0, p0, Lcom/youai/WorldVideoView$5;->this$0:Lcom/youai/WorldVideoView;

    invoke-static {v0, p2}, Lcom/youai/WorldVideoView;->access$1302(Lcom/youai/WorldVideoView;I)I

    .line 368
    return-void
.end method
