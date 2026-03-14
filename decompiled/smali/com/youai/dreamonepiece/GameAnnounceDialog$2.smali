.class Lcom/youai/dreamonepiece/GameAnnounceDialog$2;
.super Ljava/lang/Object;
.source "GameAnnounceDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameAnnounceDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 126
    :try_start_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$000(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 127
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$100(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$100(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 129
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$200(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->dismiss()V

    .line 136
    return-void

    .line 132
    :catch_0
    move-exception v0

    goto :goto_0
.end method
