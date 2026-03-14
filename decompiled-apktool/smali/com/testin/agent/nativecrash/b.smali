.class public Lcom/testin/agent/nativecrash/b;
.super Ljava/lang/Object;


# static fields
.field private static a:Landroid/content/Context;


# direct methods
.method private static a(ILjava/lang/String;)Lcom/testin/agent/c/a;
    .locals 9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Lcom/testin/agent/c/a;

    invoke-direct {v2}, Lcom/testin/agent/c/a;-><init>()V

    :try_start_0
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v3

    invoke-virtual {v3}, Lcom/testin/agent/base/TestinGVariables;->b()Lcom/testin/agent/d/c;

    move-result-object v3

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v4

    invoke-virtual {v4}, Lcom/testin/agent/base/TestinGVariables;->a()Lcom/testin/agent/d/d;

    move-result-object v4

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

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

    invoke-virtual {v4}, Lcom/testin/agent/d/d;->a()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->i(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/f/e;->h()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->f(Ljava/lang/String;)V

    sget-object v3, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/e;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->j(Ljava/lang/String;)V

    sget-object v3, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/e;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->l(Ljava/lang/String;)V

    const-string v3, "os.arch"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->n(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Lcom/testin/agent/c/a;->o(Ljava/lang/String;)V

    invoke-static {}, Lcom/testin/agent/f/a;->a()Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->m(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->b(I)V

    sget-object v3, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/testin/agent/f/d;->d(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/testin/agent/c/a;->c(I)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-string v5, "NativeCrashHandler"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u6570\u636e\u91c7\u96c6\u8017\u65f6\uff08\u6beb\u79d2\uff09\uff1a"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v0, v3, v0

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/testin/agent/nativecrash/NativeCrash;

    invoke-direct {v0}, Lcom/testin/agent/nativecrash/NativeCrash;-><init>()V

    invoke-virtual {v0, p0}, Lcom/testin/agent/nativecrash/NativeCrash;->registNativeCrash(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Regist native crash successed"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string v0, "Regist native crash failled"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Lcom/testin/agent/c/a;)V
    .locals 11

    const/4 v10, -0x1

    :try_start_0
    const-string v1, "\r\n"

    const-string v2, "--"

    const-string v3, "*********"

    invoke-virtual {p1}, Lcom/testin/agent/c/a;->p()Ljava/lang/String;

    move-result-object v4

    sget-object v0, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/testin/agent/f/d;->f(Landroid/content/Context;)I

    move-result v5

    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const/high16 v6, 0x40000

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v5, "POST"

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v5, "Connection"

    const-string v6, "Keep-Alive"

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "Charset"

    const-string v6, "utf-8"

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "Accept-Encoding"

    const-string v6, "indentity"

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "Upload-Json"

    const-string v6, "subndk"

    invoke-static {v6}, Lcom/testin/agent/nativecrash/b;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "Content-Type"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "multipart/form-data;boundary="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Content-Disposition: form-data; name=\"file_msg\""

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/testin/agent/f/a;->c(Lcom/testin/agent/c/a;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/DataOutputStream;->write([B)V

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Content-Disposition: form-data; name=\"file_dump\"; filename=\""

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "/"

    invoke-virtual {v4, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    const/16 v7, 0x2000

    new-array v7, v7, [B

    :goto_0
    invoke-virtual {v6, v7}, Ljava/io/FileInputStream;->read([B)I

    move-result v8

    if-ne v8, v10, :cond_0

    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v5}, Ljava/io/DataOutputStream;->close()V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_2

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    :goto_1
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v2

    if-ne v2, v10, :cond_1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NativeCrashHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ResultMsg:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "en"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V

    :goto_2
    return-void

    :cond_0
    const/4 v9, 0x0

    invoke-virtual {v5, v7, v9, v8}, Ljava/io/DataOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_2

    :cond_1
    int-to-char v2, v2

    :try_start_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    :pswitch_0
    invoke-static {v4}, Lcom/testin/agent/nativecrash/b;->d(Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    const-string v1, "NativeCrashHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ResponseCode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/testin/agent/base/b;->c(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1

    sput-object p0, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    sget-object v0, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/testin/agent/nativecrash/NativeCrashNdk;->a(Landroid/content/Context;)V

    invoke-static {}, Lcom/testin/agent/nativecrash/NativeCrashNdk;->a()Z

    move-result v0

    return v0
.end method

.method public static b(Ljava/lang/String;)V
    .locals 3

    const-string v0, "NativeCrashHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "filePath\uff1a"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const-string v1, "."

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/com.testin.agent/dumps/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/testin/agent/f/a;->a(Ljava/io/File;Ljava/io/File;)V

    invoke-static {v0}, Lcom/testin/agent/nativecrash/b;->c(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/testin/agent/nativecrash/b;->d(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string v0, "Native code crashed, But dump file is not exists"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static c(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    invoke-static {v0, p0}, Lcom/testin/agent/nativecrash/b;->a(ILjava/lang/String;)Lcom/testin/agent/c/a;

    move-result-object v0

    sget-object v1, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/testin/agent/f/d;->c(Landroid/content/Context;)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    sget-object v1, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/testin/agent/f/c;->a(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V

    const-string v0, "Current network is disconnected or disabled"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v1, "/cpi/crash"

    invoke-static {v1}, Lcom/testin/agent/f/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/testin/agent/nativecrash/b;->a(Ljava/lang/String;Lcom/testin/agent/c/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0

    :pswitch_1
    sget-object v1, Lcom/testin/agent/nativecrash/b;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/testin/agent/f/a;->a(Landroid/content/Context;Lcom/testin/agent/c/a;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static d(Ljava/lang/String;)V
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Delete dump file, but it\'s null"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "Delete dumpfile, but files is not exists"

    invoke-static {v0}, Lcom/testin/agent/base/b;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0
.end method

.method private static e(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const-string v0, ""

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "ak"

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v3

    iget-object v3, v3, Lcom/testin/agent/base/TestinGVariables;->e:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "tm"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "ac"

    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method
