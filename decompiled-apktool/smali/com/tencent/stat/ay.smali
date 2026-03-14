.class Lcom/tencent/stat/ay;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/tencent/stat/a/e;

.field final synthetic b:Lcom/tencent/stat/StatDispatchCallback;

.field final synthetic c:Z

.field final synthetic d:Z

.field final synthetic e:Lcom/tencent/stat/au;


# direct methods
.method constructor <init>(Lcom/tencent/stat/au;Lcom/tencent/stat/a/e;Lcom/tencent/stat/StatDispatchCallback;ZZ)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/stat/ay;->e:Lcom/tencent/stat/au;

    iput-object p2, p0, Lcom/tencent/stat/ay;->a:Lcom/tencent/stat/a/e;

    iput-object p3, p0, Lcom/tencent/stat/ay;->b:Lcom/tencent/stat/StatDispatchCallback;

    iput-boolean p4, p0, Lcom/tencent/stat/ay;->c:Z

    iput-boolean p5, p0, Lcom/tencent/stat/ay;->d:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/tencent/stat/ay;->e:Lcom/tencent/stat/au;

    iget-object v1, p0, Lcom/tencent/stat/ay;->a:Lcom/tencent/stat/a/e;

    iget-object v2, p0, Lcom/tencent/stat/ay;->b:Lcom/tencent/stat/StatDispatchCallback;

    iget-boolean v3, p0, Lcom/tencent/stat/ay;->c:Z

    iget-boolean v4, p0, Lcom/tencent/stat/ay;->d:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/tencent/stat/au;->a(Lcom/tencent/stat/au;Lcom/tencent/stat/a/e;Lcom/tencent/stat/StatDispatchCallback;ZZ)V

    return-void
.end method
