.class Lcom/youai/sdks/platform/PlatformPipaw$1;
.super Ljava/lang/Object;
.source "PlatformPipaw.java"

# interfaces
.implements Lcom/pipaw/pipawpay/PipawLoginListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/sdks/platform/PlatformPipaw;->callLogin(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/sdks/platform/PlatformPipaw;


# direct methods
.method constructor <init>(Lcom/youai/sdks/platform/PlatformPipaw;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youai/sdks/platform/PlatformPipaw$1;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callback(ILjava/lang/String;)V
    .locals 9
    .param p1, "resultCode"    # I
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 136
    const/16 v5, 0x7d0

    if-ne p1, v5, :cond_1

    .line 140
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw$1;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v6, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Cancel:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v7, "\u9000\u51fa\u767b\u5f55"

    invoke-static {v5, v6, v7}, Lcom/youai/sdks/platform/PlatformPipaw;->access$0(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    const/16 v5, 0x7d1

    if-ne p1, v5, :cond_2

    .line 149
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 150
    .local v0, "dataJsonObj":Lorg/json/JSONObject;
    const-string v5, "sid"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 152
    .local v2, "sid":Ljava/lang/String;
    const-string v5, "username"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 153
    .local v4, "username":Ljava/lang/String;
    const-string v5, "time"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 154
    .local v3, "time":Ljava/lang/String;
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw$1;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    invoke-static {v5, v2, v4, v3}, Lcom/youai/sdks/platform/PlatformPipaw;->access$1(Lcom/youai/sdks/platform/PlatformPipaw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 155
    .end local v0    # "dataJsonObj":Lorg/json/JSONObject;
    .end local v2    # "sid":Ljava/lang/String;
    .end local v3    # "time":Ljava/lang/String;
    .end local v4    # "username":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 156
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 157
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw$1;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v6, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v7, "\u767b\u5f55\u5931\u8d25"

    invoke-static {v5, v6, v7}, Lcom/youai/sdks/platform/PlatformPipaw;->access$0(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    goto :goto_0

    .line 159
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_2
    const/16 v5, 0x7d2

    if-ne p1, v5, :cond_0

    .line 163
    iget-object v5, p0, Lcom/youai/sdks/platform/PlatformPipaw$1;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v6, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "\u767b\u5f55\u5931\u8d25:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 163
    invoke-static {v5, v6, v7}, Lcom/youai/sdks/platform/PlatformPipaw;->access$0(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    goto :goto_0
.end method
