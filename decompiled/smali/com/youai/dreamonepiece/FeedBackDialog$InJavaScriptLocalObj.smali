.class final Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;
.super Ljava/lang/Object;
.source "FeedBackDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/FeedBackDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "InJavaScriptLocalObj"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/FeedBackDialog;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public goBackGame()V
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->access$400(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 208
    return-void
.end method
