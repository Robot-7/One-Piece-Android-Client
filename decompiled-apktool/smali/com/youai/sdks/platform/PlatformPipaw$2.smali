.class Lcom/youai/sdks/platform/PlatformPipaw$2;
.super Ljava/lang/Object;
.source "PlatformPipaw.java"

# interfaces
.implements Lcom/pipaw/pipawpay/PipawPayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/sdks/platform/PlatformPipaw;->callPayRecharge(Landroid/app/Activity;Lcom/youai/sdks/beans/PayInfo;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/sdks/platform/PlatformPipaw;


# direct methods
.method constructor <init>(Lcom/youai/sdks/platform/PlatformPipaw;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youai/sdks/platform/PlatformPipaw$2;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callback(ILjava/lang/String;)V
    .locals 4
    .param p1, "resultCode"    # I
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 214
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_1

    .line 218
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$2;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Cancel:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v2, "\u53d6\u6d88\u652f\u4ed8"

    invoke-static {v0, v1, v2}, Lcom/youai/sdks/platform/PlatformPipaw;->access$2(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 219
    :cond_1
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_2

    .line 223
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$2;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->pay_info:Lcom/youai/sdks/beans/PayInfo;

    const/4 v1, 0x0

    iput v1, v0, Lcom/youai/sdks/beans/PayInfo;->result:I

    .line 224
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$2;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Success:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v2, "\u652f\u4ed8\u6210\u529f"

    invoke-static {v0, v1, v2}, Lcom/youai/sdks/platform/PlatformPipaw;->access$2(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    goto :goto_0

    .line 225
    :cond_2
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_3

    .line 229
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$2;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Failure:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u652f\u4ed8\u5931\u8d25:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/youai/sdks/platform/PlatformPipaw;->access$2(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    goto :goto_0

    .line 230
    :cond_3
    const/16 v0, 0x3eb

    if-ne p1, v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$2;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Failure:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u9a8c\u7b7e\u5931\u8d25:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/youai/sdks/platform/PlatformPipaw;->access$2(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    goto :goto_0
.end method
