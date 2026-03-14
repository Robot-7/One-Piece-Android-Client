.class Lcom/testin/agent/b/i;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/testin/agent/b/f;

.field private final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/testin/agent/b/f;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/b/i;->a:Lcom/testin/agent/b/f;

    iput-object p2, p0, Lcom/testin/agent/b/i;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/testin/agent/b/i;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/testin/agent/f/c;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "TestinTestHandler"

    const-string v1, "Current network is disconnected or disabled"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/testin/agent/b/i;->a:Lcom/testin/agent/b/f;

    invoke-static {v0}, Lcom/testin/agent/b/f;->b(Lcom/testin/agent/b/f;)Lcom/testin/agent/b/d;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/testin/agent/b/i;->a:Lcom/testin/agent/b/f;

    new-instance v1, Lcom/testin/agent/b/d;

    invoke-direct {v1}, Lcom/testin/agent/b/d;-><init>()V

    invoke-static {v0, v1}, Lcom/testin/agent/b/f;->a(Lcom/testin/agent/b/f;Lcom/testin/agent/b/d;)V

    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    iget-object v0, p0, Lcom/testin/agent/b/i;->a:Lcom/testin/agent/b/f;

    iget-object v1, p0, Lcom/testin/agent/b/i;->b:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/testin/agent/b/f;->c(Landroid/content/Context;)V

    goto :goto_0
.end method
