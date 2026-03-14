.class public Lcom/youai/RSAUtil;
.super Ljava/lang/Object;
.source "RSAUtil.java"


# static fields
.field private static final RSA_KEY_ALGORITHM:Ljava/lang/String; = "RSA"

.field public static final pub_key_hand:Ljava/lang/String; = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decryptByPriKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "pPrikey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 169
    sget-boolean v12, Lcom/youai/dreamonepiece/YouaiConfig;->encryptData:Z

    if-nez v12, :cond_0

    .line 200
    .end local p0    # "data":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 172
    .restart local p0    # "data":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/youai/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v9

    .line 173
    .local v9, "pri_key":[B
    new-instance v8, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v8, v9}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 174
    .local v8, "pkcs8KeySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    const-string v12, "RSA"

    invoke-static {v12}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v7

    .line 175
    .local v7, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v7, v8}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v10

    .line 176
    .local v10, "privateKey":Ljava/security/PrivateKey;
    const-string v12, "RSA/None/PKCS1Padding"

    invoke-static {v12}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    .line 177
    .local v4, "cipher":Ljavax/crypto/Cipher;
    const/4 v12, 0x2

    invoke-virtual {v4, v12, v10}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 179
    invoke-static {p0}, Lcom/youai/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 181
    .local v0, "_data":[B
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 182
    .local v6, "ins":Ljava/io/InputStream;
    new-instance v11, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v11}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 183
    .local v11, "writer":Ljava/io/ByteArrayOutputStream;
    const/16 v12, 0x80

    new-array v2, v12, [B

    .line 186
    .local v2, "buf":[B
    :goto_1
    invoke-virtual {v6, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "bufl":I
    const/4 v12, -0x1

    if-eq v3, v12, :cond_3

    .line 187
    const/4 v1, 0x0

    .line 189
    .local v1, "block":[B
    array-length v12, v2

    if-ne v12, v3, :cond_2

    .line 190
    move-object v1, v2

    .line 198
    :cond_1
    invoke-virtual {v4, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_1

    .line 192
    :cond_2
    new-array v1, v3, [B

    .line 193
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-ge v5, v3, :cond_1

    .line 194
    aget-byte v12, v2, v5

    aput-byte v12, v1, v5

    .line 193
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 200
    .end local v1    # "block":[B
    .end local v5    # "i":I
    :cond_3
    new-instance p0, Ljava/lang/String;

    .end local p0    # "data":Ljava/lang/String;
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    invoke-direct {p0, v12}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public static decryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "pPubkey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 124
    sget-boolean v12, Lcom/youai/dreamonepiece/YouaiConfig;->encryptData:Z

    if-nez v12, :cond_0

    .line 157
    .end local p0    # "data":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 127
    .restart local p0    # "data":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/youai/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v8

    .line 128
    .local v8, "pub_key":[B
    new-instance v11, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v11, v8}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 130
    .local v11, "x509KeySpec":Ljava/security/spec/X509EncodedKeySpec;
    const-string v12, "RSA"

    invoke-static {v12}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v7

    .line 131
    .local v7, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v7, v11}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v9

    .line 132
    .local v9, "publicKey":Ljava/security/PublicKey;
    const-string v12, "RSA/None/PKCS1Padding"

    invoke-static {v12}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    .line 133
    .local v4, "cipher":Ljavax/crypto/Cipher;
    const/4 v12, 0x2

    invoke-virtual {v4, v12, v9}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 135
    invoke-static {p0}, Lcom/youai/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 137
    .local v0, "_data":[B
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 138
    .local v6, "ins":Ljava/io/InputStream;
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v10}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 139
    .local v10, "writer":Ljava/io/ByteArrayOutputStream;
    const/16 v12, 0x80

    new-array v2, v12, [B

    .line 142
    .local v2, "buf":[B
    :goto_1
    invoke-virtual {v6, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "bufl":I
    const/4 v12, -0x1

    if-eq v3, v12, :cond_3

    .line 143
    const/4 v1, 0x0

    .line 145
    .local v1, "block":[B
    array-length v12, v2

    if-ne v12, v3, :cond_2

    .line 146
    move-object v1, v2

    .line 154
    :cond_1
    invoke-virtual {v4, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_1

    .line 148
    :cond_2
    new-array v1, v3, [B

    .line 149
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-ge v5, v3, :cond_1

    .line 150
    aget-byte v12, v2, v5

    aput-byte v12, v1, v5

    .line 149
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 157
    .end local v1    # "block":[B
    .end local v5    # "i":I
    :cond_3
    new-instance p0, Ljava/lang/String;

    .end local p0    # "data":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    invoke-direct {p0, v12}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public static encryptByPriKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "pPrikey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 83
    sget-boolean v11, Lcom/youai/dreamonepiece/YouaiConfig;->encryptData:Z

    if-nez v11, :cond_0

    .line 113
    .end local p0    # "data":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 86
    .restart local p0    # "data":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/youai/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v8

    .line 87
    .local v8, "pri_key":[B
    new-instance v7, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v7, v8}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 88
    .local v7, "pkcs8KeySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    const-string v11, "RSA"

    invoke-static {v11}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v6

    .line 89
    .local v6, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v6, v7}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v9

    .line 90
    .local v9, "privateKey":Ljava/security/PrivateKey;
    const-string v11, "RSA/None/PKCS1Padding"

    invoke-static {v11}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    .line 91
    .local v3, "cipher":Ljavax/crypto/Cipher;
    const/4 v11, 0x1

    invoke-virtual {v3, v11, v9}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 93
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v11

    invoke-direct {v5, v11}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 94
    .local v5, "ins":Ljava/io/InputStream;
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v10}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 95
    .local v10, "writer":Ljava/io/ByteArrayOutputStream;
    const/16 v11, 0x64

    new-array v1, v11, [B

    .line 98
    .local v1, "buf":[B
    :goto_1
    invoke-virtual {v5, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "bufl":I
    const/4 v11, -0x1

    if-eq v2, v11, :cond_3

    .line 99
    const/4 v0, 0x0

    .line 101
    .local v0, "block":[B
    array-length v11, v1

    if-ne v11, v2, :cond_2

    .line 102
    move-object v0, v1

    .line 110
    :cond_1
    invoke-virtual {v3, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_1

    .line 104
    :cond_2
    new-array v0, v2, [B

    .line 105
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    if-ge v4, v2, :cond_1

    .line 106
    aget-byte v11, v1, v4

    aput-byte v11, v0, v4

    .line 105
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 113
    .end local v0    # "block":[B
    .end local v4    # "i":I
    :cond_3
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    invoke-static {v11}, Lcom/youai/Base64;->encode([B)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static encryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "pPubkey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    sget-boolean v11, Lcom/youai/dreamonepiece/YouaiConfig;->encryptData:Z

    if-nez v11, :cond_0

    .line 71
    .end local p0    # "data":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 44
    .restart local p0    # "data":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lcom/youai/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v7

    .line 45
    .local v7, "pub_key":[B
    new-instance v10, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v10, v7}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 46
    .local v10, "x509KeySpec":Ljava/security/spec/X509EncodedKeySpec;
    const-string v11, "RSA"

    invoke-static {v11}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v6

    .line 47
    .local v6, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v6, v10}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v8

    .line 48
    .local v8, "publicKey":Ljava/security/PublicKey;
    const-string v11, "RSA/None/PKCS1Padding"

    invoke-static {v11}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    .line 49
    .local v3, "cipher":Ljavax/crypto/Cipher;
    const/4 v11, 0x1

    invoke-virtual {v3, v11, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 51
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v11

    invoke-direct {v5, v11}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 52
    .local v5, "ins":Ljava/io/InputStream;
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 53
    .local v9, "writer":Ljava/io/ByteArrayOutputStream;
    const/16 v11, 0x64

    new-array v1, v11, [B

    .line 56
    .local v1, "buf":[B
    :goto_1
    invoke-virtual {v5, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "bufl":I
    const/4 v11, -0x1

    if-eq v2, v11, :cond_3

    .line 57
    const/4 v0, 0x0

    .line 59
    .local v0, "block":[B
    array-length v11, v1

    if-ne v11, v2, :cond_2

    .line 60
    move-object v0, v1

    .line 68
    :cond_1
    invoke-virtual {v3, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_1

    .line 62
    :cond_2
    new-array v0, v2, [B

    .line 63
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    if-ge v4, v2, :cond_1

    .line 64
    aget-byte v11, v1, v4

    aput-byte v11, v0, v4

    .line 63
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 71
    .end local v0    # "block":[B
    .end local v4    # "i":I
    :cond_3
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    invoke-static {v11}, Lcom/youai/Base64;->encode([B)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static main()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 204
    const-string v0, "xI9dZDFZZ4Oq7fcpx3W+jlrxee8IcVl/htPT+XsO3m8QTpwqQG6wzYk9NK1i8Lq49UZbtLYo/q2kSouU0szpQccAwkxDUUE3S7373ihru5boabtpzyePCwoO1ghQ1I3GgdCQ40Caej3J1rGzUHot42Zy2Rc06qoyDJlnmKHIJrQ="

    .line 205
    .local v0, "str":Ljava/lang/String;
    const-string v2, "str:"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    const-string v2, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIYMeruGjt8VREeGaC2rGz5lLD\rRrViyx7YYKvRF+036b6CnyFuVyQvl0Q+rZPtA4LidMhbHKQz9C5EhtXdhrKwgqt0\rloWYnzYef7i6tvVoCowI1tHBuiTJruekDyCQwAwqAttEKt/FNGpKhMBjCAj9xIWL\reaC0xySsOY6JzDtokQIDAQAB"

    invoke-static {v0, v2}, Lcom/youai/RSAUtil;->decryptByPubKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "strencrypbypubkey":Ljava/lang/String;
    const-string v2, "strencrypbypubkey:"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    return-void
.end method
