.class Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;
.super Landroid/os/Handler;
.source "GameAppState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameAppState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameAppStateHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameAppState;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/GameAppState;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/GameAppState;Lcom/youai/dreamonepiece/GameAppState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/GameAppState;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/GameAppState$1;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;-><init>(Lcom/youai/dreamonepiece/GameAppState;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 137
    iget v4, p1, Landroid/os/Message;->what:I

    const/4 v5, 0x7

    if-ne v4, v5, :cond_1

    .line 138
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 140
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->callLogin()V

    .line 193
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0x8

    if-ne v4, v5, :cond_2

    .line 142
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->callLogout()V

    goto :goto_0

    .line 143
    :cond_2
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0x9

    if-ne v4, v5, :cond_3

    .line 144
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 145
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->callAccountManage()V

    goto :goto_0

    .line 146
    :cond_3
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0xa

    if-ne v4, v5, :cond_5

    .line 147
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 149
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;

    .line 151
    .local v0, "obj":Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;
    new-instance v1, Lcom/youai/PlatformAndGameInfo$PayInfo;

    invoke-direct {v1}, Lcom/youai/PlatformAndGameInfo$PayInfo;-><init>()V

    .line 152
    .local v1, "pay_info":Lcom/youai/PlatformAndGameInfo$PayInfo;
    iget-object v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->serial:Ljava/lang/String;

    iput-object v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->order_serial:Ljava/lang/String;

    .line 153
    iget-object v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->productId:Ljava/lang/String;

    iput-object v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_id:Ljava/lang/String;

    .line 154
    iget-object v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->productName:Ljava/lang/String;

    iput-object v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_name:Ljava/lang/String;

    .line 155
    iget v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->price:F

    iput v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->price:F

    .line 156
    iget v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->orignalPrice:F

    iput v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->orignal_price:F

    .line 157
    iget v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->count:I

    iput v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->count:I

    .line 158
    iget-object v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->description:Ljava/lang/String;

    iput-object v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->description:Ljava/lang/String;

    .line 160
    iget-object v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->order_serial:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 161
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->generateNewOrderSerial()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/youai/PlatformAndGameInfo$PayInfo;->order_serial:Ljava/lang/String;

    .line 163
    :cond_4
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4, v1}, Lcom/youai/IPlatformLoginAndPay;->callPayRecharge(Lcom/youai/PlatformAndGameInfo$PayInfo;)I

    goto :goto_0

    .line 164
    .end local v0    # "obj":Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;
    .end local v1    # "pay_info":Lcom/youai/PlatformAndGameInfo$PayInfo;
    :cond_5
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0xb

    if-ne v4, v5, :cond_6

    .line 165
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 166
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->callPlatformFeedback()V

    goto/16 :goto_0

    .line 167
    :cond_6
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0xc

    if-ne v4, v5, :cond_7

    .line 168
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 170
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;

    .line 172
    .local v0, "obj":Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;
    new-instance v2, Lcom/youai/PlatformAndGameInfo$ShareInfo;

    invoke-direct {v2}, Lcom/youai/PlatformAndGameInfo$ShareInfo;-><init>()V

    .line 173
    .local v2, "share_info":Lcom/youai/PlatformAndGameInfo$ShareInfo;
    iget-object v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;->imgPath:Ljava/lang/String;

    iput-object v4, v2, Lcom/youai/PlatformAndGameInfo$ShareInfo;->img_path:Ljava/lang/String;

    .line 174
    iget-object v4, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;->content:Ljava/lang/String;

    iput-object v4, v2, Lcom/youai/PlatformAndGameInfo$ShareInfo;->content:Ljava/lang/String;

    .line 176
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4, v2}, Lcom/youai/IPlatformLoginAndPay;->callPlatformSupportThirdShare(Lcom/youai/PlatformAndGameInfo$ShareInfo;)V

    goto/16 :goto_0

    .line 177
    .end local v0    # "obj":Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;
    .end local v2    # "share_info":Lcom/youai/PlatformAndGameInfo$ShareInfo;
    :cond_7
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0xd

    if-ne v4, v5, :cond_8

    .line 178
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 179
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->callPlatformGameBBS()V

    goto/16 :goto_0

    .line 180
    :cond_8
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0xe

    if-ne v4, v5, :cond_9

    .line 181
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;

    .line 182
    .local v0, "obj":Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    iget-boolean v5, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;->show:Z

    iget v6, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;->progress:I

    iget-object v7, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;->text:Ljava/lang/String;

    invoke-static {v4, v5, v6, v7}, Lcom/youai/dreamonepiece/GameAppState;->access$400(Lcom/youai/dreamonepiece/GameAppState;ZILjava/lang/String;)V

    goto/16 :goto_0

    .line 183
    .end local v0    # "obj":Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;
    :cond_9
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0xf

    if-ne v4, v5, :cond_a

    .line 184
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->onGamePause()V

    goto/16 :goto_0

    .line 185
    :cond_a
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0x10

    if-ne v4, v5, :cond_b

    .line 187
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4}, Lcom/youai/IPlatformLoginAndPay;->onGameResume()V

    goto/16 :goto_0

    .line 188
    :cond_b
    iget v4, p1, Landroid/os/Message;->what:I

    const/16 v5, 0x1e

    if-ne v4, v5, :cond_0

    .line 189
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "ToolBar"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 191
    .local v3, "visible":Z
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateHandler;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v4}, Lcom/youai/dreamonepiece/GameAppState;->access$300(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IPlatformLoginAndPay;

    move-result-object v4

    invoke-interface {v4, v3}, Lcom/youai/IPlatformLoginAndPay;->callToolBar(Z)V

    goto/16 :goto_0
.end method
