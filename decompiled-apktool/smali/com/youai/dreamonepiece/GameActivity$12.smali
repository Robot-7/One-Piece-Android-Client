.class Lcom/youai/dreamonepiece/GameActivity$12;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->pushSysNotification(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;

.field final synthetic val$msg:Ljava/lang/String;

.field final synthetic val$pInstantMinite:I

.field final synthetic val$strTitle:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1125
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$12;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    iput-object p2, p0, Lcom/youai/dreamonepiece/GameActivity$12;->val$msg:Ljava/lang/String;

    iput-object p3, p0, Lcom/youai/dreamonepiece/GameActivity$12;->val$strTitle:Ljava/lang/String;

    iput p4, p0, Lcom/youai/dreamonepiece/GameActivity$12;->val$pInstantMinite:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1128
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1129
    .local v0, "myIntent":Landroid/content/Intent;
    const-string v1, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1130
    const-string v1, "message"

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity$12;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1131
    const-string v1, "title"

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity$12;->val$strTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1132
    const-string v1, "delayminite"

    iget v2, p0, Lcom/youai/dreamonepiece/GameActivity$12;->val$pInstantMinite:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1133
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity$12;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v1, v0}, Lcom/youai/dreamonepiece/GameActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1134
    const-string v1, "GameActivity"

    const-string v2, "pushSysNotification"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1135
    return-void
.end method
