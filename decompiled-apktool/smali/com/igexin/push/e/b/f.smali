.class public Lcom/igexin/push/e/b/f;
.super Lcom/igexin/push/e/b/h;


# static fields
.field private static final a:Ljava/lang/String;

.field private static b:Lcom/igexin/push/e/b/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/igexin/push/a/j;->a:Ljava/lang/String;

    sput-object v0, Lcom/igexin/push/e/b/f;->a:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    const-wide/32 v0, 0x36ee80

    invoke-direct {p0, v0, v1}, Lcom/igexin/push/e/b/h;-><init>(J)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/igexin/push/e/b/f;->A:Z

    return-void
.end method

.method public static g()Lcom/igexin/push/e/b/f;
    .locals 1

    sget-object v0, Lcom/igexin/push/e/b/f;->b:Lcom/igexin/push/e/b/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/igexin/push/e/b/f;

    invoke-direct {v0}, Lcom/igexin/push/e/b/f;-><init>()V

    sput-object v0, Lcom/igexin/push/e/b/f;->b:Lcom/igexin/push/e/b/f;

    :cond_0
    sget-object v0, Lcom/igexin/push/e/b/f;->b:Lcom/igexin/push/e/b/f;

    return-object v0
.end method


# virtual methods
.method protected a()V
    .locals 3

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->C()V

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/igexin/push/core/a/f;->a(J)Z

    move-result v0

    invoke-static {}, Lcom/igexin/push/core/a/f;->a()Lcom/igexin/push/core/a/f;

    move-result-object v1

    invoke-virtual {v1}, Lcom/igexin/push/core/a/f;->n()Z

    move-result v1

    sget-boolean v2, Lcom/igexin/push/core/g;->k:Z

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/igexin/push/core/g;->l:Z

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/igexin/push/core/g;->m:Z

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/igexin/push/core/g;->o:Z

    if-nez v2, :cond_0

    if-nez v0, :cond_0

    if-eqz v1, :cond_0

    sget-boolean v0, Lcom/igexin/push/core/g;->o:Z

    if-eqz v0, :cond_1

    :cond_0
    const-wide/32 v0, 0x36ee80

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/igexin/push/e/b/f;->a(JLjava/util/concurrent/TimeUnit;)I

    :goto_0
    return-void

    :cond_1
    invoke-static {}, Lcom/igexin/push/core/f;->a()Lcom/igexin/push/core/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/f;->g()Lcom/igexin/push/core/a/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/a/f;->d()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    :cond_2
    :goto_1
    const-wide/32 v0, 0x1b7740

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/igexin/push/e/b/f;->a(JLjava/util/concurrent/TimeUnit;)I

    goto :goto_0

    :cond_3
    if-nez v0, :cond_2

    invoke-static {}, Lcom/igexin/a/a/b/d;->c()Lcom/igexin/a/a/b/d;

    move-result-object v0

    new-instance v1, Lcom/igexin/push/c/b/a;

    invoke-direct {v1}, Lcom/igexin/push/c/b/a;-><init>()V

    invoke-virtual {v0, v1}, Lcom/igexin/a/a/b/d;->a(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/igexin/a/a/b/d;->c()Lcom/igexin/a/a/b/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/a/a/b/d;->d()V

    goto :goto_1
.end method

.method public final b()I
    .locals 1

    const v0, -0x7ffffff9

    return v0
.end method

.method public c()V
    .locals 0

    invoke-super {p0}, Lcom/igexin/push/e/b/h;->c()V

    return-void
.end method

.method public d()V
    .locals 0

    return-void
.end method

.method public h()V
    .locals 3

    invoke-static {}, Lcom/igexin/push/core/f;->a()Lcom/igexin/push/core/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/core/f;->e()Lcom/igexin/push/d/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/igexin/push/d/j;->c()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/igexin/push/e/b/f;->a(JLjava/util/concurrent/TimeUnit;)I

    return-void
.end method
