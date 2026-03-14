.class public Lcom/testin/agent/e/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static a:Lcom/testin/agent/e/a;


# instance fields
.field private b:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private c:Landroid/content/Context;

.field private d:Lcom/testin/agent/b/d;

.field private e:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/testin/agent/e/a;->e:Z

    iget-object v0, p0, Lcom/testin/agent/e/a;->d:Lcom/testin/agent/b/d;

    if-nez v0, :cond_0

    new-instance v0, Lcom/testin/agent/b/d;

    invoke-direct {v0}, Lcom/testin/agent/b/d;-><init>()V

    iput-object v0, p0, Lcom/testin/agent/e/a;->d:Lcom/testin/agent/b/d;

    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/testin/agent/e/a;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/e/a;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Lcom/testin/agent/e/a;Ljava/lang/Throwable;)Lcom/testin/agent/c/a;
    .locals 1

    invoke-direct {p0, p1}, Lcom/testin/agent/e/a;->a(Ljava/lang/Throwable;)Lcom/testin/agent/c/a;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized a(Ljava/lang/Throwable;)Lcom/testin/agent/c/a;
    .locals 9

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Lcom/testin/agent/c/a;

    invoke-direct {v2}, Lcom/testin/agent/c/a;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v3

    invoke-virtual {v3}, Lcom/testin/agent/base/TestinGVariables;->b()Lcom/testin/agent/d/c;

    move-result-object v3

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v4

    invoke-virtual {v4}, Lcom/testin/agent/base/TestinGVariables;->a()Lcom/testin/agent/d/d;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/testin/agent/c/a;->a(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/testin/agent/c/a;->b(Ljava/lang/String;)V

    const/16 v5, 0xa

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

    invoke-static {}, Lcom/testin/agent/f/e;->a()Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->g(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/testin/agent/d/d;->a()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->i(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/testin/agent/e/a;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/e;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->j(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/testin/agent/f/e;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->k(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/testin/agent/e/a;->c:Landroid/content/Context;

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

    iget-object v3, p0, Lcom/testin/agent/e/a;->c:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/d;->d(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->c(I)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-string v5, "CrashHandler"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u6570\u636e\u91c7\u96c6\u8017\u65f6\uff08\u6beb\u79d2\uff09\uff1a"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v0, v3, v0

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v2

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static declared-synchronized a()Lcom/testin/agent/e/a;
    .locals 2

    const-class v1, Lcom/testin/agent/e/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/testin/agent/e/a;->a:Lcom/testin/agent/e/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/testin/agent/e/a;

    invoke-direct {v0}, Lcom/testin/agent/e/a;-><init>()V

    sput-object v0, Lcom/testin/agent/e/a;->a:Lcom/testin/agent/e/a;

    :cond_0
    sget-object v0, Lcom/testin/agent/e/a;->a:Lcom/testin/agent/e/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static synthetic a(Lcom/testin/agent/e/a;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/testin/agent/e/a;->e:Z

    return-void
.end method

.method static synthetic b(Lcom/testin/agent/e/a;)Lcom/testin/agent/b/d;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/e/a;->d:Lcom/testin/agent/b/d;

    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Lcom/testin/agent/e/a;->c:Landroid/content/Context;

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/testin/agent/e/a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    iget-boolean v0, p0, Lcom/testin/agent/e/a;->e:Z

    if-eqz v0, :cond_0

    const-string v0, "CrashHandler"

    const-string v1, "Crash info is reported"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/testin/agent/e/b;

    invoke-direct {v0, p0, p2}, Lcom/testin/agent/e/b;-><init>(Lcom/testin/agent/e/a;Ljava/lang/Throwable;)V

    invoke-virtual {v0}, Lcom/testin/agent/e/b;->start()V

    :goto_1
    iget-boolean v0, p0, Lcom/testin/agent/e/a;->e:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/testin/agent/e/a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    const-wide/16 v0, 0x1

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_1
.end method
