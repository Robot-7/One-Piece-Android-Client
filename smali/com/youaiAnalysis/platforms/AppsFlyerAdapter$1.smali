.class Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;
.super Ljava/lang/Object;
.source "AppsFlyerAdapter.java"

# interfaces
.implements Lcom/appsflyer/ConversionDataListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;->converData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;

.field private final synthetic val$appkey:Ljava/lang/String;

.field private final synthetic val$context:Landroid/app/Activity;

.field private final synthetic val$platform_type_str:Ljava/lang/String;

.field private final synthetic val$sdkVersion:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->this$0:Lcom/youaiAnalysis/platforms/AppsFlyerAdapter;

    iput-object p2, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$context:Landroid/app/Activity;

    iput-object p3, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$appkey:Ljava/lang/String;

    iput-object p4, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$platform_type_str:Ljava/lang/String;

    iput-object p5, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$sdkVersion:Ljava/lang/String;

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConversionDataLoaded(Ljava/util/Map;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "conversionData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    const-string v0, "click_time"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 83
    .local v9, "click_time":Ljava/lang/String;
    const-string v0, "install_time"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 84
    .local v5, "install_time":Ljava/lang/String;
    const-string v0, "media_source"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 85
    .local v6, "media_source":Ljava/lang/String;
    const-string v0, "click_time"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 86
    .local v8, "click_url":Ljava/lang/String;
    const-string v0, "is_paid"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 91
    .local v10, "is_paid":Ljava/lang/String;
    new-instance v0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;

    iget-object v2, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$context:Landroid/app/Activity;

    iget-object v3, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$appkey:Ljava/lang/String;

    iget-object v4, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$platform_type_str:Ljava/lang/String;

    iget-object v7, p0, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;->val$sdkVersion:Ljava/lang/String;

    move-object v1, p0

    invoke-direct/range {v0 .. v10}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;-><init>(Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-virtual {v0}, Lcom/youaiAnalysis/platforms/AppsFlyerAdapter$1$1;->start()V

    .line 111
    return-void

    .line 73
    .end local v5    # "install_time":Ljava/lang/String;
    .end local v6    # "media_source":Ljava/lang/String;
    .end local v8    # "click_url":Ljava/lang/String;
    .end local v9    # "click_time":Ljava/lang/String;
    .end local v10    # "is_paid":Ljava/lang/String;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 74
    .local v11, "attrName":Ljava/lang/String;
    const-string v2, "AppsFlyerTest"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "attribute: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onConversionFailure(Ljava/lang/String;)V
    .locals 3
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 114
    const-string v0, "AppsFlyerTest"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "error getting conversion data: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    return-void
.end method
