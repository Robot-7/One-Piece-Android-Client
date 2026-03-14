.class Lcom/youai/sdks/platform/PlatformPipaw$4;
.super Ljava/lang/Object;
.source "PlatformPipaw.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/sdks/platform/PlatformPipaw;->returnLoginState(Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/sdks/platform/PlatformPipaw;

.field private final synthetic val$loginState:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field private final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/youai/sdks/platform/PlatformPipaw;Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youai/sdks/platform/PlatformPipaw$4;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iput-object p2, p0, Lcom/youai/sdks/platform/PlatformPipaw$4;->val$loginState:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    iput-object p3, p0, Lcom/youai/sdks/platform/PlatformPipaw$4;->val$msg:Ljava/lang/String;

    .line 334
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 338
    iget-object v0, p0, Lcom/youai/sdks/platform/PlatformPipaw$4;->this$0:Lcom/youai/sdks/platform/PlatformPipaw;

    iget-object v0, v0, Lcom/youai/sdks/platform/PlatformPipaw;->sdkInterface:Lcom/youai/sdks/callback/YASdkInterface;

    iget-object v1, p0, Lcom/youai/sdks/platform/PlatformPipaw$4;->val$loginState:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    iget-object v2, p0, Lcom/youai/sdks/platform/PlatformPipaw$4;->val$msg:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/youai/sdks/callback/YASdkInterface;->finishLoginProcess(Lcom/youai/sdks/beans/PlatformContacts$LoginState;Ljava/lang/String;)V

    .line 339
    return-void
.end method
