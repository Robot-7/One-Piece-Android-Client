.class final Lcom/tencent/wxop/stat/ao;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic e:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/ao;->e:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    invoke-static {}, Lcom/tencent/wxop/stat/f;->J()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tencent/wxop/stat/h;->r(Landroid/content/Context;)Lcom/tencent/wxop/stat/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wxop/stat/h;->aa()V

    iget-object v0, p0, Lcom/tencent/wxop/stat/ao;->e:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/tencent/wxop/stat/b/l;->a(Landroid/content/Context;Z)I

    iget-object v0, p0, Lcom/tencent/wxop/stat/ao;->e:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/wxop/stat/u;->s(Landroid/content/Context;)Lcom/tencent/wxop/stat/u;

    iget-object v0, p0, Lcom/tencent/wxop/stat/ao;->e:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/wxop/stat/al;->aa(Landroid/content/Context;)Lcom/tencent/wxop/stat/al;

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    invoke-static {v0}, Lcom/tencent/wxop/stat/f;->a(Ljava/lang/Thread$UncaughtExceptionHandler;)Ljava/lang/Thread$UncaughtExceptionHandler;

    new-instance v0, Lcom/tencent/wxop/stat/o;

    invoke-direct {v0}, Lcom/tencent/wxop/stat/o;-><init>()V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {}, Lcom/tencent/wxop/stat/c;->j()Lcom/tencent/wxop/stat/d;

    move-result-object v0

    sget-object v1, Lcom/tencent/wxop/stat/d;->aE:Lcom/tencent/wxop/stat/d;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/tencent/wxop/stat/ao;->e:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/wxop/stat/f;->o(Landroid/content/Context;)V

    :cond_0
    invoke-static {}, Lcom/tencent/wxop/stat/c;->k()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/tencent/wxop/stat/f;->K()Lcom/tencent/wxop/stat/b/b;

    move-result-object v0

    const-string v1, "Init MTA StatService success."

    invoke-virtual {v0, v1}, Lcom/tencent/wxop/stat/b/b;->e(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method
