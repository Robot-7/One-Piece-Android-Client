.class final Lcom/tencent/wxop/stat/w;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic bR:Z

.field final synthetic bc:Ljava/util/List;

.field final synthetic ch:Z

.field final synthetic ci:Lcom/tencent/wxop/stat/u;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/u;Ljava/util/List;Z)V
    .locals 1

    iput-object p1, p0, Lcom/tencent/wxop/stat/w;->ci:Lcom/tencent/wxop/stat/u;

    iput-object p2, p0, Lcom/tencent/wxop/stat/w;->bc:Ljava/util/List;

    iput-boolean p3, p0, Lcom/tencent/wxop/stat/w;->ch:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tencent/wxop/stat/w;->bR:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/tencent/wxop/stat/w;->ci:Lcom/tencent/wxop/stat/u;

    iget-object v1, p0, Lcom/tencent/wxop/stat/w;->bc:Ljava/util/List;

    iget-boolean v2, p0, Lcom/tencent/wxop/stat/w;->ch:Z

    invoke-static {v0, v1, v2}, Lcom/tencent/wxop/stat/u;->a(Lcom/tencent/wxop/stat/u;Ljava/util/List;Z)V

    iget-boolean v0, p0, Lcom/tencent/wxop/stat/w;->bR:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/wxop/stat/w;->bc:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_0
    return-void
.end method
