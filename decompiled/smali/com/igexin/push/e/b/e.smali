.class public Lcom/igexin/push/e/b/e;
.super Lcom/igexin/push/e/b/h;


# static fields
.field private static a:Lcom/igexin/push/e/b/e;


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/32 v0, 0x36ee80

    invoke-direct {p0, v0, v1}, Lcom/igexin/push/e/b/h;-><init>(J)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/igexin/push/e/b/e;->A:Z

    return-void
.end method

.method public static g()Lcom/igexin/push/e/b/e;
    .locals 1

    sget-object v0, Lcom/igexin/push/e/b/e;->a:Lcom/igexin/push/e/b/e;

    if-nez v0, :cond_0

    new-instance v0, Lcom/igexin/push/e/b/e;

    invoke-direct {v0}, Lcom/igexin/push/e/b/e;-><init>()V

    sput-object v0, Lcom/igexin/push/e/b/e;->a:Lcom/igexin/push/e/b/e;

    :cond_0
    sget-object v0, Lcom/igexin/push/e/b/e;->a:Lcom/igexin/push/e/b/e;

    return-object v0
.end method


# virtual methods
.method protected a()V
    .locals 7

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->C()V

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->A()V

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->s()V

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->t()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Lcom/igexin/push/core/g;->M:J

    sub-long v3, v1, v3

    const-wide/32 v5, 0x36ee80

    cmp-long v0, v3, v5

    if-lez v0, :cond_1

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Lcom/igexin/push/core/a/f;->a(J)Z

    move-result v3

    const/4 v0, 0x1

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v3

    const-string v4, "ccs"

    invoke-virtual {v3, v4}, Lcom/igexin/push/core/a/f;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "1"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x0

    :cond_0
    if-eqz v0, :cond_1

    sput-wide v1, Lcom/igexin/push/core/g;->M:J

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->z()V

    :cond_1
    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->B()V

    return-void
.end method

.method public b()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public c()V
    .locals 1

    invoke-super {p0}, Lcom/igexin/push/e/b/h;->c()V

    iget-boolean v0, p0, Lcom/igexin/push/e/b/e;->x:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/igexin/push/e/b/e;->h()V

    :cond_0
    return-void
.end method

.method public h()V
    .locals 3

    const-wide/32 v0, 0x36ee80

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/igexin/push/e/b/e;->a(JLjava/util/concurrent/TimeUnit;)I

    return-void
.end method
