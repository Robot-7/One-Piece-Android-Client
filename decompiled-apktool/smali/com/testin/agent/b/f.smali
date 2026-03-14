.class public Lcom/testin/agent/b/f;
.super Ljava/lang/Object;


# static fields
.field public static a:Landroid/os/Handler;


# instance fields
.field private b:Lcom/testin/agent/b/d;

.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "TestinAgent"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Lcom/testin/agent/b/g;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/testin/agent/b/g;-><init>(Lcom/testin/agent/b/f;Landroid/os/Looper;)V

    sput-object v1, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    return-void
.end method

.method static synthetic a(Lcom/testin/agent/b/f;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/b/f;->c:Landroid/content/Context;

    return-object v0
.end method

.method public static a(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/testin/agent/b/b;

    invoke-direct {v0, p0}, Lcom/testin/agent/b/b;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1, p2, p3}, Lcom/testin/agent/b/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/testin/agent/b/f;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/testin/agent/b/f;->g(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic a(Lcom/testin/agent/b/f;Lcom/testin/agent/b/d;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/b/f;->b:Lcom/testin/agent/b/d;

    return-void
.end method

.method static synthetic b(Lcom/testin/agent/b/f;)Lcom/testin/agent/b/d;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/b/f;->b:Lcom/testin/agent/b/d;

    return-object v0
.end method

.method static synthetic b(Lcom/testin/agent/b/f;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/testin/agent/b/f;->f(Landroid/content/Context;)V

    return-void
.end method

.method private d(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Lcom/testin/agent/c/c;

    invoke-direct {v0, p1}, Lcom/testin/agent/c/c;-><init>(Landroid/content/Context;)V

    const-string v1, "crashtable"

    invoke-virtual {v0, v1}, Lcom/testin/agent/c/c;->a(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_2

    invoke-static {p1}, Lcom/testin/agent/a/a;->a(Landroid/content/Context;)Lcom/testin/agent/a/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/testin/agent/a/a;->a()V

    :goto_0
    new-instance v0, Lcom/testin/agent/b/i;

    invoke-direct {v0, p0, p1}, Lcom/testin/agent/b/i;-><init>(Lcom/testin/agent/b/f;Landroid/content/Context;)V

    sget-object v1, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    invoke-virtual {v0}, Lcom/testin/agent/base/TestinGVariables;->b()Lcom/testin/agent/d/c;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    invoke-virtual {v0}, Lcom/testin/agent/base/TestinGVariables;->a()Lcom/testin/agent/d/d;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Lcom/testin/agent/b/f;->e(Landroid/content/Context;)V

    :cond_1
    return-void

    :cond_2
    invoke-static {}, Lcom/testin/agent/a/a;->b()V

    goto :goto_0
.end method

.method private e(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Lcom/testin/agent/b/j;

    invoke-direct {v0, p0, p1}, Lcom/testin/agent/b/j;-><init>(Lcom/testin/agent/b/f;Landroid/content/Context;)V

    sget-object v1, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private f(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Lcom/testin/agent/d/d;

    invoke-direct {v0}, Lcom/testin/agent/d/d;-><init>()V

    invoke-static {p1}, Lcom/testin/agent/f/c;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/d;->a(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/testin/agent/f/c;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/d;->b(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/testin/agent/base/TestinGVariables;->a(Lcom/testin/agent/d/d;)V

    return-void
.end method

.method private g(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Lcom/testin/agent/d/c;

    invoke-direct {v0}, Lcom/testin/agent/d/c;-><init>()V

    invoke-static {p1}, Lcom/testin/agent/f/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->a(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/testin/agent/f/e;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->b(Ljava/lang/String;)V

    const-string v1, "1"

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->c(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->h(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->d(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->e(Ljava/lang/String;)V

    const-string v1, "5.0"

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->f(Ljava/lang/String;)V

    const-string v1, "1.7.1"

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->g(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v1

    iget-object v1, v1, Lcom/testin/agent/base/TestinGVariables;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/testin/agent/d/c;->i(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/testin/agent/base/TestinGVariables;->a(Lcom/testin/agent/d/c;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 4

    :try_start_0
    iput-object p1, p0, Lcom/testin/agent/b/f;->c:Landroid/content/Context;

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iput-object p1, v0, Lcom/testin/agent/base/TestinGVariables;->d:Landroid/content/Context;

    iget-object v0, p0, Lcom/testin/agent/b/f;->c:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/testin/agent/f/d;->a(Landroid/content/Context;Z)V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/testin/agent/b/f;->c:Landroid/content/Context;

    new-instance v2, Lcom/testin/agent/b/k;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/testin/agent/b/k;-><init>(Lcom/testin/agent/b/k;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-static {}, Lcom/testin/agent/e/a;->a()Lcom/testin/agent/e/a;

    move-result-object v0

    iget-object v1, p0, Lcom/testin/agent/b/f;->c:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/testin/agent/e/a;->a(Landroid/content/Context;)V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    new-instance v0, Lcom/testin/agent/b/h;

    invoke-direct {v0, p0}, Lcom/testin/agent/b/h;-><init>(Lcom/testin/agent/b/f;)V

    sget-object v1, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/testin/agent/b/f;->c:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/testin/agent/b/f;->d(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public b(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p1, v0}, Lcom/testin/agent/f/d;->a(Landroid/content/Context;Z)V

    const-string v0, "App on foreground"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/testin/agent/b/f;->d(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public c(Landroid/content/Context;)V
    .locals 5

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v0, "und"

    invoke-static {p1}, Lcom/testin/agent/f/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "av"

    invoke-static {p1}, Lcom/testin/agent/f/e;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pgn"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "on"

    const-string v2, "1"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "ov"

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "mt"

    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pro"

    const-string v2, "5.0"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sv"

    const-string v2, "1.7.1"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "chid"

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v2

    iget-object v2, v2, Lcom/testin/agent/base/TestinGVariables;->f:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    invoke-static {p1}, Lcom/testin/agent/f/d;->f(Landroid/content/Context;)I

    move-result v0

    iget-object v2, p0, Lcom/testin/agent/b/f;->b:Lcom/testin/agent/b/d;

    const-string v3, "/cpi/crash"

    invoke-static {v3}, Lcom/testin/agent/f/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "register"

    invoke-virtual {v2, v3, v1, v4, v0}, Lcom/testin/agent/b/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "TestinTestHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ResultMsg: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "to"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-static {p1, v0}, Lcom/testin/agent/f/d;->d(Landroid/content/Context;I)V

    const-string v0, "po"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/testin/agent/f/d;->a(Landroid/content/Context;I)V

    const-string v0, "rc"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/testin/agent/f/d;->b(Landroid/content/Context;I)V

    const-string v0, "mc"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/testin/agent/f/d;->c(Landroid/content/Context;I)V

    const-string v0, "lv"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "tag"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcom/testin/agent/f/d;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "en"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    const-string v0, "TestinAgent Init Successed"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto/16 :goto_0

    :cond_0
    :try_start_2
    const-string v0, "TestinAgent Init Failled"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_1

    :cond_1
    :try_start_3
    const-string v1, "TestinTestHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ResponseCode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1
.end method
