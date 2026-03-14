.class Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;
.super Landroid/os/Handler;
.source "GameLogoState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameLogoState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameLogoStateHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameLogoState;


# direct methods
.method public constructor <init>(Lcom/youai/dreamonepiece/GameLogoState;)V
    .locals 1

    .prologue
    .line 1230
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    .line 1231
    invoke-static {p1}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1232
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1235
    iget v5, p1, Landroid/os/Message;->what:I

    if-nez v5, :cond_4

    .line 1236
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    .line 1237
    .local v2, "obj":Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
    iget v5, v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->progress:I

    const/16 v6, 0x64

    if-ge v5, v6, :cond_2

    .line 1238
    sget-object v5, Lcom/youai/dreamonepiece/GameLogoState;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "uncompressing resources to external storage "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->text:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1241
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$700(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/ProgressBar;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1242
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$700(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/ProgressBar;

    move-result-object v5

    iget v6, v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->progress:I

    invoke-virtual {v5, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1243
    iget v5, v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->progress:I

    const/16 v6, 0x5c

    if-ge v5, v6, :cond_1

    .line 1244
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v6}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v6

    invoke-interface {v6}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0a0008

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->text:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1247
    .local v4, "str":Ljava/lang/String;
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$800(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1306
    .end local v2    # "obj":Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
    .end local v4    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 1249
    .restart local v2    # "obj":Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
    :cond_1
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$800(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/TextView;

    move-result-object v5

    iget-object v6, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v6}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v6

    invoke-interface {v6}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0a0009

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1255
    :cond_2
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v5

    invoke-interface {v5}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v5

    const-string v6, "ResourcesInfo"

    invoke-virtual {v5, v6, v9}, Lcom/youai/dreamonepiece/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 1258
    .local v3, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1259
    .local v1, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v5, "UnzipedAssets"

    invoke-interface {v1, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1260
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1262
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5, v8}, Lcom/youai/dreamonepiece/GameLogoState;->access$102(Lcom/youai/dreamonepiece/GameLogoState;Z)Z

    .line 1264
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$900(Lcom/youai/dreamonepiece/GameLogoState;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1265
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$1000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IStateManager;

    move-result-object v5

    invoke-interface {v5, v7}, Lcom/youai/IStateManager;->changeState(I)V

    goto :goto_0

    .line 1279
    :cond_3
    new-instance v0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v5

    invoke-interface {v5}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0a0004

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v6}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v6

    invoke-interface {v6}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/youai/dreamonepiece/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0a0005

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v5, v6, v8}, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1289
    .local v0, "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5, v0}, Lcom/youai/dreamonepiece/GameLogoState;->access$1100(Lcom/youai/dreamonepiece/GameLogoState;Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V

    goto/16 :goto_0

    .line 1292
    .end local v0    # "dlgmsg":Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
    .end local v1    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "obj":Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
    .end local v3    # "sp":Landroid/content/SharedPreferences;
    :cond_4
    iget v5, p1, Landroid/os/Message;->what:I

    if-eq v5, v8, :cond_0

    .line 1294
    iget v5, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_5

    .line 1295
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$1000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IStateManager;

    move-result-object v5

    invoke-interface {v5, v7}, Lcom/youai/IStateManager;->changeState(I)V

    goto/16 :goto_0

    .line 1296
    :cond_5
    iget v5, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x4

    if-ne v5, v6, :cond_6

    .line 1297
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$800(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/TextView;

    move-result-object v5

    const-string v6, "\u89e3\u538b\u8d44\u6e90\uff0c\u4e0d\u9700\u6d41\u91cf\uff0c\u8bf7\u7a0d\u540e"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1299
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$1200(Lcom/youai/dreamonepiece/GameLogoState;)V

    goto/16 :goto_0

    .line 1300
    :cond_6
    iget v5, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x5

    if-ne v5, v6, :cond_7

    .line 1301
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;

    .line 1302
    .restart local v2    # "obj":Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$800(Lcom/youai/dreamonepiece/GameLogoState;)Landroid/widget/TextView;

    move-result-object v5

    iget-object v6, v2, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->text:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 1303
    .end local v2    # "obj":Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
    :cond_7
    iget v5, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x7

    if-ne v5, v6, :cond_0

    .line 1304
    iget-object v5, p0, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v5}, Lcom/youai/dreamonepiece/GameLogoState;->access$1300(Lcom/youai/dreamonepiece/GameLogoState;)V

    goto/16 :goto_0
.end method
