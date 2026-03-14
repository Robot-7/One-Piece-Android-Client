.class Lcom/youai/sdks/platform/PlatformPipaw$3;
.super Ljava/lang/Object;
.source "PlatformPipaw.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/sdks/platform/PlatformPipaw;->getUid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/sdks/platform/PlatformPipaw;

.field private final synthetic val$sid:Ljava/lang/String;

.field private final synthetic val$time:Ljava/lang/String;

.field private final synthetic val$username:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/youai/sdks/platform/PlatformPipaw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iput-object p2, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->val$username:Ljava/lang/String;

    iput-object p3, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->val$sid:Ljava/lang/String;

    iput-object p4, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->val$time:Ljava/lang/String;

    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loginFail()V
    .locals 3

    .prologue
    .line 246
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    iput-object v1, v0, Lcom/youai/sdks/beans/LoginInfo;->loginState:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    .line 247
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    const-string v1, ""

    iput-object v1, v0, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    .line 248
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    const-string v1, ""

    iput-object v1, v0, Lcom/youai/sdks/beans/LoginInfo;->uName:Ljava/lang/String;

    .line 249
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    .line 250
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v2, "\u767b\u5f55\u5931\u8d25"

    invoke-static {v0, v1, v2}, Lcom/youai/sdks/platform/PlatformPipaw;->access$0(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    .line 251
    return-void
.end method

.method public run()V
    .locals 22

    .prologue
    .line 255
    const-string v2, "https://temp.ruyify.xyz/wz/appuser/Checksid.php"

    .line 256
    .local v2, "UID_URL":Ljava/lang/String;
    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 257
    .local v5, "client":Lorg/apache/http/client/HttpClient;
    new-instance v16, Lorg/apache/http/client/methods/HttpPost;

    const-string v19, "https://temp.ruyify.xyz/wz/appuser/Checksid.php"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 258
    .local v16, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 259
    .local v15, "paramList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v9, Lorg/apache/http/message/BasicNameValuePair;

    const-string v19, "username"

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->val$username:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 259
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v9, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    .local v9, "param":Lorg/apache/http/message/BasicNameValuePair;
    new-instance v10, Lorg/apache/http/message/BasicNameValuePair;

    const-string v19, "appId"

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 261
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v10, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .local v10, "param1":Lorg/apache/http/message/BasicNameValuePair;
    new-instance v11, Lorg/apache/http/message/BasicNameValuePair;

    .line 264
    const-string v19, "merchantId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/youai/sdks/beans/PlatformInfo;->cpID:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v20

    .line 263
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v11, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .local v11, "param2":Lorg/apache/http/message/BasicNameValuePair;
    new-instance v12, Lorg/apache/http/message/BasicNameValuePair;

    .line 266
    const-string v19, "merchantAppId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/youai/sdks/beans/PlatformInfo;->gameID:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 265
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v12, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .local v12, "param3":Lorg/apache/http/message/BasicNameValuePair;
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string v19, "sid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->val$sid:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v13, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .local v13, "param4":Lorg/apache/http/message/BasicNameValuePair;
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string v19, "time"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->val$time:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v14, v0, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    .local v14, "param5":Lorg/apache/http/message/BasicNameValuePair;
    invoke-interface {v15, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    invoke-interface {v15, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    invoke-interface {v15, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    invoke-interface {v15, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    invoke-interface {v15, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    invoke-interface {v15, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    :try_start_0
    new-instance v19, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .line 277
    const-string v20, "UTF-8"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v15, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 276
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 278
    move-object/from16 v0, v16

    invoke-interface {v5, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 279
    .local v7, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v19

    const/16 v20, 0xc8

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_1

    .line 281
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v19

    .line 280
    invoke-static/range {v19 .. v19}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v18

    .line 282
    .local v18, "resultStr":Ljava/lang/String;
    new-instance v8, Lorg/json/JSONObject;

    move-object/from16 v0, v18

    invoke-direct {v8, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 283
    .local v8, "jsonResult":Lorg/json/JSONObject;
    const-string v19, "result"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v17

    .line 284
    .local v17, "result":I
    const/16 v19, 0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_0

    .line 285
    const-string v19, "uid"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 286
    .local v3, "_uid":Ljava/lang/String;
    const-string v19, "username"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 287
    .local v4, "_username":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    move-object/from16 v19, v0

    sget-object v20, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Success:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/youai/sdks/beans/LoginInfo;->loginState:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iput-object v3, v0, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->login_info:Lcom/youai/sdks/beans/LoginInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iput-object v4, v0, Lcom/youai/sdks/beans/LoginInfo;->uName:Ljava/lang/String;

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/youai/sdks/platform/PlatformPipaw;->mIsLogined:Z

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw$3;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    move-object/from16 v19, v0

    sget-object v20, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Success:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v21, "\u767b\u5f55\u6210\u529f"

    invoke-static/range {v19 .. v21}, Lcom/youai/sdks/platform/PlatformPipaw;->access$0(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    .line 307
    .end local v3    # "_uid":Ljava/lang/String;
    .end local v4    # "_username":Ljava/lang/String;
    .end local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v8    # "jsonResult":Lorg/json/JSONObject;
    .end local v17    # "result":I
    .end local v18    # "resultStr":Ljava/lang/String;
    :goto_0
    return-void

    .line 293
    .restart local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v8    # "jsonResult":Lorg/json/JSONObject;
    .restart local v17    # "result":I
    .restart local v18    # "resultStr":Ljava/lang/String;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/youai/sdks/platform/PlatformPipaw$3;->loginFail()V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_0

    .line 298
    .end local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v8    # "jsonResult":Lorg/json/JSONObject;
    .end local v17    # "result":I
    .end local v18    # "resultStr":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 299
    .local v6, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual/range {p0 .. p0}, Lcom/youai/sdks/platform/PlatformPipaw$3;->loginFail()V

    goto :goto_0

    .line 296
    .end local v6    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    :cond_1
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/youai/sdks/platform/PlatformPipaw$3;->loginFail()V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_0

    .line 300
    .end local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v6

    .line 301
    .local v6, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual/range {p0 .. p0}, Lcom/youai/sdks/platform/PlatformPipaw$3;->loginFail()V

    goto :goto_0

    .line 302
    .end local v6    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_2
    move-exception v6

    .line 303
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual/range {p0 .. p0}, Lcom/youai/sdks/platform/PlatformPipaw$3;->loginFail()V

    goto :goto_0

    .line 304
    .end local v6    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v6

    .line 305
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual/range {p0 .. p0}, Lcom/youai/sdks/platform/PlatformPipaw$3;->loginFail()V

    goto :goto_0
.end method
