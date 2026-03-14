.class Lcom/testin/agent/b/j;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/testin/agent/b/f;

.field private final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/testin/agent/b/f;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/b/j;->a:Lcom/testin/agent/b/f;

    iput-object p2, p0, Lcom/testin/agent/b/j;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    invoke-virtual {v0}, Lcom/testin/agent/base/TestinGVariables;->b()Lcom/testin/agent/d/c;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/testin/agent/b/j;->a:Lcom/testin/agent/b/f;

    iget-object v1, p0, Lcom/testin/agent/b/j;->b:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/testin/agent/b/f;->a(Lcom/testin/agent/b/f;Landroid/content/Context;)V

    :cond_0
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    invoke-virtual {v0}, Lcom/testin/agent/base/TestinGVariables;->a()Lcom/testin/agent/d/d;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/testin/agent/b/j;->a:Lcom/testin/agent/b/f;

    iget-object v1, p0, Lcom/testin/agent/b/j;->b:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/testin/agent/b/f;->b(Lcom/testin/agent/b/f;Landroid/content/Context;)V

    :cond_1
    return-void
.end method
