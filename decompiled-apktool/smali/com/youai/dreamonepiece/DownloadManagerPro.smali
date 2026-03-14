.class public Lcom/youai/dreamonepiece/DownloadManagerPro;
.super Ljava/lang/Object;
.source "DownloadManagerPro.java"


# static fields
.field public static final CONTENT_URI:Landroid/net/Uri;


# instance fields
.field private downloadManager:Landroid/app/DownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, "content://downloads/my_downloads"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/DownloadManagerPro;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/app/DownloadManager;)V
    .locals 0
    .param p1, "downloadManager"    # Landroid/app/DownloadManager;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/youai/dreamonepiece/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    .line 25
    return-void
.end method

.method private getInt(JLjava/lang/String;)I
    .locals 6
    .param p1, "downloadId"    # J
    .param p3, "columnName"    # Ljava/lang/String;

    .prologue
    .line 200
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    aput-wide p1, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v1

    .line 202
    .local v1, "query":Landroid/app/DownloadManager$Query;
    const/4 v2, -0x1

    .line 203
    .local v2, "result":I
    const/4 v0, 0x0

    .line 205
    .local v0, "c":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v1}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 206
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 207
    invoke-interface {v0, p3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 210
    :cond_0
    if-eqz v0, :cond_1

    .line 211
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 214
    :cond_1
    return v2

    .line 210
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_2

    .line 211
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v3
.end method

.method private getString(JLjava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "downloadId"    # J
    .param p3, "columnName"    # Ljava/lang/String;

    .prologue
    .line 175
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    aput-wide p1, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v1

    .line 177
    .local v1, "query":Landroid/app/DownloadManager$Query;
    const/4 v2, 0x0

    .line 178
    .local v2, "result":Ljava/lang/String;
    const/4 v0, 0x0

    .line 180
    .local v0, "c":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v1}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 181
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 182
    invoke-interface {v0, p3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 185
    :cond_0
    if-eqz v0, :cond_1

    .line 186
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 189
    :cond_1
    return-object v2

    .line 185
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_2

    .line 186
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v3
.end method


# virtual methods
.method public getBytesAndStatus(J)[I
    .locals 6
    .param p1, "downloadId"    # J

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 67
    const/4 v3, 0x3

    new-array v0, v3, [I

    fill-array-data v0, :array_0

    .line 68
    .local v0, "bytesAndStatus":[I
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    new-array v4, v4, [J

    aput-wide p1, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v2

    .line 70
    .local v2, "query":Landroid/app/DownloadManager$Query;
    const/4 v1, 0x0

    .line 72
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/youai/dreamonepiece/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v2}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v1

    .line 73
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 74
    const/4 v3, 0x0

    const-string v4, "bytes_so_far"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    aput v4, v0, v3

    .line 77
    const/4 v3, 0x1

    const-string v4, "total_size"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    aput v4, v0, v3

    .line 80
    const/4 v3, 0x2

    const-string v4, "status"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    aput v4, v0, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    :cond_0
    if-eqz v1, :cond_1

    .line 85
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 88
    :cond_1
    return-object v0

    .line 84
    :catchall_0
    move-exception v3

    if-eqz v1, :cond_2

    .line 85
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v3

    .line 67
    :array_0
    .array-data 4
        -0x1
        -0x1
        0x0
    .end array-data
.end method

.method public getDownloadBytes(J)[I
    .locals 5
    .param p1, "downloadId"    # J

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 49
    invoke-virtual {p0, p1, p2}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getBytesAndStatus(J)[I

    move-result-object v0

    .line 50
    .local v0, "bytesAndStatus":[I
    const/4 v1, 0x2

    new-array v1, v1, [I

    aget v2, v0, v3

    aput v2, v1, v3

    aget v2, v0, v4

    aput v2, v1, v4

    return-object v1
.end method

.method public getErrorCode(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 164
    const-string v0, "reason"

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getFileName(J)Ljava/lang/String;
    .locals 2
    .param p1, "downloadId"    # J

    .prologue
    .line 99
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 100
    const-string v0, "local_filename"

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 102
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/youai/dreamonepiece/DownloadApk;->DOWNLOAD_FILE_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPausedReason(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 154
    const-string v0, "reason"

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getReason(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 136
    const-string v0, "reason"

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getStatusById(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 34
    const-string v0, "status"

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getUri(J)Ljava/lang/String;
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 116
    const-string v0, "uri"

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/dreamonepiece/DownloadManagerPro;->getString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
