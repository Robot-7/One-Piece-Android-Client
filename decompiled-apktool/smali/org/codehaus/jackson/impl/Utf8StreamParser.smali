.class public final Lorg/codehaus/jackson/impl/Utf8StreamParser;
.super Lorg/codehaus/jackson/impl/JsonParserBase;
.source "Utf8StreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/codehaus/jackson/impl/Utf8StreamParser$1;
    }
.end annotation


# static fields
.field static final BYTE_LF:B = 0xat

.field private static final sInputCodesLatin1:[I

.field private static final sInputCodesUtf8:[I


# instance fields
.field protected _bufferRecyclable:Z

.field protected _inputBuffer:[B

.field protected _inputStream:Ljava/io/InputStream;

.field protected _objectCodec:Lorg/codehaus/jackson/ObjectCodec;

.field private _quad1:I

.field protected _quadBuffer:[I

.field protected final _symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

.field protected _tokenIncomplete:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    invoke-static {}, Lorg/codehaus/jackson/util/CharTypes;->getInputCodeUtf8()[I

    move-result-object v0

    sput-object v0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesUtf8:[I

    .line 25
    invoke-static {}, Lorg/codehaus/jackson/util/CharTypes;->getInputCodeLatin1()[I

    move-result-object v0

    sput-object v0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesLatin1:[I

    return-void
.end method

.method public constructor <init>(Lorg/codehaus/jackson/io/IOContext;ILjava/io/InputStream;Lorg/codehaus/jackson/ObjectCodec;Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;[BIIZ)V
    .locals 1
    .param p1, "ctxt"    # Lorg/codehaus/jackson/io/IOContext;
    .param p2, "features"    # I
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "codec"    # Lorg/codehaus/jackson/ObjectCodec;
    .param p5, "sym"    # Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;
    .param p6, "inputBuffer"    # [B
    .param p7, "start"    # I
    .param p8, "end"    # I
    .param p9, "bufferRecyclable"    # Z

    .prologue
    .line 109
    invoke-direct {p0, p1, p2}, Lorg/codehaus/jackson/impl/JsonParserBase;-><init>(Lorg/codehaus/jackson/io/IOContext;I)V

    .line 54
    const/16 v0, 0x10

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 110
    iput-object p3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    .line 111
    iput-object p4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_objectCodec:Lorg/codehaus/jackson/ObjectCodec;

    .line 112
    iput-object p5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    .line 113
    iput-object p6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 114
    iput p7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 115
    iput p8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    .line 116
    iput-boolean p9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_bufferRecyclable:Z

    .line 118
    sget-object v0, Lorg/codehaus/jackson/JsonParser$Feature;->CANONICALIZE_FIELD_NAMES:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {v0, p2}, Lorg/codehaus/jackson/JsonParser$Feature;->enabledIn(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwInternal()V

    .line 122
    :cond_0
    return-void
.end method

.method private final _decodeUtf8_2(I)I
    .locals 4
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2593
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_0

    .line 2594
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2596
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2597
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_1

    .line 2598
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2600
    :cond_1
    and-int/lit8 v1, p1, 0x1f

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int/2addr v1, v2

    return v1
.end method

.method private final _decodeUtf8_3(I)I
    .locals 6
    .param p1, "c1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x80

    .line 2606
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_0

    .line 2607
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2609
    :cond_0
    and-int/lit8 p1, p1, 0xf

    .line 2610
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 2611
    .local v1, "d":I
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_1

    .line 2612
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2614
    :cond_1
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 2615
    .local v0, "c":I
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_2

    .line 2616
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2618
    :cond_2
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 2619
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_3

    .line 2620
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2622
    :cond_3
    shl-int/lit8 v2, v0, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 2623
    return v0
.end method

.method private final _decodeUtf8_3fast(I)I
    .locals 6
    .param p1, "c1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x80

    .line 2629
    and-int/lit8 p1, p1, 0xf

    .line 2630
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 2631
    .local v1, "d":I
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_0

    .line 2632
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2634
    :cond_0
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 2635
    .local v0, "c":I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 2636
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_1

    .line 2637
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2639
    :cond_1
    shl-int/lit8 v2, v0, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 2640
    return v0
.end method

.method private final _decodeUtf8_4(I)I
    .locals 5
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x80

    .line 2650
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_0

    .line 2651
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2653
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2654
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_1

    .line 2655
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2657
    :cond_1
    and-int/lit8 v1, p1, 0x7

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int p1, v1, v2

    .line 2659
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_2

    .line 2660
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2662
    :cond_2
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2663
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_3

    .line 2664
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2666
    :cond_3
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int p1, v1, v2

    .line 2667
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_4

    .line 2668
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2670
    :cond_4
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2671
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_5

    .line 2672
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2678
    :cond_5
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int/2addr v1, v2

    const/high16 v2, 0x10000

    sub-int/2addr v1, v2

    return v1
.end method

.method private final _finishString2([CI)V
    .locals 9
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1908
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesUtf8:[I

    .line 1909
    .local v1, "codes":[I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 1916
    .local v2, "inputBuffer":[B
    :goto_0
    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1917
    .local v5, "ptr":I
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v5, v7, :cond_0

    .line 1918
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 1919
    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1921
    :cond_0
    array-length v7, p1

    if-lt p2, v7, :cond_1

    .line 1922
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v7}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1923
    const/4 p2, 0x0

    .line 1925
    :cond_1
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    array-length v8, p1

    sub-int/2addr v8, p2

    add-int/2addr v8, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v3

    .local v3, "max":I
    move v6, v5

    .end local v5    # "ptr":I
    .local v6, "ptr":I
    move v4, p2

    .line 1926
    .end local p2    # "outPtr":I
    .local v4, "outPtr":I
    :goto_1
    if-ge v6, v3, :cond_3

    .line 1927
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "ptr":I
    .restart local v5    # "ptr":I
    aget-byte v7, v2, v6

    and-int/lit16 v0, v7, 0xff

    .line 1928
    .local v0, "c":I
    aget v7, v1, v0

    if-eqz v7, :cond_2

    .line 1929
    iput v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1937
    const/16 v7, 0x22

    if-ne v0, v7, :cond_4

    .line 1983
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v7, v4}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 1984
    return-void

    .line 1932
    :cond_2
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    int-to-char v7, v0

    aput-char v7, p1, v4

    move v6, v5

    .end local v5    # "ptr":I
    .restart local v6    # "ptr":I
    move v4, p2

    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    goto :goto_1

    .line 1934
    .end local v0    # "c":I
    :cond_3
    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    move p2, v4

    .line 1935
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_0

    .line 1941
    .end local v6    # "ptr":I
    .end local p2    # "outPtr":I
    .restart local v0    # "c":I
    .restart local v4    # "outPtr":I
    .restart local v5    # "ptr":I
    :cond_4
    aget v7, v1, v0

    packed-switch v7, :pswitch_data_0

    .line 1967
    const/16 v7, 0x20

    if-ge v0, v7, :cond_8

    .line 1969
    const-string v7, "string value"

    invoke-virtual {p0, v0, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    move p2, v4

    .line 1976
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_2
    array-length v7, p1

    if-lt p2, v7, :cond_5

    .line 1977
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v7}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1978
    const/4 p2, 0x0

    .line 1981
    :cond_5
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    int-to-char v7, v0

    aput-char v7, p1, p2

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_0

    .line 1943
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_0
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeEscaped()C

    move-result v0

    move p2, v4

    .line 1944
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2

    .line 1946
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_1
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_2(I)I

    move-result v0

    move p2, v4

    .line 1947
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2

    .line 1949
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_2
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    sub-int/2addr v7, v8

    const/4 v8, 0x2

    if-lt v7, v8, :cond_6

    .line 1950
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_3fast(I)I

    move-result v0

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2

    .line 1952
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_6
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_3(I)I

    move-result v0

    move p2, v4

    .line 1954
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2

    .line 1956
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_3
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 1958
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    const v7, 0xd800

    shr-int/lit8 v8, v0, 0xa

    or-int/2addr v7, v8

    int-to-char v7, v7

    aput-char v7, p1, v4

    .line 1959
    array-length v7, p1

    if-lt p2, v7, :cond_7

    .line 1960
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v7}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1961
    const/4 p2, 0x0

    .line 1963
    :cond_7
    const v7, 0xdc00

    and-int/lit16 v8, v0, 0x3ff

    or-int v0, v7, v8

    .line 1965
    goto :goto_2

    .line 1972
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_8
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidChar(I)V

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2

    .line 1941
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private final _isNextTokenNameNo(I)V
    .locals 5
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 799
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parseFieldName(I)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 800
    .local v0, "n":Lorg/codehaus/jackson/sym/Name;
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v0}, Lorg/codehaus/jackson/sym/Name;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 801
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 802
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result p1

    .line 803
    const/16 v2, 0x3a

    if-eq p1, v2, :cond_0

    .line 804
    const-string v2, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, p1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 806
    :cond_0
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result p1

    .line 809
    const/16 v2, 0x22

    if-ne p1, v2, :cond_1

    .line 810
    iput-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 811
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 856
    :goto_0
    return-void

    .line 816
    :cond_1
    sparse-switch p1, :sswitch_data_0

    .line 853
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleUnexpectedValue(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    .line 855
    .local v1, "t":Lorg/codehaus/jackson/JsonToken;
    :goto_1
    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 818
    .end local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_0
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    .line 819
    .restart local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 821
    .end local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_1
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    .line 822
    .restart local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 825
    .end local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_2
    const-string v2, "expected a value"

    invoke-virtual {p0, p1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 827
    :sswitch_3
    const-string v2, "true"

    invoke-virtual {p0, v2, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 828
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_TRUE:Lorg/codehaus/jackson/JsonToken;

    .line 829
    .restart local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 831
    .end local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_4
    const-string v2, "false"

    invoke-virtual {p0, v2, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 832
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_FALSE:Lorg/codehaus/jackson/JsonToken;

    .line 833
    .restart local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 835
    .end local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_5
    const-string v2, "null"

    invoke-virtual {p0, v2, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 836
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_NULL:Lorg/codehaus/jackson/JsonToken;

    .line 837
    .restart local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 850
    .end local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_6
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseNumberText(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    .line 851
    .restart local v1    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 816
    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_6
        0x30 -> :sswitch_6
        0x31 -> :sswitch_6
        0x32 -> :sswitch_6
        0x33 -> :sswitch_6
        0x34 -> :sswitch_6
        0x35 -> :sswitch_6
        0x36 -> :sswitch_6
        0x37 -> :sswitch_6
        0x38 -> :sswitch_6
        0x39 -> :sswitch_6
        0x5b -> :sswitch_0
        0x5d -> :sswitch_2
        0x66 -> :sswitch_4
        0x6e -> :sswitch_5
        0x74 -> :sswitch_3
        0x7b -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method private final _isNextTokenNameYes()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 727
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-ge v1, v2, :cond_5

    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    const/16 v2, 0x3a

    if-ne v1, v2, :cond_5

    .line 728
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 729
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 730
    .local v0, "i":I
    const/16 v1, 0x22

    if-ne v0, v1, :cond_0

    .line 731
    iput-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 732
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 792
    :goto_0
    return-void

    .line 735
    :cond_0
    const/16 v1, 0x7b

    if-ne v0, v1, :cond_1

    .line 736
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 739
    :cond_1
    const/16 v1, 0x5b

    if-ne v0, v1, :cond_2

    .line 740
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 743
    :cond_2
    and-int/lit16 v0, v0, 0xff

    .line 744
    const/16 v1, 0x20

    if-le v0, v1, :cond_3

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_4

    .line 745
    :cond_3
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 746
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result v0

    .line 751
    :cond_4
    :goto_1
    sparse-switch v0, :sswitch_data_0

    .line 791
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleUnexpectedValue(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 749
    .end local v0    # "i":I
    :cond_5
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipColon()I

    move-result v0

    .restart local v0    # "i":I
    goto :goto_1

    .line 753
    :sswitch_0
    iput-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 754
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 757
    :sswitch_1
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 760
    :sswitch_2
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 764
    :sswitch_3
    const-string v1, "expected a value"

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 766
    :sswitch_4
    const-string v1, "true"

    invoke-virtual {p0, v1, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 767
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_TRUE:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 770
    :sswitch_5
    const-string v1, "false"

    invoke-virtual {p0, v1, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 771
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_FALSE:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 774
    :sswitch_6
    const-string v1, "null"

    invoke-virtual {p0, v1, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 775
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_NULL:Lorg/codehaus/jackson/JsonToken;

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 788
    :sswitch_7
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseNumberText(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 751
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x2d -> :sswitch_7
        0x30 -> :sswitch_7
        0x31 -> :sswitch_7
        0x32 -> :sswitch_7
        0x33 -> :sswitch_7
        0x34 -> :sswitch_7
        0x35 -> :sswitch_7
        0x36 -> :sswitch_7
        0x37 -> :sswitch_7
        0x38 -> :sswitch_7
        0x39 -> :sswitch_7
        0x5b -> :sswitch_1
        0x5d -> :sswitch_3
        0x66 -> :sswitch_5
        0x6e -> :sswitch_6
        0x74 -> :sswitch_4
        0x7b -> :sswitch_2
        0x7d -> :sswitch_3
    .end sparse-switch
.end method

.method private final _nextAfterName()Lorg/codehaus/jackson/JsonToken;
    .locals 4

    .prologue
    .line 605
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    .line 606
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 607
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 609
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_1

    .line 610
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildArrayContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 614
    :cond_0
    :goto_0
    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    return-object v0

    .line 611
    :cond_1
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_0

    .line 612
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildObjectContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0
.end method

.method private final _nextTokenNotInObject(I)Lorg/codehaus/jackson/JsonToken;
    .locals 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 558
    const/16 v0, 0x22

    if-ne p1, v0, :cond_0

    .line 559
    iput-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 560
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 600
    :goto_0
    return-object v0

    .line 562
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 600
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleUnexpectedValue(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 564
    :sswitch_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildArrayContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 565
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 567
    :sswitch_1
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildObjectContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 568
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 573
    :sswitch_2
    const-string v0, "expected a value"

    invoke-virtual {p0, p1, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 575
    :sswitch_3
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 576
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->VALUE_TRUE:Lorg/codehaus/jackson/JsonToken;

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 578
    :sswitch_4
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 579
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->VALUE_FALSE:Lorg/codehaus/jackson/JsonToken;

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 581
    :sswitch_5
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 582
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->VALUE_NULL:Lorg/codehaus/jackson/JsonToken;

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 598
    :sswitch_6
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseNumberText(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 562
    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_6
        0x30 -> :sswitch_6
        0x31 -> :sswitch_6
        0x32 -> :sswitch_6
        0x33 -> :sswitch_6
        0x34 -> :sswitch_6
        0x35 -> :sswitch_6
        0x36 -> :sswitch_6
        0x37 -> :sswitch_6
        0x38 -> :sswitch_6
        0x39 -> :sswitch_6
        0x5b -> :sswitch_0
        0x5d -> :sswitch_2
        0x66 -> :sswitch_4
        0x6e -> :sswitch_5
        0x74 -> :sswitch_3
        0x7b -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method private final _parseFloatText([CIIZI)Lorg/codehaus/jackson/JsonToken;
    .locals 9
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "c"    # I
    .param p4, "negative"    # Z
    .param p5, "integerPartLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x39

    const/16 v7, 0x30

    .line 1125
    const/4 v2, 0x0

    .line 1126
    .local v2, "fractLen":I
    const/4 v0, 0x0

    .line 1129
    .local v0, "eof":Z
    const/16 v4, 0x2e

    if-ne p3, v4, :cond_1

    .line 1130
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v3

    .line 1134
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_0
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_b

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v4

    if-nez v4, :cond_b

    .line 1135
    const/4 v0, 0x1

    .line 1150
    :cond_0
    if-nez v2, :cond_1

    .line 1151
    const-string v4, "Decimal point not followed by a digit"

    invoke-virtual {p0, p3, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1155
    :cond_1
    const/4 v1, 0x0

    .line 1156
    .local v1, "expLen":I
    const/16 v4, 0x65

    if-eq p3, v4, :cond_2

    const/16 v4, 0x45

    if-ne p3, v4, :cond_9

    .line 1157
    :cond_2
    array-length v4, p1

    if-lt p2, v4, :cond_3

    .line 1158
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v4}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1159
    const/4 p2, 0x0

    .line 1161
    :cond_3
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1163
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_4

    .line 1164
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 1166
    :cond_4
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    .line 1168
    const/16 v4, 0x2d

    if-eq p3, v4, :cond_5

    const/16 v4, 0x2b

    if-ne p3, v4, :cond_f

    .line 1169
    :cond_5
    array-length v4, p1

    if-lt v3, v4, :cond_e

    .line 1170
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v4}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1171
    const/4 p2, 0x0

    .line 1173
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_1
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1175
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_6

    .line 1176
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 1178
    :cond_6
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    move p2, v3

    .line 1182
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_2
    if-gt p3, v8, :cond_8

    if-lt p3, v7, :cond_8

    .line 1183
    add-int/lit8 v1, v1, 0x1

    .line 1184
    array-length v4, p1

    if-lt p2, v4, :cond_7

    .line 1185
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v4}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1186
    const/4 p2, 0x0

    .line 1188
    :cond_7
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1189
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_d

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v4

    if-nez v4, :cond_d

    .line 1190
    const/4 v0, 0x1

    move p2, v3

    .line 1196
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_8
    if-nez v1, :cond_9

    .line 1197
    const-string v4, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p3, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1202
    :cond_9
    if-nez v0, :cond_a

    .line 1203
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1205
    :cond_a
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v4, p2}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 1208
    invoke-virtual {p0, p4, p5, v2, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetFloat(ZIII)Lorg/codehaus/jackson/JsonToken;

    move-result-object v4

    return-object v4

    .line 1138
    .end local v1    # "expLen":I
    :cond_b
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    .line 1139
    if-lt p3, v7, :cond_0

    if-gt p3, v8, :cond_0

    .line 1142
    add-int/lit8 v2, v2, 0x1

    .line 1143
    array-length v4, p1

    if-lt p2, v4, :cond_c

    .line 1144
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v4}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1145
    const/4 p2, 0x0

    .line 1147
    :cond_c
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto/16 :goto_0

    .line 1193
    .end local p2    # "outPtr":I
    .restart local v1    # "expLen":I
    .restart local v3    # "outPtr":I
    :cond_d
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    :cond_e
    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto/16 :goto_1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    :cond_f
    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_2
.end method

.method private final _parserNumber2([CIZI)Lorg/codehaus/jackson/JsonToken;
    .locals 7
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "negative"    # Z
    .param p4, "intPartLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1058
    :goto_0
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1059
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0, p2}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 1060
    invoke-virtual {p0, p3, p4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetInt(ZI)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    .line 1080
    :goto_1
    return-object v0

    .line 1062
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v3, v0, 0xff

    .line 1063
    .local v3, "c":I
    const/16 v0, 0x39

    if-gt v3, v0, :cond_1

    const/16 v0, 0x30

    if-ge v3, v0, :cond_3

    .line 1064
    :cond_1
    const/16 v0, 0x2e

    if-eq v3, v0, :cond_2

    const/16 v0, 0x65

    if-eq v3, v0, :cond_2

    const/16 v0, 0x45

    if-ne v3, v0, :cond_5

    :cond_2
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    .line 1065
    invoke-direct/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parseFloatText([CIIZI)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 1069
    :cond_3
    array-length v0, p1

    if-lt p2, v0, :cond_4

    .line 1070
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1071
    const/4 p2, 0x0

    .line 1073
    :cond_4
    add-int/lit8 v6, p2, 0x1

    .end local p2    # "outPtr":I
    .local v6, "outPtr":I
    int-to-char v0, v3

    aput-char v0, p1, p2

    .line 1074
    add-int/lit8 p4, p4, 0x1

    move p2, v6

    .line 1075
    .end local v6    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_0

    .line 1076
    :cond_5
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1077
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0, p2}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 1080
    invoke-virtual {p0, p3, p4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetInt(ZI)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1
.end method

.method private final _skipCComment()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2427
    invoke-static {}, Lorg/codehaus/jackson/util/CharTypes;->getInputCodeComment()[I

    move-result-object v1

    .line 2430
    .local v1, "codes":[I
    :cond_0
    :goto_0
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v4, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2431
    :cond_1
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    .line 2432
    .local v2, "i":I
    aget v0, v1, v2

    .line 2433
    .local v0, "code":I
    if-eqz v0, :cond_0

    .line 2434
    sparse-switch v0, :sswitch_data_0

    .line 2449
    invoke-virtual {p0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidChar(I)V

    goto :goto_0

    .line 2436
    :sswitch_0
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v4

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_0

    .line 2437
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2454
    .end local v0    # "code":I
    .end local v2    # "i":I
    :goto_1
    return-void

    .line 2442
    .restart local v0    # "code":I
    .restart local v2    # "i":I
    :sswitch_1
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipLF()V

    goto :goto_0

    .line 2445
    :sswitch_2
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCR()V

    goto :goto_0

    .line 2453
    .end local v0    # "code":I
    .end local v2    # "i":I
    :cond_2
    const-string v3, " in a comment"

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    goto :goto_1

    .line 2434
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_1
        0xd -> :sswitch_2
        0x2a -> :sswitch_0
    .end sparse-switch
.end method

.method private final _skipColon()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x3a

    const/16 v6, 0x2f

    const/16 v5, 0x20

    .line 2335
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_0

    .line 2336
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2339
    :cond_0
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v2, v3

    .line 2340
    .local v0, "i":I
    if-ne v0, v7, :cond_1

    .line 2341
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-ge v2, v3, :cond_4

    .line 2342
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2343
    if-le v0, v5, :cond_4

    if-eq v0, v6, :cond_4

    .line 2344
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    move v1, v0

    .line 2387
    .end local v0    # "i":I
    .local v1, "i":I
    :goto_0
    return v1

    .line 2350
    .end local v1    # "i":I
    .restart local v0    # "i":I
    :cond_1
    and-int/lit16 v0, v0, 0xff

    .line 2354
    :goto_1
    sparse-switch v0, :sswitch_data_0

    .line 2367
    if-ge v0, v5, :cond_2

    .line 2368
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwInvalidSpace(I)V

    .line 2373
    :cond_2
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_3

    .line 2374
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2376
    :cond_3
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2377
    if-eq v0, v7, :cond_4

    .line 2378
    const-string v2, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, v0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2383
    :cond_4
    :goto_2
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_5

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 2384
    :cond_5
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2385
    if-le v0, v5, :cond_7

    .line 2386
    if-eq v0, v6, :cond_6

    move v1, v0

    .line 2387
    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 2358
    .end local v1    # "i":I
    .restart local v0    # "i":I
    :sswitch_0
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCR()V

    goto :goto_1

    .line 2361
    :sswitch_1
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipLF()V

    goto :goto_1

    .line 2364
    :sswitch_2
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipComment()V

    goto :goto_1

    .line 2389
    :cond_6
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipComment()V

    goto :goto_2

    .line 2390
    :cond_7
    if-eq v0, v5, :cond_4

    .line 2391
    const/16 v2, 0xa

    if-ne v0, v2, :cond_8

    .line 2392
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipLF()V

    goto :goto_2

    .line 2393
    :cond_8
    const/16 v2, 0xd

    if-ne v0, v2, :cond_9

    .line 2394
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCR()V

    goto :goto_2

    .line 2395
    :cond_9
    const/16 v2, 0x9

    if-eq v0, v2, :cond_4

    .line 2396
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2400
    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected end-of-input within/between "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " entries"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_constructError(Ljava/lang/String;)Lorg/codehaus/jackson/JsonParseException;

    move-result-object v2

    throw v2

    .line 2354
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_1
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x2f -> :sswitch_2
    .end sparse-switch
.end method

.method private final _skipComment()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2f

    .line 2406
    sget-object v1, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_COMMENTS:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2407
    const-string v1, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v4, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2410
    :cond_0
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2411
    const-string v1, " in a comment"

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2413
    :cond_1
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2414
    .local v0, "c":I
    if-ne v0, v4, :cond_2

    .line 2415
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCppComment()V

    .line 2421
    :goto_0
    return-void

    .line 2416
    :cond_2
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_3

    .line 2417
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCComment()V

    goto :goto_0

    .line 2419
    :cond_3
    const-string v1, "was expecting either \'*\' or \'/\' for a comment"

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    goto :goto_0
.end method

.method private final _skipCppComment()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2460
    invoke-static {}, Lorg/codehaus/jackson/util/CharTypes;->getInputCodeComment()[I

    move-result-object v1

    .line 2461
    .local v1, "codes":[I
    :cond_0
    :goto_0
    :sswitch_0
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v4, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2462
    :cond_1
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    .line 2463
    .local v2, "i":I
    aget v0, v1, v2

    .line 2464
    .local v0, "code":I
    if-eqz v0, :cond_0

    .line 2465
    sparse-switch v0, :sswitch_data_0

    .line 2476
    invoke-virtual {p0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidChar(I)V

    goto :goto_0

    .line 2467
    :sswitch_1
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipLF()V

    .line 2480
    .end local v0    # "code":I
    .end local v2    # "i":I
    :cond_2
    :goto_1
    return-void

    .line 2470
    .restart local v0    # "code":I
    .restart local v2    # "i":I
    :sswitch_2
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCR()V

    goto :goto_1

    .line 2465
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_1
        0xd -> :sswitch_2
        0x2a -> :sswitch_0
    .end sparse-switch
.end method

.method private final _skipUtf8_2(I)V
    .locals 3
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2684
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 2685
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2687
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 2688
    and-int/lit16 v0, p1, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_1

    .line 2689
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2691
    :cond_1
    return-void
.end method

.method private final _skipUtf8_3(I)V
    .locals 4
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x80

    .line 2699
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 2700
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2703
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 2704
    and-int/lit16 v0, p1, 0xc0

    if-eq v0, v3, :cond_1

    .line 2705
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2707
    :cond_1
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_2

    .line 2708
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2710
    :cond_2
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 2711
    and-int/lit16 v0, p1, 0xc0

    if-eq v0, v3, :cond_3

    .line 2712
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2714
    :cond_3
    return-void
.end method

.method private final _skipUtf8_4(I)V
    .locals 5
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x80

    .line 2719
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_0

    .line 2720
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2722
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2723
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_1

    .line 2724
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2726
    :cond_1
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_2

    .line 2727
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2729
    :cond_2
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_3

    .line 2730
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2732
    :cond_3
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_4

    .line 2733
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2735
    :cond_4
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2736
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_5

    .line 2737
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(II)V

    .line 2739
    :cond_5
    return-void
.end method

.method private final _skipWS()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2281
    :cond_0
    :goto_0
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 2282
    :cond_1
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2283
    .local v0, "i":I
    if-le v0, v4, :cond_3

    .line 2284
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2

    .line 2285
    return v0

    .line 2287
    :cond_2
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipComment()V

    goto :goto_0

    .line 2288
    :cond_3
    if-eq v0, v4, :cond_0

    .line 2289
    const/16 v1, 0xa

    if-ne v0, v1, :cond_4

    .line 2290
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipLF()V

    goto :goto_0

    .line 2291
    :cond_4
    const/16 v1, 0xd

    if-ne v0, v1, :cond_5

    .line 2292
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCR()V

    goto :goto_0

    .line 2293
    :cond_5
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 2294
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwInvalidSpace(I)V

    goto :goto_0

    .line 2298
    .end local v0    # "i":I
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected end-of-input within/between "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v2}, Lorg/codehaus/jackson/impl/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_constructError(Ljava/lang/String;)Lorg/codehaus/jackson/JsonParseException;

    move-result-object v1

    throw v1
.end method

.method private final _skipWSOrEnd()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2304
    :cond_0
    :goto_0
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v1, v2, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 2305
    :cond_1
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2306
    .local v0, "i":I
    if-le v0, v4, :cond_3

    .line 2307
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2

    .line 2323
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 2310
    .restart local v0    # "i":I
    :cond_2
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipComment()V

    goto :goto_0

    .line 2311
    :cond_3
    if-eq v0, v4, :cond_0

    .line 2312
    const/16 v1, 0xa

    if-ne v0, v1, :cond_4

    .line 2313
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipLF()V

    goto :goto_0

    .line 2314
    :cond_4
    const/16 v1, 0xd

    if-ne v0, v1, :cond_5

    .line 2315
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipCR()V

    goto :goto_0

    .line 2316
    :cond_5
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 2317
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwInvalidSpace(I)V

    goto :goto_0

    .line 2322
    .end local v0    # "i":I
    :cond_6
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleEOF()V

    .line 2323
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private final _verifyNoLeadingZeroes()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x39

    const/16 v1, 0x30

    .line 1092
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    .line 1118
    :cond_0
    :goto_0
    return v0

    .line 1095
    :cond_1
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 1097
    .local v0, "ch":I
    if-lt v0, v1, :cond_2

    if-le v0, v4, :cond_3

    :cond_2
    move v0, v1

    .line 1098
    goto :goto_0

    .line 1101
    :cond_3
    sget-object v2, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1102
    const-string v2, "Leading zeroes not allowed"

    invoke-virtual {p0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1105
    :cond_4
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1106
    if-ne v0, v1, :cond_0

    .line 1107
    :cond_5
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v2, v3, :cond_6

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1108
    :cond_6
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 1109
    if-lt v0, v1, :cond_7

    if-le v0, v4, :cond_8

    :cond_7
    move v0, v1

    .line 1110
    goto :goto_0

    .line 1112
    :cond_8
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1113
    if-eq v0, v1, :cond_5

    goto :goto_0
.end method

.method private final addName([III)Lorg/codehaus/jackson/sym/Name;
    .locals 14
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1762
    shl-int/lit8 v12, p2, 0x2

    add-int/lit8 v12, v12, -0x4

    add-int v3, v12, p3

    .line 1771
    .local v3, "byteLen":I
    const/4 v12, 0x4

    move/from16 v0, p3

    if-ge v0, v12, :cond_7

    .line 1772
    add-int/lit8 v12, p2, -0x1

    aget v10, p1, v12

    .line 1774
    .local v10, "lastQuad":I
    add-int/lit8 v12, p2, -0x1

    rsub-int/lit8 v13, p3, 0x4

    shl-int/lit8 v13, v13, 0x3

    shl-int v13, v10, v13

    aput v13, p1, v12

    .line 1780
    :goto_0
    iget-object v12, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v12}, Lorg/codehaus/jackson/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1781
    .local v4, "cbuf":[C
    const/4 v7, 0x0

    .line 1783
    .local v7, "cix":I
    const/4 v9, 0x0

    .local v9, "ix":I
    move v8, v7

    .end local v7    # "cix":I
    .local v8, "cix":I
    :goto_1
    if-ge v9, v3, :cond_b

    .line 1784
    shr-int/lit8 v12, v9, 0x2

    aget v5, p1, v12

    .line 1785
    .local v5, "ch":I
    and-int/lit8 v2, v9, 0x3

    .line 1786
    .local v2, "byteIx":I
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int v12, v5, v12

    and-int/lit16 v5, v12, 0xff

    .line 1787
    add-int/lit8 v9, v9, 0x1

    .line 1789
    const/16 v12, 0x7f

    if-le v5, v12, :cond_d

    .line 1791
    and-int/lit16 v12, v5, 0xe0

    const/16 v13, 0xc0

    if-ne v12, v13, :cond_8

    .line 1792
    and-int/lit8 v5, v5, 0x1f

    .line 1793
    const/4 v11, 0x1

    .line 1804
    .local v11, "needed":I
    :goto_2
    add-int v12, v9, v11

    if-le v12, v3, :cond_0

    .line 1805
    const-string v12, " in field name"

    invoke-virtual {p0, v12}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1809
    :cond_0
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 1810
    .local v6, "ch2":I
    and-int/lit8 v2, v9, 0x3

    .line 1811
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 1812
    add-int/lit8 v9, v9, 0x1

    .line 1814
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_1

    .line 1815
    invoke-virtual {p0, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 1817
    :cond_1
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 1818
    const/4 v12, 0x1

    if-le v11, v12, :cond_4

    .line 1819
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 1820
    and-int/lit8 v2, v9, 0x3

    .line 1821
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 1822
    add-int/lit8 v9, v9, 0x1

    .line 1824
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_2

    .line 1825
    invoke-virtual {p0, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 1827
    :cond_2
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 1828
    const/4 v12, 0x2

    if-le v11, v12, :cond_4

    .line 1829
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 1830
    and-int/lit8 v2, v9, 0x3

    .line 1831
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 1832
    add-int/lit8 v9, v9, 0x1

    .line 1833
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_3

    .line 1834
    and-int/lit16 v12, v6, 0xff

    invoke-virtual {p0, v12}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 1836
    :cond_3
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 1839
    :cond_4
    const/4 v12, 0x2

    if-le v11, v12, :cond_d

    .line 1840
    const/high16 v12, 0x10000

    sub-int/2addr v5, v12

    .line 1841
    array-length v12, v4

    if-lt v8, v12, :cond_5

    .line 1842
    iget-object v12, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v12}, Lorg/codehaus/jackson/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v4

    .line 1844
    :cond_5
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "cix":I
    .restart local v7    # "cix":I
    const v12, 0xd800

    shr-int/lit8 v13, v5, 0xa

    add-int/2addr v12, v13

    int-to-char v12, v12

    aput-char v12, v4, v8

    .line 1845
    const v12, 0xdc00

    and-int/lit16 v13, v5, 0x3ff

    or-int v5, v12, v13

    .line 1848
    .end local v6    # "ch2":I
    .end local v11    # "needed":I
    :goto_3
    array-length v12, v4

    if-lt v7, v12, :cond_6

    .line 1849
    iget-object v12, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v12}, Lorg/codehaus/jackson/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v4

    .line 1851
    :cond_6
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "cix":I
    .restart local v8    # "cix":I
    int-to-char v12, v5

    aput-char v12, v4, v7

    goto/16 :goto_1

    .line 1776
    .end local v2    # "byteIx":I
    .end local v4    # "cbuf":[C
    .end local v5    # "ch":I
    .end local v8    # "cix":I
    .end local v9    # "ix":I
    .end local v10    # "lastQuad":I
    :cond_7
    const/4 v10, 0x0

    .restart local v10    # "lastQuad":I
    goto/16 :goto_0

    .line 1794
    .restart local v2    # "byteIx":I
    .restart local v4    # "cbuf":[C
    .restart local v5    # "ch":I
    .restart local v8    # "cix":I
    .restart local v9    # "ix":I
    :cond_8
    and-int/lit16 v12, v5, 0xf0

    const/16 v13, 0xe0

    if-ne v12, v13, :cond_9

    .line 1795
    and-int/lit8 v5, v5, 0xf

    .line 1796
    const/4 v11, 0x2

    .restart local v11    # "needed":I
    goto/16 :goto_2

    .line 1797
    .end local v11    # "needed":I
    :cond_9
    and-int/lit16 v12, v5, 0xf8

    const/16 v13, 0xf0

    if-ne v12, v13, :cond_a

    .line 1798
    and-int/lit8 v5, v5, 0x7

    .line 1799
    const/4 v11, 0x3

    .restart local v11    # "needed":I
    goto/16 :goto_2

    .line 1801
    .end local v11    # "needed":I
    :cond_a
    invoke-virtual {p0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidInitial(I)V

    .line 1802
    const/4 v5, 0x1

    move v11, v5

    .restart local v11    # "needed":I
    goto/16 :goto_2

    .line 1855
    .end local v2    # "byteIx":I
    .end local v5    # "ch":I
    .end local v11    # "needed":I
    :cond_b
    new-instance v1, Ljava/lang/String;

    const/4 v12, 0x0

    invoke-direct {v1, v4, v12, v8}, Ljava/lang/String;-><init>([CII)V

    .line 1857
    .local v1, "baseName":Ljava/lang/String;
    const/4 v12, 0x4

    move/from16 v0, p3

    if-ge v0, v12, :cond_c

    .line 1858
    add-int/lit8 v12, p2, -0x1

    aput v10, p1, v12

    .line 1860
    :cond_c
    iget-object v12, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    move/from16 v0, p2

    invoke-virtual {v12, v1, p1, v0}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->addName(Ljava/lang/String;[II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v12

    return-object v12

    .end local v1    # "baseName":Ljava/lang/String;
    .restart local v2    # "byteIx":I
    .restart local v5    # "ch":I
    :cond_d
    move v7, v8

    .end local v8    # "cix":I
    .restart local v7    # "cix":I
    goto :goto_3
.end method

.method private final findName(II)Lorg/codehaus/jackson/sym/Name;
    .locals 3
    .param p1, "q1"    # I
    .param p2, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1711
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v1, p1}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->findName(I)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 1712
    .local v0, "name":Lorg/codehaus/jackson/sym/Name;
    if-eqz v0, :cond_0

    .line 1717
    .end local v0    # "name":Lorg/codehaus/jackson/sym/Name;
    :goto_0
    return-object v0

    .line 1716
    .restart local v0    # "name":Lorg/codehaus/jackson/sym/Name;
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1717
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->addName([III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_0
.end method

.method private final findName(III)Lorg/codehaus/jackson/sym/Name;
    .locals 3
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1724
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v1, p1, p2}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->findName(II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 1725
    .local v0, "name":Lorg/codehaus/jackson/sym/Name;
    if-eqz v0, :cond_0

    .line 1731
    .end local v0    # "name":Lorg/codehaus/jackson/sym/Name;
    :goto_0
    return-object v0

    .line 1729
    .restart local v0    # "name":Lorg/codehaus/jackson/sym/Name;
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1730
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 1731
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2, p3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->addName([III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_0
.end method

.method private final findName([IIII)Lorg/codehaus/jackson/sym/Name;
    .locals 3
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "lastQuad"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1737
    array-length v2, p1

    if-lt p2, v2, :cond_0

    .line 1738
    array-length v2, p1

    invoke-static {p1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1740
    :cond_0
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .local v1, "qlen":I
    aput p3, p1, p2

    .line 1741
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v2, p1, v1}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->findName([II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 1742
    .local v0, "name":Lorg/codehaus/jackson/sym/Name;
    if-nez v0, :cond_1

    .line 1743
    invoke-direct {p0, p1, v1, p4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->addName([III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 1745
    .end local v0    # "name":Lorg/codehaus/jackson/sym/Name;
    :cond_1
    return-object v0
.end method

.method public static growArrayBy([II)[I
    .locals 4
    .param p0, "arr"    # [I
    .param p1, "more"    # I

    .prologue
    const/4 v3, 0x0

    .line 2814
    if-nez p0, :cond_0

    .line 2815
    new-array p0, p1, [I

    .line 2821
    .end local p0    # "arr":[I
    :goto_0
    return-object p0

    .line 2817
    .restart local p0    # "arr":[I
    :cond_0
    move-object v1, p0

    .line 2818
    .local v1, "old":[I
    array-length v0, p0

    .line 2819
    .local v0, "len":I
    add-int v2, v0, p1

    new-array p0, v2, [I

    .line 2820
    invoke-static {v1, v3, p0, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method private nextByte()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2771
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 2772
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2774
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private final parseFieldName(III)Lorg/codehaus/jackson/sym/Name;
    .locals 6
    .param p1, "q1"    # I
    .param p2, "ch"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1404
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    return-object v0
.end method

.method private final parseFieldName(IIII)Lorg/codehaus/jackson/sym/Name;
    .locals 6
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "ch"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1410
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1411
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x1

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected _closeInput()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_2

    .line 236
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_ioContext:Lorg/codehaus/jackson/io/IOContext;

    invoke-virtual {v0}, Lorg/codehaus/jackson/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/codehaus/jackson/JsonParser$Feature;->AUTO_CLOSE_SOURCE:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 237
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 239
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    .line 241
    :cond_2
    return-void
.end method

.method protected _decodeBase64(Lorg/codehaus/jackson/Base64Variant;)[B
    .locals 10
    .param p1, "b64variant"    # Lorg/codehaus/jackson/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/16 v8, 0x22

    const/4 v7, -0x2

    .line 2834
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_getByteArrayBuilder()Lorg/codehaus/jackson/util/ByteArrayBuilder;

    move-result-object v1

    .line 2841
    .local v1, "builder":Lorg/codehaus/jackson/util/ByteArrayBuilder;
    :cond_0
    :goto_0
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_1

    .line 2842
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2844
    :cond_1
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 2845
    .local v2, "ch":I
    const/16 v4, 0x20

    if-le v2, v4, :cond_0

    .line 2846
    invoke-virtual {p1, v2}, Lorg/codehaus/jackson/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 2847
    .local v0, "bits":I
    if-gez v0, :cond_3

    .line 2848
    if-ne v2, v8, :cond_2

    .line 2849
    invoke-virtual {v1}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    .line 2917
    :goto_1
    return-object v4

    .line 2851
    :cond_2
    const/4 v4, 0x0

    invoke-virtual {p0, p1, v2, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeBase64Escape(Lorg/codehaus/jackson/Base64Variant;II)I

    move-result v0

    .line 2852
    if-ltz v0, :cond_0

    .line 2856
    :cond_3
    move v3, v0

    .line 2860
    .local v3, "decodedData":I
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_4

    .line 2861
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2863
    :cond_4
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 2864
    invoke-virtual {p1, v2}, Lorg/codehaus/jackson/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 2865
    if-gez v0, :cond_5

    .line 2866
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v2, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeBase64Escape(Lorg/codehaus/jackson/Base64Variant;II)I

    move-result v0

    .line 2868
    :cond_5
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 2871
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_6

    .line 2872
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2874
    :cond_6
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 2875
    invoke-virtual {p1, v2}, Lorg/codehaus/jackson/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 2878
    if-gez v0, :cond_b

    .line 2879
    if-eq v0, v7, :cond_8

    .line 2881
    if-ne v2, v8, :cond_7

    invoke-virtual {p1}, Lorg/codehaus/jackson/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_7

    .line 2882
    shr-int/lit8 v3, v3, 0x4

    .line 2883
    invoke-virtual {v1, v3}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->append(I)V

    .line 2884
    invoke-virtual {v1}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto :goto_1

    .line 2886
    :cond_7
    const/4 v4, 0x2

    invoke-virtual {p0, p1, v2, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeBase64Escape(Lorg/codehaus/jackson/Base64Variant;II)I

    move-result v0

    .line 2888
    :cond_8
    if-ne v0, v7, :cond_b

    .line 2890
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_9

    .line 2891
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2893
    :cond_9
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 2894
    invoke-virtual {p1, v2}, Lorg/codehaus/jackson/Base64Variant;->usesPaddingChar(I)Z

    move-result v4

    if-nez v4, :cond_a

    .line 2895
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expected padding character \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/codehaus/jackson/Base64Variant;->getPaddingChar()C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, p1, v2, v9, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->reportInvalidBase64Char(Lorg/codehaus/jackson/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v4

    throw v4

    .line 2898
    :cond_a
    shr-int/lit8 v3, v3, 0x4

    .line 2899
    invoke-virtual {v1, v3}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->append(I)V

    goto/16 :goto_0

    .line 2904
    :cond_b
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 2906
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v4, v5, :cond_c

    .line 2907
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2909
    :cond_c
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 2910
    invoke-virtual {p1, v2}, Lorg/codehaus/jackson/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 2911
    if-gez v0, :cond_f

    .line 2912
    if-eq v0, v7, :cond_e

    .line 2914
    if-ne v2, v8, :cond_d

    invoke-virtual {p1}, Lorg/codehaus/jackson/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_d

    .line 2915
    shr-int/lit8 v3, v3, 0x2

    .line 2916
    invoke-virtual {v1, v3}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->appendTwoBytes(I)V

    .line 2917
    invoke-virtual {v1}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto/16 :goto_1

    .line 2919
    :cond_d
    invoke-virtual {p0, p1, v2, v9}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeBase64Escape(Lorg/codehaus/jackson/Base64Variant;II)I

    move-result v0

    .line 2921
    :cond_e
    if-ne v0, v7, :cond_f

    .line 2928
    shr-int/lit8 v3, v3, 0x2

    .line 2929
    invoke-virtual {v1, v3}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->appendTwoBytes(I)V

    goto/16 :goto_0

    .line 2934
    :cond_f
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 2935
    invoke-virtual {v1, v3}, Lorg/codehaus/jackson/util/ByteArrayBuilder;->appendThreeBytes(I)V

    goto/16 :goto_0
.end method

.method protected _decodeCharForError(I)I
    .locals 6
    .param p1, "firstByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x80

    .line 2540
    move v0, p1

    .line 2541
    .local v0, "c":I
    if-gez v0, :cond_3

    .line 2545
    and-int/lit16 v3, v0, 0xe0

    const/16 v4, 0xc0

    if-ne v3, v4, :cond_4

    .line 2546
    and-int/lit8 v0, v0, 0x1f

    .line 2547
    const/4 v2, 0x1

    .line 2560
    .local v2, "needed":I
    :goto_0
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextByte()I

    move-result v1

    .line 2561
    .local v1, "d":I
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_0

    .line 2562
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 2564
    :cond_0
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 2566
    const/4 v3, 0x1

    if-le v2, v3, :cond_3

    .line 2567
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextByte()I

    move-result v1

    .line 2568
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_1

    .line 2569
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 2571
    :cond_1
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 2572
    const/4 v3, 0x2

    if-le v2, v3, :cond_3

    .line 2573
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextByte()I

    move-result v1

    .line 2574
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_2

    .line 2575
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 2577
    :cond_2
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 2581
    .end local v1    # "d":I
    .end local v2    # "needed":I
    :cond_3
    return v0

    .line 2548
    :cond_4
    and-int/lit16 v3, v0, 0xf0

    const/16 v4, 0xe0

    if-ne v3, v4, :cond_5

    .line 2549
    and-int/lit8 v0, v0, 0xf

    .line 2550
    const/4 v2, 0x2

    .restart local v2    # "needed":I
    goto :goto_0

    .line 2551
    .end local v2    # "needed":I
    :cond_5
    and-int/lit16 v3, v0, 0xf8

    const/16 v4, 0xf0

    if-ne v3, v4, :cond_6

    .line 2553
    and-int/lit8 v0, v0, 0x7

    .line 2554
    const/4 v2, 0x3

    .restart local v2    # "needed":I
    goto :goto_0

    .line 2556
    .end local v2    # "needed":I
    :cond_6
    and-int/lit16 v3, v0, 0xff

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidInitial(I)V

    .line 2557
    const/4 v2, 0x1

    .restart local v2    # "needed":I
    goto :goto_0
.end method

.method protected final _decodeEscaped()C
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2486
    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v5, v6, :cond_0

    .line 2487
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2488
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2491
    :cond_0
    iget-object v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v5, v6

    .line 2493
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 2516
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeCharForError(I)I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {p0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v5

    .line 2534
    :goto_0
    return v5

    .line 2496
    :sswitch_0
    const/16 v5, 0x8

    goto :goto_0

    .line 2498
    :sswitch_1
    const/16 v5, 0x9

    goto :goto_0

    .line 2500
    :sswitch_2
    const/16 v5, 0xa

    goto :goto_0

    .line 2502
    :sswitch_3
    const/16 v5, 0xc

    goto :goto_0

    .line 2504
    :sswitch_4
    const/16 v5, 0xd

    goto :goto_0

    .line 2510
    :sswitch_5
    int-to-char v5, v0

    goto :goto_0

    .line 2520
    :sswitch_6
    const/4 v4, 0x0

    .line 2521
    .local v4, "value":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    const/4 v5, 0x4

    if-ge v3, v5, :cond_3

    .line 2522
    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v5, v6, :cond_1

    .line 2523
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2524
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2527
    :cond_1
    iget-object v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v5, v6

    .line 2528
    .local v1, "ch":I
    invoke-static {v1}, Lorg/codehaus/jackson/util/CharTypes;->charToHex(I)I

    move-result v2

    .line 2529
    .local v2, "digit":I
    if-gez v2, :cond_2

    .line 2530
    const-string v5, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v1, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2532
    :cond_2
    shl-int/lit8 v5, v4, 0x4

    or-int v4, v5, v2

    .line 2521
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2534
    .end local v1    # "ch":I
    .end local v2    # "digit":I
    :cond_3
    int-to-char v5, v4

    goto :goto_0

    .line 2493
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_5
        0x2f -> :sswitch_5
        0x5c -> :sswitch_5
        0x62 -> :sswitch_0
        0x66 -> :sswitch_3
        0x6e -> :sswitch_2
        0x72 -> :sswitch_4
        0x74 -> :sswitch_1
        0x75 -> :sswitch_6
    .end sparse-switch
.end method

.method protected _finishString()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1874
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1875
    .local v7, "ptr":I
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v7, v8, :cond_0

    .line 1876
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 1877
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1879
    :cond_0
    const/4 v5, 0x0

    .line 1880
    .local v5, "outPtr":I
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8}, Lorg/codehaus/jackson/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1881
    .local v4, "outBuf":[C
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesUtf8:[I

    .line 1883
    .local v1, "codes":[I
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    array-length v9, v4

    add-int/2addr v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1884
    .local v3, "max":I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .local v2, "inputBuffer":[B
    move v6, v5

    .line 1885
    .end local v5    # "outPtr":I
    .local v6, "outPtr":I
    :goto_0
    if-ge v7, v3, :cond_2

    .line 1886
    aget-byte v8, v2, v7

    and-int/lit16 v0, v8, 0xff

    .line 1887
    .local v0, "c":I
    aget v8, v1, v0

    if-eqz v8, :cond_1

    .line 1888
    const/16 v8, 0x22

    if-ne v0, v8, :cond_2

    .line 1889
    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1890
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8, v6}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 1900
    .end local v0    # "c":I
    :goto_1
    return-void

    .line 1895
    .restart local v0    # "c":I
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 1896
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    int-to-char v8, v0

    aput-char v8, v4, v6

    move v6, v5

    .line 1897
    .end local v5    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_0

    .line 1898
    .end local v0    # "c":I
    :cond_2
    iput v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1899
    invoke-direct {p0, v4, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_finishString2([CI)V

    goto :goto_1
.end method

.method protected final _getText2(Lorg/codehaus/jackson/JsonToken;)Ljava/lang/String;
    .locals 2
    .param p1, "t"    # Lorg/codehaus/jackson/JsonToken;

    .prologue
    .line 285
    if-nez p1, :cond_0

    .line 286
    const/4 v0, 0x0

    .line 298
    :goto_0
    return-object v0

    .line 288
    :cond_0
    sget-object v0, Lorg/codehaus/jackson/impl/Utf8StreamParser$1;->$SwitchMap$org$codehaus$jackson$JsonToken:[I

    invoke-virtual {p1}, Lorg/codehaus/jackson/JsonToken;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 298
    invoke-virtual {p1}, Lorg/codehaus/jackson/JsonToken;->asString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 290
    :pswitch_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v0}, Lorg/codehaus/jackson/impl/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 296
    :pswitch_1
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0}, Lorg/codehaus/jackson/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 288
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method protected _handleApostropheValue()Lorg/codehaus/jackson/JsonToken;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x27

    .line 2091
    const/4 v0, 0x0

    .line 2093
    .local v0, "c":I
    const/4 v6, 0x0

    .line 2094
    .local v6, "outPtr":I
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8}, Lorg/codehaus/jackson/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    .line 2097
    .local v5, "outBuf":[C
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesUtf8:[I

    .line 2098
    .local v1, "codes":[I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 2105
    .local v2, "inputBuffer":[B
    :cond_0
    :goto_0
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v8, v9, :cond_1

    .line 2106
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2108
    :cond_1
    array-length v8, v5

    if-lt v6, v8, :cond_2

    .line 2109
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2110
    const/4 v6, 0x0

    .line 2112
    :cond_2
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    .line 2114
    .local v3, "max":I
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    array-length v9, v5

    sub-int/2addr v9, v6

    add-int v4, v8, v9

    .line 2115
    .local v4, "max2":I
    if-ge v4, v3, :cond_3

    .line 2116
    move v3, v4

    .line 2119
    :cond_3
    :goto_1
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    if-ge v8, v3, :cond_0

    .line 2120
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v8, v2, v8

    and-int/lit16 v0, v8, 0xff

    .line 2121
    if-eq v0, v10, :cond_4

    aget v8, v1, v0

    if-eqz v8, :cond_5

    .line 2129
    :cond_4
    if-ne v0, v10, :cond_6

    .line 2175
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8, v6}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 2177
    sget-object v8, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    return-object v8

    .line 2124
    :cond_5
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v0

    aput-char v8, v5, v6

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_1

    .line 2133
    :cond_6
    aget v8, v1, v0

    packed-switch v8, :pswitch_data_0

    .line 2161
    const/16 v8, 0x20

    if-ge v0, v8, :cond_7

    .line 2162
    const-string v8, "string value"

    invoke-virtual {p0, v0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 2165
    :cond_7
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidChar(I)V

    .line 2168
    :cond_8
    :goto_2
    array-length v8, v5

    if-lt v6, v8, :cond_9

    .line 2169
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2170
    const/4 v6, 0x0

    .line 2173
    :cond_9
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    int-to-char v8, v0

    aput-char v8, v5, v6

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_0

    .line 2135
    :pswitch_0
    const/16 v8, 0x22

    if-eq v0, v8, :cond_8

    .line 2136
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeEscaped()C

    move-result v0

    goto :goto_2

    .line 2140
    :pswitch_1
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_2(I)I

    move-result v0

    .line 2141
    goto :goto_2

    .line 2143
    :pswitch_2
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    iget v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    sub-int/2addr v8, v9

    const/4 v9, 0x2

    if-lt v8, v9, :cond_a

    .line 2144
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_3fast(I)I

    move-result v0

    goto :goto_2

    .line 2146
    :cond_a
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_3(I)I

    move-result v0

    .line 2148
    goto :goto_2

    .line 2150
    :pswitch_3
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 2152
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    const v8, 0xd800

    shr-int/lit8 v9, v0, 0xa

    or-int/2addr v8, v9

    int-to-char v8, v8

    aput-char v8, v5, v6

    .line 2153
    array-length v8, v5

    if-lt v7, v8, :cond_b

    .line 2154
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v8}, Lorg/codehaus/jackson/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2155
    const/4 v6, 0x0

    .line 2157
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :goto_3
    const v8, 0xdc00

    and-int/lit16 v9, v0, 0x3ff

    or-int v0, v8, v9

    .line 2159
    goto :goto_2

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_b
    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_3

    .line 2133
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected _handleInvalidNumberStart(IZ)Lorg/codehaus/jackson/JsonToken;
    .locals 9
    .param p1, "ch"    # I
    .param p2, "negative"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x3

    const-wide/high16 v3, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 2187
    const/16 v5, 0x49

    if-ne p1, v5, :cond_4

    .line 2188
    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v5, v6, :cond_0

    .line 2189
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2190
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOFInValue()V

    .line 2193
    :cond_0
    iget-object v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte p1, v5, v6

    .line 2194
    const/16 v5, 0x4e

    if-ne p1, v5, :cond_5

    .line 2195
    if-eqz p2, :cond_1

    const-string v0, "-INF"

    .line 2196
    .local v0, "match":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 2197
    sget-object v5, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 2198
    if-eqz p2, :cond_2

    :goto_1
    invoke-virtual {p0, v0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetAsNaN(Ljava/lang/String;D)Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    .line 2211
    .end local v0    # "match":Ljava/lang/String;
    :goto_2
    return-object v1

    .line 2195
    :cond_1
    const-string v0, "+INF"

    goto :goto_0

    .restart local v0    # "match":Ljava/lang/String;
    :cond_2
    move-wide v1, v3

    .line 2198
    goto :goto_1

    .line 2200
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-standard token \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    .line 2210
    .end local v0    # "match":Ljava/lang/String;
    :cond_4
    :goto_3
    const-string v1, "expected digit (0-9) to follow minus sign, for valid numeric value"

    invoke-virtual {p0, p1, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 2211
    const/4 v1, 0x0

    goto :goto_2

    .line 2201
    :cond_5
    const/16 v5, 0x6e

    if-ne p1, v5, :cond_4

    .line 2202
    if-eqz p2, :cond_6

    const-string v0, "-Infinity"

    .line 2203
    .restart local v0    # "match":Ljava/lang/String;
    :goto_4
    invoke-virtual {p0, v0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 2204
    sget-object v5, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 2205
    if-eqz p2, :cond_7

    :goto_5
    invoke-virtual {p0, v0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetAsNaN(Ljava/lang/String;D)Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    goto :goto_2

    .line 2202
    .end local v0    # "match":Ljava/lang/String;
    :cond_6
    const-string v0, "+Infinity"

    goto :goto_4

    .restart local v0    # "match":Ljava/lang/String;
    :cond_7
    move-wide v1, v3

    .line 2205
    goto :goto_5

    .line 2207
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-standard token \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    goto :goto_3
.end method

.method protected _handleUnexpectedValue(I)Lorg/codehaus/jackson/JsonToken;
    .locals 3
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2062
    sparse-switch p1, :sswitch_data_0

    .line 2084
    :cond_0
    :goto_0
    const-string v0, "expected a valid value (number, String, array, object, \'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p1, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2085
    const/4 v0, 0x0

    :goto_1
    return-object v0

    .line 2064
    :sswitch_0
    sget-object v0, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2065
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleApostropheValue()Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 2069
    :sswitch_1
    const-string v0, "NaN"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 2070
    sget-object v0, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2071
    const-string v0, "NaN"

    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {p0, v0, v1, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetAsNaN(Ljava/lang/String;D)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 2073
    :cond_1
    const-string v0, "Non-standard token \'NaN\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 2076
    :sswitch_2
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_2

    .line 2077
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2078
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOFInValue()V

    .line 2081
    :cond_2
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleInvalidNumberStart(IZ)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 2062
    nop

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_0
        0x2b -> :sswitch_2
        0x4e -> :sswitch_1
    .end sparse-switch
.end method

.method protected final _handleUnusualFieldName(I)Lorg/codehaus/jackson/sym/Name;
    .locals 9
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1526
    const/16 v7, 0x27

    if-ne p1, v7, :cond_1

    sget-object v7, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1527
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parseApostropheFieldName()Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    .line 1587
    :cond_0
    :goto_0
    return-object v3

    .line 1530
    :cond_1
    sget-object v7, Lorg/codehaus/jackson/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lorg/codehaus/jackson/JsonParser$Feature;

    invoke-virtual {p0, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->isEnabled(Lorg/codehaus/jackson/JsonParser$Feature;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 1531
    const-string v7, "was expecting double-quote to start field name"

    invoke-virtual {p0, p1, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1537
    :cond_2
    invoke-static {}, Lorg/codehaus/jackson/util/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v0

    .line 1539
    .local v0, "codes":[I
    aget v7, v0, p1

    if-eqz v7, :cond_3

    .line 1540
    const-string v7, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1547
    :cond_3
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1548
    .local v6, "quads":[I
    const/4 v4, 0x0

    .line 1549
    .local v4, "qlen":I
    const/4 v1, 0x0

    .line 1550
    .local v1, "currQuad":I
    const/4 v2, 0x0

    .local v2, "currQuadBytes":I
    move v5, v4

    .line 1554
    .end local v4    # "qlen":I
    .local v5, "qlen":I
    :goto_1
    const/4 v7, 0x4

    if-ge v2, v7, :cond_7

    .line 1555
    add-int/lit8 v2, v2, 0x1

    .line 1556
    shl-int/lit8 v7, v1, 0x8

    or-int v1, v7, p1

    move v4, v5

    .line 1565
    .end local v5    # "qlen":I
    .restart local v4    # "qlen":I
    :goto_2
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v7, v8, :cond_4

    .line 1566
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v7

    if-nez v7, :cond_4

    .line 1567
    const-string v7, " in field name"

    invoke-virtual {p0, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1570
    :cond_4
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 p1, v7, 0xff

    .line 1571
    aget v7, v0, p1

    if-eqz v7, :cond_9

    .line 1577
    if-lez v2, :cond_6

    .line 1578
    array-length v7, v6

    if-lt v4, v7, :cond_5

    .line 1579
    array-length v7, v6

    invoke-static {v6, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v6

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1581
    :cond_5
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "qlen":I
    .restart local v5    # "qlen":I
    aput v1, v6, v4

    move v4, v5

    .line 1583
    .end local v5    # "qlen":I
    .restart local v4    # "qlen":I
    :cond_6
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v7, v6, v4}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->findName([II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    .line 1584
    .local v3, "name":Lorg/codehaus/jackson/sym/Name;
    if-nez v3, :cond_0

    .line 1585
    invoke-direct {p0, v6, v4, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->addName([III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto :goto_0

    .line 1558
    .end local v3    # "name":Lorg/codehaus/jackson/sym/Name;
    .end local v4    # "qlen":I
    .restart local v5    # "qlen":I
    :cond_7
    array-length v7, v6

    if-lt v5, v7, :cond_8

    .line 1559
    array-length v7, v6

    invoke-static {v6, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v6

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1561
    :cond_8
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "qlen":I
    .restart local v4    # "qlen":I
    aput v1, v6, v5

    .line 1562
    move v1, p1

    .line 1563
    const/4 v2, 0x1

    goto :goto_2

    .line 1574
    :cond_9
    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    move v5, v4

    .end local v4    # "qlen":I
    .restart local v5    # "qlen":I
    goto :goto_1
.end method

.method protected final _loadToHaveAtLeast(I)Z
    .locals 9
    .param p1, "minAvailable"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 198
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    if-nez v4, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v2

    .line 202
    :cond_1
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    sub-int v0, v4, v5

    .line 203
    .local v0, "amount":I
    if-lez v0, :cond_2

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    if-lez v4, :cond_2

    .line 204
    iget-wide v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputProcessed:J

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputProcessed:J

    .line 205
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    sub-int/2addr v4, v5

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    .line 206
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    invoke-static {v4, v5, v6, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    .line 211
    :goto_1
    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 212
    :goto_2
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-ge v4, p1, :cond_4

    .line 213
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    array-length v7, v7

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    sub-int/2addr v7, v8

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 214
    .local v1, "count":I
    if-ge v1, v3, :cond_3

    .line 216
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_closeInput()V

    .line 218
    if-nez v1, :cond_0

    .line 219
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InputStream.read() returned 0 characters when trying to read "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 209
    .end local v1    # "count":I
    :cond_2
    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    goto :goto_1

    .line 223
    .restart local v1    # "count":I
    :cond_3
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    add-int/2addr v4, v1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    goto :goto_2

    .end local v1    # "count":I
    :cond_4
    move v2, v3

    .line 225
    goto :goto_0
.end method

.method protected final _matchToken(Ljava/lang/String;I)V
    .locals 6
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 2217
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 2220
    .local v2, "len":I
    :cond_0
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v4, :cond_1

    .line 2221
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2222
    const-string v3, " in a value"

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2225
    :cond_1
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v4

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_2

    .line 2226
    invoke-virtual {p1, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\'null\', \'true\', \'false\' or NaN"

    invoke-virtual {p0, v3, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 2228
    :cond_2
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2229
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v2, :cond_0

    .line 2232
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v4, :cond_4

    .line 2233
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_4

    .line 2247
    :cond_3
    :goto_0
    return-void

    .line 2237
    :cond_4
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v1, v3, 0xff

    .line 2238
    .local v1, "ch":I
    const/16 v3, 0x30

    if-lt v1, v3, :cond_3

    const/16 v3, 0x5d

    if-eq v1, v3, :cond_3

    const/16 v3, 0x7d

    if-eq v1, v3, :cond_3

    .line 2242
    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeCharForError(I)I

    move-result v3

    int-to-char v0, v3

    .line 2243
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2244
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2245
    invoke-virtual {p1, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\'null\', \'true\', \'false\' or NaN"

    invoke-virtual {p0, v3, v4}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final _parseApostropheFieldName()Lorg/codehaus/jackson/sym/Name;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x27

    const/4 v11, 0x4

    .line 1598
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v8, v9, :cond_0

    .line 1599
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_0

    .line 1600
    const-string v8, ": was expecting closing \'\'\' for name"

    invoke-virtual {p0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1603
    :cond_0
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 v0, v8, 0xff

    .line 1604
    .local v0, "ch":I
    if-ne v0, v12, :cond_2

    .line 1605
    invoke-static {}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->getEmptyName()Lorg/codehaus/jackson/sym/Name;

    move-result-object v4

    .line 1698
    :cond_1
    :goto_0
    return-object v4

    .line 1607
    :cond_2
    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1608
    .local v7, "quads":[I
    const/4 v5, 0x0

    .line 1609
    .local v5, "qlen":I
    const/4 v2, 0x0

    .line 1610
    .local v2, "currQuad":I
    const/4 v3, 0x0

    .line 1614
    .local v3, "currQuadBytes":I
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesLatin1:[I

    .local v1, "codes":[I
    move v6, v5

    .line 1617
    .end local v5    # "qlen":I
    .local v6, "qlen":I
    :goto_1
    if-ne v0, v12, :cond_4

    .line 1688
    if-lez v3, :cond_e

    .line 1689
    array-length v8, v7

    if-lt v6, v8, :cond_3

    .line 1690
    array-length v8, v7

    invoke-static {v7, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1692
    :cond_3
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1694
    :goto_2
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v8, v7, v5}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->findName([II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v4

    .line 1695
    .local v4, "name":Lorg/codehaus/jackson/sym/Name;
    if-nez v4, :cond_1

    .line 1696
    invoke-direct {p0, v7, v5, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->addName([III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v4

    goto :goto_0

    .line 1621
    .end local v4    # "name":Lorg/codehaus/jackson/sym/Name;
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_4
    const/16 v8, 0x22

    if-eq v0, v8, :cond_7

    aget v8, v1, v0

    if-eqz v8, :cond_7

    .line 1622
    const/16 v8, 0x5c

    if-eq v0, v8, :cond_9

    .line 1625
    const-string v8, "name"

    invoke-virtual {p0, v0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 1635
    :goto_3
    const/16 v8, 0x7f

    if-le v0, v8, :cond_7

    .line 1637
    if-lt v3, v11, :cond_6

    .line 1638
    array-length v8, v7

    if-lt v6, v8, :cond_5

    .line 1639
    array-length v8, v7

    invoke-static {v7, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1641
    :cond_5
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1642
    const/4 v2, 0x0

    .line 1643
    const/4 v3, 0x0

    move v6, v5

    .line 1645
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_6
    const/16 v8, 0x800

    if-ge v0, v8, :cond_a

    .line 1646
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0x6

    or-int/lit16 v9, v9, 0xc0

    or-int v2, v8, v9

    .line 1647
    add-int/lit8 v3, v3, 0x1

    move v5, v6

    .line 1665
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_4
    and-int/lit8 v8, v0, 0x3f

    or-int/lit16 v0, v8, 0x80

    move v6, v5

    .line 1669
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_7
    if-ge v3, v11, :cond_c

    .line 1670
    add-int/lit8 v3, v3, 0x1

    .line 1671
    shl-int/lit8 v8, v2, 0x8

    or-int v2, v8, v0

    move v5, v6

    .line 1680
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_5
    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v8, v9, :cond_8

    .line 1681
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_8

    .line 1682
    const-string v8, " in field name"

    invoke-virtual {p0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1685
    :cond_8
    iget-object v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 v0, v8, 0xff

    move v6, v5

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    goto/16 :goto_1

    .line 1628
    :cond_9
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeEscaped()C

    move-result v0

    goto :goto_3

    .line 1650
    :cond_a
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0xc

    or-int/lit16 v9, v9, 0xe0

    or-int v2, v8, v9

    .line 1651
    add-int/lit8 v3, v3, 0x1

    .line 1653
    if-lt v3, v11, :cond_f

    .line 1654
    array-length v8, v7

    if-lt v6, v8, :cond_b

    .line 1655
    array-length v8, v7

    invoke-static {v7, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1657
    :cond_b
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1658
    const/4 v2, 0x0

    .line 1659
    const/4 v3, 0x0

    .line 1661
    :goto_6
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0x6

    and-int/lit8 v9, v9, 0x3f

    or-int/lit16 v9, v9, 0x80

    or-int v2, v8, v9

    .line 1662
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 1673
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_c
    array-length v8, v7

    if-lt v6, v8, :cond_d

    .line 1674
    array-length v8, v7

    invoke-static {v7, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1676
    :cond_d
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1677
    move v2, v0

    .line 1678
    const/4 v3, 0x1

    goto :goto_5

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_e
    move v5, v6

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    goto/16 :goto_2

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_f
    move v5, v6

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    goto :goto_6
.end method

.method protected final _parseFieldName(I)Lorg/codehaus/jackson/sym/Name;
    .locals 10
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/16 v5, 0x22

    .line 1220
    if-eq p1, v5, :cond_0

    .line 1221
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleUnusualFieldName(I)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    .line 1277
    :goto_0
    return-object v3

    .line 1224
    :cond_0
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x9

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-le v3, v4, :cond_1

    .line 1225
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->slowParseFieldName()Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto :goto_0

    .line 1234
    :cond_1
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 1235
    .local v1, "input":[B
    sget-object v0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesLatin1:[I

    .line 1237
    .local v0, "codes":[I
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 v2, v3, 0xff

    .line 1239
    .local v2, "q":I
    aget v3, v0, v2

    if-nez v3, :cond_a

    .line 1240
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1241
    aget v3, v0, p1

    if-nez v3, :cond_8

    .line 1242
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1243
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1244
    aget v3, v0, p1

    if-nez v3, :cond_6

    .line 1245
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1246
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1247
    aget v3, v0, p1

    if-nez v3, :cond_4

    .line 1248
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1249
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1250
    aget v3, v0, p1

    if-nez v3, :cond_2

    .line 1251
    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    .line 1252
    invoke-virtual {p0, p1, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseMediumFieldName(I[I)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto :goto_0

    .line 1254
    :cond_2
    if-ne p1, v5, :cond_3

    .line 1255
    const/4 v3, 0x4

    invoke-direct {p0, v2, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto :goto_0

    .line 1257
    :cond_3
    const/4 v3, 0x4

    invoke-direct {p0, v2, p1, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto :goto_0

    .line 1259
    :cond_4
    if-ne p1, v5, :cond_5

    .line 1260
    invoke-direct {p0, v2, v9}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto :goto_0

    .line 1262
    :cond_5
    invoke-direct {p0, v2, p1, v9}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0

    .line 1264
    :cond_6
    if-ne p1, v5, :cond_7

    .line 1265
    invoke-direct {p0, v2, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0

    .line 1267
    :cond_7
    invoke-direct {p0, v2, p1, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0

    .line 1269
    :cond_8
    if-ne p1, v5, :cond_9

    .line 1270
    invoke-direct {p0, v2, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0

    .line 1272
    :cond_9
    invoke-direct {p0, v2, p1, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0

    .line 1274
    :cond_a
    if-ne v2, v5, :cond_b

    .line 1275
    invoke-static {}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->getEmptyName()Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0

    .line 1277
    :cond_b
    invoke-direct {p0, v6, v2, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v3

    goto/16 :goto_0
.end method

.method protected _releaseBuffers()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    invoke-super {p0}, Lorg/codehaus/jackson/impl/JsonParserBase;->_releaseBuffers()V

    .line 253
    iget-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_bufferRecyclable:Z

    if-eqz v1, :cond_0

    .line 254
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 255
    .local v0, "buf":[B
    if-eqz v0, :cond_0

    .line 256
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 257
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_ioContext:Lorg/codehaus/jackson/io/IOContext;

    invoke-virtual {v1, v0}, Lorg/codehaus/jackson/io/IOContext;->releaseReadIOBuffer([B)V

    .line 260
    .end local v0    # "buf":[B
    :cond_0
    return-void
.end method

.method protected _reportInvalidChar(I)V
    .locals 1
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2787
    const/16 v0, 0x20

    if-ge p1, v0, :cond_0

    .line 2788
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwInvalidSpace(I)V

    .line 2790
    :cond_0
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidInitial(I)V

    .line 2791
    return-void
.end method

.method protected _reportInvalidInitial(I)V
    .locals 2
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2796
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid UTF-8 start byte 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    .line 2797
    return-void
.end method

.method protected _reportInvalidOther(I)V
    .locals 2
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2802
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid UTF-8 middle byte 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    .line 2803
    return-void
.end method

.method protected _reportInvalidOther(II)V
    .locals 0
    .param p1, "mask"    # I
    .param p2, "ptr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2808
    iput p2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2809
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidOther(I)V

    .line 2810
    return-void
.end method

.method protected _reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "matchedPart"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2252
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2258
    .local v2, "sb":Ljava/lang/StringBuilder;
    :goto_0
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v4, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2269
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognized token \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\': was expecting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    .line 2270
    return-void

    .line 2261
    :cond_1
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v3, v4

    .line 2262
    .local v1, "i":I
    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeCharForError(I)I

    move-result v3

    int-to-char v0, v3

    .line 2263
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2266
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2267
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method protected final _skipCR()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2753
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2754
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    .line 2755
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2758
    :cond_1
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRow:I

    .line 2759
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    .line 2760
    return-void
.end method

.method protected final _skipLF()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2764
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRow:I

    .line 2765
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    .line 2766
    return-void
.end method

.method protected _skipString()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1994
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 1997
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesUtf8:[I

    .line 1998
    .local v1, "codes":[I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    .line 2006
    .local v2, "inputBuffer":[B
    :goto_0
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2007
    .local v4, "ptr":I
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    .line 2008
    .local v3, "max":I
    if-lt v4, v3, :cond_3

    .line 2009
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 2010
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2011
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    move v5, v4

    .line 2013
    .end local v4    # "ptr":I
    .local v5, "ptr":I
    :goto_1
    if-ge v5, v3, :cond_0

    .line 2014
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "ptr":I
    .restart local v4    # "ptr":I
    aget-byte v6, v2, v5

    and-int/lit16 v0, v6, 0xff

    .line 2015
    .local v0, "c":I
    aget v6, v1, v0

    if-eqz v6, :cond_3

    .line 2016
    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 2023
    const/16 v6, 0x22

    if-ne v0, v6, :cond_1

    .line 2050
    return-void

    .line 2020
    .end local v0    # "c":I
    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    :cond_0
    iput v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    goto :goto_0

    .line 2027
    .end local v5    # "ptr":I
    .restart local v0    # "c":I
    .restart local v4    # "ptr":I
    :cond_1
    aget v6, v1, v0

    packed-switch v6, :pswitch_data_0

    .line 2041
    const/16 v6, 0x20

    if-ge v0, v6, :cond_2

    .line 2043
    const-string v6, "string value"

    invoke-virtual {p0, v0, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_0

    .line 2029
    :pswitch_0
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeEscaped()C

    goto :goto_0

    .line 2032
    :pswitch_1
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipUtf8_2(I)V

    goto :goto_0

    .line 2035
    :pswitch_2
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipUtf8_3(I)V

    goto :goto_0

    .line 2038
    :pswitch_3
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipUtf8_4(I)V

    goto :goto_0

    .line 2046
    :cond_2
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidChar(I)V

    goto :goto_0

    .end local v0    # "c":I
    :cond_3
    move v5, v4

    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    goto :goto_1

    .line 2027
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 620
    invoke-super {p0}, Lorg/codehaus/jackson/impl/JsonParserBase;->close()V

    .line 622
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v0}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->release()V

    .line 623
    return-void
.end method

.method public getBinaryValue(Lorg/codehaus/jackson/Base64Variant;)[B
    .locals 3
    .param p1, "b64variant"    # Lorg/codehaus/jackson/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 391
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_EMBEDDED_OBJECT:Lorg/codehaus/jackson/JsonToken;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_binaryValue:[B

    if-nez v1, :cond_1

    .line 393
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Current token ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportError(Ljava/lang/String;)V

    .line 398
    :cond_1
    iget-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_2

    .line 400
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeBase64(Lorg/codehaus/jackson/Base64Variant;)[B

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_binaryValue:[B
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 407
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 409
    :cond_2
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_binaryValue:[B

    return-object v1

    .line 401
    :catch_0
    move-exception v0

    .line 402
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to decode VALUE_STRING as base64 ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_constructError(Ljava/lang/String;)Lorg/codehaus/jackson/JsonParseException;

    move-result-object v1

    throw v1
.end method

.method public getCodec()Lorg/codehaus/jackson/ObjectCodec;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_objectCodec:Lorg/codehaus/jackson/ObjectCodec;

    return-object v0
.end method

.method public getInputSource()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 273
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_1

    .line 274
    iget-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_0

    .line 275
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 276
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_finishString()V

    .line 278
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v1}, Lorg/codehaus/jackson/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v1

    .line 280
    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_getText2(Lorg/codehaus/jackson/JsonToken;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getTextCharacters()[C
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 305
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    if-eqz v2, :cond_4

    .line 306
    sget-object v2, Lorg/codehaus/jackson/impl/Utf8StreamParser$1;->$SwitchMap$org$codehaus$jackson$JsonToken:[I

    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    invoke-virtual {v3}, Lorg/codehaus/jackson/JsonToken;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 333
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    invoke-virtual {v2}, Lorg/codehaus/jackson/JsonToken;->asCharArray()[C

    move-result-object v2

    .line 336
    :goto_0
    return-object v2

    .line 309
    :pswitch_0
    iget-boolean v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    if-nez v2, :cond_1

    .line 310
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v2}, Lorg/codehaus/jackson/impl/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 312
    .local v1, "nameLen":I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopyBuffer:[C

    if-nez v2, :cond_2

    .line 313
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_ioContext:Lorg/codehaus/jackson/io/IOContext;

    invoke-virtual {v2, v1}, Lorg/codehaus/jackson/io/IOContext;->allocNameCopyBuffer(I)[C

    move-result-object v2

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopyBuffer:[C

    .line 317
    :cond_0
    :goto_1
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopyBuffer:[C

    invoke-virtual {v0, v4, v1, v2, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 318
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    .line 320
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :cond_1
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopyBuffer:[C

    goto :goto_0

    .line 314
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v1    # "nameLen":I
    :cond_2
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopyBuffer:[C

    array-length v2, v2

    if-ge v2, v1, :cond_0

    .line 315
    new-array v2, v1, [C

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopyBuffer:[C

    goto :goto_1

    .line 323
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :pswitch_1
    iget-boolean v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_3

    .line 324
    iput-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 325
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_finishString()V

    .line 330
    :cond_3
    :pswitch_2
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v2}, Lorg/codehaus/jackson/util/TextBuffer;->getTextBuffer()[C

    move-result-object v2

    goto :goto_0

    .line 336
    :cond_4
    const/4 v2, 0x0

    goto :goto_0

    .line 306
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public getTextLength()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 343
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    if-eqz v1, :cond_0

    .line 344
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser$1;->$SwitchMap$org$codehaus$jackson$JsonToken:[I

    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    invoke-virtual {v2}, Lorg/codehaus/jackson/JsonToken;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 359
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    invoke-virtual {v0}, Lorg/codehaus/jackson/JsonToken;->asCharArray()[C

    move-result-object v0

    array-length v0, v0

    .line 362
    :cond_0
    :goto_0
    return v0

    .line 347
    :pswitch_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v0}, Lorg/codehaus/jackson/impl/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    .line 349
    :pswitch_1
    iget-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_1

    .line 350
    iput-boolean v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 351
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_finishString()V

    .line 356
    :cond_1
    :pswitch_2
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0}, Lorg/codehaus/jackson/util/TextBuffer;->size()I

    move-result v0

    goto :goto_0

    .line 344
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public getTextOffset()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 369
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    if-eqz v1, :cond_0

    .line 370
    sget-object v1, Lorg/codehaus/jackson/impl/Utf8StreamParser$1;->$SwitchMap$org$codehaus$jackson$JsonToken:[I

    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    invoke-virtual {v2}, Lorg/codehaus/jackson/JsonToken;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 384
    :cond_0
    :goto_0
    :pswitch_0
    return v0

    .line 374
    :pswitch_1
    iget-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_1

    .line 375
    iput-boolean v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 376
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_finishString()V

    .line 381
    :cond_1
    :pswitch_2
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0}, Lorg/codehaus/jackson/util/TextBuffer;->getTextOffset()I

    move-result v0

    goto :goto_0

    .line 370
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method protected final loadMore()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 168
    iget-wide v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputProcessed:J

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputProcessed:J

    .line 169
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    sub-int/2addr v2, v3

    iput v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    .line 171
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    if-eqz v2, :cond_0

    .line 172
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputStream:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    array-length v4, v4

    invoke-virtual {v2, v3, v1, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 173
    .local v0, "count":I
    if-lez v0, :cond_1

    .line 174
    iput v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 175
    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    .line 176
    const/4 v1, 0x1

    .line 185
    .end local v0    # "count":I
    :cond_0
    return v1

    .line 179
    .restart local v0    # "count":I
    :cond_1
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_closeInput()V

    .line 181
    if-nez v0, :cond_0

    .line 182
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "InputStream.read() returned 0 characters when trying to read "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextBooleanValue()Ljava/lang/Boolean;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 939
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v3, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    if-ne v2, v3, :cond_4

    .line 940
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    .line 941
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 942
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 943
    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 944
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_TRUE:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_1

    .line 945
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 963
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_0
    :goto_0
    return-object v1

    .line 947
    .restart local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_1
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_FALSE:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_2

    .line 948
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 950
    :cond_2
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_3

    .line 951
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildArrayContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 952
    :cond_3
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_0

    .line 953
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildObjectContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 957
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_4
    sget-object v2, Lorg/codehaus/jackson/impl/Utf8StreamParser$1;->$SwitchMap$org$codehaus$jackson$JsonToken:[I

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextToken()Lorg/codehaus/jackson/JsonToken;

    move-result-object v3

    invoke-virtual {v3}, Lorg/codehaus/jackson/JsonToken;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 959
    :pswitch_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 961
    :pswitch_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 957
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public nextFieldName(Lorg/codehaus/jackson/SerializableString;)Z
    .locals 10
    .param p1, "str"    # Lorg/codehaus/jackson/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 637
    const/4 v6, 0x0

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_numTypesValid:I

    .line 638
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v7, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    if-ne v6, v7, :cond_0

    .line 639
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextAfterName()Lorg/codehaus/jackson/JsonToken;

    .line 640
    const/4 v6, 0x0

    .line 719
    :goto_0
    return v6

    .line 642
    :cond_0
    iget-boolean v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v6, :cond_1

    .line 643
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipString()V

    .line 645
    :cond_1
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWSOrEnd()I

    move-result v1

    .line 646
    .local v1, "i":I
    if-gez v1, :cond_2

    .line 647
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->close()V

    .line 648
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 649
    const/4 v6, 0x0

    goto :goto_0

    .line 651
    :cond_2
    iget-wide v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputProcessed:J

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    int-to-long v8, v8

    add-long/2addr v6, v8

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputTotal:J

    .line 652
    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRow:I

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    .line 653
    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    .line 656
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_binaryValue:[B

    .line 659
    const/16 v6, 0x5d

    if-ne v1, v6, :cond_4

    .line 660
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v6}, Lorg/codehaus/jackson/impl/JsonReadContext;->inArray()Z

    move-result v6

    if-nez v6, :cond_3

    .line 661
    const/16 v6, 0x7d

    invoke-virtual {p0, v1, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportMismatchedEndMarker(IC)V

    .line 663
    :cond_3
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v6}, Lorg/codehaus/jackson/impl/JsonReadContext;->getParent()Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v6

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 664
    sget-object v6, Lorg/codehaus/jackson/JsonToken;->END_ARRAY:Lorg/codehaus/jackson/JsonToken;

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 665
    const/4 v6, 0x0

    goto :goto_0

    .line 667
    :cond_4
    const/16 v6, 0x7d

    if-ne v1, v6, :cond_6

    .line 668
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v6}, Lorg/codehaus/jackson/impl/JsonReadContext;->inObject()Z

    move-result v6

    if-nez v6, :cond_5

    .line 669
    const/16 v6, 0x5d

    invoke-virtual {p0, v1, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportMismatchedEndMarker(IC)V

    .line 671
    :cond_5
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v6}, Lorg/codehaus/jackson/impl/JsonReadContext;->getParent()Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v6

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 672
    sget-object v6, Lorg/codehaus/jackson/JsonToken;->END_OBJECT:Lorg/codehaus/jackson/JsonToken;

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 673
    const/4 v6, 0x0

    goto :goto_0

    .line 677
    :cond_6
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v6}, Lorg/codehaus/jackson/impl/JsonReadContext;->expectComma()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 678
    const/16 v6, 0x2c

    if-eq v1, v6, :cond_7

    .line 679
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "was expecting comma to separate "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v7}, Lorg/codehaus/jackson/impl/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " entries"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v1, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 681
    :cond_7
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result v1

    .line 684
    :cond_8
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v6}, Lorg/codehaus/jackson/impl/JsonReadContext;->inObject()Z

    move-result v6

    if-nez v6, :cond_9

    .line 685
    invoke-direct {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextTokenNotInObject(I)Lorg/codehaus/jackson/JsonToken;

    .line 686
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 690
    :cond_9
    const/16 v6, 0x22

    if-ne v1, v6, :cond_b

    .line 692
    invoke-interface {p1}, Lorg/codehaus/jackson/SerializableString;->asQuotedUTF8()[B

    move-result-object v3

    .line 693
    .local v3, "nameBytes":[B
    array-length v2, v3

    .line 694
    .local v2, "len":I
    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/2addr v6, v2

    iget v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-ge v6, v7, :cond_b

    .line 696
    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int v0, v6, v2

    .line 697
    .local v0, "end":I
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    aget-byte v6, v6, v0

    const/16 v7, 0x22

    if-ne v6, v7, :cond_b

    .line 698
    const/4 v4, 0x0

    .line 699
    .local v4, "offset":I
    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 701
    .local v5, "ptr":I
    :goto_1
    if-ne v4, v2, :cond_a

    .line 702
    add-int/lit8 v6, v0, 0x1

    iput v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 704
    iget-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-interface {p1}, Lorg/codehaus/jackson/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/codehaus/jackson/impl/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 705
    sget-object v6, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    iput-object v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 707
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_isNextTokenNameYes()V

    .line 708
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 710
    :cond_a
    aget-byte v6, v3, v4

    iget-object v7, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    add-int v8, v5, v4

    aget-byte v7, v7, v8

    if-eq v6, v7, :cond_c

    .line 718
    .end local v0    # "end":I
    .end local v2    # "len":I
    .end local v3    # "nameBytes":[B
    .end local v4    # "offset":I
    .end local v5    # "ptr":I
    :cond_b
    invoke-direct {p0, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_isNextTokenNameNo(I)V

    .line 719
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 713
    .restart local v0    # "end":I
    .restart local v2    # "len":I
    .restart local v3    # "nameBytes":[B
    .restart local v4    # "offset":I
    .restart local v5    # "ptr":I
    :cond_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method public nextIntValue(I)I
    .locals 4
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 891
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v2, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    if-ne v1, v2, :cond_3

    .line 892
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    .line 893
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 894
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 895
    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 896
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_NUMBER_INT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_1

    .line 897
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->getIntValue()I

    move-result p1

    .line 907
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    .end local p1    # "defaultValue":I
    :cond_0
    :goto_0
    return p1

    .line 899
    .restart local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    .restart local p1    # "defaultValue":I
    :cond_1
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_2

    .line 900
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildArrayContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 901
    :cond_2
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_0

    .line 902
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildObjectContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 907
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_3
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextToken()Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_NUMBER_INT:Lorg/codehaus/jackson/JsonToken;

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->getIntValue()I

    move-result p1

    goto :goto_0
.end method

.method public nextLongValue(J)J
    .locals 4
    .param p1, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 915
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v2, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    if-ne v1, v2, :cond_3

    .line 916
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    .line 917
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 918
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 919
    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 920
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->VALUE_NUMBER_INT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_1

    .line 921
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->getLongValue()J

    move-result-wide p1

    .line 931
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    .end local p1    # "defaultValue":J
    :cond_0
    :goto_0
    return-wide p1

    .line 923
    .restart local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    .restart local p1    # "defaultValue":J
    :cond_1
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_2

    .line 924
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildArrayContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 925
    :cond_2
    sget-object v1, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v1, :cond_0

    .line 926
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildObjectContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 931
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_3
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextToken()Lorg/codehaus/jackson/JsonToken;

    move-result-object v1

    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_NUMBER_INT:Lorg/codehaus/jackson/JsonToken;

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->getLongValue()J

    move-result-wide p1

    goto :goto_0
.end method

.method public nextTextValue()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 863
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v3, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    if-ne v2, v3, :cond_4

    .line 864
    iput-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nameCopied:Z

    .line 865
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 866
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    iput-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 867
    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 868
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_2

    .line 869
    iget-boolean v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_0

    .line 870
    iput-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 871
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_finishString()V

    .line 873
    :cond_0
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v1}, Lorg/codehaus/jackson/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v1

    .line 883
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_1
    :goto_0
    return-object v1

    .line 875
    .restart local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_2
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_3

    .line 876
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildArrayContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 877
    :cond_3
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    if-ne v0, v2, :cond_1

    .line 878
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lorg/codehaus/jackson/impl/JsonReadContext;->createChildObjectContext(II)Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    goto :goto_0

    .line 883
    .end local v0    # "t":Lorg/codehaus/jackson/JsonToken;
    :cond_4
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->nextToken()Lorg/codehaus/jackson/JsonToken;

    move-result-object v2

    sget-object v3, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    if-ne v2, v3, :cond_1

    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public nextToken()Lorg/codehaus/jackson/JsonToken;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/16 v10, 0x7d

    const/16 v9, 0x5d

    const/4 v8, 0x1

    .line 426
    const/4 v4, 0x0

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_numTypesValid:I

    .line 431
    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    sget-object v5, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    if-ne v4, v5, :cond_0

    .line 432
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextAfterName()Lorg/codehaus/jackson/JsonToken;

    move-result-object v3

    .line 552
    :goto_0
    return-object v3

    .line 434
    :cond_0
    iget-boolean v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    if-eqz v4, :cond_1

    .line 435
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipString()V

    .line 438
    :cond_1
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWSOrEnd()I

    move-result v0

    .line 439
    .local v0, "i":I
    if-gez v0, :cond_2

    .line 443
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->close()V

    .line 444
    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 450
    :cond_2
    iget-wide v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputProcessed:J

    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputTotal:J

    .line 451
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRow:I

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputRow:I

    .line 452
    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currInputRowStart:I

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenInputCol:I

    .line 455
    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_binaryValue:[B

    .line 458
    if-ne v0, v9, :cond_4

    .line 459
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->inArray()Z

    move-result v3

    if-nez v3, :cond_3

    .line 460
    invoke-virtual {p0, v0, v10}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportMismatchedEndMarker(IC)V

    .line 462
    :cond_3
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->getParent()Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 463
    sget-object v3, Lorg/codehaus/jackson/JsonToken;->END_ARRAY:Lorg/codehaus/jackson/JsonToken;

    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 465
    :cond_4
    if-ne v0, v10, :cond_6

    .line 466
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_5

    .line 467
    invoke-virtual {p0, v0, v9}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportMismatchedEndMarker(IC)V

    .line 469
    :cond_5
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->getParent()Lorg/codehaus/jackson/impl/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    .line 470
    sget-object v3, Lorg/codehaus/jackson/JsonToken;->END_OBJECT:Lorg/codehaus/jackson/JsonToken;

    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto :goto_0

    .line 474
    :cond_6
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->expectComma()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 475
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_7

    .line 476
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "was expecting comma to separate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v4}, Lorg/codehaus/jackson/impl/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " entries"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 478
    :cond_7
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result v0

    .line 485
    :cond_8
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v3}, Lorg/codehaus/jackson/impl/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_9

    .line 486
    invoke-direct {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextTokenNotInObject(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v3

    goto/16 :goto_0

    .line 489
    :cond_9
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parseFieldName(I)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    .line 490
    .local v1, "n":Lorg/codehaus/jackson/sym/Name;
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parsingContext:Lorg/codehaus/jackson/impl/JsonReadContext;

    invoke-virtual {v1}, Lorg/codehaus/jackson/sym/Name;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/codehaus/jackson/impl/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 491
    sget-object v3, Lorg/codehaus/jackson/JsonToken;->FIELD_NAME:Lorg/codehaus/jackson/JsonToken;

    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    .line 492
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result v0

    .line 493
    const/16 v3, 0x3a

    if-eq v0, v3, :cond_a

    .line 494
    const-string v3, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, v0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 496
    :cond_a
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_skipWS()I

    move-result v0

    .line 499
    const/16 v3, 0x22

    if-ne v0, v3, :cond_b

    .line 500
    iput-boolean v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_tokenIncomplete:Z

    .line 501
    sget-object v3, Lorg/codehaus/jackson/JsonToken;->VALUE_STRING:Lorg/codehaus/jackson/JsonToken;

    iput-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 502
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto/16 :goto_0

    .line 506
    :cond_b
    sparse-switch v0, :sswitch_data_0

    .line 549
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleUnexpectedValue(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v2

    .line 551
    .local v2, "t":Lorg/codehaus/jackson/JsonToken;
    :goto_1
    iput-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_nextToken:Lorg/codehaus/jackson/JsonToken;

    .line 552
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_currToken:Lorg/codehaus/jackson/JsonToken;

    goto/16 :goto_0

    .line 508
    .end local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_0
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->START_ARRAY:Lorg/codehaus/jackson/JsonToken;

    .line 509
    .restart local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 511
    .end local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_1
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->START_OBJECT:Lorg/codehaus/jackson/JsonToken;

    .line 512
    .restart local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 517
    .end local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_2
    const-string v3, "expected a value"

    invoke-virtual {p0, v0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 519
    :sswitch_3
    const-string v3, "true"

    invoke-virtual {p0, v3, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 520
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_TRUE:Lorg/codehaus/jackson/JsonToken;

    .line 521
    .restart local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 523
    .end local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_4
    const-string v3, "false"

    invoke-virtual {p0, v3, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 524
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_FALSE:Lorg/codehaus/jackson/JsonToken;

    .line 525
    .restart local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 527
    .end local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_5
    const-string v3, "null"

    invoke-virtual {p0, v3, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_matchToken(Ljava/lang/String;I)V

    .line 528
    sget-object v2, Lorg/codehaus/jackson/JsonToken;->VALUE_NULL:Lorg/codehaus/jackson/JsonToken;

    .line 529
    .restart local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 546
    .end local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    :sswitch_6
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseNumberText(I)Lorg/codehaus/jackson/JsonToken;

    move-result-object v2

    .line 547
    .restart local v2    # "t":Lorg/codehaus/jackson/JsonToken;
    goto :goto_1

    .line 506
    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_6
        0x30 -> :sswitch_6
        0x31 -> :sswitch_6
        0x32 -> :sswitch_6
        0x33 -> :sswitch_6
        0x34 -> :sswitch_6
        0x35 -> :sswitch_6
        0x36 -> :sswitch_6
        0x37 -> :sswitch_6
        0x38 -> :sswitch_6
        0x39 -> :sswitch_6
        0x5b -> :sswitch_0
        0x5d -> :sswitch_2
        0x66 -> :sswitch_4
        0x6e -> :sswitch_5
        0x74 -> :sswitch_3
        0x7b -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method protected parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;
    .locals 7
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "currQuad"    # I
    .param p4, "ch"    # I
    .param p5, "currQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    .line 1430
    sget-object v0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesLatin1:[I

    .line 1433
    .local v0, "codes":[I
    :goto_0
    aget v3, v0, p4

    if-eqz v3, :cond_d

    .line 1434
    const/16 v3, 0x22

    if-ne p4, v3, :cond_3

    .line 1503
    if-lez p5, :cond_1

    .line 1504
    array-length v3, p1

    if-lt p2, v3, :cond_0

    .line 1505
    array-length v3, p1

    invoke-static {p1, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1507
    :cond_0
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "qlen":I
    .local v2, "qlen":I
    aput p3, p1, p2

    move p2, v2

    .line 1509
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_1
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_symbols:Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;

    invoke-virtual {v3, p1, p2}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->findName([II)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    .line 1510
    .local v1, "name":Lorg/codehaus/jackson/sym/Name;
    if-nez v1, :cond_2

    .line 1511
    invoke-direct {p0, p1, p2, p5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->addName([III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    .line 1513
    :cond_2
    return-object v1

    .line 1438
    .end local v1    # "name":Lorg/codehaus/jackson/sym/Name;
    :cond_3
    const/16 v3, 0x5c

    if-eq p4, v3, :cond_6

    .line 1440
    const-string v3, "name"

    invoke-virtual {p0, p4, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 1450
    :goto_1
    const/16 v3, 0x7f

    if-le p4, v3, :cond_d

    .line 1452
    if-lt p5, v6, :cond_c

    .line 1453
    array-length v3, p1

    if-lt p2, v3, :cond_4

    .line 1454
    array-length v3, p1

    invoke-static {p1, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1456
    :cond_4
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    aput p3, p1, p2

    .line 1457
    const/4 p3, 0x0

    .line 1458
    const/4 p5, 0x0

    .line 1460
    :goto_2
    const/16 v3, 0x800

    if-ge p4, v3, :cond_7

    .line 1461
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0x6

    or-int/lit16 v4, v4, 0xc0

    or-int p3, v3, v4

    .line 1462
    add-int/lit8 p5, p5, 0x1

    move p2, v2

    .line 1480
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :goto_3
    and-int/lit8 v3, p4, 0x3f

    or-int/lit16 p4, v3, 0x80

    move v2, p2

    .line 1484
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :goto_4
    if-ge p5, v6, :cond_9

    .line 1485
    add-int/lit8 p5, p5, 0x1

    .line 1486
    shl-int/lit8 v3, p3, 0x8

    or-int p3, v3, p4

    move p2, v2

    .line 1495
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :goto_5
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v4, :cond_5

    .line 1496
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_5

    .line 1497
    const-string v3, " in field name"

    invoke-virtual {p0, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1500
    :cond_5
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v4, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 p4, v3, 0xff

    goto :goto_0

    .line 1443
    :cond_6
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_decodeEscaped()C

    move-result p4

    goto :goto_1

    .line 1465
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_7
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int p3, v3, v4

    .line 1466
    add-int/lit8 p5, p5, 0x1

    .line 1468
    if-lt p5, v6, :cond_b

    .line 1469
    array-length v3, p1

    if-lt v2, v3, :cond_8

    .line 1470
    array-length v3, p1

    invoke-static {p1, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1472
    :cond_8
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    aput p3, p1, v2

    .line 1473
    const/4 p3, 0x0

    .line 1474
    const/4 p5, 0x0

    .line 1476
    :goto_6
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/lit16 v4, v4, 0x80

    or-int p3, v3, v4

    .line 1477
    add-int/lit8 p5, p5, 0x1

    goto :goto_3

    .line 1488
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_9
    array-length v3, p1

    if-lt v2, v3, :cond_a

    .line 1489
    array-length v3, p1

    invoke-static {p1, v3}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1491
    :cond_a
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    aput p3, p1, v2

    .line 1492
    move p3, p4

    .line 1493
    const/4 p5, 0x1

    goto :goto_5

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_b
    move p2, v2

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    goto :goto_6

    :cond_c
    move v2, p2

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    goto :goto_2

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_d
    move v2, p2

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    goto :goto_4
.end method

.method protected parseLongFieldName(I)Lorg/codehaus/jackson/sym/Name;
    .locals 12
    .param p1, "q"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v10, 0x4

    const/16 v9, 0x22

    .line 1324
    sget-object v6, Lorg/codehaus/jackson/impl/Utf8StreamParser;->sInputCodesLatin1:[I

    .line 1325
    .local v6, "codes":[I
    const/4 v2, 0x2

    .line 1332
    .local v2, "qlen":I
    :goto_0
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    sub-int/2addr v0, v1

    if-ge v0, v10, :cond_0

    .line 1333
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    move-object v0, p0

    move v4, p1

    move v5, v3

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 1369
    :goto_1
    return-object v0

    .line 1337
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v8, v1, 0x1

    iput v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1338
    .local v4, "i":I
    aget v0, v6, v4

    if-eqz v0, :cond_2

    .line 1339
    if-ne v4, v9, :cond_1

    .line 1340
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    invoke-direct {p0, v0, v2, p1, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName([IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_1

    .line 1342
    :cond_1
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_1

    .line 1345
    :cond_2
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1346
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v8, v1, 0x1

    iput v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1347
    aget v0, v6, v4

    if-eqz v0, :cond_4

    .line 1348
    if-ne v4, v9, :cond_3

    .line 1349
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    invoke-direct {p0, v0, v2, p1, v11}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName([IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_1

    .line 1351
    :cond_3
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    move-object v0, p0

    move v3, p1

    move v5, v11

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_1

    .line 1354
    :cond_4
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1355
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v8, v1, 0x1

    iput v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1356
    aget v0, v6, v4

    if-eqz v0, :cond_6

    .line 1357
    if-ne v4, v9, :cond_5

    .line 1358
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v1, 0x3

    invoke-direct {p0, v0, v2, p1, v1}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName([IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_1

    .line 1360
    :cond_5
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v5, 0x3

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_1

    .line 1363
    :cond_6
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1364
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v8, v1, 0x1

    iput v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1365
    aget v0, v6, v4

    if-eqz v0, :cond_8

    .line 1366
    if-ne v4, v9, :cond_7

    .line 1367
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    invoke-direct {p0, v0, v2, p1, v10}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName([IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto/16 :goto_1

    .line 1369
    :cond_7
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    move-object v0, p0

    move v3, p1

    move v5, v10

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto/16 :goto_1

    .line 1373
    :cond_8
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    array-length v0, v0

    if-lt v2, v0, :cond_9

    .line 1374
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    invoke-static {v0, v2}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    .line 1376
    :cond_9
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    add-int/lit8 v7, v2, 0x1

    .end local v2    # "qlen":I
    .local v7, "qlen":I
    aput p1, v0, v2

    .line 1377
    move p1, v4

    move v2, v7

    .line 1378
    .end local v7    # "qlen":I
    .restart local v2    # "qlen":I
    goto/16 :goto_0
.end method

.method protected final parseMediumFieldName(I[I)Lorg/codehaus/jackson/sym/Name;
    .locals 9
    .param p1, "q2"    # I
    .param p2, "codes"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/16 v4, 0x22

    .line 1284
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 1285
    .local v0, "i":I
    aget v1, p2, v0

    if-eqz v1, :cond_1

    .line 1286
    if-ne v0, v4, :cond_0

    .line 1287
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    .line 1317
    :goto_0
    return-object v1

    .line 1289
    :cond_0
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v0, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1291
    :cond_1
    shl-int/lit8 v1, p1, 0x8

    or-int p1, v1, v0

    .line 1292
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 1293
    aget v1, p2, v0

    if-eqz v1, :cond_3

    .line 1294
    if-ne v0, v4, :cond_2

    .line 1295
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1297
    :cond_2
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v0, v6}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1299
    :cond_3
    shl-int/lit8 v1, p1, 0x8

    or-int p1, v1, v0

    .line 1300
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 1301
    aget v1, p2, v0

    if-eqz v1, :cond_5

    .line 1302
    if-ne v0, v4, :cond_4

    .line 1303
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1305
    :cond_4
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v0, v7}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1307
    :cond_5
    shl-int/lit8 v1, p1, 0x8

    or-int p1, v1, v0

    .line 1308
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 1309
    aget v1, p2, v0

    if-eqz v1, :cond_7

    .line 1310
    if-ne v0, v4, :cond_6

    .line 1311
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->findName(III)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1313
    :cond_6
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    invoke-direct {p0, v1, p1, v0, v8}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseFieldName(IIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto :goto_0

    .line 1315
    :cond_7
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    const/4 v2, 0x0

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quad1:I

    aput v3, v1, v2

    .line 1316
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    aput p1, v1, v5

    .line 1317
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseLongFieldName(I)Lorg/codehaus/jackson/sym/Name;

    move-result-object v1

    goto/16 :goto_0
.end method

.method protected final parseNumberText(I)Lorg/codehaus/jackson/JsonToken;
    .locals 12
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x39

    const/16 v8, 0x2d

    const/4 v0, 0x1

    const/16 v10, 0x30

    .line 991
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v3}, Lorg/codehaus/jackson/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 992
    .local v1, "outBuf":[C
    const/4 v2, 0x0

    .line 993
    .local v2, "outPtr":I
    if-ne p1, v8, :cond_2

    move v4, v0

    .line 996
    .local v4, "negative":Z
    :goto_0
    if-eqz v4, :cond_3

    .line 997
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .local v7, "outPtr":I
    aput-char v8, v1, v2

    .line 999
    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v3, v8, :cond_0

    .line 1000
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMoreGuaranteed()V

    .line 1002
    :cond_0
    iget-object v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v3, v3, v8

    and-int/lit16 p1, v3, 0xff

    .line 1004
    if-lt p1, v10, :cond_1

    if-le p1, v11, :cond_4

    .line 1005
    :cond_1
    invoke-virtual {p0, p1, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_handleInvalidNumberStart(IZ)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    move v2, v7

    .line 1045
    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    :goto_1
    return-object v0

    .line 993
    .end local v4    # "negative":Z
    :cond_2
    const/4 v4, 0x0

    goto :goto_0

    .restart local v4    # "negative":Z
    :cond_3
    move v7, v2

    .line 1010
    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_4
    if-ne p1, v10, :cond_5

    .line 1011
    invoke-direct {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_verifyNoLeadingZeroes()I

    move-result p1

    .line 1015
    :cond_5
    add-int/lit8 v2, v7, 0x1

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    int-to-char v0, p1

    aput-char v0, v1, v7

    .line 1016
    const/4 v5, 0x1

    .line 1019
    .local v5, "intLen":I
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    array-length v3, v1

    add-int v6, v0, v3

    .line 1020
    .local v6, "end":I
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-le v6, v0, :cond_6

    .line 1021
    iget v6, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    .line 1026
    :cond_6
    :goto_2
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    if-lt v0, v6, :cond_7

    .line 1028
    invoke-direct {p0, v1, v2, v4, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parserNumber2([CIZI)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 1030
    :cond_7
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v8, v3, 0x1

    iput v8, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v3

    and-int/lit16 p1, v0, 0xff

    .line 1031
    if-lt p1, v10, :cond_8

    if-le p1, v11, :cond_a

    .line 1037
    :cond_8
    const/16 v0, 0x2e

    if-eq p1, v0, :cond_9

    const/16 v0, 0x65

    if-eq p1, v0, :cond_9

    const/16 v0, 0x45

    if-ne p1, v0, :cond_b

    :cond_9
    move-object v0, p0

    move v3, p1

    .line 1038
    invoke-direct/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_parseFloatText([CIIZI)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 1034
    :cond_a
    add-int/lit8 v5, v5, 0x1

    .line 1035
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    int-to-char v0, p1

    aput-char v0, v1, v2

    move v2, v7

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    goto :goto_2

    .line 1041
    :cond_b
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 1042
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_textBuffer:Lorg/codehaus/jackson/util/TextBuffer;

    invoke-virtual {v0, v2}, Lorg/codehaus/jackson/util/TextBuffer;->setCurrentLength(I)V

    .line 1045
    invoke-virtual {p0, v4, v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->resetInt(ZI)Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    goto :goto_1
.end method

.method public releaseBuffered(Ljava/io/OutputStream;)I
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    iget v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    iget v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    sub-int v0, v2, v3

    .line 144
    .local v0, "count":I
    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    .line 145
    const/4 v0, 0x0

    .line 150
    .end local v0    # "count":I
    :goto_0
    return v0

    .line 148
    .restart local v0    # "count":I
    :cond_0
    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    .line 149
    .local v1, "origPtr":I
    iget-object v2, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    invoke-virtual {p1, v2, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public setCodec(Lorg/codehaus/jackson/ObjectCodec;)V
    .locals 0
    .param p1, "c"    # Lorg/codehaus/jackson/ObjectCodec;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_objectCodec:Lorg/codehaus/jackson/ObjectCodec;

    .line 132
    return-void
.end method

.method protected slowParseFieldName()Lorg/codehaus/jackson/sym/Name;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1389
    iget v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1390
    invoke-virtual {p0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1391
    const-string v0, ": was expecting closing \'\"\' for name"

    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1394
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputBuffer:[B

    iget v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1395
    .local v4, "i":I
    const/16 v0, 0x22

    if-ne v4, v0, :cond_1

    .line 1396
    invoke-static {}, Lorg/codehaus/jackson/sym/BytesToNameCanonicalizer;->getEmptyName()Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    .line 1398
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, p0, Lorg/codehaus/jackson/impl/Utf8StreamParser;->_quadBuffer:[I

    move-object v0, p0

    move v3, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lorg/codehaus/jackson/impl/Utf8StreamParser;->parseEscapedFieldName([IIIII)Lorg/codehaus/jackson/sym/Name;

    move-result-object v0

    goto :goto_0
.end method
