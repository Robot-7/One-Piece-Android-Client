.class public Lcom/youai/dreamonepiece/LogcatHelper;
.super Ljava/lang/Object;
.source "LogcatHelper.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/LogcatHelper$MyDate;,
        Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;
    }
.end annotation


# static fields
.field private static PATH_LOGCAT:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;

.field private static mInstance:Lcom/youai/dreamonepiece/LogcatHelper;


# instance fields
.field private info:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

.field private mPId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/youai/dreamonepiece/LogcatHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->TAG:Ljava/lang/String;

    .line 32
    const/4 v0, 0x0

    sput-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->mInstance:Lcom/youai/dreamonepiece/LogcatHelper;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->info:Ljava/util/Map;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    .line 42
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->info:Ljava/util/Map;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    .line 76
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/LogcatHelper;->init(Landroid/content/Context;)V

    .line 77
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    iput v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mPId:I

    .line 78
    return-void
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/LogcatHelper;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/LogcatHelper;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/youai/dreamonepiece/LogcatHelper;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    sget-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->mInstance:Lcom/youai/dreamonepiece/LogcatHelper;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/youai/dreamonepiece/LogcatHelper;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/LogcatHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->mInstance:Lcom/youai/dreamonepiece/LogcatHelper;

    .line 49
    :cond_0
    sget-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->mInstance:Lcom/youai/dreamonepiece/LogcatHelper;

    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mContext:Landroid/content/Context;

    .line 59
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Log"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/youai/dreamonepiece/LogcatHelper;->PATH_LOGCAT:Ljava/lang/String;

    .line 66
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/youai/dreamonepiece/LogcatHelper;->PATH_LOGCAT:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 67
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 68
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcom/youai/dreamonepiece/LogcatHelper;->collectDeviceInfo(Landroid/content/Context;)V

    .line 71
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 72
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 73
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    return-void
.end method

.method private saveCrashInfo2File(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 16
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 278
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    .line 279
    .local v8, "sb":Ljava/lang/StringBuffer;
    new-instance v12, Ljava/io/StringWriter;

    invoke-direct {v12}, Ljava/io/StringWriter;-><init>()V

    .line 280
    .local v12, "writer":Ljava/io/Writer;
    new-instance v6, Ljava/io/PrintWriter;

    invoke-direct {v6, v12}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 281
    .local v6, "pw":Ljava/io/PrintWriter;
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 282
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 284
    .local v1, "cause":Ljava/lang/Throwable;
    :goto_0
    if-eqz v1, :cond_0

    .line 285
    invoke-virtual {v1, v6}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 286
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    goto :goto_0

    .line 288
    :cond_0
    invoke-virtual {v6}, Ljava/io/PrintWriter;->close()V

    .line 289
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 290
    .local v7, "result":Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 292
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 293
    .local v10, "timetamp":J
    invoke-static {}, Lcom/youai/dreamonepiece/LogcatHelper$MyDate;->getFileName()Ljava/lang/String;

    move-result-object v9

    .line 294
    .local v9, "time":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "crash-"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "-"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".log"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 295
    .local v4, "fileName":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v13

    const-string v14, "mounted"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 298
    :try_start_0
    new-instance v2, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/youai/dreamonepiece/LogcatHelper;->mContext:Landroid/content/Context;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "Log"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v2, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 300
    .local v2, "dir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_1

    .line 301
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 302
    :cond_1
    new-instance v5, Ljava/io/FileOutputStream;

    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v5, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 304
    .local v5, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/io/FileOutputStream;->write([B)V

    .line 305
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 313
    .end local v2    # "dir":Ljava/io/File;
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    :goto_1
    return-object v4

    .line 307
    .restart local v4    # "fileName":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 308
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 313
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :cond_2
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 309
    :catch_1
    move-exception v3

    .line 310
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method


# virtual methods
.method public collectDeviceInfo(Landroid/content/Context;)V
    .locals 24
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 220
    new-instance v17, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v22, Lcom/youai/dreamonepiece/LogcatHelper;->PATH_LOGCAT:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    sget-object v22, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "device.log"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 221
    .local v17, "tmp":Ljava/io/File;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v21

    if-eqz v21, :cond_1

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 225
    :cond_1
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v15

    .line 226
    .local v15, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v15, v0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v14

    .line 228
    .local v14, "pi":Landroid/content/pm/PackageInfo;
    if-eqz v14, :cond_2

    .line 229
    iget-object v0, v14, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v21, v0

    if-nez v21, :cond_3

    const-string v20, "null"

    .line 231
    .local v20, "versionName":Ljava/lang/String;
    :goto_1
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v14, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ""

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 232
    .local v19, "versionCode":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/LogcatHelper;->info:Ljava/util/Map;

    move-object/from16 v21, v0

    const-string v22, "versionName"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/LogcatHelper;->info:Ljava/util/Map;

    move-object/from16 v21, v0

    const-string v22, "versionCode"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    .end local v14    # "pi":Landroid/content/pm/PackageInfo;
    .end local v15    # "pm":Landroid/content/pm/PackageManager;
    .end local v19    # "versionCode":Ljava/lang/String;
    .end local v20    # "versionName":Ljava/lang/String;
    :cond_2
    :goto_2
    const-class v21, Landroid/os/Build;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    .line 240
    .local v8, "fields":[Ljava/lang/reflect/Field;
    move-object v3, v8

    .local v3, "arr$":[Ljava/lang/reflect/Field;
    array-length v13, v3

    .local v13, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_3
    if-ge v11, v13, :cond_4

    aget-object v7, v3, v11

    .line 242
    .local v7, "field":Ljava/lang/reflect/Field;
    const/16 v21, 0x1

    :try_start_1
    move/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/LogcatHelper;->info:Ljava/util/Map;

    move-object/from16 v21, v0

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v22

    const-string v23, ""

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v21 .. v23}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v21, Lcom/youai/dreamonepiece/LogcatHelper;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ":"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ""

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 240
    :goto_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 229
    .end local v3    # "arr$":[Ljava/lang/reflect/Field;
    .end local v7    # "field":Ljava/lang/reflect/Field;
    .end local v8    # "fields":[Ljava/lang/reflect/Field;
    .end local v11    # "i$":I
    .end local v13    # "len$":I
    .restart local v14    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v15    # "pm":Landroid/content/pm/PackageManager;
    :cond_3
    :try_start_2
    iget-object v0, v14, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v20, v0
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 235
    .end local v14    # "pi":Landroid/content/pm/PackageInfo;
    .end local v15    # "pm":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v5

    .line 236
    .local v5, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v5}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_2

    .line 245
    .end local v5    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3    # "arr$":[Ljava/lang/reflect/Field;
    .restart local v7    # "field":Ljava/lang/reflect/Field;
    .restart local v8    # "fields":[Ljava/lang/reflect/Field;
    .restart local v11    # "i$":I
    .restart local v13    # "len$":I
    :catch_1
    move-exception v5

    .line 246
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v5}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_4

    .line 247
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v5

    .line 248
    .local v5, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v5}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_4

    .line 251
    .end local v5    # "e":Ljava/lang/IllegalAccessException;
    .end local v7    # "field":Ljava/lang/reflect/Field;
    :cond_4
    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    .line 252
    .local v16, "sb":Ljava/lang/StringBuffer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/LogcatHelper;->info:Ljava/util/Map;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_5

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 253
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 254
    .local v12, "key":Ljava/lang/String;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 255
    .local v18, "value":Ljava/lang/String;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "\r\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 257
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "key":Ljava/lang/String;
    .end local v18    # "value":Ljava/lang/String;
    :cond_5
    const-string v9, "device.log"

    .line 258
    .local v9, "fileName":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v21

    const-string v22, "mounted"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 261
    :try_start_3
    new-instance v4, Ljava/io/File;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/youai/dreamonepiece/LogcatHelper;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    sget-object v22, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "Log"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 263
    .local v4, "dir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v21

    if-nez v21, :cond_6

    .line 264
    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 265
    :cond_6
    new-instance v10, Ljava/io/FileOutputStream;

    new-instance v21, Ljava/io/File;

    move-object/from16 v0, v21

    invoke-direct {v0, v4, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-direct {v10, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 267
    .local v10, "fos":Ljava/io/FileOutputStream;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->getBytes()[B

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 268
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    goto/16 :goto_0

    .line 269
    .end local v4    # "dir":Ljava/io/File;
    .end local v10    # "fos":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v5

    .line 270
    .local v5, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v5}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 271
    .end local v5    # "e":Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v5

    .line 272
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public handleException(Ljava/lang/Throwable;)Z
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 198
    if-nez p1, :cond_0

    .line 199
    const/4 v0, 0x0

    .line 211
    :goto_0
    return v0

    .line 201
    :cond_0
    new-instance v0, Lcom/youai/dreamonepiece/LogcatHelper$1;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/LogcatHelper$1;-><init>(Lcom/youai/dreamonepiece/LogcatHelper;)V

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/LogcatHelper$1;->start()V

    .line 210
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/LogcatHelper;->saveCrashInfo2File(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 211
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public start()V
    .locals 3

    .prologue
    .line 81
    sget-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->PATH_LOGCAT:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/LogcatHelper;->PATH_LOGCAT:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-void

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    if-nez v0, :cond_2

    .line 85
    new-instance v0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    iget v1, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mPId:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/youai/dreamonepiece/LogcatHelper;->PATH_LOGCAT:Ljava/lang/String;

    invoke-direct {v0, p0, v1, v2}, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;-><init>(Lcom/youai/dreamonepiece/LogcatHelper;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    .line 87
    :cond_2
    iget-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->start()V

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->stopLogs()V

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mLogDumper:Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;

    .line 95
    :cond_0
    return-void
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 175
    invoke-virtual {p0, p2}, Lcom/youai/dreamonepiece/LogcatHelper;->handleException(Ljava/lang/Throwable;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 188
    :goto_0
    return-void

    .line 180
    :cond_0
    const-wide/16 v1, 0xbb8

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    :goto_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {v1}, Landroid/os/Process;->killProcess(I)V

    .line 186
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method
