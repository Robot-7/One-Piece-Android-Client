.class public Lcom/youai/dreamonepiece/YouaiConfig;
.super Ljava/lang/Object;
.source "YouaiConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/YouaiConfig$ShowMsgActivity;,
        Lcom/youai/dreamonepiece/YouaiConfig$THIRD_PLATFORM;
    }
.end annotation


# static fields
.field public static UrlFeedBack:Ljava/lang/String;

.field public static WX_APP_ID:Ljava/lang/String;

.field public static encryptData:Z

.field public static error_net:Ljava/lang/String;

.field public static getPlayerList:Ljava/lang/String;

.field public static md5key:Ljava/lang/String;

.field public static pushforclient:Ljava/lang/String;

.field public static timestamp:J

.field public static urlroot:Ljava/lang/String;

.field public static urlrootDebug:Ljava/lang/String;

.field public static urlrootRelease:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 5
    const-string v0, "http://pc.com4loves.com:6520/"

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    .line 9
    const-string v0, "http://223.203.216.6:8261/"

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->urlrootDebug:Ljava/lang/String;

    .line 10
    const-string v0, "http://pc.com4loves.com:6520/"

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->urlrootRelease:Ljava/lang/String;

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "gameplayer/getplayerlist"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->getPlayerList:Ljava/lang/String;

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "gameplayer/pushforclient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->pushforclient:Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "feedback/querydetailbygameinfo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->UrlFeedBack:Ljava/lang/String;

    .line 17
    const-string v0, "-com4loves"

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->md5key:Ljava/lang/String;

    .line 19
    const/4 v0, 0x1

    sput-boolean v0, Lcom/youai/dreamonepiece/YouaiConfig;->encryptData:Z

    .line 27
    const-string v0, "\u7f51\u7edc\u9519\u8bef"

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->error_net:Ljava/lang/String;

    .line 42
    const-string v0, ""

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->WX_APP_ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static reCreate()V
    .locals 2

    .prologue
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "gameplayer/getplayerlist"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->getPlayerList:Ljava/lang/String;

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "gameplayer/pushforclient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->pushforclient:Ljava/lang/String;

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "feedback/querydetailbygameinfo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/YouaiConfig;->UrlFeedBack:Ljava/lang/String;

    .line 25
    return-void
.end method
