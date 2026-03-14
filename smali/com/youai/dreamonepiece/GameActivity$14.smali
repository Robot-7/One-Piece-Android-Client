.class Lcom/youai/dreamonepiece/GameActivity$14;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->clearSysNotification()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 0

    .prologue
    .line 1193
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$14;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1196
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1197
    .local v0, "myIntent":Landroid/content/Intent;
    const-string v1, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1198
    const-string v1, "clear"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1199
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity$14;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v1, v0}, Lcom/youai/dreamonepiece/GameActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1200
    const-string v1, "GameActivity"

    const-string v2, "clearSysNotification"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1201
    return-void
.end method
