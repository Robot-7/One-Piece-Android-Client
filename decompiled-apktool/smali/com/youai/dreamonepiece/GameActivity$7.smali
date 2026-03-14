.class Lcom/youai/dreamonepiece/GameActivity$7;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->callSystemShare(Lcom/youai/PlatformAndGameInfo$ShareInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;

.field final synthetic val$share:Lcom/youai/PlatformAndGameInfo$ShareInfo;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/PlatformAndGameInfo$ShareInfo;)V
    .locals 0

    .prologue
    .line 456
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$7;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    iput-object p2, p0, Lcom/youai/dreamonepiece/GameActivity$7;->val$share:Lcom/youai/PlatformAndGameInfo$ShareInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/high16 v6, 0x10000000

    .line 467
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 468
    .local v2, "intent1":Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND_MULTIPLE"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 469
    .local v1, "intent":Landroid/content/Intent;
    const-string v3, "image/png"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 470
    const-string v3, "image/png"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 472
    const-string v3, "android.intent.extra.SUBJECT"

    const-string v4, "\u5206\u4eab\u4f1f\u5927\u822a\u8def"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 473
    const-string v3, "android.intent.extra.TEXT"

    iget-object v4, p0, Lcom/youai/dreamonepiece/GameActivity$7;->val$share:Lcom/youai/PlatformAndGameInfo$ShareInfo;

    iget-object v4, v4, Lcom/youai/PlatformAndGameInfo$ShareInfo;->content:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 475
    const-string v3, "android.intent.extra.SUBJECT"

    const-string v4, "\u5206\u4eab\u4f1f\u5927\u822a\u8def"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 476
    const-string v3, "android.intent.extra.TEXT"

    iget-object v4, p0, Lcom/youai/dreamonepiece/GameActivity$7;->val$share:Lcom/youai/PlatformAndGameInfo$ShareInfo;

    iget-object v4, v4, Lcom/youai/PlatformAndGameInfo$ShareInfo;->content:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 478
    const-string v3, "android.intent.extra.STREAM"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "file:///"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameActivity$7;->val$share:Lcom/youai/PlatformAndGameInfo$ShareInfo;

    iget-object v5, v5, Lcom/youai/PlatformAndGameInfo$ShareInfo;->img_path:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 482
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .local v0, "arrayUri":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file:///"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/youai/dreamonepiece/GameActivity$7;->val$share:Lcom/youai/PlatformAndGameInfo$ShareInfo;

    iget-object v4, v4, Lcom/youai/PlatformAndGameInfo$ShareInfo;->img_path:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 485
    const-string v3, "android.intent.extra.STREAM"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 488
    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 489
    invoke-virtual {v2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 509
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "\u5206\u4eab"

    invoke-static {v2, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 512
    const-string v3, "callSystemShare"

    const-string v4, "android.intent.action.SEND"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    return-void
.end method
