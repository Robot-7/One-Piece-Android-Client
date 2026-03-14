.class public Lcom/testin/agent/a/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static b:Ljava/util/concurrent/locks/ReentrantLock;

.field private static f:Lcom/testin/agent/a/a;


# instance fields
.field private a:Landroid/content/Context;

.field private c:Ljava/util/concurrent/ScheduledExecutorService;

.field private d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private e:Ljava/util/concurrent/ScheduledFuture;

.field private g:Lcom/testin/agent/c/c;

.field private h:Ljava/util/ArrayList;

.field private i:Ljava/util/HashMap;

.field private j:I

.field private k:Lcom/testin/agent/b/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sput-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/testin/agent/a/a;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/testin/agent/a/a;->i:Ljava/util/HashMap;

    iput v1, p0, Lcom/testin/agent/a/a;->j:I

    iput-object p1, p0, Lcom/testin/agent/a/a;->a:Landroid/content/Context;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/testin/agent/a/a;->c:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Lcom/testin/agent/c/c;

    iget-object v1, p0, Lcom/testin/agent/a/a;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/testin/agent/c/c;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/testin/agent/a/a;->g:Lcom/testin/agent/c/c;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/testin/agent/a/a;
    .locals 2

    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    new-instance v0, Lcom/testin/agent/a/a;

    invoke-direct {v0, p0}, Lcom/testin/agent/a/a;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    return-object v0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method private a(I)V
    .locals 3

    iget-object v0, p0, Lcom/testin/agent/a/a;->g:Lcom/testin/agent/c/c;

    const-string v1, "crashtable"

    invoke-virtual {v0, v1, p1}, Lcom/testin/agent/c/c;->b(Ljava/lang/String;I)Z

    iget-object v0, p0, Lcom/testin/agent/a/a;->i:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private a(ILjava/lang/String;)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/testin/agent/a/a;->a(I)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "CacheUploader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Delete dumpfile(crashId:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") successed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v0, "CacheUploader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Delete dumpfile(crashId:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private a(IZI)V
    .locals 3

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "crashed_num"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/testin/agent/a/a;->g:Lcom/testin/agent/c/c;

    const-string v2, "crashtable"

    invoke-virtual {v1, v2, p1, v0}, Lcom/testin/agent/c/c;->a(Ljava/lang/String;ILandroid/content/ContentValues;)Z

    goto :goto_0
.end method

.method private a(Lcom/testin/agent/c/a;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/testin/agent/a/a;->c(Lcom/testin/agent/c/a;)V

    return-void
.end method

.method private a(Z)V
    .locals 2

    iget-object v0, p0, Lcom/testin/agent/a/a;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "CacheUploader"

    const-string v1, "CacheUploader is stopped"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    iget-object v0, v0, Lcom/testin/agent/a/a;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    iget-object v0, v0, Lcom/testin/agent/a/a;->e:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    const-string v0, "CacheUploader"

    const-string v1, "CacheUploader stopped"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public static b()V
    .locals 2

    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/testin/agent/a/a;->a(Z)V

    goto :goto_0
.end method

.method private b(Lcom/testin/agent/c/a;)V
    .locals 14

    const/4 v13, -0x1

    :try_start_0
    invoke-virtual {p1}, Lcom/testin/agent/c/a;->a()I

    move-result v1

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->q()I

    move-result v2

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->r()I

    move-result v3

    iget-object v0, p0, Lcom/testin/agent/a/a;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/testin/agent/f/d;->f(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->p()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\r\n"

    const-string v7, "--"

    const-string v8, "*********"

    new-instance v0, Ljava/net/URL;

    const-string v9, "/cpi/crash"

    invoke-static {v9}, Lcom/testin/agent/f/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const/high16 v9, 0x40000

    invoke-virtual {v0, v9}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v4, "POST"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v4, "Connection"

    const-string v9, "Keep-Alive"

    invoke-virtual {v0, v4, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Charset"

    const-string v9, "utf-8"

    invoke-virtual {v0, v4, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Accept-Encoding"

    const-string v9, "indentity"

    invoke-virtual {v0, v4, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Upload-Json"

    const-string v9, "subndk"

    invoke-static {v9}, Lcom/testin/agent/f/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v4, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Content-Type"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "multipart/form-data;boundary="

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v4, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Content-Disposition: form-data; name=\"file_msg\""

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/testin/agent/f/a;->c(Lcom/testin/agent/c/a;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "UTF-8"

    invoke-virtual {v9, v10}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/io/DataOutputStream;->write([B)V

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Content-Disposition: form-data; name=\"file_dump\"; filename=\""

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/"

    invoke-virtual {v5, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    const/16 v10, 0x2000

    new-array v10, v10, [B

    :goto_0
    invoke-virtual {v9, v10}, Ljava/io/FileInputStream;->read([B)I

    move-result v11

    if-ne v11, v13, :cond_1

    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    const/16 v6, 0xc8

    if-ne v4, v6, :cond_0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    :goto_1
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v6

    if-ne v6, v13, :cond_2

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "CacheUploader"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Response\uff1a"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "en"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    add-int/lit8 v0, v2, 0x1

    if-le v0, v3, :cond_3

    invoke-direct {p0, v1, v5}, Lcom/testin/agent/a/a;->a(ILjava/lang/String;)V

    :cond_0
    :goto_2
    return-void

    :cond_1
    const/4 v12, 0x0

    invoke-virtual {v4, v10, v12, v11}, Ljava/io/DataOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_2

    :cond_2
    int-to-char v6, v6

    :try_start_1
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    :pswitch_0
    invoke-direct {p0, v1, v5}, Lcom/testin/agent/a/a;->a(ILjava/lang/String;)V

    goto :goto_2

    :cond_3
    const/4 v0, 0x1

    add-int/lit8 v2, v2, 0x1

    invoke-direct {p0, v1, v0, v2}, Lcom/testin/agent/a/a;->a(IZI)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private c()V
    .locals 7

    iget-object v0, p0, Lcom/testin/agent/a/a;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CacheUploader"

    const-string v1, "CacheUploader is running"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/testin/agent/a/a;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/testin/agent/a/a;->c:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0xbb8

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/testin/agent/a/a;->e:Ljava/util/concurrent/ScheduledFuture;

    goto :goto_0
.end method

.method private c(Lcom/testin/agent/c/a;)V
    .locals 8

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/testin/agent/a/a;->k:Lcom/testin/agent/b/d;

    if-nez v0, :cond_2

    new-instance v0, Lcom/testin/agent/b/d;

    invoke-direct {v0}, Lcom/testin/agent/b/d;-><init>()V

    iput-object v0, p0, Lcom/testin/agent/a/a;->k:Lcom/testin/agent/b/d;

    :cond_2
    invoke-virtual {p1}, Lcom/testin/agent/c/a;->a()I

    move-result v2

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->q()I

    move-result v3

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->r()I

    move-result v4

    :try_start_0
    const-string v1, ""

    const-string v0, ""

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->d()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_3
    const-string v0, "CacheUploader"

    const-string v1, "Head tag or crash message is 0-length"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0

    :pswitch_0
    :try_start_1
    const-string v0, "exception"

    invoke-static {p1}, Lcom/testin/agent/f/a;->b(Lcom/testin/agent/c/a;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :pswitch_1
    const-string v0, "submit"

    invoke-static {p1}, Lcom/testin/agent/f/a;->a(Lcom/testin/agent/c/a;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_4
    iget-object v5, p0, Lcom/testin/agent/a/a;->a:Landroid/content/Context;

    invoke-static {v5}, Lcom/testin/agent/f/d;->f(Landroid/content/Context;)I

    move-result v5

    iget-object v6, p0, Lcom/testin/agent/a/a;->k:Lcom/testin/agent/b/d;

    const-string v7, "/cpi/crash"

    invoke-static {v7}, Lcom/testin/agent/f/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v1, v0, v5}, Lcom/testin/agent/b/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v5, 0xc8

    if-ne v1, v5, :cond_0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CacheUploader"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "ResultMsg:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "en"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_1

    add-int/lit8 v0, v3, 0x1

    if-le v0, v4, :cond_5

    invoke-direct {p0, v2}, Lcom/testin/agent/a/a;->a(I)V

    goto/16 :goto_0

    :pswitch_2
    invoke-direct {p0, v2}, Lcom/testin/agent/a/a;->a(I)V

    goto/16 :goto_0

    :cond_5
    const/4 v0, 0x1

    add-int/lit8 v1, v3, 0x1

    invoke-direct {p0, v2, v0, v1}, Lcom/testin/agent/a/a;->a(IZI)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
    .end packed-switch
.end method

.method private d()V
    .locals 4

    const/4 v0, 0x0

    sget-object v1, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    iget-object v1, p0, Lcom/testin/agent/a/a;->g:Lcom/testin/agent/c/c;

    const-string v2, "crashtable"

    invoke-virtual {v1, v2}, Lcom/testin/agent/c/c;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lt v1, v0, :cond_0

    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/testin/agent/a/a;->i:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method private e()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/testin/agent/a/a;->j:I

    iget-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Lcom/testin/agent/a/a;->i:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    invoke-direct {v0}, Lcom/testin/agent/a/a;->c()V

    const-string v0, "CacheUploader"

    const-string v1, "CacheUploader started"

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public run()V
    .locals 4

    sget-object v0, Lcom/testin/agent/a/a;->f:Lcom/testin/agent/a/a;

    iget-object v0, v0, Lcom/testin/agent/a/a;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/testin/agent/a/a;->g:Lcom/testin/agent/c/c;

    const-string v1, "crashtable"

    invoke-virtual {v0, v1}, Lcom/testin/agent/c/c;->a(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    iget-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/testin/agent/a/a;->d()V

    const-string v0, "CacheUploader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Indexs :"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/testin/agent/a/a;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/testin/agent/f/c;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    iget v1, p0, Lcom/testin/agent/a/a;->j:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v0, "CacheUploader"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Upload CrashId :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/testin/agent/a/a;->i:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/testin/agent/a/a;->g:Lcom/testin/agent/c/c;

    const-string v2, "crashtable"

    invoke-virtual {v0, v2, v1}, Lcom/testin/agent/c/c;->a(Ljava/lang/String;I)Lcom/testin/agent/c/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/testin/agent/c/a;->d()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_2
    :goto_0
    iget v0, p0, Lcom/testin/agent/a/a;->j:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/testin/agent/a/a;->j:I

    iget v0, p0, Lcom/testin/agent/a/a;->j:I

    iget-object v1, p0, Lcom/testin/agent/a/a;->h:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_3

    invoke-direct {p0}, Lcom/testin/agent/a/a;->e()V

    sget-object v0, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_1
    sget-object v0, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_4
    return-void

    :pswitch_0
    :try_start_1
    invoke-virtual {v0}, Lcom/testin/agent/c/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_1

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, v0}, Lcom/testin/agent/a/a;->c(Lcom/testin/agent/c/a;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/testin/agent/a/a;->b:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :pswitch_2
    :try_start_2
    invoke-direct {p0, v0}, Lcom/testin/agent/a/a;->b(Lcom/testin/agent/c/a;)V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0, v0}, Lcom/testin/agent/a/a;->a(Lcom/testin/agent/c/a;)V

    goto :goto_0

    :cond_5
    const-string v0, "Current network is disconnected or disabled"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/testin/agent/a/a;->e()V

    sget-object v0, Lcom/testin/agent/b/f;->a:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
