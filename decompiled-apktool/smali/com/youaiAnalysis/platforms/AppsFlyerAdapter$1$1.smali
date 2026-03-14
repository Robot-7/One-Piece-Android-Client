.class Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;
.super Ljava/lang/Thread;
.source "AppsFlyerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->onConversionDataLoaded(Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;

.field private final synthetic val$appkey:Ljava/lang/String;

.field private final synthetic val$click_time:Ljava/lang/String;

.field private final synthetic val$click_url:Ljava/lang/String;

.field private final synthetic val$context:Landroid/app/Activity;

.field private final synthetic val$install_time:Ljava/lang/String;

.field private final synthetic val$is_paid:Ljava/lang/String;

.field private final synthetic val$media_source:Ljava/lang/String;

.field private final synthetic val$platform_type_str:Ljava/lang/String;

.field private final synthetic val$sdkVersion:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->this$1:Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;

    iput-object p2, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$context:Landroid/app/Activity;

    iput-object p3, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$appkey:Ljava/lang/String;

    iput-object p4, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$platform_type_str:Ljava/lang/String;

    iput-object p5, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$install_time:Ljava/lang/String;

    iput-object p6, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$media_source:Ljava/lang/String;

    iput-object p7, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$sdkVersion:Ljava/lang/String;

    iput-object p8, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$click_url:Ljava/lang/String;

    iput-object p9, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$click_time:Ljava/lang/String;

    iput-object p10, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$is_paid:Ljava/lang/String;

    .line 91
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 93
    iget-object v0, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$context:Landroid/app/Activity;

    iget-object v1, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$appkey:Ljava/lang/String;

    iget-object v2, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$platform_type_str:Ljava/lang/String;

    iget-object v3, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$install_time:Ljava/lang/String;

    iget-object v4, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$media_source:Ljava/lang/String;

    iget-object v5, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$sdkVersion:Ljava/lang/String;

    iget-object v6, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$click_url:Ljava/lang/String;

    iget-object v7, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$click_time:Ljava/lang/String;

    iget-object v8, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$is_paid:Ljava/lang/String;

    invoke-static/range {v0 .. v8}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->makeAppsFlyerMsg(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 95
    .local v11, "postData":Ljava/lang/String;
    const-string v0, "http://203.90.236.18/index.php?g=home&m=apiRequest&a=collectData"

    invoke-static {v0, v11}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->doPost(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 98
    .local v12, "retData":Ljava/lang/String;
    :try_start_0
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 99
    .local v13, "retJson":Lorg/json/JSONObject;
    const-string v0, "status"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v14

    .line 100
    .local v14, "status":I
    if-eqz v14, :cond_0

    .line 101
    iget-object v0, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->val$context:Landroid/app/Activity;

    const-string v1, "appsflyer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    .line 102
    .local v9, "appsEditor":Landroid/content/SharedPreferences$Editor;
    const-string v0, "sendCollectData"

    const/4 v1, 0x1

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 103
    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v9    # "appsEditor":Landroid/content/SharedPreferences$Editor;
    .end local v13    # "retJson":Lorg/json/JSONObject;
    .end local v14    # "status":I
    :cond_0
    :goto_0
    return-void

    .line 105
    :catch_0
    move-exception v10

    .line 106
    .local v10, "e":Lorg/json/JSONException;
    invoke-virtual {v10}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
