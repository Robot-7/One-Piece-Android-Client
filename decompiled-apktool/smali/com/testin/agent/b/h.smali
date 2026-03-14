.class Lcom/testin/agent/b/h;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/testin/agent/b/f;


# direct methods
.method constructor <init>(Lcom/testin/agent/b/f;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/b/h;->a:Lcom/testin/agent/b/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    iget-object v0, p0, Lcom/testin/agent/b/h;->a:Lcom/testin/agent/b/f;

    invoke-static {v0}, Lcom/testin/agent/b/f;->a(Lcom/testin/agent/b/f;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/nativecrash/b;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/testin/agent/b/h;->a:Lcom/testin/agent/b/f;

    invoke-static {v1}, Lcom/testin/agent/b/f;->a(Lcom/testin/agent/b/f;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "/com.testin.agent/dumps/"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "TestinTestHandler"

    const-string v2, "Dumps directories create successed"

    invoke-static {v1, v2}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/nativecrash/b;->a(Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    const-string v1, "TestinTestHandler"

    const-string v2, "Dumps directories create failled"

    invoke-static {v1, v2}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
