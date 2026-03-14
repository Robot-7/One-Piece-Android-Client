.class final Lcom/tencent/wxop/stat/ah;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic de:Lcom/tencent/wxop/stat/ag;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/ag;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/ah;->de:Lcom/tencent/wxop/stat/ag;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    invoke-static {}, Lcom/tencent/wxop/stat/c;->k()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tencent/wxop/stat/b/l;->av()Lcom/tencent/wxop/stat/b/b;

    move-result-object v0

    const-string v1, "TimerTask run"

    invoke-virtual {v0, v1}, Lcom/tencent/wxop/stat/b/b;->b(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/tencent/wxop/stat/ah;->de:Lcom/tencent/wxop/stat/ag;

    invoke-static {v0}, Lcom/tencent/wxop/stat/ag;->a(Lcom/tencent/wxop/stat/ag;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tencent/wxop/stat/f;->q(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/tencent/wxop/stat/ah;->cancel()Z

    iget-object v0, p0, Lcom/tencent/wxop/stat/ah;->de:Lcom/tencent/wxop/stat/ag;

    invoke-virtual {v0}, Lcom/tencent/wxop/stat/ag;->ah()V

    return-void
.end method
