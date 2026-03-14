.class public Lcom/youai/dreamonepiece/YouaiLastLoginHelp;
.super Ljava/lang/Object;
.source "YouaiLastLoginHelp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;
    }
.end annotation


# static fields
.field public static final Tag:Ljava/lang/String;

.field static activityGame:Lcom/youai/dreamonepiece/GameActivity;

.field static dynamicFile:Ljava/io/File;

.field static found:Z

.field static gameId:Ljava/lang/String;

.field private static gexingClientId:Ljava/lang/String;

.field private static gexingTags:Ljava/lang/String;

.field private static mDesBol:Z

.field static platform_str:Ljava/lang/String;

.field private static saveFile:Ljava/io/File;

.field private static savePath:Ljava/io/File;

.field static switchPushGet:Z

.field static yaUid:Ljava/lang/String;

.field static youaiInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/youai/dreamonepiece/YouaiServerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 40
    const-class v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->Tag:Ljava/lang/String;

    .line 48
    const-string v0, "Android"

    sput-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->platform_str:Ljava/lang/String;

    .line 50
    sput-boolean v1, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->switchPushGet:Z

    .line 51
    sput-boolean v1, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    .line 54
    const-string v0, ""

    sput-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gexingClientId:Ljava/lang/String;

    .line 57
    const-string v0, ""

    sput-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gexingTags:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 852
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 38
    sget-boolean v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    return v0
.end method

.method static getFromNet(Lorg/json/JSONObject;)V
    .locals 2
    .param p0, "pMessage"    # Lorg/json/JSONObject;

    .prologue
    .line 492
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$2;

    invoke-direct {v1}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$2;-><init>()V

    invoke-static {v0, v1}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->getPlayerList(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V

    .line 595
    return-void
.end method

.method public static getPlayerList(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V
    .locals 15
    .param p0, "param"    # Ljava/lang/String;
    .param p1, "listener"    # Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

    .prologue
    .line 744
    const/4 v9, 0x0

    .line 746
    .local v9, "tempStr":Ljava/lang/String;
    const/4 v11, 0x0

    .line 750
    .local v11, "url_con":Ljava/net/HttpURLConnection;
    :try_start_0
    const-string v12, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB"

    invoke-static {p0, v12}, Lcom/youai/RSAUtil;->encryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 751
    .local v4, "encript":Ljava/lang/String;
    sget-object v12, Lcom/youai/dreamonepiece/YouaiConfig;->md5key:Ljava/lang/String;

    invoke-static {v4, v12}, Lcom/youai/MD5;->sign(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 752
    .local v2, "checksum":Ljava/lang/String;
    new-instance v10, Ljava/net/URL;

    sget-object v12, Lcom/youai/dreamonepiece/YouaiConfig;->getPlayerList:Ljava/lang/String;

    invoke-direct {v10, v12}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 753
    .local v10, "url":Ljava/net/URL;
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v11, v0

    .line 754
    const-string v12, "PUT"

    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 755
    const-string v12, "Game-Checksum"

    invoke-virtual {v11, v12, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 757
    const/16 v12, 0xbb8

    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 758
    const/16 v12, 0xbb8

    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 759
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/OutputStream;->write([B)V

    .line 760
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V

    .line 761
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V

    .line 762
    const-string v12, "YouaiLastLogin"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "status"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    const/16 v13, 0xc8

    if-ne v12, v13, :cond_2

    .line 764
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 765
    .local v5, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/InputStreamReader;

    invoke-direct {v12, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 767
    .local v1, "bufferRe":Ljava/io/BufferedReader;
    new-instance v8, Ljava/lang/StringBuffer;

    const-string v12, ""

    invoke-direct {v8, v12}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 768
    .local v8, "sb":Ljava/lang/StringBuffer;
    const-string v6, ""

    .line 769
    .local v6, "line":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 770
    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 781
    .end local v1    # "bufferRe":Ljava/io/BufferedReader;
    .end local v2    # "checksum":Ljava/lang/String;
    .end local v4    # "encript":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/InputStream;
    .end local v6    # "line":Ljava/lang/String;
    .end local v8    # "sb":Ljava/lang/StringBuffer;
    .end local v10    # "url":Ljava/net/URL;
    :catch_0
    move-exception v3

    .line 782
    .local v3, "e":Ljava/net/MalformedURLException;
    :try_start_1
    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onError(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 789
    if-eqz v11, :cond_0

    .line 790
    .end local v3    # "e":Ljava/net/MalformedURLException;
    :goto_1
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 792
    :cond_0
    return-void

    .line 772
    .restart local v1    # "bufferRe":Ljava/io/BufferedReader;
    .restart local v2    # "checksum":Ljava/lang/String;
    .restart local v4    # "encript":Ljava/lang/String;
    .restart local v5    # "in":Ljava/io/InputStream;
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v8    # "sb":Ljava/lang/StringBuffer;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_1
    :try_start_2
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 773
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 774
    const-string v12, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB"

    invoke-static {v9, v12}, Lcom/youai/RSAUtil;->decryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 776
    .local v7, "response":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onComplete(Ljava/lang/String;)V

    .line 789
    .end local v1    # "bufferRe":Ljava/io/BufferedReader;
    .end local v5    # "in":Ljava/io/InputStream;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "response":Ljava/lang/String;
    .end local v8    # "sb":Ljava/lang/StringBuffer;
    :goto_2
    if-eqz v11, :cond_0

    goto :goto_1

    .line 778
    :cond_2
    new-instance v12, Ljava/lang/Exception;

    const-string v13, "url_con.getResponseCode()"

    invoke-direct {v12, v13}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onError(Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 783
    .end local v2    # "checksum":Ljava/lang/String;
    .end local v4    # "encript":Ljava/lang/String;
    .end local v10    # "url":Ljava/net/URL;
    :catch_1
    move-exception v3

    .line 784
    .local v3, "e":Ljava/io/IOException;
    :try_start_3
    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onIOException(Ljava/io/IOException;)V

    .line 789
    if-eqz v11, :cond_0

    goto :goto_1

    .line 785
    .end local v3    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v3

    .line 786
    .local v3, "e":Ljava/lang/Exception;
    const-string v12, "YouaiLastLoginHelp"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "catch Exception :"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 787
    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;->onError(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 789
    if-eqz v11, :cond_0

    goto :goto_1

    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v12

    if-eqz v11, :cond_3

    .line 790
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 789
    :cond_3
    throw v12
.end method

.method public static getServerInfoCount()I
    .locals 5

    .prologue
    const/16 v1, 0xc

    .line 617
    const-string v2, "YouaiLastLoginHelp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getServerInfoCount"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    sget-object v2, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 620
    .local v0, "size":I
    if-le v0, v1, :cond_0

    move v0, v1

    .line 622
    .end local v0    # "size":I
    :cond_0
    return v0
.end method

.method public static getServerUserByIndex(I)I
    .locals 3
    .param p0, "index"    # I

    .prologue
    .line 629
    const-string v0, "YouaiLastLoginHelp"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getServerUserByIndex"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    sget-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_0

    .line 631
    const/4 v0, 0x0

    .line 634
    :goto_0
    return v0

    .line 632
    :cond_0
    const-string v1, "YouaiLastLoginHelp"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "serverId:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getServerId()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 634
    sget-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getServerId()I

    move-result v0

    goto :goto_0
.end method

.method public static makeHead(Landroid/content/Context;Lcom/youai/dreamonepiece/YouaiServerInfo;)Lorg/json/JSONObject;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pYouaiInfo"    # Lcom/youai/dreamonepiece/YouaiServerInfo;

    .prologue
    .line 600
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 602
    .local v1, "header":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "gameId"

    invoke-virtual {p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getGameId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 603
    const-string v2, "platform"

    invoke-virtual {p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlatform()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 604
    const-string v2, "deviceMacId"

    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 605
    const-string v2, "timestamp"

    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 606
    const-string v2, "deviceName"

    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 612
    :goto_0
    return-object v1

    .line 608
    :catch_0
    move-exception v0

    .line 609
    .local v0, "e1":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public static pushforclient(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V
    .locals 1
    .param p0, "param"    # Ljava/lang/String;
    .param p1, "listener"    # Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;

    .prologue
    .line 796
    new-instance v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;

    invoke-direct {v0, p0, p1}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;-><init>(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$3;->start()V

    .line 842
    return-void
.end method

.method public static readJSONFromSD()Ljava/lang/String;
    .locals 14

    .prologue
    const/4 v11, 0x0

    .line 640
    const-string v6, ""

    .line 642
    .local v6, "jsonStr":Ljava/lang/String;
    sget-object v12, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 645
    :try_start_0
    new-instance v4, Ljava/io/FileReader;

    sget-object v12, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-direct {v4, v12}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 646
    .local v4, "fileRe":Ljava/io/FileReader;
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 649
    .local v1, "buffRe":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    .local v9, "temp":Ljava/lang/String;
    if-eqz v9, :cond_0

    .line 650
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 652
    :cond_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 653
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 670
    .end local v1    # "buffRe":Ljava/io/BufferedReader;
    .end local v4    # "fileRe":Ljava/io/FileReader;
    .end local v9    # "temp":Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    .line 671
    .local v7, "jsonsave":Lorg/json/JSONObject;
    const/4 v8, 0x0

    .line 673
    .local v8, "savejsonUser":Lorg/json/JSONArray;
    :try_start_1
    new-instance v7, Lorg/json/JSONObject;

    .end local v7    # "jsonsave":Lorg/json/JSONObject;
    invoke-direct {v7, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 680
    .restart local v7    # "jsonsave":Lorg/json/JSONObject;
    :try_start_2
    sget-boolean v12, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v12, :cond_3

    .line 681
    const-string v12, "com4love"

    sget-object v13, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static {v12, v13}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result-object v0

    .line 689
    .local v0, "_yaUid":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 691
    if-eqz v8, :cond_2

    .line 693
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v5, v12, :cond_2

    .line 695
    :try_start_3
    invoke-virtual {v8, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 696
    .local v10, "testsaveitem":Lorg/json/JSONObject;
    const-string v12, "puid"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 697
    const-string v12, "gameId"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 698
    const-string v12, "playerName"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 699
    const-string v12, "serverId"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 700
    const-string v12, "lastlogintime"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 693
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 654
    .end local v0    # "_yaUid":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v7    # "jsonsave":Lorg/json/JSONObject;
    .end local v8    # "savejsonUser":Lorg/json/JSONArray;
    .end local v10    # "testsaveitem":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 655
    .local v2, "e":Ljava/io/FileNotFoundException;
    const-string v12, "YouaiLastLoginHelp"

    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v6, v11

    .line 712
    .end local v6    # "jsonStr":Ljava/lang/String;
    :cond_2
    :goto_3
    return-object v6

    .line 658
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    .restart local v6    # "jsonStr":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 659
    .local v2, "e":Ljava/io/IOException;
    const-string v12, "YouaiLastLoginHelp"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v6, v11

    .line 660
    goto :goto_3

    .line 674
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v8    # "savejsonUser":Lorg/json/JSONArray;
    :catch_2
    move-exception v3

    .local v3, "e1":Lorg/json/JSONException;
    move-object v6, v11

    .line 675
    goto :goto_3

    .line 683
    .end local v3    # "e1":Lorg/json/JSONException;
    .restart local v7    # "jsonsave":Lorg/json/JSONObject;
    :cond_3
    :try_start_4
    sget-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .restart local v0    # "_yaUid":Ljava/lang/String;
    goto :goto_1

    .line 685
    .end local v0    # "_yaUid":Ljava/lang/String;
    :catch_3
    move-exception v3

    .line 686
    .local v3, "e1":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    move-object v6, v11

    .line 687
    goto :goto_3

    .line 701
    .end local v3    # "e1":Ljava/lang/Exception;
    .restart local v0    # "_yaUid":Ljava/lang/String;
    .restart local v5    # "i":I
    :catch_4
    move-exception v2

    .local v2, "e":Ljava/lang/Exception;
    move-object v6, v11

    .line 702
    goto :goto_3
.end method

.method public static refreshServerInfo(Ljava/lang/String;Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiServerInfo;Z)V
    .locals 23
    .param p0, "gameid"    # Ljava/lang/String;
    .param p1, "puid"    # Ljava/lang/String;
    .param p2, "pYouaiServerInfo"    # Lcom/youai/dreamonepiece/YouaiServerInfo;
    .param p3, "getSvr"    # Z

    .prologue
    .line 345
    const-string v19, "YouaiLastLoginHelp"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "refreshServerInfo+gameid"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "puid"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    if-ne v0, v1, :cond_0

    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_0

    .line 488
    :goto_0
    return-void

    .line 353
    :cond_0
    sput-boolean p3, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->switchPushGet:Z

    .line 355
    new-instance v16, Ljava/io/File;

    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->activityGame:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual/range {v19 .. v19}, Lcom/youai/dreamonepiece/GameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 356
    .local v16, "rootfiles":Ljava/io/File;
    new-instance v19, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    sget-object v21, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "dynamic.ini"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->dynamicFile:Ljava/io/File;

    .line 358
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->dynamicFile:Ljava/io/File;

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_1

    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->dynamicFile:Ljava/io/File;

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->isFile()Z

    move-result v19

    if-eqz v19, :cond_1

    .line 359
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->dynamicFile:Ljava/io/File;

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Push_Get"

    const-string v21, "Switch"

    const-string v22, "0"

    invoke-static/range {v19 .. v22}, Lcom/youai/IniFileUtil;->GetPrivateProfileString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 361
    .local v2, "_switch":Ljava/lang/String;
    const-string v19, "YouaiLastLoginHelp"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "_switch"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    .end local v2    # "_switch":Ljava/lang/String;
    :cond_1
    sput-object p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    .line 367
    sput-object p1, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    .line 368
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->clear()V

    .line 370
    invoke-virtual/range {p2 .. p2}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlatform()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Android_Youai"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 371
    const/16 v19, 0x1

    sput-boolean v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    .line 373
    :cond_2
    new-instance v19, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    sget-object v21, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "youai"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    sget-object v21, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p2 .. p2}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlatform()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "_user"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    .line 376
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_3

    .line 378
    :try_start_0
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    :cond_3
    :goto_1
    invoke-static {}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->readJSONFromSD()Ljava/lang/String;

    move-result-object v12

    .line 385
    .local v12, "jsonsavestr":Ljava/lang/String;
    if-eqz v12, :cond_4

    const-string v19, ""

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 386
    :cond_4
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameId(Ljava/lang/String;)V

    .line 387
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPuid(Ljava/lang/String;)V

    .line 389
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 390
    .local v14, "message":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 392
    .local v6, "data":Lorg/json/JSONObject;
    :try_start_1
    const-string v19, "puid"

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 393
    const-string v19, "data"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 394
    const-string v19, "header"

    sget-object v20, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->activityGame:Lcom/youai/dreamonepiece/GameActivity;

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->makeHead(Landroid/content/Context;Lcom/youai/dreamonepiece/YouaiServerInfo;)Lorg/json/JSONObject;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 399
    :goto_2
    sget-boolean v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->switchPushGet:Z

    if-eqz v19, :cond_5

    .line 400
    invoke-static {v14}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->getFromNet(Lorg/json/JSONObject;)V

    .line 483
    .end local v6    # "data":Lorg/json/JSONObject;
    .end local v14    # "message":Lorg/json/JSONObject;
    :cond_5
    :goto_3
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_6

    .line 484
    new-instance v5, Lcom/youai/dreamonepiece/Ordercomparator;

    invoke-direct {v5}, Lcom/youai/dreamonepiece/Ordercomparator;-><init>()V

    .line 485
    .local v5, "comp":Lcom/youai/dreamonepiece/Ordercomparator;
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v19

    invoke-static {v0, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 487
    .end local v5    # "comp":Lcom/youai/dreamonepiece/Ordercomparator;
    :cond_6
    const-string v19, "youaiInfos"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "youaiInfos"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    sget-object v21, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 379
    .end local v12    # "jsonsavestr":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 380
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1

    .line 395
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v6    # "data":Lorg/json/JSONObject;
    .restart local v12    # "jsonsavestr":Ljava/lang/String;
    .restart local v14    # "message":Lorg/json/JSONObject;
    :catch_1
    move-exception v8

    .line 396
    .local v8, "e1":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 403
    .end local v6    # "data":Lorg/json/JSONObject;
    .end local v8    # "e1":Lorg/json/JSONException;
    .end local v14    # "message":Lorg/json/JSONObject;
    :cond_7
    const/4 v10, 0x0

    .line 404
    .local v10, "jsonsave":Lorg/json/JSONObject;
    const/16 v18, 0x0

    .line 406
    .local v18, "savejsonUser":Lorg/json/JSONArray;
    :try_start_2
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 409
    .end local v10    # "jsonsave":Lorg/json/JSONObject;
    .local v11, "jsonsave":Lorg/json/JSONObject;
    :try_start_3
    sget-boolean v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v19, :cond_8

    .line 410
    const-string v19, "com4love"

    sget-object v20, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v19 .. v20}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 414
    .local v4, "_yaUid":Ljava/lang/String;
    :goto_4
    invoke-virtual {v11, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7

    move-result-object v18

    .line 424
    if-nez v18, :cond_9

    .line 425
    const/4 v13, 0x0

    .line 430
    .local v13, "length":I
    :goto_5
    if-nez v13, :cond_a

    .line 431
    new-instance v15, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-direct {v15}, Lcom/youai/dreamonepiece/YouaiServerInfo;-><init>()V

    .line 432
    .local v15, "pYouaiInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameId(Ljava/lang/String;)V

    .line 433
    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPuid(Ljava/lang/String;)V

    .line 435
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 436
    .restart local v14    # "message":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 438
    .restart local v6    # "data":Lorg/json/JSONObject;
    :try_start_4
    const-string v19, "puid"

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 439
    const-string v19, "data"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 440
    const-string v19, "header"

    sget-object v20, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->activityGame:Lcom/youai/dreamonepiece/GameActivity;

    move-object/from16 v0, v20

    invoke-static {v0, v15}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->makeHead(Landroid/content/Context;Lcom/youai/dreamonepiece/YouaiServerInfo;)Lorg/json/JSONObject;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 446
    :goto_6
    sget-boolean v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->switchPushGet:Z

    if-eqz v19, :cond_5

    .line 447
    invoke-static {v14}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->getFromNet(Lorg/json/JSONObject;)V

    goto/16 :goto_3

    .line 412
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v6    # "data":Lorg/json/JSONObject;
    .end local v13    # "length":I
    .end local v14    # "message":Lorg/json/JSONObject;
    .end local v15    # "pYouaiInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :cond_8
    :try_start_5
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto :goto_4

    .line 415
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v11    # "jsonsave":Lorg/json/JSONObject;
    .restart local v10    # "jsonsave":Lorg/json/JSONObject;
    :catch_2
    move-exception v7

    .line 416
    .local v7, "e":Lorg/json/JSONException;
    :goto_7
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 418
    .end local v7    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v7

    .line 419
    .local v7, "e":Ljava/lang/Exception;
    :goto_8
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 427
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v10    # "jsonsave":Lorg/json/JSONObject;
    .restart local v4    # "_yaUid":Ljava/lang/String;
    .restart local v11    # "jsonsave":Lorg/json/JSONObject;
    :cond_9
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v13

    .restart local v13    # "length":I
    goto :goto_5

    .line 441
    .restart local v6    # "data":Lorg/json/JSONObject;
    .restart local v14    # "message":Lorg/json/JSONObject;
    .restart local v15    # "pYouaiInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :catch_4
    move-exception v8

    .line 442
    .restart local v8    # "e1":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_6

    .line 449
    .end local v6    # "data":Lorg/json/JSONObject;
    .end local v8    # "e1":Lorg/json/JSONException;
    .end local v14    # "message":Lorg/json/JSONObject;
    .end local v15    # "pYouaiInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :cond_a
    const-string v19, "YouaiLastLoginHelp"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "length"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_9
    if-ge v9, v13, :cond_5

    .line 451
    const/16 v17, 0x0

    .line 453
    .local v17, "saveitem":Lorg/json/JSONObject;
    :try_start_6
    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v17

    .line 454
    new-instance v3, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-direct {v3}, Lcom/youai/dreamonepiece/YouaiServerInfo;-><init>()V

    .line 455
    .local v3, "_userServer":Lcom/youai/dreamonepiece/YouaiServerInfo;
    sget-boolean v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v19, :cond_b

    .line 456
    const-string v19, "com4love"

    const-string v20, "puid"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/youai/dreamonepiece/DES;->decryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPuid(Ljava/lang/String;)V

    .line 461
    :goto_a
    const-string v19, "serverId"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setServerId(I)V

    .line 462
    const-string v19, "playerName"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerName(Ljava/lang/String;)V

    .line 464
    const-string v19, "lastlogintime"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setLastLoginTime(Ljava/lang/Long;)V

    .line 466
    sget-object v19, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 450
    .end local v3    # "_userServer":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :goto_b
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 459
    .restart local v3    # "_userServer":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :cond_b
    const-string v19, "puid"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPuid(Ljava/lang/String;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_a

    .line 467
    .end local v3    # "_userServer":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :catch_5
    move-exception v7

    .line 468
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_b

    .line 470
    .end local v7    # "e":Lorg/json/JSONException;
    :catch_6
    move-exception v7

    .line 471
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_b

    .line 418
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v9    # "i":I
    .end local v13    # "length":I
    .end local v17    # "saveitem":Lorg/json/JSONObject;
    :catch_7
    move-exception v7

    move-object v10, v11

    .end local v11    # "jsonsave":Lorg/json/JSONObject;
    .restart local v10    # "jsonsave":Lorg/json/JSONObject;
    goto/16 :goto_8

    .line 415
    .end local v10    # "jsonsave":Lorg/json/JSONObject;
    .restart local v11    # "jsonsave":Lorg/json/JSONObject;
    :catch_8
    move-exception v7

    move-object v10, v11

    .end local v11    # "jsonsave":Lorg/json/JSONObject;
    .restart local v10    # "jsonsave":Lorg/json/JSONObject;
    goto/16 :goto_7
.end method

.method public static setGexingClientId(Ljava/lang/String;)V
    .locals 0
    .param p0, "gexingClientId"    # Ljava/lang/String;

    .prologue
    .line 845
    sput-object p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gexingClientId:Ljava/lang/String;

    .line 846
    return-void
.end method

.method public static setGexingTags(Ljava/lang/String;)V
    .locals 0
    .param p0, "gexingTags"    # Ljava/lang/String;

    .prologue
    .line 849
    sput-object p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gexingTags:Ljava/lang/String;

    .line 850
    return-void
.end method

.method public static setYouaiLastLoginHelp(Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 3
    .param p0, "pActivity"    # Lcom/youai/dreamonepiece/GameActivity;

    .prologue
    .line 60
    sput-object p0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->activityGame:Lcom/youai/dreamonepiece/GameActivity;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    .line 62
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "youai"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->savePath:Ljava/io/File;

    .line 65
    sget-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->savePath:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    sget-object v0, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->savePath:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 69
    :cond_0
    return-void
.end method

.method public static updateServerInfo(ILcom/youai/dreamonepiece/YouaiServerInfo;Z)V
    .locals 29
    .param p0, "serverID"    # I
    .param p1, "pYouaiInfo"    # Lcom/youai/dreamonepiece/YouaiServerInfo;
    .param p2, "pushSvr"    # Z

    .prologue
    .line 75
    const-string v26, "YouaiLastLoginHelp"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "updateServerInfo"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlatform()Ljava/lang/String;

    move-result-object v26

    sput-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->platform_str:Ljava/lang/String;

    .line 78
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->platform_str:Ljava/lang/String;

    const-string v27, "Android_Youai"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_0

    .line 79
    const/16 v26, 0x1

    sput-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    .line 81
    :cond_0
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    if-eqz v26, :cond_1

    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    const-string v27, ""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_1

    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    if-eqz v26, :cond_1

    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    const-string v27, ""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_3

    .line 83
    :cond_1
    const-string v26, "YouaiLastLoginHelp"

    const-string v27, "gameid or yauid invalid"

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    :cond_2
    :goto_0
    return-void

    .line 87
    :cond_3
    sput-boolean p2, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->switchPushGet:Z

    .line 89
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V

    .line 90
    .local v18, "message":Lorg/json/JSONObject;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 93
    .local v7, "data":Lorg/json/JSONObject;
    :try_start_0
    const-string v26, "puid"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    const-string v26, "serverId"

    move-object/from16 v0, v26

    move/from16 v1, p0

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 95
    const-string v26, "playerId"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerId()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 96
    const-string v26, "playerName"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    const-string v26, "gameCoin1"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getGameCoin1()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 98
    const-string v26, "gameCoin2"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getGameCoin2()J

    move-result-wide v27

    move-object/from16 v0, v26

    move-wide/from16 v1, v27

    invoke-virtual {v7, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 99
    const-string v26, "vipLvl"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getVipLv1()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 100
    const-string v26, "playerLvl"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerLv1()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 102
    const-string v26, "geXingClientId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gexingClientId:Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 103
    const-string v26, "geXingTags"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gexingTags:Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 105
    const-string v26, "data"

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 107
    .local v11, "header":Lorg/json/JSONObject;
    const-string v26, "gameId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    const-string v26, "platform"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->platform_str:Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    const-string v26, "deviceMacId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->activityGame:Lcom/youai/dreamonepiece/GameActivity;

    invoke-static/range {v27 .. v27}, Lcom/youai/DeviceUtil;->getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    const-string v26, "timestamp"

    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    move-result-wide v27

    move-object/from16 v0, v26

    move-wide/from16 v1, v27

    invoke-virtual {v11, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 111
    const-string v26, "deviceName"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->activityGame:Lcom/youai/dreamonepiece/GameActivity;

    invoke-static/range {v27 .. v27}, Lcom/youai/DeviceUtil;->getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    const-string v26, "header"

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 117
    .end local v11    # "header":Lorg/json/JSONObject;
    :goto_1
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v20

    .line 118
    .local v20, "pushMsg":Ljava/lang/String;
    const-string v26, "YouaiLastLoginHelp:message.toString"

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->switchPushGet:Z

    if-eqz v26, :cond_4

    .line 120
    new-instance v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$1;

    invoke-direct/range {v26 .. v26}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp$1;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->pushforclient(Ljava/lang/String;Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;)V

    .line 140
    :cond_4
    invoke-static {}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->readJSONFromSD()Ljava/lang/String;

    move-result-object v16

    .line 141
    .local v16, "jsonsavestr":Ljava/lang/String;
    if-eqz v16, :cond_5

    const-string v26, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_7

    .line 145
    :cond_5
    new-instance v23, Lorg/json/JSONObject;

    invoke-direct/range {v23 .. v23}, Lorg/json/JSONObject;-><init>()V

    .line 146
    .local v23, "tosaveObj":Lorg/json/JSONObject;
    new-instance v24, Lorg/json/JSONArray;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONArray;-><init>()V

    .line 147
    .local v24, "tosavearray":Lorg/json/JSONArray;
    new-instance v25, Lorg/json/JSONObject;

    invoke-direct/range {v25 .. v25}, Lorg/json/JSONObject;-><init>()V

    .line 150
    .local v25, "tosaveitem":Lorg/json/JSONObject;
    :try_start_1
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v26, :cond_6

    .line 151
    const-string v26, "com4love"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v26 .. v27}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 155
    .local v4, "_yaUid":Ljava/lang/String;
    :goto_2
    const-string v26, "puid"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    const-string v26, "gameId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    const-string v26, "playerName"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    const-string v26, "serverId"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 159
    const-string v26, "lastlogintime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    invoke-virtual/range {v25 .. v28}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 160
    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 162
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    invoke-static/range {v23 .. v23}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->writeJSONObjectToSdCard(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto/16 :goto_0

    .line 165
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 166
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 114
    .end local v8    # "e":Lorg/json/JSONException;
    .end local v16    # "jsonsavestr":Ljava/lang/String;
    .end local v20    # "pushMsg":Ljava/lang/String;
    .end local v23    # "tosaveObj":Lorg/json/JSONObject;
    .end local v24    # "tosavearray":Lorg/json/JSONArray;
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    :catch_1
    move-exception v9

    .line 115
    .local v9, "e1":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 153
    .end local v9    # "e1":Lorg/json/JSONException;
    .restart local v16    # "jsonsavestr":Ljava/lang/String;
    .restart local v20    # "pushMsg":Ljava/lang/String;
    .restart local v23    # "tosaveObj":Lorg/json/JSONObject;
    .restart local v24    # "tosavearray":Lorg/json/JSONArray;
    .restart local v25    # "tosaveitem":Lorg/json/JSONObject;
    :cond_6
    :try_start_2
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto :goto_2

    .line 167
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_2
    move-exception v8

    .line 168
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 174
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v23    # "tosaveObj":Lorg/json/JSONObject;
    .end local v24    # "tosavearray":Lorg/json/JSONArray;
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    :cond_7
    const/4 v14, 0x0

    .line 175
    .local v14, "jsonsave":Lorg/json/JSONObject;
    const/16 v22, 0x0

    .line 177
    .local v22, "savejsonUser":Lorg/json/JSONArray;
    :try_start_3
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct/range {v15 .. v16}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    .line 180
    .end local v14    # "jsonsave":Lorg/json/JSONObject;
    .local v15, "jsonsave":Lorg/json/JSONObject;
    :try_start_4
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v26, :cond_d

    .line 181
    const-string v26, "com4love"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v26 .. v27}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 185
    .restart local v4    # "_yaUid":Ljava/lang/String;
    :goto_3
    invoke-virtual {v15, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_d

    move-result-object v22

    move-object v14, v15

    .line 219
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v15    # "jsonsave":Lorg/json/JSONObject;
    .restart local v14    # "jsonsave":Lorg/json/JSONObject;
    :goto_4
    invoke-static {}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->readJSONFromSD()Ljava/lang/String;

    move-result-object v26

    if-nez v26, :cond_8

    .line 220
    const/16 v22, 0x0

    .line 223
    :cond_8
    if-nez v22, :cond_10

    .line 224
    new-instance v24, Lorg/json/JSONArray;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONArray;-><init>()V

    .line 225
    .restart local v24    # "tosavearray":Lorg/json/JSONArray;
    new-instance v25, Lorg/json/JSONObject;

    invoke-direct/range {v25 .. v25}, Lorg/json/JSONObject;-><init>()V

    .line 229
    .restart local v25    # "tosaveitem":Lorg/json/JSONObject;
    :try_start_5
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v26, :cond_f

    .line 230
    const-string v26, "com4love"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v26 .. v27}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 235
    .restart local v4    # "_yaUid":Ljava/lang/String;
    :goto_5
    const-string v26, "puid"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    const-string v26, "gameId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    const-string v26, "playerName"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 238
    const-string v26, "serverId"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 239
    const-string v26, "lastlogintime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    invoke-virtual/range {v25 .. v28}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 240
    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 241
    move-object/from16 v0, v24

    invoke-virtual {v14, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_8

    .line 305
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v24    # "tosavearray":Lorg/json/JSONArray;
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    :cond_9
    :goto_6
    invoke-static {v14}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->writeJSONObjectToSdCard(Lorg/json/JSONObject;)V

    .line 307
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/youai/dreamonepiece/YouaiServerInfo;

    .line 308
    .local v5, "aInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    invoke-virtual {v5}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getServerId()I

    move-result v26

    move/from16 v0, v26

    move/from16 v1, p0

    if-ne v0, v1, :cond_a

    .line 309
    const/16 v26, 0x1

    sput-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->found:Z

    .line 310
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setLastLoginTime(Ljava/lang/Long;)V

    .line 314
    .end local v5    # "aInfo":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :cond_b
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->found:Z

    if-nez v26, :cond_c

    .line 315
    new-instance v19, Lcom/youai/dreamonepiece/YouaiServerInfo;

    invoke-direct/range {v19 .. v19}, Lcom/youai/dreamonepiece/YouaiServerInfo;-><init>()V

    .line 317
    .local v19, "nowuserServer":Lcom/youai/dreamonepiece/YouaiServerInfo;
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPuid(Ljava/lang/String;)V

    .line 318
    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getGameCoin1()I

    move-result v26

    move-object/from16 v0, v19

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameCoin1(I)V

    .line 319
    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getGameCoin2()J

    move-result-wide v26

    move-object/from16 v0, v19

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameCoin2(J)V

    .line 320
    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerLv1()I

    move-result v26

    move-object/from16 v0, v19

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerLv1(I)V

    .line 321
    move-object/from16 v0, v19

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setServerId(I)V

    .line 322
    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getVipLv1()I

    move-result v26

    move-object/from16 v0, v19

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setVipLv1(I)V

    .line 323
    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setPlayerName(Ljava/lang/String;)V

    .line 324
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setGameId(Ljava/lang/String;)V

    .line 325
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->setLastLoginTime(Ljava/lang/Long;)V

    .line 327
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    .end local v19    # "nowuserServer":Lcom/youai/dreamonepiece/YouaiServerInfo;
    :cond_c
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->size()I

    move-result v26

    if-lez v26, :cond_2

    .line 335
    new-instance v6, Lcom/youai/dreamonepiece/Ordercomparator;

    invoke-direct {v6}, Lcom/youai/dreamonepiece/Ordercomparator;-><init>()V

    .line 336
    .local v6, "comp":Lcom/youai/dreamonepiece/Ordercomparator;
    sget-object v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->youaiInfos:Ljava/util/ArrayList;

    move-object/from16 v0, v26

    invoke-static {v0, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto/16 :goto_0

    .line 183
    .end local v6    # "comp":Lcom/youai/dreamonepiece/Ordercomparator;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v14    # "jsonsave":Lorg/json/JSONObject;
    .restart local v15    # "jsonsave":Lorg/json/JSONObject;
    :cond_d
    :try_start_6
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_d

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto/16 :goto_3

    .line 186
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v15    # "jsonsave":Lorg/json/JSONObject;
    .restart local v14    # "jsonsave":Lorg/json/JSONObject;
    :catch_3
    move-exception v8

    .line 187
    .local v8, "e":Lorg/json/JSONException;
    :goto_7
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    .line 191
    new-instance v23, Lorg/json/JSONObject;

    invoke-direct/range {v23 .. v23}, Lorg/json/JSONObject;-><init>()V

    .line 192
    .restart local v23    # "tosaveObj":Lorg/json/JSONObject;
    new-instance v24, Lorg/json/JSONArray;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONArray;-><init>()V

    .line 193
    .restart local v24    # "tosavearray":Lorg/json/JSONArray;
    new-instance v25, Lorg/json/JSONObject;

    invoke-direct/range {v25 .. v25}, Lorg/json/JSONObject;-><init>()V

    .line 196
    .restart local v25    # "tosaveitem":Lorg/json/JSONObject;
    :try_start_7
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v26, :cond_e

    .line 197
    const-string v26, "com4love"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v26 .. v27}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 201
    .restart local v4    # "_yaUid":Ljava/lang/String;
    :goto_8
    const-string v26, "puid"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    const-string v26, "gameId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 203
    const-string v26, "playerName"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 204
    const-string v26, "serverId"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 205
    const-string v26, "lastlogintime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    invoke-virtual/range {v25 .. v28}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 206
    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 207
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    invoke-static/range {v23 .. v23}, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->writeJSONObjectToSdCard(Lorg/json/JSONObject;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_0

    .line 209
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_4
    move-exception v10

    .line 210
    .local v10, "e2":Lorg/json/JSONException;
    invoke-virtual {v10}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 199
    .end local v10    # "e2":Lorg/json/JSONException;
    :cond_e
    :try_start_8
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto :goto_8

    .line 211
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_5
    move-exception v10

    .line 212
    .local v10, "e2":Ljava/lang/Exception;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 215
    .end local v8    # "e":Lorg/json/JSONException;
    .end local v10    # "e2":Ljava/lang/Exception;
    .end local v23    # "tosaveObj":Lorg/json/JSONObject;
    .end local v24    # "tosavearray":Lorg/json/JSONArray;
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    :catch_6
    move-exception v8

    .line 216
    .local v8, "e":Ljava/lang/Exception;
    :goto_9
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_4

    .line 232
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v24    # "tosavearray":Lorg/json/JSONArray;
    .restart local v25    # "tosaveitem":Lorg/json/JSONObject;
    :cond_f
    :try_start_9
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_7
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto/16 :goto_5

    .line 242
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_7
    move-exception v8

    .line 243
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_6

    .line 244
    .end local v8    # "e":Lorg/json/JSONException;
    :catch_8
    move-exception v8

    .line 245
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 248
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v24    # "tosavearray":Lorg/json/JSONArray;
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    :cond_10
    const/16 v26, 0x0

    sput-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->found:Z

    .line 249
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v17

    .line 250
    .local v17, "length":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_a
    move/from16 v0, v17

    if-ge v12, v0, :cond_11

    .line 251
    const/16 v21, 0x0

    .line 253
    .local v21, "saveitem":Lorg/json/JSONObject;
    :try_start_a
    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 254
    const-string v26, "YouaiLastLoginHelp"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "serverId"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "serverId"

    move-object/from16 v0, v21

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    const-string v26, "serverId"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    move/from16 v1, p0

    if-ne v0, v1, :cond_13

    .line 257
    const/16 v26, 0x1

    sput-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->found:Z

    .line 258
    const-string v26, "lastlogintime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    move-wide/from16 v2, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 262
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v26, :cond_12

    .line 263
    const-string v26, "com4love"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v26 .. v27}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 267
    .restart local v4    # "_yaUid":Ljava/lang/String;
    :goto_b
    move-object/from16 v0, v22

    invoke-virtual {v14, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_b

    .line 277
    .end local v4    # "_yaUid":Ljava/lang/String;
    .end local v21    # "saveitem":Lorg/json/JSONObject;
    :cond_11
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->found:Z

    if-nez v26, :cond_9

    .line 278
    new-instance v25, Lorg/json/JSONObject;

    invoke-direct/range {v25 .. v25}, Lorg/json/JSONObject;-><init>()V

    .line 282
    .restart local v25    # "tosaveitem":Lorg/json/JSONObject;
    :try_start_b
    sget-boolean v26, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->mDesBol:Z

    if-eqz v26, :cond_14

    .line 283
    const-string v26, "com4love"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;

    invoke-static/range {v26 .. v27}, Lcom/youai/dreamonepiece/DES;->encryptDES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 287
    .restart local v4    # "_yaUid":Ljava/lang/String;
    :goto_c
    const-string v26, "puid"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 288
    const-string v26, "gameId"

    sget-object v27, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->gameId:Ljava/lang/String;

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 289
    const-string v26, "playerName"

    invoke-virtual/range {p1 .. p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getPlayerName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v25 .. v27}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 291
    const-string v26, "serverId"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 292
    const-string v26, "lastlogintime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    invoke-virtual/range {v25 .. v28}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 294
    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_9
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_c

    goto/16 :goto_6

    .line 295
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_9
    move-exception v8

    .line 296
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_6

    .line 265
    .end local v8    # "e":Lorg/json/JSONException;
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    .restart local v21    # "saveitem":Lorg/json/JSONObject;
    :cond_12
    :try_start_c
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_a
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_b

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto :goto_b

    .line 270
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_a
    move-exception v8

    .line 271
    .restart local v8    # "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    .line 250
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_13
    :goto_d
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_a

    .line 272
    :catch_b
    move-exception v8

    .line 273
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_d

    .line 285
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v21    # "saveitem":Lorg/json/JSONObject;
    .restart local v25    # "tosaveitem":Lorg/json/JSONObject;
    :cond_14
    :try_start_d
    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->yaUid:Ljava/lang/String;
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_9
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_c

    .restart local v4    # "_yaUid":Ljava/lang/String;
    goto :goto_c

    .line 297
    .end local v4    # "_yaUid":Ljava/lang/String;
    :catch_c
    move-exception v8

    .line 298
    .restart local v8    # "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 215
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v12    # "i":I
    .end local v14    # "jsonsave":Lorg/json/JSONObject;
    .end local v17    # "length":I
    .end local v25    # "tosaveitem":Lorg/json/JSONObject;
    .restart local v15    # "jsonsave":Lorg/json/JSONObject;
    :catch_d
    move-exception v8

    move-object v14, v15

    .end local v15    # "jsonsave":Lorg/json/JSONObject;
    .restart local v14    # "jsonsave":Lorg/json/JSONObject;
    goto/16 :goto_9

    .line 186
    .end local v14    # "jsonsave":Lorg/json/JSONObject;
    .restart local v15    # "jsonsave":Lorg/json/JSONObject;
    :catch_e
    move-exception v8

    move-object v14, v15

    .end local v15    # "jsonsave":Lorg/json/JSONObject;
    .restart local v14    # "jsonsave":Lorg/json/JSONObject;
    goto/16 :goto_7
.end method

.method public static writeJSONObjectToSdCard(Lorg/json/JSONObject;)V
    .locals 5
    .param p0, "pServerObj"    # Lorg/json/JSONObject;

    .prologue
    .line 717
    sget-object v3, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 718
    sget-object v3, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 720
    :cond_0
    sget-object v3, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    sget-object v3, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_1

    .line 722
    :try_start_0
    sget-object v3, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 729
    :cond_1
    const/4 v1, 0x0

    .line 731
    .local v1, "outputStream":Ljava/io/PrintStream;
    :try_start_1
    new-instance v2, Ljava/io/PrintStream;

    new-instance v3, Ljava/io/FileOutputStream;

    sget-object v4, Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->saveFile:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 732
    .end local v1    # "outputStream":Ljava/io/PrintStream;
    .local v2, "outputStream":Ljava/io/PrintStream;
    :try_start_2
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 736
    if-eqz v2, :cond_2

    .line 737
    invoke-virtual {v2}, Ljava/io/PrintStream;->close()V

    :cond_2
    move-object v1, v2

    .line 740
    .end local v2    # "outputStream":Ljava/io/PrintStream;
    :cond_3
    :goto_0
    return-void

    .line 723
    :catch_0
    move-exception v0

    .line 724
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "YouaiLastLoginHelp"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 733
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "outputStream":Ljava/io/PrintStream;
    :catch_1
    move-exception v0

    .line 734
    .local v0, "e":Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 736
    if-eqz v1, :cond_3

    .line 737
    invoke-virtual {v1}, Ljava/io/PrintStream;->close()V

    goto :goto_0

    .line 736
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catchall_0
    move-exception v3

    :goto_2
    if-eqz v1, :cond_4

    .line 737
    invoke-virtual {v1}, Ljava/io/PrintStream;->close()V

    .line 736
    :cond_4
    throw v3

    .end local v1    # "outputStream":Ljava/io/PrintStream;
    .restart local v2    # "outputStream":Ljava/io/PrintStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/PrintStream;
    .restart local v1    # "outputStream":Ljava/io/PrintStream;
    goto :goto_2

    .line 733
    .end local v1    # "outputStream":Ljava/io/PrintStream;
    .restart local v2    # "outputStream":Ljava/io/PrintStream;
    :catch_2
    move-exception v0

    move-object v1, v2

    .end local v2    # "outputStream":Ljava/io/PrintStream;
    .restart local v1    # "outputStream":Ljava/io/PrintStream;
    goto :goto_1
.end method
