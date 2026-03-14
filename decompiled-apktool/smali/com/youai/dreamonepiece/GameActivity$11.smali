.class final Lcom/youai/dreamonepiece/GameActivity$11;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->playMovie(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 967
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 971
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 972
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->stopMovieClick()V

    .line 973
    :cond_0
    return-void
.end method
