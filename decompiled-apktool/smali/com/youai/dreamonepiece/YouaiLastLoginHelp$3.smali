.class final Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;
.super Ljava/lang/Thread;
.source "YouaiLastLoginHelp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->pushforclient(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$listener:Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

.field final synthetic val$param:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V
    .locals 0

    .prologue
    .line 796
    iput-object p1, p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->val$param:Ljava/lang/String;

    iput-object p2, p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->val$listener:Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 798
    const/4 v8, 0x0

    .line 800
    .local v8, "tempStr":Ljava/lang/String;
    const/4 v10, 0x0

    .line 804
    .local v10, "url_con":Ljava/net/HttpURLConnection;
    :try_start_0
    iget-object v11, p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->val$param:Ljava/lang/String;

    const-string v12, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB"

    invoke-static {v11, v12}, Lcom/youai/RSAUtil;->encryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 806
    .local v4, "encript":Ljava/lang/String;
    sget-object v11, Lcom/youai/dreamonepiece/YouaiConfig;->md5key:Ljava/lang/String;

    invoke-static {v4, v11}, Lcom/youai/MD5;->sign(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 807
    .local v2, "checksum":Ljava/lang/String;
    new-instance v9, Ljava/net/URL;

    sget-object v11, Lcom/youai/dreamonepiece/YouaiConfig;->pushforclient:Ljava/lang/String;

    invoke-direct {v9, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 808
    .local v9, "url":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v10, v0

    .line 809
    const-string v11, "PUT"

    invoke-virtual {v10, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 810
    const-string v11, "Game-Checksum"

    invoke-virtual {v10, v11, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 811
    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 812
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/OutputStream;->write([B)V

    .line 813
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V

    .line 814
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 815
    const-string v11, "YouaiLastLogin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "status"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 818
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 819
    .local v5, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-direct {v11, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 821
    .local v1, "bufferRe":Ljava/io/BufferedReader;
    new-instance v7, Ljava/lang/StringBuffer;

    const-string v11, ""

    invoke-direct {v7, v11}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 822
    .local v7, "sb":Ljava/lang/StringBuffer;
    const-string v6, ""

    .line 823
    .local v6, "line":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 824
    invoke-virtual {v7, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 830
    .end local v1    # "bufferRe":Ljava/io/BufferedReader;
    .end local v2    # "checksum":Ljava/lang/String;
    .end local v4    # "encript":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/InputStream;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "sb":Ljava/lang/StringBuffer;
    .end local v9    # "url":Ljava/net/URL;
    :catch_0
    move-exception v3

    .line 831
    .local v3, "e":Ljava/net/MalformedURLException;
    :try_start_1
    iget-object v11, p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->val$listener:Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

    invoke-interface {v11, v3}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onError(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 837
    if-eqz v10, :cond_0

    .line 838
    .end local v3    # "e":Ljava/net/MalformedURLException;
    :goto_1
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 840
    :cond_0
    return-void

    .line 826
    .restart local v1    # "bufferRe":Ljava/io/BufferedReader;
    .restart local v2    # "checksum":Ljava/lang/String;
    .restart local v4    # "encript":Ljava/lang/String;
    .restart local v5    # "in":Ljava/io/InputStream;
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v7    # "sb":Ljava/lang/StringBuffer;
    .restart local v9    # "url":Ljava/net/URL;
    :cond_1
    :try_start_2
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 827
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 828
    iget-object v11, p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->val$listener:Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

    const-string v12, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB"

    invoke-static {v8, v12}, Lcom/youai/RSAUtil;->decryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onComplete(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 837
    if-eqz v10, :cond_0

    goto :goto_1

    .line 832
    .end local v1    # "bufferRe":Ljava/io/BufferedReader;
    .end local v2    # "checksum":Ljava/lang/String;
    .end local v4    # "encript":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/InputStream;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "sb":Ljava/lang/StringBuffer;
    .end local v9    # "url":Ljava/net/URL;
    :catch_1
    move-exception v3

    .line 833
    .local v3, "e":Ljava/io/IOException;
    :try_start_3
    iget-object v11, p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->val$listener:Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

    invoke-interface {v11, v3}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onIOException(Ljava/io/IOException;)V

    .line 837
    if-eqz v10, :cond_0

    goto :goto_1

    .line 834
    .end local v3    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v3

    .line 835
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 837
    if-eqz v10, :cond_0

    goto :goto_1

    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v11

    if-eqz v10, :cond_2

    .line 838
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 837
    :cond_2
    throw v11
.end method
