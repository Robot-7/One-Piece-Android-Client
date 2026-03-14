.class Lcom/youai/dreamonepiece/DownloadApk$2;
.super Ljava/lang/Thread;
.source "DownloadApk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/DownloadApk;-><init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/DownloadApk;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/DownloadApk;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk$2;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/16 v10, 0x2710

    .line 149
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v2}, Lorg/apache/http/client/methods/HttpGet;-><init>()V

    .line 150
    .local v2, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    new-instance v5, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v5}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 151
    .local v5, "params":Lorg/apache/http/params/HttpParams;
    const/16 v7, 0x1f40

    invoke-static {v5, v7}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 152
    invoke-virtual {v2, v5}, Lorg/apache/http/client/methods/HttpGet;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 154
    :try_start_0
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 155
    .local v1, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 158
    .local v3, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    .line 160
    .local v6, "statusCode":I
    const-string v7, "DownloadApk"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "statusCode"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 162
    .local v4, "msg":Landroid/os/Message;
    const/16 v7, 0x2710

    iput v7, v4, Landroid/os/Message;->what:I

    .line 163
    iput v6, v4, Landroid/os/Message;->arg1:I

    .line 164
    iget-object v7, p0, Lcom/youai/dreamonepiece/DownloadApk$2;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    iget-object v7, v7, Lcom/youai/dreamonepiece/DownloadApk;->mResponseHandler:Landroid/os/Handler;

    invoke-virtual {v7, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .end local v1    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v6    # "statusCode":I
    :goto_0
    return-void

    .line 165
    .end local v4    # "msg":Landroid/os/Message;
    :catch_0
    move-exception v0

    .line 167
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 168
    .restart local v4    # "msg":Landroid/os/Message;
    iput v10, v4, Landroid/os/Message;->what:I

    .line 169
    const/16 v7, 0x194

    iput v7, v4, Landroid/os/Message;->arg1:I

    .line 170
    iget-object v7, p0, Lcom/youai/dreamonepiece/DownloadApk$2;->this$0:Lcom/youai/dreamonepiece/DownloadApk;

    iget-object v7, v7, Lcom/youai/dreamonepiece/DownloadApk;->mResponseHandler:Landroid/os/Handler;

    invoke-virtual {v7, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
