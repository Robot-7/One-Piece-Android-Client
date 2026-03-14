.class public Lcom/testin/agent/b/e;
.super Ljava/lang/Object;


# direct methods
.method public static a(Ljava/lang/Exception;)V
    .locals 5

    :try_start_0
    invoke-static {p0}, Lcom/testin/agent/b/e;->b(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v1

    iget-object v1, v1, Lcom/testin/agent/base/TestinGVariables;->d:Landroid/content/Context;

    invoke-static {v1}, Lcom/testin/agent/f/d;->f(Landroid/content/Context;)I

    move-result v1

    new-instance v2, Lcom/testin/agent/b/d;

    invoke-direct {v2}, Lcom/testin/agent/b/d;-><init>()V

    const-string v3, "/cpi/crash"

    invoke-static {v3}, Lcom/testin/agent/f/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "sdkcatch"

    invoke-virtual {v2, v3, v0, v4, v1}, Lcom/testin/agent/b/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "TestinDebug"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ResultMsg:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string v0, "TestinDebug"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ResponseCode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "TestinDebug"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exception: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static b(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "et"

    invoke-static {p0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, ""

    goto :goto_0
.end method
