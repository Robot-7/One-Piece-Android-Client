.class Lcom/youai/dreamonepiece/FeedBackDialog$3;
.super Ljava/lang/Object;
.source "FeedBackDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/FeedBackDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/FeedBackDialog;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V
    .locals 0

    .prologue
    .line 143
    iput-object p1, p0, Lcom/youai/dreamonepiece/FeedBackDialog$3;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 148
    :try_start_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$3;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->access$100(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 149
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$3;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->access$200(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$3;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->access$200(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$3;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->dismiss()V

    .line 156
    return-void

    .line 152
    :catch_0
    move-exception v0

    goto :goto_0
.end method
