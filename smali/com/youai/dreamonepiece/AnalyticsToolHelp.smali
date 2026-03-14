.class public Lcom/youai/dreamonepiece/AnalyticsToolHelp;
.super Ljava/lang/Object;
.source "AnalyticsToolHelp.java"


# static fields
.field private static final AppId_Tencent:Ljava/lang/String; = "A1HGLES644LU"

.field private static activityCtx:Landroid/content/Context; = null

.field private static appId:Ljava/lang/String; = null

.field private static bpair:Z = false

.field private static final isDebugTencent:Z = false

.field private static final isStatisticsOpen:Z = true

.field private static paramsMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static userId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    sput-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    .line 26
    sput-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    .line 28
    sput-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    .line 30
    const/4 v0, 0x0

    sput-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->paramsMap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addParamsMapOnePair(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 159
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    return-void
.end method

.method public static analyticsLogEndTimeEvent(Ljava/lang/String;)V
    .locals 1
    .param p0, "event"    # Ljava/lang/String;

    .prologue
    .line 189
    sget-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    if-nez v0, :cond_1

    .line 201
    :cond_0
    :goto_0
    return-void

    .line 191
    :cond_1
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 193
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->endTimedEvent(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static analyticsLogEvent(Ljava/lang/String;)V
    .locals 3
    .param p0, "event"    # Ljava/lang/String;

    .prologue
    .line 132
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v0, p0, v1}, Lcom/tencent/stat/StatService;->trackCustomEvent(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V

    .line 133
    sget-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    if-nez v0, :cond_1

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 135
    :cond_1
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static analyticsLogMapParamsEvent(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "timed"    # Z

    .prologue
    .line 166
    sget-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    if-nez v0, :cond_1

    .line 183
    :cond_0
    :goto_0
    return-void

    .line 169
    :cond_1
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->paramsMap:Ljava/util/HashMap;

    const-string v1, "userId"

    sget-object v2, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 173
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->paramsMap:Ljava/util/HashMap;

    invoke-static {p0, v0, p1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;Z)V

    goto :goto_0
.end method

.method public static clearParamsMap()V
    .locals 1

    .prologue
    .line 152
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 153
    return-void
.end method

.method public static initAnalytics(Ljava/lang/String;)V
    .locals 1
    .param p0, "appid"    # Ljava/lang/String;

    .prologue
    .line 115
    const-string v0, "TK2K9PJM8XDGXWD9BPM5"

    sput-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    .line 116
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onStart()V

    .line 117
    return-void
.end method

.method public static initAnalyticsUserID(Ljava/lang/String;)V
    .locals 0
    .param p0, "userid"    # Ljava/lang/String;

    .prologue
    .line 123
    sput-object p0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->userId:Ljava/lang/String;

    .line 125
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->setUserId(Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public static onCreate(Landroid/content/Context;Lcom/youai/PlatformAndGameInfo$GameInfo;)V
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "gameInfo"    # Lcom/youai/PlatformAndGameInfo$GameInfo;

    .prologue
    const/4 v6, 0x1

    .line 38
    sput-object p0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    .line 40
    invoke-static {v6}, Lcom/flurry/android/FlurryAgent;->setCaptureUncaughtExceptions(Z)V

    .line 42
    const/4 v0, 0x0

    .line 44
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 49
    :goto_0
    const-string v1, ""

    .line 50
    .local v1, "channelName":Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_0

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "youai_channel"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_0

    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v5, "youai_channel"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 59
    :goto_1
    const-string v3, "A1HGLES644LU"

    invoke-static {v3}, Lcom/tencent/stat/StatConfig;->setAppKey(Ljava/lang/String;)V

    .line 60
    invoke-static {v1}, Lcom/tencent/stat/StatConfig;->setInstallChannel(Ljava/lang/String;)V

    .line 66
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/tencent/stat/StatConfig;->setDebugEnable(Z)V

    .line 68
    invoke-static {v6}, Lcom/tencent/stat/StatConfig;->setAutoExceptionCaught(Z)V

    .line 69
    sget-object v3, Lcom/tencent/stat/StatReportStrategy;->APP_LAUNCH:Lcom/tencent/stat/StatReportStrategy;

    invoke-static {v3}, Lcom/tencent/stat/StatConfig;->setStatSendStrategy(Lcom/tencent/stat/StatReportStrategy;)V

    .line 77
    return-void

    .line 46
    .end local v1    # "channelName":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 47
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 55
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v1    # "channelName":Ljava/lang/String;
    :cond_0
    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    goto :goto_1
.end method

.method public static onPause()V
    .locals 1

    .prologue
    .line 97
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/stat/StatService;->onPause(Landroid/content/Context;)V

    .line 98
    return-void
.end method

.method public static onResume()V
    .locals 1

    .prologue
    .line 92
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/stat/StatService;->onResume(Landroid/content/Context;)V

    .line 93
    return-void
.end method

.method public static onStart()V
    .locals 2

    .prologue
    .line 80
    sget-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    if-eqz v0, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    const/4 v0, 0x1

    sput-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    .line 84
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    sget-object v1, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static onStop()V
    .locals 1

    .prologue
    .line 101
    sget-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    if-nez v0, :cond_1

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 103
    :cond_1
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->appId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    const/4 v0, 0x0

    sput-boolean v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->bpair:Z

    .line 105
    sget-object v0, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->activityCtx:Landroid/content/Context;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->onEndSession(Landroid/content/Context;)V

    goto :goto_0
.end method
