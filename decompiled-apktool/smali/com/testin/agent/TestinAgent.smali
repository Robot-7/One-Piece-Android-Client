.class public Lcom/testin/agent/TestinAgent;
.super Ljava/lang/Object;


# static fields
.field private static final CRASH_TYPE_JAVA:I

.field private static testHandler:Lcom/testin/agent/b/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/testin/agent/TestinAgent;->testHandler:Lcom/testin/agent/b/f;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAppKey(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    const-string v0, ""

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "TESTIN_APPKEY"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getChannel(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    const-string v0, ""

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "TESTIN_CHANNEL"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, ""

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getStackTraceInfo(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    const-string v0, ""

    :try_start_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, ""

    goto :goto_0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Lcom/testin/agent/TestinAgent;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/testin/agent/TestinAgent;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-nez p0, :cond_0

    const-string v0, "Context parameter is null"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {v0}, Lcom/testin/agent/TestinAgent;->getAppKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v0}, Lcom/testin/agent/TestinAgent;->getChannel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    :cond_2
    invoke-static {v0, p1, p2}, Lcom/testin/agent/TestinAgent;->start(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static onStart(Landroid/content/Context;)V
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/b/a;->a(Landroid/content/Context;)Z

    return-void
.end method

.method public static onStop(Landroid/content/Context;)V
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/b/a;->c(Landroid/content/Context;)Z

    return-void
.end method

.method public static declared-synchronized reportCustomizedException(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-class v1, Lcom/testin/agent/TestinAgent;

    monitor-enter v1

    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "reportCustomizedException(): StackTrace info is null or 0-length"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    :try_start_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, ""

    :cond_1
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iget-object v0, v0, Lcom/testin/agent/base/TestinGVariables;->d:Landroid/content/Context;

    invoke-static {v0, p0, p1, p2}, Lcom/testin/agent/b/f;->a(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static setUserInfo(Ljava/lang/String;)V
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iput-object p0, v0, Lcom/testin/agent/base/TestinGVariables;->g:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private static start(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "TestinAgent appKey parameter not configured"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iget-object v0, v0, Lcom/testin/agent/base/TestinGVariables;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "TestinAgent is initialized"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "TestinAgent channel parameter not configured"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    :cond_2
    sget-object v0, Lcom/testin/agent/TestinAgent;->testHandler:Lcom/testin/agent/b/f;

    if-nez v0, :cond_3

    new-instance v0, Lcom/testin/agent/b/f;

    invoke-direct {v0}, Lcom/testin/agent/b/f;-><init>()V

    sput-object v0, Lcom/testin/agent/TestinAgent;->testHandler:Lcom/testin/agent/b/f;

    :cond_3
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iput-object p0, v0, Lcom/testin/agent/base/TestinGVariables;->d:Landroid/content/Context;

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iput-object p1, v0, Lcom/testin/agent/base/TestinGVariables;->e:Ljava/lang/String;

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iput-object p2, v0, Lcom/testin/agent/base/TestinGVariables;->f:Ljava/lang/String;

    sget-object v0, Lcom/testin/agent/TestinAgent;->testHandler:Lcom/testin/agent/b/f;

    invoke-virtual {v0, p0}, Lcom/testin/agent/b/f;->a(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public static declared-synchronized uploadException(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4

    const-class v1, Lcom/testin/agent/TestinAgent;

    monitor-enter v1

    if-nez p0, :cond_0

    :try_start_0
    const-string v0, "uploadException(): Context parameter is null"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez p2, :cond_1

    const-string v0, "uploadException(): Throwable parameter is null"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    :try_start_2
    invoke-static {p2}, Lcom/testin/agent/TestinAgent;->getStackTraceInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v0, "uploadException(): StackTrace info is null or 0-length"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "uploadException(): Message parameter is null or 0-length"

    invoke-static {v3}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    const-string p1, ""

    :cond_3
    const/4 v3, 0x0

    invoke-static {v0, v3, p1, v2}, Lcom/testin/agent/b/f;->a(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method
