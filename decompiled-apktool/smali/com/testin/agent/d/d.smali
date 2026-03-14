.class public Lcom/testin/agent/d/d;
.super Lcom/testin/agent/d/a;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/testin/agent/d/a;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/testin/agent/d/d;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/testin/agent/d/d;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 3

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v0, "isp"

    iget-object v2, p0, Lcom/testin/agent/d/d;->a:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "nt"

    iget-object v2, p0, Lcom/testin/agent/d/d;->b:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/d/d;->a:Ljava/lang/String;

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/d/d;->b:Ljava/lang/String;

    return-void
.end method
