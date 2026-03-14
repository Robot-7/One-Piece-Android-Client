.class public Lcom/testin/agent/nativecrash/NativeCrash;
.super Ljava/lang/Object;


# instance fields
.field private tag:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/testin/agent/nativecrash/NativeCrash;->tag:Z

    return-void
.end method

.method static synthetic access$0(Lcom/testin/agent/nativecrash/NativeCrash;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/testin/agent/nativecrash/NativeCrash;->tag:Z

    return-void
.end method


# virtual methods
.method public initNativeCrash(Ljava/lang/String;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/testin/agent/nativecrash/NativeCrash;->registNativeCrash(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public notifyNativeCrashed(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "dumpfile path is null or 0-length"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "dump file not exists"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0

    :cond_2
    :try_start_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/testin/agent/nativecrash/a;

    invoke-direct {v1, p0, p1}, Lcom/testin/agent/nativecrash/a;-><init>(Lcom/testin/agent/nativecrash/NativeCrash;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :goto_1
    iget-boolean v0, p0, Lcom/testin/agent/nativecrash/NativeCrash;->tag:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x1

    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_3
    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1
.end method

.method public native registNativeCrash(Ljava/lang/String;)Z
.end method
