.class Lcom/youai/dreamonepiece/NotificationService$NotificationTask;
.super Ljava/util/TimerTask;
.source "NotificationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/NotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NotificationTask"
.end annotation


# instance fields
.field Noticontent:Ljava/lang/String;

.field Notititle:Ljava/lang/String;

.field showTime:J

.field final synthetic this$0:Lcom/youai/dreamonepiece/NotificationService;


# direct methods
.method public constructor <init>(Lcom/youai/dreamonepiece/NotificationService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "pTickrText"    # Ljava/lang/String;
    .param p3, "pNotititle"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 74
    iput-object p3, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->Notititle:Ljava/lang/String;

    .line 75
    iput-object p2, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->Noticontent:Ljava/lang/String;

    .line 77
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    add-long/2addr v7, v9

    iput-wide v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->showTime:J

    .line 83
    new-instance v3, Landroid/app/Notification;

    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-virtual {v7}, Lcom/youai/dreamonepiece/NotificationService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->icon:I

    iget-object v8, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->Notititle:Ljava/lang/String;

    iget-wide v9, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->showTime:J

    invoke-direct {v3, v7, v8, v9, v10}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 85
    .local v3, "notifica":Landroid/app/Notification;
    const/16 v7, 0x10

    iput v7, v3, Landroid/app/Notification;->flags:I

    .line 86
    new-instance v2, Landroid/content/Intent;

    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    const-class v8, Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 88
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v7, 0x14000000

    invoke-virtual {v2, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 90
    const-string v7, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v7, v11, v2, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 101
    .local v1, "contentIntent":Landroid/app/PendingIntent;
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    iget-object v8, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->Notititle:Ljava/lang/String;

    iget-object v9, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->Noticontent:Ljava/lang/String;

    invoke-virtual {v3, v7, v8, v9, v1}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 104
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-static {v7, v8}, Lcom/youai/dreamonepiece/NotificationService;->access$102(Lcom/youai/dreamonepiece/NotificationService;Ljava/util/Date;)Ljava/util/Date;

    .line 105
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v7, v8}, Lcom/youai/dreamonepiece/NotificationService;->access$202(Lcom/youai/dreamonepiece/NotificationService;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 106
    const/4 v4, 0x0

    .line 107
    .local v4, "seq":I
    const v0, 0x1869f

    .line 108
    .local v0, "ROTATION":I
    if-le v4, v0, :cond_0

    .line 109
    const/4 v4, 0x0

    .line 110
    :cond_0
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v7}, Lcom/youai/dreamonepiece/NotificationService;->access$200(Lcom/youai/dreamonepiece/NotificationService;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v8}, Lcom/youai/dreamonepiece/NotificationService;->access$200(Lcom/youai/dreamonepiece/NotificationService;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    invoke-virtual {v7, v11, v8}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 111
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v7}, Lcom/youai/dreamonepiece/NotificationService;->access$100(Lcom/youai/dreamonepiece/NotificationService;)Ljava/util/Date;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/util/Date;->setTime(J)V

    .line 112
    const-string v7, "%1$tY%1$tm%1$td%1$tk%1$tM%1$tS%2$05d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v9}, Lcom/youai/dreamonepiece/NotificationService;->access$100(Lcom/youai/dreamonepiece/NotificationService;)Ljava/util/Date;

    move-result-object v9

    aput-object v9, v8, v11

    const/4 v9, 0x1

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "seq":I
    .local v5, "seq":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 114
    .local v6, "str":Ljava/lang/String;
    iget-object v7, p0, Lcom/youai/dreamonepiece/NotificationService$NotificationTask;->this$0:Lcom/youai/dreamonepiece/NotificationService;

    invoke-static {v7}, Lcom/youai/dreamonepiece/NotificationService;->access$300(Lcom/youai/dreamonepiece/NotificationService;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    long-to-int v8, v8

    invoke-virtual {v7, v8, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 116
    return-void
.end method
