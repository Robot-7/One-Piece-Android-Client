.class Lcom/testin/agent/e/b;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/testin/agent/e/a;

.field private final synthetic b:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(Lcom/testin/agent/e/a;Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    iput-object p2, p0, Lcom/testin/agent/e/b;->b:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    iget-object v1, p0, Lcom/testin/agent/e/b;->b:Ljava/lang/Throwable;

    invoke-static {v0, v1}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Ljava/lang/Throwable;)Lcom/testin/agent/c/a;

    move-result-object v1

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/f/d;->c(Landroid/content/Context;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/testin/agent/f/c;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V

    const-string v0, "CrashHandler"

    const-string v1, "Current network is disconnected or disabled"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {v1}, Lcom/testin/agent/f/a;->a(Lcom/testin/agent/c/a;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    :try_start_0
    invoke-static {v2}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    iget-object v2, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v2}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/testin/agent/f/d;->f(Landroid/content/Context;)I

    move-result v2

    iget-object v3, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v3}, Lcom/testin/agent/e/a;->b(Lcom/testin/agent/e/a;)Lcom/testin/agent/b/d;

    move-result-object v3

    const-string v4, "/cpi/crash"

    invoke-static {v4}, Lcom/testin/agent/f/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "submit"

    invoke-virtual {v3, v4, v0, v5, v2}, Lcom/testin/agent/b/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    const-string v2, "UTF-8"

    invoke-static {v0, v2}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "CrashHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ResultMsg:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "en"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_1

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    :pswitch_1
    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    goto/16 :goto_0

    :cond_1
    :try_start_1
    const-string v2, "CrashHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ResponseCode: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    iget-object v2, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v2}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v1, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    throw v0

    :pswitch_2
    :try_start_3
    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    goto/16 :goto_0

    :catch_1
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    iget-object v0, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v0, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    iget-object v1, p0, Lcom/testin/agent/e/b;->a:Lcom/testin/agent/e/a;

    invoke-static {v1, v6}, Lcom/testin/agent/e/a;->a(Lcom/testin/agent/e/a;Z)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
