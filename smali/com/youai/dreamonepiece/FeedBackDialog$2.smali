.class Lcom/youai/dreamonepiece/FeedBackDialog$2;
.super Ljava/lang/Object;
.source "FeedBackDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/FeedBackDialog;->show()V
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
    .line 114
    iput-object p1, p0, Lcom/youai/dreamonepiece/FeedBackDialog$2;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 120
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog$2;->this$0:Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->onBack()V

    .line 122
    const/4 v0, 0x1

    .line 124
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
