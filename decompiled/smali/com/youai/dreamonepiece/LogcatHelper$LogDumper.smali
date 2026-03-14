.class Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;
.super Ljava/lang/Thread;
.source "LogcatHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/LogcatHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LogDumper"
.end annotation


# instance fields
.field private FilePath:Ljava/lang/String;

.field private cmds:Ljava/lang/String;

.field private logcatProc:Ljava/lang/Process;

.field private mPID:Ljava/lang/String;

.field private mReader:Ljava/io/BufferedReader;

.field private mRunning:Z

.field private out:Ljava/io/FileOutputStream;

.field final synthetic this$0:Lcom/youai/dreamonepiece/LogcatHelper;


# direct methods
.method public constructor <init>(Lcom/youai/dreamonepiece/LogcatHelper;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p2, "pid"    # Ljava/lang/String;
    .param p3, "dir"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 107
    iput-object p1, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->this$0:Lcom/youai/dreamonepiece/LogcatHelper;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 100
    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    .line 101
    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    .line 102
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mRunning:Z

    .line 103
    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->cmds:Ljava/lang/String;

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "log-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/youai/dreamonepiece/LogcatHelper$MyDate;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->FilePath:Ljava/lang/String;

    .line 108
    iput-object p2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mPID:Ljava/lang/String;

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->FilePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".log"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->FilePath:Ljava/lang/String;

    .line 111
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->FilePath:Ljava/lang/String;

    invoke-direct {v2, p3, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "logcat  | grep \"("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mPID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->cmds:Ljava/lang/String;

    .line 117
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 126
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->cmds:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    .line 127
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v4, 0x400

    invoke-direct {v2, v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    .line 129
    const/4 v1, 0x0

    .line 130
    .local v1, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mRunning:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 131
    iget-boolean v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mRunning:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_5

    .line 146
    :cond_1
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    if-eqz v2, :cond_2

    .line 147
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 148
    iput-object v5, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    .line 150
    :cond_2
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    if-eqz v2, :cond_3

    .line 152
    :try_start_1
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 153
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .line 158
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    if-eqz v2, :cond_4

    .line 160
    :try_start_2
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6

    .line 164
    .end local v1    # "line":Ljava/lang/String;
    :goto_2
    iput-object v5, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    .line 167
    :cond_4
    return-void

    .line 134
    .restart local v1    # "line":Ljava/lang/String;
    :cond_5
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 137
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mPID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/youai/dreamonepiece/LogcatHelper$MyDate;->getDateEN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 143
    .end local v1    # "line":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 146
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    if-eqz v2, :cond_6

    .line 147
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 148
    iput-object v5, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    .line 150
    :cond_6
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    if-eqz v2, :cond_7

    .line 152
    :try_start_5
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 153
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 158
    :cond_7
    :goto_3
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    if-eqz v2, :cond_4

    .line 160
    :try_start_6
    iget-object v2, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    .line 161
    :catch_1
    move-exception v0

    .line 162
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 161
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 162
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 164
    .end local v0    # "e":Ljava/io/IOException;
    :goto_4
    iput-object v5, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    .line 146
    :cond_8
    throw v2

    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    if-eqz v3, :cond_9

    .line 147
    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 148
    iput-object v5, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->logcatProc:Ljava/lang/Process;

    .line 150
    :cond_9
    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    if-eqz v3, :cond_a

    .line 152
    :try_start_7
    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;

    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 153
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mReader:Ljava/io/BufferedReader;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 158
    :cond_a
    :goto_5
    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    if-eqz v3, :cond_8

    .line 160
    :try_start_8
    iget-object v3, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->out:Ljava/io/FileOutputStream;

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    goto :goto_4

    .line 154
    :catch_3
    move-exception v0

    .line 155
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 154
    :catch_4
    move-exception v0

    .line 155
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 154
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "line":Ljava/lang/String;
    :catch_5
    move-exception v0

    .line 155
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1

    .line 161
    .end local v0    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v0

    .line 162
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2
.end method

.method public stopLogs()V
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/LogcatHelper$LogDumper;->mRunning:Z

    .line 121
    return-void
.end method
