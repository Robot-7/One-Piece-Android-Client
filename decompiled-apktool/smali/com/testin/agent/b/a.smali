.class public Lcom/testin/agent/b/a;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/testin/agent/b/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/testin/agent/b/a;->a:Lcom/testin/agent/b/f;

    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1

    invoke-static {p0}, Lcom/testin/agent/b/a;->b(Landroid/content/Context;)Z

    const/4 v0, 0x1

    return v0
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 1

    sget-object v0, Lcom/testin/agent/b/a;->a:Lcom/testin/agent/b/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/testin/agent/b/f;

    invoke-direct {v0}, Lcom/testin/agent/b/f;-><init>()V

    sput-object v0, Lcom/testin/agent/b/a;->a:Lcom/testin/agent/b/f;

    :cond_0
    invoke-static {p0}, Lcom/testin/agent/f/d;->b(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/testin/agent/b/a;->a:Lcom/testin/agent/b/f;

    invoke-virtual {v0, p0}, Lcom/testin/agent/b/f;->b(Landroid/content/Context;)V

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public static c(Landroid/content/Context;)Z
    .locals 1

    invoke-static {p0}, Lcom/testin/agent/b/a;->d(Landroid/content/Context;)Z

    move-result v0

    invoke-static {p0, v0}, Lcom/testin/agent/f/d;->a(Landroid/content/Context;Z)V

    const/4 v0, 0x0

    return v0
.end method

.method public static d(Landroid/content/Context;)Z
    .locals 5

    const/4 v1, 0x0

    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget-object v4, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v4, 0x64

    if-ne v0, v4, :cond_1

    const/4 v0, 0x1

    goto :goto_0
.end method
