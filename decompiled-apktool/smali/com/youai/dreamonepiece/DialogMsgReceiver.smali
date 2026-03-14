.class public Lcom/youai/dreamonepiece/DialogMsgReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DialogMsgReceiver.java"


# static fields
.field public static showDialogMsg:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-string v0, "showDialogMsg"

    sput-object v0, Lcom/youai/dreamonepiece/DialogMsgReceiver;->showDialogMsg:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 13
    const-string v2, "pTitle"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 14
    .local v1, "pTitle":Ljava/lang/String;
    const-string v2, "pMessage"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 15
    .local v0, "pMessage":Ljava/lang/String;
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->clearParamsMap()V

    .line 16
    const-string v2, "pTitle"

    invoke-static {v2, v1}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->addParamsMapOnePair(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    const-string v2, "pMessage"

    invoke-static {v2, v0}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->addParamsMapOnePair(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    sget-object v2, Lcom/youai/dreamonepiece/DialogMsgReceiver;->showDialogMsg:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->analyticsLogMapParamsEvent(Ljava/lang/String;Z)V

    .line 19
    return-void
.end method
