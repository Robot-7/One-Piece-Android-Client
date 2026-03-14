.class Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;
.super Ljava/lang/Object;
.source "PlatformSDKLoginAndPay.java"

# interfaces
.implements Lcom/youai/sdks/callback/YASdkInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)V
    .locals 0

    .prologue
    .line 91
    iput-object p1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public finishLoginProcess(Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V
    .locals 5
    .param p1, "code"    # Lcom/youai/sdks/beans/PlatformContacts$LoginState;
    .param p2, "dis"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 149
    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Success:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    if-ne p1, v1, :cond_1

    .line 150
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v1

    invoke-virtual {v1}, Lcom/youai/sdks/PlatformSdk;->getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;

    move-result-object v0

    .line 152
    .local v0, "logininfo":Lcom/youai/sdks/beans/LoginInfo;
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    new-instance v2, Lcom/youai/PlatformAndGameInfo$LoginInfo;

    invoke-direct {v2}, Lcom/youai/PlatformAndGameInfo$LoginInfo;-><init>()V

    invoke-static {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$002(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Lcom/youai/PlatformAndGameInfo$LoginInfo;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 153
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iget-object v2, v0, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid_str:Ljava/lang/String;

    .line 154
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iget-object v2, v0, Lcom/youai/sdks/beans/LoginInfo;->uName:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_nick_name:Ljava/lang/String;

    .line 155
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iget-object v2, v0, Lcom/youai/sdks/beans/LoginInfo;->sessionId:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_session:Ljava/lang/String;

    .line 156
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iput v3, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    .line 157
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1, v4}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$102(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Z)Z

    .line 158
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->notifyLoginResult(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V

    .line 168
    .end local v0    # "logininfo":Lcom/youai/sdks/beans/LoginInfo;
    :goto_0
    if-eqz p2, :cond_0

    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 169
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$300(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, p2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 171
    :cond_0
    return-void

    .line 160
    :cond_1
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    new-instance v2, Lcom/youai/PlatformAndGameInfo$LoginInfo;

    invoke-direct {v2}, Lcom/youai/PlatformAndGameInfo$LoginInfo;-><init>()V

    invoke-static {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$002(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Lcom/youai/PlatformAndGameInfo$LoginInfo;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 161
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    const-string v2, ""

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid_str:Ljava/lang/String;

    .line 162
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    const-string v2, ""

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_nick_name:Ljava/lang/String;

    .line 163
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    const-string v2, ""

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_session:Ljava/lang/String;

    .line 164
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iput v4, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    .line 165
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1, v3}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$102(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Z)Z

    .line 166
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->notifyLoginResult(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V

    goto :goto_0
.end method

.method public finishLogoutProcess(Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V
    .locals 3
    .param p1, "code"    # Lcom/youai/sdks/beans/PlatformContacts$LoginState;
    .param p2, "dis"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 191
    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Not:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    if-ne p1, v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$102(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Z)Z

    .line 193
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    .line 195
    :cond_0
    if-eqz p2, :cond_1

    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$300(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 198
    :cond_1
    return-void
.end method

.method public finishPayProcess(Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V
    .locals 3
    .param p1, "code"    # Lcom/youai/sdks/beans/PlatformContacts$PayState;
    .param p2, "dis"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 127
    if-eqz p2, :cond_1

    .line 128
    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Success:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    if-ne p1, v0, :cond_2

    .line 129
    invoke-static {}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getInstance()Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    move-result-object v0

    new-instance v1, Lcom/youai/PlatformAndGameInfo$PayInfo;

    invoke-direct {v1}, Lcom/youai/PlatformAndGameInfo$PayInfo;-><init>()V

    invoke-static {v0, v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$202(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Lcom/youai/PlatformAndGameInfo$PayInfo;)Lcom/youai/PlatformAndGameInfo$PayInfo;

    .line 130
    invoke-static {}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getInstance()Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    move-result-object v0

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$200(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$PayInfo;

    move-result-object v0

    iput v2, v0, Lcom/youai/PlatformAndGameInfo$PayInfo;->result:I

    .line 131
    invoke-static {}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getInstance()Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    move-result-object v0

    invoke-static {}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->getInstance()Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    move-result-object v1

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$200(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$PayInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->notifyPayRechargeRequestResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V

    .line 141
    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$300(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 145
    :cond_1
    return-void

    .line 135
    :cond_2
    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Failure:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Asyn_Sms_Sent:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Cancel:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Request_Submitted:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    if-ne p1, v0, :cond_0

    goto :goto_0
.end method

.method public onExitComplete()V
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$300(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 186
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 187
    return-void
.end method

.method public onInitComplete(I)V
    .locals 3
    .param p1, "arg0"    # I

    .prologue
    .line 175
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$400(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;->notifyInitPlatformSDKComplete()V

    .line 181
    :goto_0
    return-void

    .line 178
    :cond_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v0}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$500(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/IGameActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    const-string v1, "\u5e73\u53f0\u521d\u59cb\u5316\u5931\u8d25\uff01"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public onPauseComplete()V
    .locals 0

    .prologue
    .line 118
    return-void
.end method

.method public onPlatformBackground()V
    .locals 0

    .prologue
    .line 123
    return-void
.end method

.method public onSwitchAccount(Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;)V
    .locals 3
    .param p1, "code"    # Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;

    .prologue
    .line 95
    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;->USER_SWITCH_ACCOUNT:Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;

    if-ne p1, v1, :cond_1

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 97
    :cond_1
    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;->USER_SWITCH_ACCOUNT_RESTART:Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;

    if-ne p1, v1, :cond_2

    .line 98
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->requestRestart()V

    goto :goto_0

    .line 100
    :cond_2
    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;->USER_SWITCH_ACCOUNT_CANCEL:Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;

    if-eq p1, v1, :cond_0

    .line 102
    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;->USER_SWITCH_ACCOUNT_SUCCESS:Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;

    if-ne p1, v1, :cond_0

    .line 103
    invoke-static {}, Lcom/youai/sdks/PlatformSdk;->getInstance()Lcom/youai/sdks/PlatformSdk;

    move-result-object v1

    invoke-virtual {v1}, Lcom/youai/sdks/PlatformSdk;->getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;

    move-result-object v0

    .line 105
    .local v0, "logininfo":Lcom/youai/sdks/beans/LoginInfo;
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    new-instance v2, Lcom/youai/PlatformAndGameInfo$LoginInfo;

    invoke-direct {v2}, Lcom/youai/PlatformAndGameInfo$LoginInfo;-><init>()V

    invoke-static {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$002(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Lcom/youai/PlatformAndGameInfo$LoginInfo;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .line 106
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iget-object v2, v0, Lcom/youai/sdks/beans/LoginInfo;->uId:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid_str:Ljava/lang/String;

    .line 107
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iget-object v2, v0, Lcom/youai/sdks/beans/LoginInfo;->uName:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_nick_name:Ljava/lang/String;

    .line 108
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    iget-object v2, v0, Lcom/youai/sdks/beans/LoginInfo;->sessionId:Ljava/lang/String;

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_session:Ljava/lang/String;

    .line 109
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v1}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v1

    const/4 v2, 0x0

    iput v2, v1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    .line 110
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$102(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;Z)Z

    .line 111
    iget-object v1, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    iget-object v2, p0, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay$1;->this$0:Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;

    invoke-static {v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->access$000(Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;)Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/platform/PlatformSDKLoginAndPay;->notifyLoginResult(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V

    goto :goto_0
.end method

.method public onTryUserToOK()V
    .locals 0

    .prologue
    .line 201
    return-void
.end method
