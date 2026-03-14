.class public Lcom/youai/IniFileUtil;
.super Ljava/lang/Object;
.source "IniFileUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static GetPrivateProfileString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "sec"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaults"    # Ljava/lang/String;

    .prologue
    .line 36
    move-object v3, p3

    .line 38
    .local v3, "result":Ljava/lang/String;
    invoke-static {p0}, Lcom/youai/IniFileUtil;->getIniAllValue(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 40
    .local v2, "map":Ljava/util/Map;
    if-nez v2, :cond_0

    .line 66
    .end local v3    # "result":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 44
    .restart local v3    # "result":Ljava/lang/String;
    :cond_0
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 46
    .local v4, "section":Ljava/util/ArrayList;
    if-eqz v4, :cond_2

    .line 50
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 52
    .local v0, "iter":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    move-object v1, v5

    check-cast v1, [Ljava/lang/String;

    .line 56
    .local v1, "kv":[Ljava/lang/String;
    if-eqz v1, :cond_1

    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 58
    const/4 v5, 0x1

    aget-object v5, v1, v5

    const/4 v6, 0x2

    invoke-static {v5, v6}, Lcom/youai/IniFileUtil;->dealCorpsSign(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "kv":[Ljava/lang/String;
    :cond_2
    move-object v3, p3

    .line 66
    goto :goto_0
.end method

.method public static WritePrivateProfileString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 15
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "sec"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 95
    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-static {v0, v13}, Lcom/youai/IniFileUtil;->dealCorpsSign(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p3

    .line 97
    invoke-static {p0}, Lcom/youai/IniFileUtil;->getIniAllValue(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    .line 99
    .local v6, "map":Ljava/util/Map;
    if-nez v6, :cond_2

    .line 102
    new-instance v6, Ljava/util/HashMap;

    .end local v6    # "map":Ljava/util/Map;
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 104
    .restart local v6    # "map":Ljava/util/Map;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v10, "section":Ljava/util/ArrayList;
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object p2, v13, v14

    const/4 v14, 0x1

    aput-object p3, v13, v14

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    move-object/from16 v0, p1

    invoke-interface {v6, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .end local v10    # "section":Ljava/util/ArrayList;
    :cond_0
    :goto_0
    :try_start_0
    new-instance v8, Ljava/io/PrintWriter;

    new-instance v13, Ljava/io/BufferedWriter;

    new-instance v14, Ljava/io/FileWriter;

    invoke-direct {v14, p0}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v13, v14}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-direct {v8, v13}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 164
    .local v8, "out":Ljava/io/PrintWriter;
    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 166
    .local v4, "iter":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 170
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 172
    .local v7, "obj":Ljava/lang/Object;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "line.separator"

    invoke-static {v14}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "["

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "]"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 175
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 177
    .local v1, "aList":Ljava/util/ArrayList;
    if-eqz v1, :cond_1

    .line 179
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 181
    .local v9, "res":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    .line 183
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    move-object v0, v13

    check-cast v0, [Ljava/lang/String;

    move-object v5, v0

    .line 185
    .local v5, "kv":[Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v14, 0x0

    aget-object v14, v5, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x1

    aget-object v14, v5, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 195
    .end local v1    # "aList":Ljava/util/ArrayList;
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "kv":[Ljava/lang/String;
    .end local v7    # "obj":Ljava/lang/Object;
    .end local v8    # "out":Ljava/io/PrintWriter;
    .end local v9    # "res":Ljava/util/Iterator;
    :catch_0
    move-exception v3

    .line 197
    .local v3, "e":Ljava/lang/Exception;
    const/4 v13, 0x0

    .line 201
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_2
    return v13

    .line 114
    :cond_2
    const/4 v11, 0x0

    .local v11, "x":I
    const/4 v12, 0x0

    .line 116
    .local v12, "y":I
    move-object/from16 v0, p1

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 118
    .local v2, "al":Ljava/util/ArrayList;
    if-eqz v2, :cond_4

    .line 120
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 122
    .restart local v4    # "iter":Ljava/util/Iterator;
    :cond_3
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 124
    add-int/lit8 v11, v11, 0x1

    .line 126
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    move-object v5, v13

    check-cast v5, [Ljava/lang/String;

    .line 128
    .restart local v5    # "kv":[Ljava/lang/String;
    if-eqz v5, :cond_3

    const/4 v13, 0x0

    aget-object v13, v5, v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 130
    const/4 v13, 0x1

    aput-object p3, v5, v13

    .line 132
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 140
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "kv":[Ljava/lang/String;
    :cond_4
    if-nez v11, :cond_5

    .line 142
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .restart local v10    # "section":Ljava/util/ArrayList;
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object p2, v13, v14

    const/4 v14, 0x1

    aput-object p3, v13, v14

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    move-object/from16 v0, p1

    invoke-interface {v6, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 150
    .end local v10    # "section":Ljava/util/ArrayList;
    :cond_5
    if-nez v12, :cond_0

    .line 152
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object p2, v13, v14

    const/4 v14, 0x1

    aput-object p3, v13, v14

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    move-object/from16 v0, p1

    invoke-interface {v6, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 193
    .end local v2    # "al":Ljava/util/ArrayList;
    .end local v11    # "x":I
    .end local v12    # "y":I
    .restart local v4    # "iter":Ljava/util/Iterator;
    .restart local v8    # "out":Ljava/io/PrintWriter;
    :cond_6
    :try_start_1
    invoke-virtual {v8}, Ljava/io/PrintWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 201
    const/4 v13, 0x1

    goto :goto_2
.end method

.method private static dealCorpsSign(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "flag"    # I

    .prologue
    .line 209
    const-string v1, "line.separator"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "xline":Ljava/lang/String;
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 213
    const-string v1, "\u25a141\u25ce3\u25a1"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 219
    :goto_0
    return-object p0

    .line 217
    :cond_0
    const-string v1, "\u25a141\u25ce3\u25a1"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private static getIniAllValue(Ljava/lang/String;)Ljava/util/Map;
    .locals 14
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    .line 237
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 241
    .local v7, "map":Ljava/util/Map;
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 243
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_0

    move-object v7, v11

    .line 301
    .end local v1    # "f":Ljava/io/File;
    .end local v7    # "map":Ljava/util/Map;
    :goto_0
    return-object v7

    .line 247
    .restart local v1    # "f":Ljava/io/File;
    .restart local v7    # "map":Ljava/util/Map;
    :cond_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/FileReader;

    invoke-direct {v12, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 249
    .local v2, "in":Ljava/io/BufferedReader;
    const/4 v6, 0x0

    .line 251
    .local v6, "line":Ljava/lang/String;
    const/4 v10, 0x0

    .line 253
    .local v10, "values":Ljava/util/ArrayList;
    :cond_1
    :goto_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 257
    invoke-static {v6}, Lcom/youai/IniFileUtil;->isSection(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 261
    new-instance v10, Ljava/util/ArrayList;

    .end local v10    # "values":Ljava/util/ArrayList;
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .restart local v10    # "values":Ljava/util/ArrayList;
    const/4 v12, 0x1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v6, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v7, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 299
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v6    # "line":Ljava/lang/String;
    .end local v10    # "values":Ljava/util/ArrayList;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move-object v7, v11

    .line 301
    goto :goto_0

    .line 265
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v10    # "values":Ljava/util/ArrayList;
    :cond_2
    if-eqz v10, :cond_1

    .line 269
    const-string v12, "="

    invoke-virtual {v6, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 271
    .local v3, "index":I
    if-lez v3, :cond_1

    .line 273
    const/4 v12, 0x0

    invoke-virtual {v6, v12, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 275
    .local v4, "k":Ljava/lang/String;
    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-virtual {v4, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 277
    .local v8, "note":Ljava/lang/String;
    const-string v12, "#"

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    const-string v12, "/"

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    const-string v12, ";"

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 281
    add-int/lit8 v12, v3, 0x1

    invoke-virtual {v6, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 283
    .local v9, "v":Ljava/lang/String;
    const/4 v12, 0x2

    new-array v5, v12, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v4, v5, v12

    const/4 v12, 0x1

    aput-object v9, v5, v12

    .line 285
    .local v5, "kv":[Ljava/lang/String;
    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 293
    .end local v3    # "index":I
    .end local v4    # "k":Ljava/lang/String;
    .end local v5    # "kv":[Ljava/lang/String;
    .end local v8    # "note":Ljava/lang/String;
    .end local v9    # "v":Ljava/lang/String;
    :cond_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method private static isSection(Ljava/lang/String;)Z
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 321
    const/4 v0, 0x0

    .line 323
    .local v0, "result":Z
    if-eqz p0, :cond_0

    const-string v1, "["

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "]"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 325
    const/4 v0, 0x1

    .line 329
    :cond_0
    return v0
.end method
