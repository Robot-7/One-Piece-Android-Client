.class Lcom/testin/agent/b/k;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field a:D


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/testin/agent/b/k;->a:D

    return-void
.end method

.method synthetic constructor <init>(Lcom/testin/agent/b/k;)V
    .locals 0

    invoke-direct {p0}, Lcom/testin/agent/b/k;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    const/4 v2, -0x1

    const-string v0, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "level"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "scale"

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-double v1, v1

    if-lez v0, :cond_0

    const-wide/16 v3, 0x0

    cmpl-double v3, v1, v3

    if-lez v3, :cond_0

    int-to-double v3, v0

    div-double v0, v3, v1

    iput-wide v0, p0, Lcom/testin/agent/b/k;->a:D

    :cond_0
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iget-object v0, v0, Lcom/testin/agent/base/TestinGVariables;->j:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iget-object v0, v0, Lcom/testin/agent/base/TestinGVariables;->j:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iget-object v0, v0, Lcom/testin/agent/base/TestinGVariables;->j:Ljava/util/LinkedList;

    iget-wide v1, p0, Lcom/testin/agent/b/k;->a:D

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-static {}, Lcom/testin/agent/base/TestinGVariables;->c()Lcom/testin/agent/base/TestinGVariables;

    move-result-object v0

    iget-object v0, v0, Lcom/testin/agent/base/TestinGVariables;->j:Ljava/util/LinkedList;

    iget-wide v1, p0, Lcom/testin/agent/b/k;->a:D

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_0
.end method
