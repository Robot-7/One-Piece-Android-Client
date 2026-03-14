.class public Lcom/youai/dreamonepiece/NotificationService;
.super Landroid/app/Service;
.source "NotificationService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/NotificationService$NotificationTask;,
        Lcom/youai/dreamonepiece/NotificationService$DataReceiver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private buf:Ljava/lang/StringBuilder;

.field private dataReceiver:Lcom/youai/dreamonepiece/NotificationService$DataReceiver;

.field private date:Ljava/util/Date;

.field private notif:Landroid/app/NotificationManager;

.field private timer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/youai/dreamonepiece/NotificationService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/NotificationService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/NotificationService;)Ljava/util/Timer;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->timer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$002(Lcom/youai/dreamonepiece/NotificationService;Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;
    .param p1, "x1"    # Ljava/util/Timer;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/youai/dreamonepiece/NotificationService;->timer:Ljava/util/Timer;

    return-object p1
.end method

.method static synthetic access$100(Lcom/youai/dreamonepiece/NotificationService;)Ljava/util/Date;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->date:Ljava/util/Date;

    return-object v0
.end method

.method static synthetic access$102(Lcom/youai/dreamonepiece/NotificationService;Ljava/util/Date;)Ljava/util/Date;
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;
    .param p1, "x1"    # Ljava/util/Date;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/youai/dreamonepiece/NotificationService;->date:Ljava/util/Date;

    return-object p1
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/NotificationService;)Ljava/lang/StringBuilder;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->buf:Ljava/lang/StringBuilder;

    return-object v0
.end method

.method static synthetic access$202(Lcom/youai/dreamonepiece/NotificationService;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;
    .param p1, "x1"    # Ljava/lang/StringBuilder;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/youai/dreamonepiece/NotificationService;->buf:Ljava/lang/StringBuilder;

    return-object p1
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/NotificationService;)Landroid/app/NotificationManager;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/NotificationService;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->notif:Landroid/app/NotificationManager;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 131
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 35
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 36
    new-instance v1, Ljava/util/Timer;

    const-string v2, "Notificationservice"

    invoke-direct {v1, v2}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/youai/dreamonepiece/NotificationService;->timer:Ljava/util/Timer;

    .line 37
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/youai/dreamonepiece/NotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    iput-object v1, p0, Lcom/youai/dreamonepiece/NotificationService;->notif:Landroid/app/NotificationManager;

    .line 38
    new-instance v1, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/NotificationService$DataReceiver;-><init>(Lcom/youai/dreamonepiece/NotificationService;)V

    iput-object v1, p0, Lcom/youai/dreamonepiece/NotificationService;->dataReceiver:Lcom/youai/dreamonepiece/NotificationService$DataReceiver;

    .line 39
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 40
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 41
    iget-object v1, p0, Lcom/youai/dreamonepiece/NotificationService;->dataReceiver:Lcom/youai/dreamonepiece/NotificationService$DataReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/youai/dreamonepiece/NotificationService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 42
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 121
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 123
    sget-object v0, Lcom/youai/dreamonepiece/NotificationService;->TAG:Ljava/lang/String;

    const-string v1, "Service destroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 126
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->timer:Ljava/util/Timer;

    .line 127
    iget-object v0, p0, Lcom/youai/dreamonepiece/NotificationService;->dataReceiver:Lcom/youai/dreamonepiece/NotificationService$DataReceiver;

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/NotificationService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 128
    return-void
.end method
