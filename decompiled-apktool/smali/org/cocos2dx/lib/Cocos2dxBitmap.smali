.class public Lorg/cocos2dx/lib/Cocos2dxBitmap;
.super Ljava/lang/Object;
.source "Cocos2dxBitmap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    }
.end annotation


# static fields
.field private static final HORIZONTALALIGN_CENTER:I = 0x3

.field private static final HORIZONTALALIGN_LEFT:I = 0x1

.field private static final HORIZONTALALIGN_RIGHT:I = 0x2

.field private static final VERTICALALIGN_BOTTOM:I = 0x2

.field private static final VERTICALALIGN_CENTER:I = 0x3

.field private static final VERTICALALIGN_TOP:I = 0x1

.field private static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    .locals 10
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pWidth"    # I
    .param p2, "pHeight"    # I
    .param p3, "pPaint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v7, 0x0

    .line 239
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 240
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v6, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v8, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v6, v8

    int-to-double v8, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v1, v8

    .line 241
    .local v1, "h":I
    const/4 v4, 0x0

    .line 243
    .local v4, "maxContentWidth":I
    invoke-static {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;

    move-result-object v3

    .line 245
    .local v3, "lines":[Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 246
    move v4, p1

    .line 258
    :cond_0
    new-instance v6, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;

    invoke-direct {v6, v4, v1, v3}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;-><init>(II[Ljava/lang/String;)V

    return-object v6

    .line 249
    :cond_1
    const/4 v5, 0x0

    .line 250
    .local v5, "temp":I
    array-length v8, v3

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_0

    aget-object v2, v3, v6

    .line 251
    .local v2, "line":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p3, v2, v7, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v9

    invoke-static {v9}, Landroid/util/FloatMath;->ceil(F)F

    move-result v9

    float-to-int v5, v9

    .line 252
    if-le v5, v4, :cond_2

    .line 253
    move v4, v5

    .line 250
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method private static computeX(Ljava/lang/String;II)I
    .locals 1
    .param p0, "pText"    # Ljava/lang/String;
    .param p1, "pMaxWidth"    # I
    .param p2, "pHorizontalAlignment"    # I

    .prologue
    .line 262
    const/4 v0, 0x0

    .line 264
    .local v0, "ret":I
    packed-switch p2, :pswitch_data_0

    .line 276
    :goto_0
    return v0

    .line 266
    :pswitch_0
    div-int/lit8 v0, p1, 0x2

    .line 267
    goto :goto_0

    .line 269
    :pswitch_1
    move v0, p1

    .line 270
    goto :goto_0

    .line 264
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static computeY(Landroid/graphics/Paint$FontMetricsInt;III)I
    .locals 3
    .param p0, "pFontMetricsInt"    # Landroid/graphics/Paint$FontMetricsInt;
    .param p1, "pConstrainHeight"    # I
    .param p2, "pTotalHeight"    # I
    .param p3, "pVerticalAlignment"    # I

    .prologue
    .line 280
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v0, v1

    .line 282
    .local v0, "y":I
    if-le p1, p2, :cond_0

    .line 283
    packed-switch p3, :pswitch_data_0

    .line 298
    :cond_0
    :goto_0
    return v0

    .line 285
    :pswitch_0
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v0, v1

    .line 286
    goto :goto_0

    .line 288
    :pswitch_1
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v1, v1

    sub-int v2, p1, p2

    div-int/lit8 v2, v2, 0x2

    add-int v0, v1, v2

    .line 289
    goto :goto_0

    .line 291
    :pswitch_2
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v1, v1

    sub-int v2, p1, p2

    add-int v0, v1, v2

    .line 292
    goto :goto_0

    .line 283
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static createTextBitmap(Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 22
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pFontName"    # Ljava/lang/String;
    .param p2, "pFontSize"    # I
    .param p3, "pAlignment"    # I
    .param p4, "pWidth"    # I
    .param p5, "pHeight"    # I

    .prologue
    .line 95
    const/16 v20, 0x0

    .line 96
    .local v20, "bBold":Z
    const/16 v21, 0x0

    .line 98
    .local v21, "bUnderline":Z
    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    .line 100
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 101
    const/4 v13, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    const/high16 v15, 0x3f800000    # 1.0f

    const/high16 v16, 0x3f800000    # 1.0f

    const/high16 v17, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    .line 98
    invoke-static/range {v0 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->createTextBitmapShadowStroke(Ljava/lang/String;Ljava/lang/String;IFFFIIIZFFFZFFFFZZ)V

    .line 103
    return-void
.end method

.method public static createTextBitmapShadowStroke(Ljava/lang/String;Ljava/lang/String;IFFFIIIZFFFZFFFFZZ)V
    .locals 30
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pFontName"    # Ljava/lang/String;
    .param p2, "pFontSize"    # I
    .param p3, "fontTintR"    # F
    .param p4, "fontTintG"    # F
    .param p5, "fontTintB"    # F
    .param p6, "pAlignment"    # I
    .param p7, "pWidth"    # I
    .param p8, "pHeight"    # I
    .param p9, "shadow"    # Z
    .param p10, "shadowDX"    # F
    .param p11, "shadowDY"    # F
    .param p12, "shadowBlur"    # F
    .param p13, "stroke"    # Z
    .param p14, "strokeR"    # F
    .param p15, "strokeG"    # F
    .param p16, "strokeB"    # F
    .param p17, "strokeSize"    # F
    .param p18, "bBold"    # Z
    .param p19, "bUnderline"    # Z

    .prologue
    .line 113
    and-int/lit8 v10, p6, 0xf

    .line 114
    .local v10, "horizontalAlignment":I
    shr-int/lit8 v23, p6, 0x4

    and-int/lit8 v20, v23, 0xf

    .line 116
    .local v20, "verticalAlignment":I
    invoke-static/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->refactorString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 117
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v14

    .line 118
    .local v14, "paint":Landroid/graphics/Paint;
    move/from16 v0, p18

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 119
    move/from16 v0, p19

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 122
    const/16 v23, 0xff

    const-wide v24, 0x406fe00000000000L    # 255.0

    move/from16 v0, p3

    float-to-double v0, v0

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-int v0, v0

    move/from16 v24, v0

    const-wide v25, 0x406fe00000000000L    # 255.0

    move/from16 v0, p4

    float-to-double v0, v0

    move-wide/from16 v27, v0

    mul-double v25, v25, v27

    move-wide/from16 v0, v25

    double-to-int v0, v0

    move/from16 v25, v0

    const-wide v26, 0x406fe00000000000L    # 255.0

    move/from16 v0, p5

    float-to-double v0, v0

    move-wide/from16 v28, v0

    mul-double v26, v26, v28

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v14, v0, v1, v2, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 124
    move-object/from16 v0, p0

    move/from16 v1, p7

    move/from16 v2, p8

    invoke-static {v0, v1, v2, v14}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;

    move-result-object v19

    .line 125
    .local v19, "textProperty":Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    if-nez p8, :cond_3

    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$0(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v7

    .line 128
    .local v7, "bitmapTotalHeight":I
    :goto_0
    const/4 v5, 0x0

    .line 129
    .local v5, "bitmapPaddingX":F
    const/4 v6, 0x0

    .line 130
    .local v6, "bitmapPaddingY":F
    const/16 v16, 0x0

    .line 131
    .local v16, "renderTextDeltaX":F
    const/16 v17, 0x0

    .line 133
    .local v17, "renderTextDeltaY":F
    if-eqz p9, :cond_1

    .line 135
    const v18, -0x828283

    .line 136
    .local v18, "shadowColor":I
    move/from16 v0, p12

    move/from16 v1, p10

    move/from16 v2, p11

    move/from16 v3, v18

    invoke-virtual {v14, v0, v1, v2, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 138
    invoke-static/range {p10 .. p10}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 139
    invoke-static/range {p11 .. p11}, Ljava/lang/Math;->abs(F)F

    move-result v6

    .line 141
    move/from16 v0, p10

    float-to-double v0, v0

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x0

    cmpg-double v23, v23, v25

    if-gez v23, :cond_0

    .line 143
    move/from16 v16, v5

    .line 146
    :cond_0
    move/from16 v0, p11

    float-to-double v0, v0

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x0

    cmpg-double v23, v23, v25

    if-gez v23, :cond_1

    .line 148
    move/from16 v17, v6

    .line 152
    .end local v18    # "shadowColor":I
    :cond_1
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$1(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v23

    float-to-int v0, v5

    move/from16 v24, v0

    add-int v23, v23, v24

    .line 153
    float-to-int v0, v6

    move/from16 v24, v0

    add-int v24, v24, v7

    sget-object v25, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 152
    invoke-static/range {v23 .. v25}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 155
    .local v4, "bitmap":Landroid/graphics/Bitmap;
    new-instance v8, Landroid/graphics/Canvas;

    invoke-direct {v8, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 158
    .local v8, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v14}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v9

    .line 160
    .local v9, "fontMetricsInt":Landroid/graphics/Paint$FontMetricsInt;
    const/16 v21, 0x0

    .line 161
    .local v21, "x":I
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$0(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v23

    move/from16 v0, p8

    move/from16 v1, v23

    move/from16 v2, v20

    invoke-static {v9, v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v22

    .line 163
    .local v22, "y":I
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$2(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v12

    .line 165
    .local v12, "lines":[Ljava/lang/String;
    array-length v0, v12

    move/from16 v24, v0

    const/16 v23, 0x0

    :goto_1
    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_4

    .line 174
    if-eqz p13, :cond_2

    .line 176
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v15

    .line 177
    .local v15, "paintStroke":Landroid/graphics/Paint;
    sget-object v23, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 178
    const/high16 v23, 0x3f000000    # 0.5f

    mul-float v23, v23, p17

    move/from16 v0, v23

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 179
    const/16 v23, 0xff

    move/from16 v0, p14

    float-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    mul-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, p15

    float-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    mul-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, p16

    float-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    mul-int/lit16 v0, v0, 0xff

    move/from16 v26, v0

    move/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v15, v0, v1, v2, v3}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 181
    const/16 v21, 0x0

    .line 182
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$0(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v23

    move/from16 v0, p8

    move/from16 v1, v23

    move/from16 v2, v20

    invoke-static {v9, v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v22

    .line 183
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$2(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v13

    .line 185
    .local v13, "lines2":[Ljava/lang/String;
    array-length v0, v13

    move/from16 v24, v0

    const/16 v23, 0x0

    :goto_2
    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_5

    .line 195
    .end local v13    # "lines2":[Ljava/lang/String;
    .end local v15    # "paintStroke":Landroid/graphics/Paint;
    :cond_2
    invoke-static {v4}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->initNativeObject(Landroid/graphics/Bitmap;)V

    .line 196
    return-void

    .end local v4    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "bitmapPaddingX":F
    .end local v6    # "bitmapPaddingY":F
    .end local v7    # "bitmapTotalHeight":I
    .end local v8    # "canvas":Landroid/graphics/Canvas;
    .end local v9    # "fontMetricsInt":Landroid/graphics/Paint$FontMetricsInt;
    .end local v12    # "lines":[Ljava/lang/String;
    .end local v16    # "renderTextDeltaX":F
    .end local v17    # "renderTextDeltaY":F
    .end local v21    # "x":I
    .end local v22    # "y":I
    :cond_3
    move/from16 v7, p8

    .line 125
    goto/16 :goto_0

    .line 165
    .restart local v4    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "bitmapPaddingX":F
    .restart local v6    # "bitmapPaddingY":F
    .restart local v7    # "bitmapTotalHeight":I
    .restart local v8    # "canvas":Landroid/graphics/Canvas;
    .restart local v9    # "fontMetricsInt":Landroid/graphics/Paint$FontMetricsInt;
    .restart local v12    # "lines":[Ljava/lang/String;
    .restart local v16    # "renderTextDeltaX":F
    .restart local v17    # "renderTextDeltaY":F
    .restart local v21    # "x":I
    .restart local v22    # "y":I
    :cond_4
    aget-object v11, v12, v23

    .line 167
    .local v11, "line":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$1(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v25

    move/from16 v0, v25

    invoke-static {v11, v0, v10}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeX(Ljava/lang/String;II)I

    move-result v21

    .line 168
    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v25, v25, v16

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v26, v0

    add-float v26, v26, v17

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v8, v11, v0, v1, v14}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 169
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$3(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v25

    add-int v22, v22, v25

    .line 165
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_1

    .line 185
    .end local v11    # "line":Ljava/lang/String;
    .restart local v13    # "lines2":[Ljava/lang/String;
    .restart local v15    # "paintStroke":Landroid/graphics/Paint;
    :cond_5
    aget-object v11, v13, v23

    .line 187
    .restart local v11    # "line":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$1(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v25

    move/from16 v0, v25

    invoke-static {v11, v0, v10}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeX(Ljava/lang/String;II)I

    move-result v21

    .line 188
    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v25, v25, v16

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v26, v0

    add-float v26, v26, v17

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v8, v11, v0, v1, v15}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 189
    invoke-static/range {v19 .. v19}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$3(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v25

    add-int v22, v22, v25

    .line 185
    add-int/lit8 v23, v23, 0x1

    goto :goto_2
.end method

.method private static divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;
    .locals 8
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pMaxWidth"    # I
    .param p2, "pPaint"    # Landroid/graphics/Paint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/graphics/Paint;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 354
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 355
    .local v0, "charLength":I
    const/4 v3, 0x0

    .line 356
    .local v3, "start":I
    const/4 v5, 0x0

    .line 357
    .local v5, "tempWidth":I
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 360
    .local v4, "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    if-le v1, v0, :cond_1

    .line 392
    if-ge v3, v0, :cond_0

    .line 393
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 396
    :cond_0
    return-object v4

    .line 361
    :cond_1
    invoke-virtual {p2, p0, v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v6

    invoke-static {v6}, Landroid/util/FloatMath;->ceil(F)F

    move-result v6

    float-to-int v5, v6

    .line 363
    if-lt v5, p1, :cond_3

    .line 364
    const/4 v6, 0x0

    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 365
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 367
    .local v2, "lastIndexOfSpace":I
    const/4 v6, -0x1

    if-eq v2, v6, :cond_4

    if-le v2, v3, :cond_4

    .line 369
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 370
    add-int/lit8 v1, v2, 0x1

    .line 383
    :goto_1
    if-ge v1, v0, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x20

    if-eq v6, v7, :cond_6

    .line 387
    :cond_2
    move v3, v1

    .line 360
    .end local v2    # "lastIndexOfSpace":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 373
    .restart local v2    # "lastIndexOfSpace":I
    :cond_4
    if-le v5, p1, :cond_5

    .line 374
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {p0, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 376
    add-int/lit8 v1, v1, -0x1

    .line 377
    goto :goto_1

    .line 378
    :cond_5
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 384
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static getFontSizeAccordingHeight(I)I
    .locals 8
    .param p0, "height"    # I

    .prologue
    .line 452
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 453
    .local v3, "paint":Landroid/graphics/Paint;
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 455
    .local v0, "bounds":Landroid/graphics/Rect;
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 456
    const/4 v2, 0x1

    .line 457
    .local v2, "incr_text_size":I
    const/4 v1, 0x0

    .line 459
    .local v1, "found_desired_size":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 472
    return v2

    .line 461
    :cond_0
    int-to-float v5, v2

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 462
    const-string v4, "SghMNy"

    .line 463
    .local v4, "text":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v4, v5, v6, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 465
    add-int/lit8 v2, v2, 0x1

    .line 467
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    sub-int v5, p0, v5

    const/4 v6, 0x2

    if-gt v5, v6, :cond_1

    .line 468
    const/4 v1, 0x1

    .line 470
    :cond_1
    const-string v5, "font size"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "incr size:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getPixels(Landroid/graphics/Bitmap;)[B
    .locals 4
    .param p0, "pBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 440
    if-eqz p0, :cond_0

    .line 441
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    new-array v1, v2, [B

    .line 442
    .local v1, "pixels":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 443
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 444
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 448
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .end local v1    # "pixels":[B
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getStringWithEllipsis(Ljava/lang/String;FF)Ljava/lang/String;
    .locals 2
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "width"    # F
    .param p2, "fontSize"    # F

    .prologue
    .line 476
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 477
    const-string v1, ""

    .line 484
    :goto_0
    return-object v1

    .line 480
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 481
    .local v0, "paint":Landroid/text/TextPaint;
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 482
    invoke-virtual {v0, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 484
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {p0, v0, p1, v1}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static initNativeObject(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p0, "pBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 431
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 432
    .local v0, "pixels":[B
    if-nez v0, :cond_0

    .line 437
    :goto_0
    return-void

    .line 436
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2, v0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->nativeInitBitmapDC(II[B)V

    goto :goto_0
.end method

.method private static native nativeInitBitmapDC(II[B)V
.end method

.method private static newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;
    .locals 7
    .param p0, "pFontName"    # Ljava/lang/String;
    .param p1, "pFontSize"    # I
    .param p2, "pHorizontalAlignment"    # I

    .prologue
    const/4 v6, 0x0

    .line 200
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 201
    .local v1, "paint":Landroid/graphics/Paint;
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 202
    int-to-float v3, p1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 203
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 206
    const-string v3, ".ttf"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 209
    :try_start_0
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    .line 208
    invoke-static {v3, p0}, Lorg/cocos2dx/lib/Cocos2dxTypefaces;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 210
    .local v2, "typeFace":Landroid/graphics/Typeface;
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v2    # "typeFace":Landroid/graphics/Typeface;
    :goto_0
    packed-switch p2, :pswitch_data_0

    .line 231
    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 235
    :goto_1
    return-object v1

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Cocos2dxBitmap"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "error to create ttf type face: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 212
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 219
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 224
    :pswitch_0
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 227
    :pswitch_1
    sget-object v3, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 222
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static refactorString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "pString"    # Ljava/lang/String;

    .prologue
    .line 401
    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 402
    const-string v3, " "

    .line 427
    :goto_0
    return-object v3

    .line 409
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 410
    .local v2, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 411
    .local v1, "start":I
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 412
    .local v0, "index":I
    :goto_1
    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    .line 427
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 413
    :cond_2
    if-eqz v0, :cond_3

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_4

    .line 414
    :cond_3
    const-string v3, " "

    invoke-virtual {v2, v1, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    add-int/lit8 v1, v0, 0x2

    .line 420
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-gt v1, v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 424
    const-string v3, "\n"

    invoke-virtual {v2, v3, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1

    .line 417
    :cond_4
    add-int/lit8 v1, v0, 0x1

    goto :goto_2
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0
    .param p0, "pContext"    # Landroid/content/Context;

    .prologue
    .line 72
    sput-object p0, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    .line 73
    return-void
.end method

.method private static splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;
    .locals 12
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pMaxWidth"    # I
    .param p2, "pMaxHeight"    # I
    .param p3, "pPaint"    # Landroid/graphics/Paint;

    .prologue
    .line 305
    const-string v9, "\\n"

    invoke-virtual {p0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 306
    .local v5, "lines":[Ljava/lang/String;
    const/4 v7, 0x0

    .line 307
    .local v7, "ret":[Ljava/lang/String;
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 308
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v9, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v10, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v9, v10

    int-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-int v1, v9

    .line 309
    .local v1, "heightPerLine":I
    div-int v6, p2, v1

    .line 311
    .local v6, "maxLines":I
    if-eqz p1, :cond_6

    .line 312
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 313
    .local v8, "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    array-length v10, v5

    const/4 v9, 0x0

    :goto_0
    if-lt v9, v10, :cond_2

    .line 329
    :cond_0
    if-lez v6, :cond_1

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-le v9, v6, :cond_1

    .line 330
    :goto_1
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-gt v9, v6, :cond_5

    .line 335
    :cond_1
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v7, v9, [Ljava/lang/String;

    .line 336
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 349
    .end local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_2
    return-object v7

    .line 313
    .restart local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_2
    aget-object v3, v5, v9

    .line 315
    .local v3, "line":Ljava/lang/String;
    invoke-virtual {p3, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    invoke-static {v11}, Landroid/util/FloatMath;->ceil(F)F

    move-result v11

    float-to-int v4, v11

    .line 316
    .local v4, "lineWidth":I
    if-le v4, p1, :cond_4

    .line 317
    invoke-static {v3, p1, p3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 323
    :goto_3
    if-lez v6, :cond_3

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v11

    if-ge v11, v6, :cond_0

    .line 313
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 319
    :cond_4
    invoke-virtual {v8, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 331
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "lineWidth":I
    :cond_5
    invoke-virtual {v8}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_1

    .line 337
    .end local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_6
    if-eqz p2, :cond_8

    array-length v9, v5

    if-le v9, v6, :cond_8

    .line 339
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 340
    .restart local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-lt v2, v6, :cond_7

    .line 343
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v7, v9, [Ljava/lang/String;

    .line 344
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto :goto_2

    .line 341
    :cond_7
    aget-object v9, v5, v2

    invoke-virtual {v8, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 340
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 346
    .end local v2    # "i":I
    .end local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_8
    move-object v7, v5

    goto :goto_2
.end method
