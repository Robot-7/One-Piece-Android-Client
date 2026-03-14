.class Lcom/youai/sdks/platform/PlatformPipaw$5;
.super Ljava/lang/Object;
.source "PlatformPipaw.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/sdks/platform/PlatformPipaw;->returnpayState(Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/sdks/platform/PlatformPipaw;

.field private final synthetic val$msg:Ljava/lang/String;

.field private final synthetic val$payState:Lcom/youai/sdks/beans/PlatformContacts$PayState;


# direct methods
.method constructor <init>(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youai/sdks/platform/PlatformPipaw$5;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iput-object p2, p0, Lcom/youai/sdks/platform/PlatformPipaw$5;->val$payState:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    iput-object p3, p0, Lcom/youai/sdks/platform/PlatformPipaw$5;->val$msg:Ljava/lang/String;

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 348
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$5;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->sdkInterface:Lcom/youai/sdks/callback/YASdkInterface;

    iget-object v1, p0, Lcom/youai/sdks/platform/PlatformPipaw$5;->val$payState:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    iget-object v2, p0, Lcom/youai/sdks/platform/PlatformPipaw$5;->val$msg:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/youai/sdks/callback/YASdkInterface;->finishPayProcess(Lcom/youai/sdks/beans/PlatformContacts$PayState;Ljava/lang/String;)V

    .line 349
    return-void
.end method
