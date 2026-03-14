.class Lcom/youai/dreamonepiece/DownloadApk$3;
.super Ljava/lang/Object;
.source "DownloadApk.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/DownloadApk;->preCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/DownloadApk;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/DownloadApk;)V
    .locals 0

    .prologue
    .line 221
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk$3;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 227
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 228
    .local v0, "i":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 229
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 230
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk$3;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-static {v1}, Lcom/youai/dreamonepiece/DownloadApk;->access$400(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/youai/dreamonepiece/GameActivity;->startActivity(Landroid/content/Intent;)V

    .line 231
    return-void
.end method
