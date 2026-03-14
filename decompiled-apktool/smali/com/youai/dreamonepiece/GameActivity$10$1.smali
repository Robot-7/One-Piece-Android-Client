.class Lcom/youai/dreamonepiece/GameActivity$10$1;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity$10;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity$10;)V
    .locals 0

    .prologue
    .line 945
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$10$1;->this$0:Lcom/youai/dreamonepiece/GameActivity$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 949
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->stopMovieClick()V

    .line 950
    const/4 v0, 0x1

    return v0
.end method
