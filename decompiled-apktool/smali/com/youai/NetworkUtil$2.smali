.class Lcom/youai/NetworkUtil$2;
.super Ljava/lang/Object;
.source "NetworkUtil.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/NetworkUtil;->CheckNetwork(Landroid/content/Context;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/NetworkUtil;

.field final synthetic val$pContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/youai/NetworkUtil;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/youai/NetworkUtil$2;->this$0:Lcom/youai/NetworkUtil;

    iput-object p2, p0, Lcom/youai/NetworkUtil$2;->val$pContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 68
    new-instance v1, Landroid/content/Intent;

    const-string v2, "/"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, "mIntent":Landroid/content/Intent;
    new-instance v0, Landroid/content/ComponentName;

    const-string v2, "com.android.settings"

    const-string v3, "com.android.settings.WirelessSettings"

    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .local v0, "comp":Landroid/content/ComponentName;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 73
    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    iget-object v2, p0, Lcom/youai/NetworkUtil$2;->val$pContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 75
    return-void
.end method
