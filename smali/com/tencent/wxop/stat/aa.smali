.class final Lcom/tencent/wxop/stat/aa;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field final synthetic cm:Lcom/tencent/wxop/stat/h;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/h;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/aa;->cm:Lcom/tencent/wxop/stat/h;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/tencent/wxop/stat/aa;->cm:Lcom/tencent/wxop/stat/h;

    invoke-static {v0}, Lcom/tencent/wxop/stat/h;->a(Lcom/tencent/wxop/stat/h;)Lcom/tencent/wxop/stat/b/f;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/wxop/stat/aa;->cm:Lcom/tencent/wxop/stat/h;

    invoke-static {v0}, Lcom/tencent/wxop/stat/h;->a(Lcom/tencent/wxop/stat/h;)Lcom/tencent/wxop/stat/b/f;

    move-result-object v0

    new-instance v1, Lcom/tencent/wxop/stat/af;

    invoke-direct {v1, p0}, Lcom/tencent/wxop/stat/af;-><init>(Lcom/tencent/wxop/stat/aa;)V

    invoke-virtual {v0, v1}, Lcom/tencent/wxop/stat/b/f;->a(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
