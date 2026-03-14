.class Lcom/youai/dreamonepiece/NotificationService$DataReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NotificationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/NotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DataReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/NotificationService;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/NotificationService;)V
    .locals 0

    .prologue
    .line 44
    iput-object p1, p0, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 49
    const-string v4, "clear"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 50
    .local v0, "isClear":Z
    if-eqz v0, :cond_0

    .line 51
    iget-object v4, p0, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v4}, Lcom/youai/dreamonepiece/NotificationService;->access$000(Lcom/youai/dreamonepiece/NotificationService;)Ljava/util/Timer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 52
    iget-object v4, p0, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    new-instance v5, Ljava/util/Timer;

    const-string v6, "Notificationservice"

    invoke-direct {v5, v6}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v5}, Lcom/youai/dreamonepiece/NotificationService;->access$002(Lcom/youai/dreamonepiece/NotificationService;Ljava/util/Timer;)Ljava/util/Timer;

    .line 63
    :goto_0
    return-void

    .line 56
    :cond_0
    const-string v4, "title"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 57
    .local v3, "title":Ljava/lang/String;
    const-string v4, "message"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "msg":Ljava/lang/String;
    const-string v4, "delayminite"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 59
    .local v2, "time":I
    const-string v4, "DataReceiver onReceive:"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object v4, p0, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v4}, Lcom/youai/dreamonepiece/NotificationService;->access$000(Lcom/youai/dreamonepiece/NotificationService;)Ljava/util/Timer;

    move-result-object v4

    new-instance v5, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;

    iget-object v6, p0, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-direct {v5, v6, v1, v3}, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;-><init>(Lcom/youai/dreamonepiece/NotificationService;Ljava/lang/String;Ljava/lang/String;)V

    mul-int/lit8 v6, v2, 0x3c

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    invoke-virtual {v4, v5, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0
.end method
