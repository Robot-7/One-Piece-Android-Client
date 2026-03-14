.class public Lcom/youai/dreamonepiece/DownloadApk;
.super Ljava/lang/Object;
.source "DownloadApk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;,
        Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;,
        Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;
    }
.end annotation


# static fields
.field static final DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

.field static DOWNLOAD_FILE_NAME:Ljava/lang/String; = null

.field private static final DOWNLOAD_FOLDER_NAME:Ljava/lang/String; = "Download"

.field public static final KB_2_BYTE:I = 0x400

.field public static final MB_2_BYTE:I = 0x100000

.field private static final RESPONSE:I = 0x2710


# instance fields
.field private DownloadPathFile:Ljava/io/File;

.field private channel:Ljava/lang/String;

.field private completeReceiver:Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;

.field private context:Lcom/youai/dreamonepiece/GameActivity;

.field private downloadId:J

.field private downloadManager:Landroid/app/DownloadManager;

.field private downloadManagerPro:Lcom/youai/dreamonepiece/DownloadManagerPro;

.field private downloadObserver:Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;

.field private handler:Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

.field private mIsExistDialog:Landroid/app/ProgressDialog;

.field private mOriginalUrl:Ljava/lang/String;

.field mResponseHandler:Landroid/os/Handler;

.field private mUrlChannel:Ljava/lang/String;

.field private mpDialog:Landroid/app/ProgressDialog;

.field private useChannelUrl:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.##"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/youai/dreamonepiece/DownloadApk;->DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    .line 55
    const-string v0, "DreamOnePiece.apk"

    sput-object v0, Lcom/youai/dreamonepiece/DownloadApk;->DOWNLOAD_FILE_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;)V
    .locals 13
    .param p1, "mActivity"    # Lcom/youai/dreamonepiece/GameActivity;
    .param p2, "pUrl"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadId:J

    .line 58
    const-string v10, ""

    iput-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mUrlChannel:Ljava/lang/String;

    .line 59
    const/4 v10, 0x0

    iput v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->useChannelUrl:I

    .line 65
    new-instance v10, Lcom/youai/dreamonepiece/DownloadApk$1;

    invoke-direct {v10, p0}, Lcom/youai/dreamonepiece/DownloadApk$1;-><init>(Lcom/youai/dreamonepiece/DownloadApk;)V

    iput-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mResponseHandler:Landroid/os/Handler;

    .line 90
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    .line 91
    const/4 v10, 0x0

    const-string v11, ".apk"

    invoke-virtual {p2, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {p2, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 92
    .local v2, "_url":Ljava/lang/String;
    iput-object p2, p0, Lcom/youai/dreamonepiece/DownloadApk;->mOriginalUrl:Ljava/lang/String;

    .line 93
    const/4 v3, 0x0

    .line 95
    .local v3, "appInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/DownloadApk;->preCreate()V

    .line 97
    const-string v6, ""

    .line 99
    .local v6, "content":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/youai/dreamonepiece/GameActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 101
    .local v4, "assetMgr":Landroid/content/res/AssetManager;
    :try_start_0
    const-string v10, "channel.properties"

    invoke-virtual {v4, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    .line 102
    .local v8, "is":Ljava/io/InputStream;
    if-eqz v8, :cond_0

    .line 103
    invoke-virtual {v8}, Ljava/io/InputStream;->available()I

    move-result v9

    .line 104
    .local v9, "lenght":I
    new-array v5, v9, [B

    .line 105
    .local v5, "buffer":[B
    invoke-virtual {v8, v5}, Ljava/io/InputStream;->read([B)I

    .line 106
    const-string v10, "UTF-8"

    invoke-static {v5, v10}, Lorg/apache/http/util/EncodingUtils;->getString([BLjava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 113
    .end local v5    # "buffer":[B
    .end local v8    # "is":Ljava/io/InputStream;
    .end local v9    # "lenght":I
    :cond_0
    :goto_0
    const-string v10, ""

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1

    if-eqz v6, :cond_1

    .line 114
    iput-object v6, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    .line 115
    const-string v10, "channel"

    iget-object v11, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    invoke-virtual {p0, v10, v2}, Lcom/youai/dreamonepiece/DownloadApk;->Onchannel(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    :goto_1
    return-void

    .line 109
    :catch_0
    move-exception v7

    .line 110
    .local v7, "e1":Ljava/io/IOException;
    const-string v10, "PROJECT_PROPERTIES"

    const-string v11, "project.properties is null"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 121
    .end local v7    # "e1":Ljava/io/IOException;
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/youai/dreamonepiece/GameActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {p1}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x80

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 127
    :goto_2
    if-eqz v3, :cond_3

    iget-object v10, v3, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v10, :cond_3

    .line 128
    iget-object v10, v3, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v11, "YOUAI_PACKAGE"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 129
    .local v0, "_id":I
    if-eqz v0, :cond_2

    .line 130
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    .line 136
    :goto_3
    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    if-eqz v10, :cond_3

    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    const-string v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 138
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".apk"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mUrlChannel:Ljava/lang/String;

    .line 139
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "OnePiece_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v11}, Lcom/youai/dreamonepiece/GameActivity;->getPlatformId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".apk"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    sput-object v10, Lcom/youai/dreamonepiece/DownloadApk;->DOWNLOAD_FILE_NAME:Ljava/lang/String;

    .line 141
    const/4 v10, 0x1

    iput v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->useChannelUrl:I

    .line 143
    new-instance v10, Landroid/app/ProgressDialog;

    iget-object v11, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {v10, v11}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mIsExistDialog:Landroid/app/ProgressDialog;

    .line 144
    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mIsExistDialog:Landroid/app/ProgressDialog;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 145
    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mIsExistDialog:Landroid/app/ProgressDialog;

    const-string v11, "\u8bf7\u7a0d\u5019....."

    invoke-virtual {v10, v11}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 146
    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mIsExistDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v10}, Landroid/app/ProgressDialog;->show()V

    .line 147
    new-instance v10, Lcom/youai/dreamonepiece/DownloadApk$2;

    invoke-direct {v10, p0}, Lcom/youai/dreamonepiece/DownloadApk$2;-><init>(Lcom/youai/dreamonepiece/DownloadApk;)V

    invoke-virtual {v10}, Lcom/youai/dreamonepiece/DownloadApk$2;->start()V

    goto/16 :goto_1

    .line 132
    :cond_2
    iget-object v10, v3, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v11, "YOUAI_PACKAGE"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "_str":Ljava/lang/String;
    iput-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    goto/16 :goto_3

    .line 179
    .end local v0    # "_id":I
    .end local v1    # "_str":Ljava/lang/String;
    :cond_3
    const/4 v10, 0x0

    iput v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->useChannelUrl:I

    .line 180
    iget-object v10, p0, Lcom/youai/dreamonepiece/DownloadApk;->mOriginalUrl:Ljava/lang/String;

    invoke-virtual {p0, v10}, Lcom/youai/dreamonepiece/DownloadApk;->onCreate(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 123
    :catch_1
    move-exception v10

    goto/16 :goto_2
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mIsExistDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$100(Lcom/youai/dreamonepiece/DownloadApk;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mUrlChannel:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/DownloadApk;)I
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->useChannelUrl:I

    return v0
.end method

.method static synthetic access$202(Lcom/youai/dreamonepiece/DownloadApk;I)I
    .locals 0
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;
    .param p1, "x1"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/youai/dreamonepiece/DownloadApk;->useChannelUrl:I

    return p1
.end method

.method static synthetic access$300(Lcom/youai/dreamonepiece/DownloadApk;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mOriginalUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/GameActivity;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->handler:Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/youai/dreamonepiece/DownloadApk;)J
    .locals 2
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-wide v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadId:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$800(Lcom/youai/dreamonepiece/DownloadApk;)Lcom/youai/dreamonepiece/DownloadManagerPro;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManagerPro:Lcom/youai/dreamonepiece/DownloadManagerPro;

    return-object v0
.end method

.method static synthetic access$900(Lcom/youai/dreamonepiece/DownloadApk;)Landroid/app/DownloadManager;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/DownloadApk;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManager:Landroid/app/DownloadManager;

    return-object v0
.end method

.method public static getAppSize(J)Ljava/lang/CharSequence;
    .locals 6
    .param p0, "size"    # J

    .prologue
    const/16 v2, 0x10

    .line 293
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    .line 294
    const-string v0, "0M"

    .line 306
    :goto_0
    return-object v0

    .line 297
    :cond_0
    const-wide/32 v0, 0x100000

    cmp-long v0, p0, v0

    if-ltz v0, :cond_1

    .line 298
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    sget-object v1, Lcom/youai/dreamonepiece/DownloadApk;->DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    long-to-double v2, p0

    const-wide/high16 v4, 0x4130000000000000L    # 1048576.0

    div-double/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_0

    .line 301
    :cond_1
    const-wide/16 v0, 0x400

    cmp-long v0, p0, v0

    if-ltz v0, :cond_2

    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    sget-object v1, Lcom/youai/dreamonepiece/DownloadApk;->DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    long-to-double v2, p0

    const-wide/high16 v4, 0x4090000000000000L    # 1024.0

    div-double/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_0

    .line 306
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "B"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static install(Landroid/content/Context;Ljava/io/File;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/io/File;

    .prologue
    .line 318
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 319
    .local v0, "i":Landroid/content/Intent;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 321
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 323
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 324
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 325
    const/4 v1, 0x1

    .line 327
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isDownloading(I)Z
    .locals 2
    .param p0, "downloadManagerStatus"    # I

    .prologue
    const/4 v0, 0x1

    .line 311
    const/4 v1, 0x2

    if-eq p0, v1, :cond_0

    const/4 v1, 0x4

    if-eq p0, v1, :cond_0

    if-ne p0, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public Onchannel(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "strChannel"    # Ljava/lang/String;
    .param p2, "_url"    # Ljava/lang/String;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mUrlChannel:Ljava/lang/String;

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OnePiece_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v1}, Lcom/youai/dreamonepiece/GameActivity;->getPlatformId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->channel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/DownloadApk;->DOWNLOAD_FILE_NAME:Ljava/lang/String;

    .line 190
    const/4 v0, 0x1

    iput v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->useChannelUrl:I

    .line 191
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mUrlChannel:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/DownloadApk;->onCreate(Ljava/lang/String;)V

    .line 194
    :cond_0
    return-void
.end method

.method public onCreate(Ljava/lang/String;)V
    .locals 10
    .param p1, "pDownloadUrl"    # Ljava/lang/String;

    .prologue
    const v9, 0x7f0a0023

    const/16 v8, 0xb

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 239
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 242
    .local v1, "DownloadPath":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "Download"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    .line 244
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_1

    .line 245
    :cond_0
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 248
    :cond_1
    new-instance v3, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    .line 250
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_3

    .line 251
    :cond_2
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 254
    :cond_3
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->DownloadPathFile:Ljava/io/File;

    sget-object v6, Lcom/youai/dreamonepiece/DownloadApk;->DOWNLOAD_FILE_NAME:Ljava/lang/String;

    invoke-direct {v0, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 255
    .local v0, "DOWNLOAD_FILE":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    and-int/2addr v6, v3

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v8, :cond_6

    move v3, v4

    :goto_0
    and-int/2addr v3, v6

    if-eqz v3, :cond_4

    .line 257
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 258
    :cond_4
    const-string v3, "DownloadApk path"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    new-instance v2, Landroid/app/DownloadManager$Request;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 262
    .local v2, "request":Landroid/app/DownloadManager$Request;
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    sget-object v6, Lcom/youai/dreamonepiece/DownloadApk;->DOWNLOAD_FILE_NAME:Ljava/lang/String;

    invoke-virtual {v2, v3, v6}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 266
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v3, v9}, Lcom/youai/dreamonepiece/GameActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 267
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v3, v9}, Lcom/youai/dreamonepiece/GameActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 269
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v8, :cond_5

    .line 270
    invoke-virtual {v2, v4}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 272
    :cond_5
    invoke-virtual {v2, v5}, Landroid/app/DownloadManager$Request;->setVisibleInDownloadsUi(Z)Landroid/app/DownloadManager$Request;

    .line 278
    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 279
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadId:J

    .line 281
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->show()V

    .line 283
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/DownloadApk;->updateView()V

    .line 284
    return-void

    .end local v2    # "request":Landroid/app/DownloadManager$Request;
    :cond_6
    move v3, v5

    .line 255
    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 197
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadObserver:Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 199
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->completeReceiver:Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 200
    return-void
.end method

.method public preCreate()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 204
    new-instance v0, Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;-><init>(Lcom/youai/dreamonepiece/DownloadApk;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadObserver:Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;

    .line 205
    new-instance v0, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;-><init>(Lcom/youai/dreamonepiece/DownloadApk;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->completeReceiver:Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;

    .line 206
    new-instance v0, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;-><init>(Lcom/youai/dreamonepiece/DownloadApk;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->handler:Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

    .line 207
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/youai/dreamonepiece/DownloadManagerPro;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadObserver:Lcom/youai/dreamonepiece/DownloadApk$DownloadChangeObserver;

    invoke-virtual {v0, v1, v5, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 209
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->completeReceiver:Lcom/youai/dreamonepiece/DownloadApk$CompleteReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/youai/dreamonepiece/GameActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 211
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    const-string v1, "download"

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManager:Landroid/app/DownloadManager;

    .line 213
    new-instance v0, Lcom/youai/dreamonepiece/DownloadManagerPro;

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManager:Landroid/app/DownloadManager;

    invoke-direct {v0, v1}, Lcom/youai/dreamonepiece/DownloadManagerPro;-><init>(Landroid/app/DownloadManager;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManagerPro:Lcom/youai/dreamonepiece/DownloadManagerPro;

    .line 215
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->context:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    .line 216
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v5}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 217
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    const-string v1, "\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 218
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    const-string v1, "\u6b63\u5728\u4e0b\u8f7d\u6700\u65b0\u8f6f\u4ef6\uff0c\u9700\u8981\u8f83\u957f\u65f6\u95f4\uff0c\u662f\u5426\u5207\u6362\u540e\u53f0\u4e0b\u8f7d?"

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 219
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 220
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 221
    iget-object v0, p0, Lcom/youai/dreamonepiece/DownloadApk;->mpDialog:Landroid/app/ProgressDialog;

    const-string v1, "\u786e\u5b9a"

    new-instance v2, Lcom/youai/dreamonepiece/DownloadApk$3;

    invoke-direct {v2, p0}, Lcom/youai/dreamonepiece/DownloadApk$3;-><init>(Lcom/youai/dreamonepiece/DownloadApk;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/ProgressDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 235
    return-void
.end method

.method public updateView()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 287
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadManagerPro:Lcom/youai/dreamonepiece/DownloadManagerPro;

    iget-wide v2, p0, Lcom/youai/dreamonepiece/DownloadApk;->downloadId:J

    invoke-virtual {v1, v2, v3}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getBytesAndStatus(J)[I

    move-result-object v0

    .line 288
    .local v0, "bytesAndStatus":[I
    iget-object v1, p0, Lcom/youai/dreamonepiece/DownloadApk;->handler:Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

    iget-object v2, p0, Lcom/youai/dreamonepiece/DownloadApk;->handler:Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;

    aget v3, v0, v6

    const/4 v4, 0x1

    aget v4, v0, v4

    const/4 v5, 0x2

    aget v5, v0, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v6, v3, v4, v5}, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/DownloadApk$DownLoadHandler;->sendMessage(Landroid/os/Message;)Z

    .line 290
    return-void
.end method
