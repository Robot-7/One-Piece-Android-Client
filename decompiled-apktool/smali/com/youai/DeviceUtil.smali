.class public Lcom/youai/DeviceUtil;
.super Ljava/lang/Object;
.source "DeviceUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generateUUID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 30
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "imei":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 36
    .end local v1    # "imei":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 34
    .restart local v1    # "imei":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "android_id"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "androidId":Ljava/lang/String;
    move-object v1, v0

    .line 36
    goto :goto_0
.end method

.method public static getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, " "

    const-string v3, "-"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "temp":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    const-string v3, ""

    .line 64
    .local v3, "uuid":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/youai/uuid.properties"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 68
    .local v2, "uFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 69
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 71
    .local v0, "cfgIni":Ljava/util/Properties;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, v5}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 72
    const-string v5, "uuid"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v3

    .line 78
    :goto_0
    const/4 v0, 0x0

    .line 79
    if-eqz v3, :cond_1

    const-string v5, ""

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 80
    const/4 v2, 0x0

    .line 81
    const-string v5, "getDeviceUUID"

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v3

    .line 127
    .end local v3    # "uuid":Ljava/lang/String;
    .local v4, "uuid":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 85
    .end local v0    # "cfgIni":Ljava/util/Properties;
    .end local v4    # "uuid":Ljava/lang/String;
    .restart local v3    # "uuid":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 86
    .restart local v0    # "cfgIni":Ljava/util/Properties;
    const-string v5, "uuid"

    const-string v6, ""

    invoke-virtual {v0, v5, v6}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 88
    :try_start_1
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v6, "auto save, default none str"

    invoke-virtual {v0, v5, v6}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 99
    :cond_1
    :goto_2
    :try_start_2
    const-string v5, "phone"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 101
    .local v1, "tmsvc":Landroid/telephony/TelephonyManager;
    if-eqz v1, :cond_3

    .line 102
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    .line 103
    if-nez v3, :cond_2

    .line 104
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v3

    .line 105
    :cond_2
    if-nez v3, :cond_3

    .line 107
    const/4 v3, 0x0

    .line 112
    .end local v1    # "tmsvc":Landroid/telephony/TelephonyManager;
    :cond_3
    :goto_3
    if-eqz v3, :cond_4

    const-string v5, ""

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "0"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 113
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uuid_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lcom/youai/DeviceUtil;->generateUUID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 115
    :cond_5
    new-instance v0, Ljava/util/Properties;

    .end local v0    # "cfgIni":Ljava/util/Properties;
    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 116
    .restart local v0    # "cfgIni":Ljava/util/Properties;
    const-string v5, "uuid"

    invoke-virtual {v0, v5, v3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 118
    :try_start_3
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v6, "auto save, generateUUID"

    invoke-virtual {v0, v5, v6}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 124
    :goto_4
    const/4 v2, 0x0

    .line 125
    const/4 v0, 0x0

    .line 126
    const-string v5, "getDeviceUUID"

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v3

    .line 127
    .end local v3    # "uuid":Ljava/lang/String;
    .restart local v4    # "uuid":Ljava/lang/String;
    goto :goto_1

    .line 121
    .end local v4    # "uuid":Ljava/lang/String;
    .restart local v3    # "uuid":Ljava/lang/String;
    :catch_0
    move-exception v5

    goto :goto_4

    .line 119
    :catch_1
    move-exception v5

    goto :goto_4

    .line 109
    :catch_2
    move-exception v5

    goto :goto_3

    .line 92
    :catch_3
    move-exception v5

    goto :goto_2

    .line 90
    :catch_4
    move-exception v5

    goto :goto_2

    .line 75
    :catch_5
    move-exception v5

    goto/16 :goto_0

    .line 73
    :catch_6
    move-exception v5

    goto/16 :goto_0
.end method

.method public static getMaxCpuFreq()Ljava/lang/String;
    .locals 9

    .prologue
    .line 195
    const-string v6, ""

    .line 198
    .local v6, "result":Ljava/lang/String;
    const/4 v7, 0x2

    :try_start_0
    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "/system/bin/cat"

    aput-object v8, v0, v7

    const/4 v7, 0x1

    const-string v8, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"

    aput-object v8, v0, v7

    .line 200
    .local v0, "args":[Ljava/lang/String;
    new-instance v1, Ljava/lang/ProcessBuilder;

    invoke-direct {v1, v0}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 201
    .local v1, "cmd":Ljava/lang/ProcessBuilder;
    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v4

    .line 202
    .local v4, "process":Ljava/lang/Process;
    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 203
    .local v3, "in":Ljava/io/InputStream;
    const/16 v7, 0x18

    new-array v5, v7, [B

    .line 204
    .local v5, "re":[B
    :goto_0
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_0

    .line 205
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 207
    :cond_0
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .end local v0    # "args":[Ljava/lang/String;
    .end local v1    # "cmd":Ljava/lang/ProcessBuilder;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "process":Ljava/lang/Process;
    .end local v5    # "re":[B
    :goto_1
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 208
    :catch_0
    move-exception v2

    .line 209
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 210
    const-string v6, ""

    goto :goto_1
.end method

.method public static getNumCores()I
    .locals 7

    .prologue
    const/4 v3, 0x1

    .line 179
    :try_start_0
    new-instance v0, Ljava/io/File;

    const-string v4, "/sys/devices/system/cpu/"

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 180
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 181
    new-instance v4, Lcom/youai/DeviceUtil$1CpuFilter;

    invoke-direct {v4}, Lcom/youai/DeviceUtil$1CpuFilter;-><init>()V

    invoke-virtual {v0, v4}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 182
    .local v2, "files":[Ljava/io/File;
    const-string v4, "MainActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CPU Count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    array-length v3, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .end local v2    # "files":[Ljava/io/File;
    :cond_0
    :goto_0
    return v3

    .line 187
    :catch_0
    move-exception v1

    .line 188
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "MainActivity"

    const-string v5, "CPU Count: Failed."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getTotalMemory(Landroid/content/Context;)Ljava/lang/String;
    .locals 16
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 136
    const-string v12, "/proc/meminfo"

    .line 139
    .local v12, "str1":Ljava/lang/String;
    const-wide/16 v6, 0x0

    .line 140
    .local v6, "initial_memory":D
    const/4 v2, 0x0

    .line 142
    .local v2, "df":Ljava/text/DecimalFormat;
    :try_start_0
    new-instance v10, Ljava/io/FileReader;

    invoke-direct {v10, v12}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 143
    .local v10, "localFileReader":Ljava/io/FileReader;
    new-instance v9, Ljava/io/BufferedReader;

    const/16 v14, 0x2000

    invoke-direct {v9, v10, v14}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 145
    .local v9, "localBufferedReader":Ljava/io/BufferedReader;
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 146
    .local v13, "str2":Ljava/lang/String;
    if-nez v13, :cond_0

    .line 147
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 148
    const-string v14, ""

    .line 163
    .end local v9    # "localBufferedReader":Ljava/io/BufferedReader;
    .end local v10    # "localFileReader":Ljava/io/FileReader;
    .end local v13    # "str2":Ljava/lang/String;
    :goto_0
    return-object v14

    .line 150
    .restart local v9    # "localBufferedReader":Ljava/io/BufferedReader;
    .restart local v10    # "localFileReader":Ljava/io/FileReader;
    .restart local v13    # "str2":Ljava/lang/String;
    :cond_0
    const-string v14, "\\s+"

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, "arrayOfString":[Ljava/lang/String;
    move-object v0, v1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v8, v0

    .local v8, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1
    if-ge v5, v8, :cond_1

    aget-object v11, v0, v5

    .line 152
    .local v11, "num":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\t"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 154
    .end local v11    # "num":Ljava/lang/String;
    :cond_1
    const/4 v14, 0x1

    aget-object v14, v1, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    div-int/lit16 v14, v14, 0x400

    int-to-double v6, v14

    .line 157
    const-wide/high16 v14, 0x4090000000000000L    # 1024.0

    div-double/2addr v6, v14

    .line 158
    new-instance v3, Ljava/text/DecimalFormat;

    const-string v14, "##.##"

    invoke-direct {v3, v14}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .end local v2    # "df":Ljava/text/DecimalFormat;
    .local v3, "df":Ljava/text/DecimalFormat;
    :try_start_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 163
    invoke-virtual {v3, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v14

    move-object v2, v3

    .end local v3    # "df":Ljava/text/DecimalFormat;
    .restart local v2    # "df":Ljava/text/DecimalFormat;
    goto :goto_0

    .line 160
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "arrayOfString":[Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    .end local v9    # "localBufferedReader":Ljava/io/BufferedReader;
    .end local v10    # "localFileReader":Ljava/io/FileReader;
    .end local v13    # "str2":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 161
    .local v4, "e":Ljava/lang/Exception;
    :goto_2
    const-string v14, ""

    goto :goto_0

    .line 160
    .end local v2    # "df":Ljava/text/DecimalFormat;
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "arrayOfString":[Ljava/lang/String;
    .restart local v3    # "df":Ljava/text/DecimalFormat;
    .restart local v5    # "i$":I
    .restart local v8    # "len$":I
    .restart local v9    # "localBufferedReader":Ljava/io/BufferedReader;
    .restart local v10    # "localFileReader":Ljava/io/FileReader;
    .restart local v13    # "str2":Ljava/lang/String;
    :catch_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "df":Ljava/text/DecimalFormat;
    .restart local v2    # "df":Ljava/text/DecimalFormat;
    goto :goto_2
.end method
