.class public Lcom/youai/sdks/beans/PlatformInfo;
.super Ljava/lang/Object;
.source "PlatformInfo.java"


# instance fields
.field public BBSUrl:Ljava/lang/String;

.field public Rid:I

.field public appID:Ljava/lang/String;

.field public appSign:Ljava/lang/String;

.field public appkey:Ljava/lang/String;

.field public appsecret:Ljava/lang/String;

.field public cls:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public companyName:Ljava/lang/String;

.field public cpID:I

.field public enShortName:Ljava/lang/String;

.field public gameID:Ljava/lang/String;

.field public gameName:Ljava/lang/String;

.field public isDebug:Z

.field public loginUrl:Ljava/lang/String;

.field public payUrl:Ljava/lang/String;

.field public payaddr:Ljava/lang/String;

.field public payidstr:Ljava/lang/String;

.field public platform:I

.field public platformName:Ljava/lang/String;

.field public privatestr:Ljava/lang/String;

.field public publicKey:Ljava/lang/String;

.field public publicstr:Ljava/lang/String;

.field public screenOrientation:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

.field public serviceId:I

.field public svrID:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->appkey:Ljava/lang/String;

    .line 8
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->appSign:Ljava/lang/String;

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->gameID:Ljava/lang/String;

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->gameName:Ljava/lang/String;

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->payUrl:Ljava/lang/String;

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->BBSUrl:Ljava/lang/String;

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->appsecret:Ljava/lang/String;

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->payidstr:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->companyName:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->publicstr:Ljava/lang/String;

    .line 21
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->privatestr:Ljava/lang/String;

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->payaddr:Ljava/lang/String;

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->enShortName:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->platformName:Ljava/lang/String;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->loginUrl:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/sdks/beans/PlatformInfo;->publicKey:Ljava/lang/String;

    .line 3
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "platformInfo = [ isDebug "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    iget-boolean v1, p0, Lcom/youai/sdks/beans/PlatformInfo;->isDebug:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 32
    const-string v1, " appkey "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/sdks/beans/PlatformInfo;->appkey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 33
    const-string v1, " appSign "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/sdks/beans/PlatformInfo;->appSign:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 34
    const-string v1, " appID "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/sdks/beans/PlatformInfo;->appID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 35
    const-string v1, " gameName "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/sdks/beans/PlatformInfo;->gameName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 36
    const-string v1, " ]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
