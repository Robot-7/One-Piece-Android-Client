.class Lcom/youai/dreamonepiece/GameContextState$1;
.super Ljava/lang/Object;
.source "GameContextState.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameContextState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private ict:I

.field final synthetic this$0:Lcom/youai/dreamonepiece/GameContextState;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameContextState;)V
    .locals 1

    .prologue
    .line 121
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameContextState$1;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    const/4 v0, 0x0

    iput v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 127
    iget v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    if-nez v0, :cond_1

    .line 128
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameContextState;->access$200(Lcom/youai/dreamonepiece/GameContextState;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "\u6b63\u5728\u542f\u52a8\u6e38\u620f."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    iput v2, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    .line 138
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameContextState;->access$300(Lcom/youai/dreamonepiece/GameContextState;)Lcom/youai/IGameActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 140
    return-void

    .line 130
    :cond_1
    iget v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    if-ne v0, v2, :cond_2

    .line 131
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameContextState;->access$200(Lcom/youai/dreamonepiece/GameContextState;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "\u6b63\u5728\u542f\u52a8\u6e38\u620f.."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iput v3, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    goto :goto_0

    .line 133
    :cond_2
    iget v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    if-ne v0, v3, :cond_0

    .line 134
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->this$0:Lcom/youai/dreamonepiece/GameContextState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameContextState;->access$200(Lcom/youai/dreamonepiece/GameContextState;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "\u6b63\u5728\u542f\u52a8\u6e38\u620f..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    const/4 v0, 0x0

    iput v0, p0, Lcom/youai/dreamonepiece/GameContextState$1;->ict:I

    goto :goto_0
.end method
