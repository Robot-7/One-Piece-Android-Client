.class Lcom/youai/GameActivityHelper$2$1;
.super Ljava/lang/Object;
.source "GameActivityHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/GameActivityHelper$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/GameActivityHelper$2;


# direct methods
.method constructor <init>(Lcom/youai/GameActivityHelper$2;)V
    .locals 0

    .prologue
    .line 87
    iput-object p1, p0, Lcom/youai/GameActivityHelper$2$1;->this$0:Lcom/youai/GameActivityHelper$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 92
    const-string v3, "market://details?id=com.tencent.mm"

    .line 94
    .local v3, "str":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 96
    .local v2, "localIntent":Landroid/content/Intent;
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 98
    :try_start_0
    iget-object v5, p0, Lcom/youai/GameActivityHelper$2$1;->this$0:Lcom/youai/GameActivityHelper$2;

    iget-object v5, v5, Lcom/youai/GameActivityHelper$2;->val$context:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "https://market.android.com/details?id=com.tencent.mm"

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 102
    .local v4, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v1, v5, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 104
    .local v1, "intent":Landroid/content/Intent;
    iget-object v5, p0, Lcom/youai/GameActivityHelper$2$1;->this$0:Lcom/youai/GameActivityHelper$2;

    iget-object v5, v5, Lcom/youai/GameActivityHelper$2;->val$context:Landroid/content/Context;

    invoke-virtual {v5, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
