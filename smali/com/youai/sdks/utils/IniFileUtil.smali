.class public Lcom/youai/sdks/utils/IniFileUtil;
.super Ljava/lang/Object;
.source "IniFileUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
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
    .line 18
    move-object v3, p3

    .line 20
    .local v3, "result":Ljava/lang/String;
    invoke-static {p0}, Lcom/youai/sdks/utils/IniFileUtil;->getIniAllValue(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 21
    .local v2, "map":Ljava/util/Map;
    if-nez v2, :cond_0

    .line 35
    .end local v3    # "result":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 25
    .restart local v3    # "result":Ljava/lang/String;
    :cond_0
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 26
    .local v4, "section":Ljava/util/ArrayList;
    if-eqz v4, :cond_2

    .line 27
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 28
    .local v0, "iter":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .end local v0    # "iter":Ljava/util/Iterator;
    :cond_2
    move-object v3, p3

    .line 35
    goto :goto_0

    .line 29
    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 30
    .local v1, "kv":[Ljava/lang/String;
    if-eqz v1, :cond_1

    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 31
    const/4 v5, 0x1

    aget-object v5, v1, v5

    const/4 v6, 0x2

    invoke-static {v5, v6}, Lcom/youai/sdks/utils/IniFileUtil;->dealCorpsSign(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static WritePrivateProfileString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 15
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "sec"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-static {v0, v13}, Lcom/youai/sdks/utils/IniFileUtil;->dealCorpsSign(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p3

    .line 43
    invoke-static {p0}, Lcom/youai/sdks/utils/IniFileUtil;->getIniAllValue(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    .line 44
    .local v6, "map":Ljava/util/Map;
    if-nez v6, :cond_2

    .line 45
    new-instance v6, Ljava/util/HashMap;

    .end local v6    # "map":Ljava/util/Map;
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 47
    .restart local v6    # "map":Ljava/util/Map;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v10, "section":Ljava/util/ArrayList;
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object p2, v13, v14

    const/4 v14, 0x1

    aput-object p3, v13, v14

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    move-object/from16 v0, p1

    invoke-interface {v6, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .end local v10    # "section":Ljava/util/ArrayList;
    :cond_0
    :goto_0
    :try_start_0
    new-instance v8, Ljava/io/PrintWriter;

    new-instance v13, Ljava/io/BufferedWriter;

    .line 84
    new-instance v14, Ljava/io/FileWriter;

    invoke-direct {v14, p0}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v13, v14}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 83
    invoke-direct {v8, v13}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 86
    .local v8, "out":Ljava/io/PrintWriter;
    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 87
    .local v4, "iter":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_7

    .line 103
    invoke-virtual {v8}, Ljava/io/PrintWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    const/4 v13, 0x1

    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v8    # "out":Ljava/io/PrintWriter;
    :goto_1
    return v13

    .line 53
    :cond_2
    const/4 v11, 0x0

    .line 54
    .local v11, "x":I
    const/4 v12, 0x0

    .line 56
    .local v12, "y":I
    move-object/from16 v0, p1

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 57
    .local v2, "al":Ljava/util/ArrayList;
    if-eqz v2, :cond_4

    .line 58
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 59
    .restart local v4    # "iter":Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_5

    .line 70
    .end local v4    # "iter":Ljava/util/Iterator;
    :cond_4
    if-nez v11, :cond_6

    .line 71
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .restart local v10    # "section":Ljava/util/ArrayList;
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object p2, v13, v14

    const/4 v14, 0x1

    aput-object p3, v13, v14

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    move-object/from16 v0, p1

    invoke-interface {v6, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 60
    .end local v10    # "section":Ljava/util/ArrayList;
    .restart local v4    # "iter":Ljava/util/Iterator;
    :cond_5
    add-int/lit8 v11, v11, 0x1

    .line 62
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    .line 63
    .local v5, "kv":[Ljava/lang/String;
    if-eqz v5, :cond_3

    const/4 v13, 0x0

    aget-object v13, v5, v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 64
    const/4 v13, 0x1

    aput-object p3, v5, v13

    .line 66
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 76
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "kv":[Ljava/lang/String;
    :cond_6
    if-nez v12, :cond_0

    .line 77
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    aput-object p2, v13, v14

    const/4 v14, 0x1

    aput-object p3, v13, v14

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    move-object/from16 v0, p1

    invoke-interface {v6, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 88
    .end local v2    # "al":Ljava/util/ArrayList;
    .end local v11    # "x":I
    .end local v12    # "y":I
    .restart local v4    # "iter":Ljava/util/Iterator;
    .restart local v8    # "out":Ljava/io/PrintWriter;
    :cond_7
    :try_start_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 90
    .local v7, "obj":Ljava/lang/Object;
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "line.separator"

    invoke-static {v14}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "["

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 91
    const-string v14, "]"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 90
    invoke-virtual {v8, v13}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 93
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 94
    .local v1, "aList":Ljava/util/ArrayList;
    if-eqz v1, :cond_1

    .line 95
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 96
    .local v9, "res":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    .line 97
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    .line 99
    .restart local v5    # "kv":[Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    const/4 v14, 0x0

    aget-object v14, v5, v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

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
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 104
    .end local v1    # "aList":Ljava/util/ArrayList;
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "kv":[Ljava/lang/String;
    .end local v7    # "obj":Ljava/lang/Object;
    .end local v8    # "out":Ljava/io/PrintWriter;
    .end local v9    # "res":Ljava/util/Iterator;
    :catch_0
    move-exception v3

    .line 105
    .local v3, "e":Ljava/lang/Exception;
    const/4 v13, 0x0

    goto/16 :goto_1
.end method

.method private static dealCorpsSign(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "flag"    # I

    .prologue
    .line 111
    const-string v1, "line.separator"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "xline":Ljava/lang/String;
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 113
    const-string v1, "\u25a141\u25ce3\u25a1"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 117
    :goto_0
    return-object p0

    .line 115
    :cond_0
    const-string v1, "\u25a141\u25ce3\u25a1"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private static getIniAllValue(Ljava/lang/String;)Ljava/util/Map;
    .locals 13
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 122
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 124
    .local v6, "map":Ljava/util/Map;
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    move-object v6, v10

    .line 160
    .end local v0    # "f":Ljava/io/File;
    .end local v6    # "map":Ljava/util/Map;
    :goto_0
    return-object v6

    .line 128
    .restart local v0    # "f":Ljava/io/File;
    .restart local v6    # "map":Ljava/util/Map;
    :cond_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/FileReader;

    invoke-direct {v11, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 130
    .local v1, "in":Ljava/io/BufferedReader;
    const/4 v5, 0x0

    .line 132
    .local v5, "line":Ljava/lang/String;
    const/4 v9, 0x0

    .line 133
    .local v9, "values":Ljava/util/ArrayList;
    :cond_1
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_2

    .line 155
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    goto :goto_0

    .line 158
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v9    # "values":Ljava/util/ArrayList;
    :catch_0
    move-exception v11

    move-object v6, v10

    .line 160
    goto :goto_0

    .line 134
    .restart local v0    # "f":Ljava/io/File;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v9    # "values":Ljava/util/ArrayList;
    :cond_2
    invoke-static {v5}, Lcom/youai/sdks/utils/IniFileUtil;->isSection(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 135
    new-instance v9, Ljava/util/ArrayList;

    .end local v9    # "values":Ljava/util/ArrayList;
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .restart local v9    # "values":Ljava/util/ArrayList;
    const/4 v11, 0x1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v5, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v6, v11, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 138
    :cond_3
    if-eqz v9, :cond_1

    .line 139
    const-string v11, "="

    invoke-virtual {v5, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 140
    .local v2, "index":I
    if-lez v2, :cond_1

    .line 141
    const/4 v11, 0x0

    invoke-virtual {v5, v11, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "k":Ljava/lang/String;
    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-virtual {v3, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 144
    .local v7, "note":Ljava/lang/String;
    const-string v11, "#"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    const-string v11, "/"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 145
    const-string v11, ";"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 146
    add-int/lit8 v11, v2, 0x1

    invoke-virtual {v5, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 148
    .local v8, "v":Ljava/lang/String;
    const/4 v11, 0x2

    new-array v4, v11, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v3, v4, v11

    const/4 v11, 0x1

    aput-object v8, v4, v11

    .line 150
    .local v4, "kv":[Ljava/lang/String;
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method

.method private static isSection(Ljava/lang/String;)Z
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 164
    const/4 v0, 0x0

    .line 165
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

    .line 166
    const/4 v0, 0x1

    .line 168
    :cond_0
    return v0
.end method
