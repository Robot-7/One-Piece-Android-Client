.class Lcom/youai/dreamonepiece/GameActivity$15;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->onCompletion(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 0

    .prologue
    .line 1249
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$15;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 1253
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->nativeOnPlayMovieEnd()V

    .line 1254
    return-void
.end method
