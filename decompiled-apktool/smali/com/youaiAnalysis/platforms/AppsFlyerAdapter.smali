.class public Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;
.super Lcom/youaiAnalysis/AnalysisBaseAdapter;
.source "AppsFlyerAdapter.java"


# static fields
.field private static final CollectDataUrl:Ljava/lang/String; = "http://203.90.236.18/index.php?g=home&m=apiRequest&a=collectData"

.field private static devKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-string v0, "xTe4FqvHxdVJTTVj8xQPKa"

    sput-object v0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->devKey:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/youaiAnalysis/AnalysisBaseAdapter;-><init>()V

    return-void
.end method

.method public static byte2hex([B)Ljava/lang/String;
    .locals 6
    .param p0, "b"    # [B

    .prologue
    .line 261
    new-instance v0, Ljava/lang/StringBuffer;

    array-length v4, p0

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 262
    .local v0, "hs":Ljava/lang/StringBuffer;
    const-string v3, ""

    .line 263
    .local v3, "stmp":Ljava/lang/String;
    array-length v1, p0

    .line 264
    .local v1, "len":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 272
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 265
    :cond_0
    aget-byte v4, p0, v2

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 266
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 267
    const-string v4, "0"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 264
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 269
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_1
.end method

.method public static doPost(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 16
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 202
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    .line 203
    .local v13, "stringBuffer":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .line 204
    .local v5, "entity":Lorg/apache/http/HttpEntity;
    const/4 v8, 0x0

    .line 205
    .local v8, "in":Ljava/io/BufferedReader;
    const/4 v12, 0x0

    .line 207
    .local v12, "response":Lorg/apache/http/HttpResponse;
    :try_start_0
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 208
    .local v6, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v11

    .line 209
    .local v11, "params":Lorg/apache/http/params/HttpParams;
    const/16 v14, 0x4e20

    invoke-static {v11, v14}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 210
    const/16 v14, 0x4e20

    invoke-static {v11, v14}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 211
    new-instance v7, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 212
    .local v7, "httppost":Lorg/apache/http/client/methods/HttpPost;
    const-string v14, "Content-Type"

    const-string v15, "application/x-www-form-urlencoded"

    invoke-virtual {v7, v14, v15}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    new-instance v14, Lorg/apache/http/entity/ByteArrayEntity;

    const-string v15, "UTF-8"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-virtual {v7, v14}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 215
    invoke-virtual {v6, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v12

    .line 216
    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    .line 217
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v14, Ljava/io/InputStreamReader;

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v9, v14}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .end local v8    # "in":Ljava/io/BufferedReader;
    .local v9, "in":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v10

    .local v10, "ln":Ljava/lang/String;
    if-nez v10, :cond_1

    .line 223
    invoke-virtual {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_c
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_a
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 233
    if-eqz v9, :cond_3

    .line 235
    :try_start_2
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_9

    .line 236
    const/4 v8, 0x0

    .line 242
    .end local v6    # "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    .end local v9    # "in":Ljava/io/BufferedReader;
    .end local v10    # "ln":Ljava/lang/String;
    .end local v11    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    :cond_0
    :goto_1
    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 220
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v7    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v9    # "in":Ljava/io/BufferedReader;
    .restart local v10    # "ln":Ljava/lang/String;
    .restart local v11    # "params":Lorg/apache/http/params/HttpParams;
    :cond_1
    :try_start_3
    invoke-virtual {v13, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 221
    const-string v14, "\r\n"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_c
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_a
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 224
    .end local v10    # "ln":Ljava/lang/String;
    :catch_0
    move-exception v1

    move-object v8, v9

    .line 225
    .end local v6    # "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    .end local v9    # "in":Ljava/io/BufferedReader;
    .end local v11    # "params":Lorg/apache/http/params/HttpParams;
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 233
    if-eqz v8, :cond_0

    .line 235
    :try_start_5
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 236
    const/4 v8, 0x0

    goto :goto_1

    .line 237
    :catch_1
    move-exception v4

    .line 238
    .local v4, "e3":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 226
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    .end local v4    # "e3":Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 227
    .local v2, "e1":Ljava/io/IOException;
    :goto_3
    :try_start_6
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 233
    if-eqz v8, :cond_0

    .line 235
    :try_start_7
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 236
    const/4 v8, 0x0

    goto :goto_1

    .line 237
    :catch_3
    move-exception v4

    .line 238
    .restart local v4    # "e3":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 228
    .end local v2    # "e1":Ljava/io/IOException;
    .end local v4    # "e3":Ljava/io/IOException;
    :catch_4
    move-exception v3

    .line 229
    .local v3, "e2":Ljava/lang/IllegalStateException;
    :goto_4
    :try_start_8
    invoke-virtual {v3}, Ljava/lang/IllegalStateException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 233
    if-eqz v8, :cond_0

    .line 235
    :try_start_9
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    .line 236
    const/4 v8, 0x0

    goto :goto_1

    .line 237
    :catch_5
    move-exception v4

    .line 238
    .restart local v4    # "e3":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 230
    .end local v3    # "e2":Ljava/lang/IllegalStateException;
    .end local v4    # "e3":Ljava/io/IOException;
    :catch_6
    move-exception v1

    .line 231
    .local v1, "e":Ljava/lang/Exception;
    :goto_5
    :try_start_a
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 233
    if-eqz v8, :cond_0

    .line 235
    :try_start_b
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7

    .line 236
    const/4 v8, 0x0

    goto :goto_1

    .line 237
    :catch_7
    move-exception v4

    .line 238
    .restart local v4    # "e3":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 232
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "e3":Ljava/io/IOException;
    :catchall_0
    move-exception v14

    .line 233
    :goto_6
    if-eqz v8, :cond_2

    .line 235
    :try_start_c
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8

    .line 236
    const/4 v8, 0x0

    .line 241
    :cond_2
    :goto_7
    throw v14

    .line 237
    :catch_8
    move-exception v4

    .line 238
    .restart local v4    # "e3":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 237
    .end local v4    # "e3":Ljava/io/IOException;
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v7    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v9    # "in":Ljava/io/BufferedReader;
    .restart local v10    # "ln":Ljava/lang/String;
    .restart local v11    # "params":Lorg/apache/http/params/HttpParams;
    :catch_9
    move-exception v4

    .line 238
    .restart local v4    # "e3":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .end local v4    # "e3":Ljava/io/IOException;
    :cond_3
    move-object v8, v9

    .end local v9    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    goto :goto_1

    .line 232
    .end local v8    # "in":Ljava/io/BufferedReader;
    .end local v10    # "ln":Ljava/lang/String;
    .restart local v9    # "in":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v14

    move-object v8, v9

    .end local v9    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    goto :goto_6

    .line 230
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v9    # "in":Ljava/io/BufferedReader;
    :catch_a
    move-exception v1

    move-object v8, v9

    .end local v9    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    goto :goto_5

    .line 228
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v9    # "in":Ljava/io/BufferedReader;
    :catch_b
    move-exception v3

    move-object v8, v9

    .end local v9    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    goto :goto_4

    .line 226
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v9    # "in":Ljava/io/BufferedReader;
    :catch_c
    move-exception v2

    move-object v8, v9

    .end local v9    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    goto :goto_3

    .line 224
    .end local v6    # "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    .end local v11    # "params":Lorg/apache/http/params/HttpParams;
    :catch_d
    move-exception v1

    goto :goto_2
.end method

.method public static getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 277
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, " "

    const-string v3, "-"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 278
    .local v0, "temp":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getLocalIpAddress()Ljava/lang/String;
    .locals 7

    .prologue
    .line 184
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_1

    .line 198
    :goto_0
    const-string v5, ""

    :goto_1
    return-object v5

    .line 185
    :cond_1
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 186
    .local v4, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 187
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .line 188
    .local v3, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv4Address(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 189
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "null"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 190
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_1

    .line 195
    .end local v1    # "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "inetAddress":Ljava/net/InetAddress;
    .end local v4    # "intf":Ljava/net/NetworkInterface;
    :catch_0
    move-exception v2

    .line 196
    .local v2, "ex":Ljava/net/SocketException;
    const-string v5, "WifiPreference IpAddress"

    invoke-virtual {v2}, Ljava/net/SocketException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getLocalMacAddressFromIp(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 247
    const-string v2, ""

    .line 250
    .local v2, "mac_s":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->getLocalIpAddress()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v4

    invoke-static {v4}, Ljava/net/NetworkInterface;->getByInetAddress(Ljava/net/InetAddress;)Ljava/net/NetworkInterface;

    move-result-object v3

    .line 251
    .local v3, "ne":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getHardwareAddress()[B

    move-result-object v1

    .line 252
    .local v1, "mac":[B
    invoke-static {v1}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->byte2hex([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 257
    .end local v1    # "mac":[B
    .end local v3    # "ne":Ljava/net/NetworkInterface;
    :goto_0
    return-object v2

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static load(Lcom/youaiAnalysis/AnalysisManager;)V
    .locals 1
    .param p0, "registry"    # Lcom/youaiAnalysis/AnalysisManager;

    .prologue
    .line 50
    :try_start_0
    const-string v0, "com.appsflyer.AppsFlyerLib"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 51
    new-instance v0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;

    invoke-direct {v0}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;-><init>()V

    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youaiAnalysis/AnalysisManager;->registerClass(Lcom/youaiAnalysis/AnalysisBaseAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :cond_0
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static makeAppsFlyerMsg(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "appkey"    # Ljava/lang/String;
    .param p2, "platform_type_str"    # Ljava/lang/String;
    .param p3, "installTime"    # Ljava/lang/String;
    .param p4, "media_source"    # Ljava/lang/String;
    .param p5, "sdkVersion"    # Ljava/lang/String;
    .param p6, "click_url"    # Ljava/lang/String;
    .param p7, "click_time"    # Ljava/lang/String;
    .param p8, "is_paid"    # Ljava/lang/String;

    .prologue
    .line 137
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 139
    .local v2, "datas":Ljava/lang/StringBuffer;
    new-instance v8, Ljava/text/SimpleDateFormat;

    const-string v9, "yyyy-MM-dd hh:mm:ss"

    invoke-direct {v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v8, v9}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    .line 140
    .local v7, "time":Ljava/lang/String;
    if-eqz p8, :cond_0

    .line 141
    new-instance v1, Ljava/util/Date;

    move-object/from16 v0, p8

    invoke-direct {v1, v0}, Ljava/util/Date;-><init>(Ljava/lang/String;)V

    .line 142
    .local v1, "dat":Ljava/util/Date;
    new-instance v4, Ljava/util/GregorianCalendar;

    invoke-direct {v4}, Ljava/util/GregorianCalendar;-><init>()V

    .line 143
    .local v4, "gc":Ljava/util/GregorianCalendar;
    invoke-virtual {v4, v1}, Ljava/util/GregorianCalendar;->setTime(Ljava/util/Date;)V

    .line 144
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyy-MM-dd hh:mm:ss"

    invoke-direct {v3, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 145
    .local v3, "format":Ljava/text/SimpleDateFormat;
    invoke-virtual {v4}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .line 146
    .local v6, "sb":Ljava/lang/String;
    move-object p3, v6

    .line 148
    .end local v1    # "dat":Ljava/util/Date;
    .end local v3    # "format":Ljava/text/SimpleDateFormat;
    .end local v4    # "gc":Ljava/util/GregorianCalendar;
    .end local v6    # "sb":Ljava/lang/String;
    :cond_0
    if-nez p3, :cond_1

    .line 149
    move-object p3, v7

    .line 151
    :cond_1
    if-nez p4, :cond_2

    .line 152
    const-string p4, ""

    .line 154
    :cond_2
    if-nez p6, :cond_3

    .line 155
    const-string p6, ""

    .line 157
    :cond_3
    if-nez p7, :cond_4

    .line 158
    move-object/from16 p7, v7

    .line 161
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "android_id="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "android_id"

    invoke-static {v9, v10}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 162
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v8, "&imei="

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "phone"

    invoke-virtual {p0, v8}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/telephony/TelephonyManager;

    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 163
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&game_id="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 164
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&platform="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 165
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&package="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 166
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&media_source="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 167
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&ip="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->getLocalIpAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 168
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&mac="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->getLocalMacAddressFromIp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 169
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&decvice_type="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&sdk_version="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p5

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&os_version="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 172
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&click_url="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p6

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 173
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&click_time="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p7

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 174
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&install_time="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 175
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget-object v5, v8, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 176
    .local v5, "locale":Ljava/util/Locale;
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "&country_code="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    const-string v8, "&city="

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 179
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method


# virtual methods
.method public converData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "appkey"    # Ljava/lang/String;
    .param p3, "platform_type_str"    # Ljava/lang/String;
    .param p4, "sdkVersion"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 68
    const-string v0, "appsflyer"

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 69
    .local v6, "appsFlyerPre":Landroid/content/SharedPreferences;
    const-string v0, "sendCollectData"

    invoke-interface {v6, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    .line 70
    .local v7, "isSendData":Z
    if-nez v7, :cond_0

    .line 71
    new-instance v0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;-><init>(Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/appsflyer/AppsFlyerLib;->getConversionData(Landroid/content/Context;Lcom/appsflyer/ConversionDataListener;)V

    .line 117
    :cond_0
    return-void
.end method

.method public initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->devKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/appsflyer/AppsFlyerLib;->setAppsFlyerKey(Ljava/lang/String;)V

    .line 62
    const-string v0, "USD"

    invoke-static {v0}, Lcom/appsflyer/AppsFlyerLib;->setCurrencyCode(Ljava/lang/String;)V

    .line 63
    return-object p0
.end method

.method public login(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "login"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/appsflyer/AppsFlyerLib;->sendTrackingWithEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AppsFlyerLib;->sendTracking(Landroid/content/Context;)V

    .line 59
    return-void
.end method

.method public purchase(Landroid/content/Context;F)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "price"    # F

    .prologue
    .line 129
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "purchase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/appsflyer/AppsFlyerLib;->sendTrackingWithEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method public register(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    invoke-static {v0, p2, v1}, Lcom/appsflyer/AppsFlyerLib;->sendTrackingWithEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public setDeviceTrackingDisabled(Z)V
    .locals 0
    .param p1, "boo"    # Z

    .prologue
    .line 133
    invoke-static {p1}, Lcom/appsflyer/AppsFlyerLib;->setDeviceTrackingDisabled(Z)V

    .line 134
    return-void
.end method
