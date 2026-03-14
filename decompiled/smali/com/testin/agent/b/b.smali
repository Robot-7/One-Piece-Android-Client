.class public Lcom/testin/agent/b/b;
.super Ljava/lang/Object;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/testin/agent/b/d;

.field private c:Z


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/testin/agent/b/b;->b:Lcom/testin/agent/b/d;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/testin/agent/b/b;->c:Z

    iput-object p1, p0, Lcom/testin/agent/b/b;->a:Landroid/content/Context;

    iget-object v0, p0, Lcom/testin/agent/b/b;->b:Lcom/testin/agent/b/d;

    if-nez v0, :cond_0

    new-instance v0, Lcom/testin/agent/b/d;

    invoke-direct {v0}, Lcom/testin/agent/b/d;-><init>()V

    iput-object v0, p0, Lcom/testin/agent/b/b;->b:Lcom/testin/agent/b/d;

    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/testin/agent/b/b;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/b/b;->a:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Lcom/testin/agent/b/b;ILjava/lang/String;Ljava/lang/String;)Lcom/testin/agent/c/a;
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lcom/testin/agent/b/b;->b(ILjava/lang/String;Ljava/lang/String;)Lcom/testin/agent/c/a;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/testin/agent/b/b;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/testin/agent/b/b;->c:Z

    return-void
.end method

.method static synthetic b(Lcom/testin/agent/b/b;)Lcom/testin/agent/b/d;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/b/b;->b:Lcom/testin/agent/b/d;

    return-object v0
.end method

.method private b(ILjava/lang/String;Ljava/lang/String;)Lcom/testin/agent/c/a;
    .locals 9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Lcom/testin/agent/c/a;

    invoke-direct {v2}, Lcom/testin/agent/c/a;-><init>()V

    :try_start_0
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v3

    invoke-virtual {v3}, Lcom/testin/agent/base/TestinGVariables;->b()Lcom/testin/agent/d/c;

    move-result-object v3

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v4

    invoke-virtual {v4}, Lcom/testin/agent/base/TestinGVariables;->a()Lcom/testin/agent/d/d;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/testin/agent/c/a;->a(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/testin/agent/c/a;->b(Ljava/lang/String;)V

    const/16 v5, 0xb

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/testin/agent/c/a;->c(Ljava/lang/String;)V

    const-string v5, "5.0"

    invoke-virtual {v2, v5}, Lcom/testin/agent/c/a;->e(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/testin/agent/d/c;->a()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->d(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/f/e;->h()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->f(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Lcom/testin/agent/c/a;->h(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/testin/agent/d/d;->a()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->i(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/testin/agent/b/b;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/e;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->j(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Lcom/testin/agent/c/a;->k(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/testin/agent/b/b;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/e;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->l(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/f/a;->a()Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->m(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->b(I)V

    iget-object v3, p0, Lcom/testin/agent/b/b;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/d;->d(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->c(I)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-string v5, "CustomExceptionHandler"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u6570\u636e\u91c7\u96c6\u8017\u65f6\uff08\u6beb\u79d2\uff09\uff1a"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v0, v3, v0

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method


# virtual methods
.method protected a(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Lcom/testin/agent/b/c;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/testin/agent/b/c;-><init>(Lcom/testin/agent/b/b;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/testin/agent/b/c;->start()V

    :goto_0
    iget-boolean v0, p0, Lcom/testin/agent/b/b;->c:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-wide/16 v0, 0x1

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method
