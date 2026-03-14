.class public Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;
.super Landroid/app/Dialog;
.source "Cocos2dxEditBoxDialog.java"


# instance fields
.field private final kEditBoxInputFlagInitialCapsAllCharacters:I

.field private final kEditBoxInputFlagInitialCapsSentence:I

.field private final kEditBoxInputFlagInitialCapsWord:I

.field private final kEditBoxInputFlagPassword:I

.field private final kEditBoxInputFlagSensitive:I

.field private final kEditBoxInputModeAny:I

.field private final kEditBoxInputModeDecimal:I

.field private final kEditBoxInputModeEmailAddr:I

.field private final kEditBoxInputModeNumeric:I

.field private final kEditBoxInputModePhoneNumber:I

.field private final kEditBoxInputModeSingleLine:I

.field private final kEditBoxInputModeUrl:I

.field private final kKeyboardReturnTypeDefault:I

.field private final kKeyboardReturnTypeDone:I

.field private final kKeyboardReturnTypeGo:I

.field private final kKeyboardReturnTypeSearch:I

.field private final kKeyboardReturnTypeSend:I

.field private mCancelBtn:Landroid/widget/Button;

.field private mInputEditText:Landroid/widget/EditText;

.field private final mInputFlag:I

.field private mInputFlagConstraints:I

.field private final mInputMode:I

.field private mInputModeContraints:I

.field private mIsMultiline:Z

.field private final mMaxLength:I

.field private final mMessage:Ljava/lang/String;

.field private mOkBtn:Landroid/widget/Button;

.field private final mReturnType:I

.field private mTextViewTitle:Landroid/widget/TextView;

.field private final mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 6
    .param p1, "pContext"    # Landroid/content/Context;
    .param p2, "pTitle"    # Ljava/lang/String;
    .param p3, "pMessage"    # Ljava/lang/String;
    .param p4, "pInputMode"    # I
    .param p5, "pInputFlag"    # I
    .param p6, "pReturnType"    # I
    .param p7, "pMaxLength"    # I

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 144
    const v0, 0x1030011

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 56
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModeAny:I

    .line 61
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModeEmailAddr:I

    .line 66
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModeNumeric:I

    .line 71
    iput v4, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModePhoneNumber:I

    .line 76
    iput v5, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModeUrl:I

    .line 81
    const/4 v0, 0x5

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModeDecimal:I

    .line 86
    const/4 v0, 0x6

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputModeSingleLine:I

    .line 91
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputFlagPassword:I

    .line 96
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputFlagSensitive:I

    .line 101
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputFlagInitialCapsWord:I

    .line 106
    iput v4, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputFlagInitialCapsSentence:I

    .line 111
    iput v5, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kEditBoxInputFlagInitialCapsAllCharacters:I

    .line 113
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kKeyboardReturnTypeDefault:I

    .line 114
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kKeyboardReturnTypeDone:I

    .line 115
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kKeyboardReturnTypeSend:I

    .line 116
    iput v4, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kKeyboardReturnTypeSearch:I

    .line 117
    iput v5, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->kKeyboardReturnTypeGo:I

    .line 147
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mTitle:Ljava/lang/String;

    .line 148
    iput-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mMessage:Ljava/lang/String;

    .line 149
    iput p4, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputMode:I

    .line 150
    iput p5, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlag:I

    .line 151
    iput p6, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mReturnType:I

    .line 152
    iput p7, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mMaxLength:I

    .line 153
    return-void
.end method

.method static synthetic access$0(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)V
    .locals 0

    .prologue
    .line 380
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->closeKeyboard()V

    return-void
.end method

.method static synthetic access$2(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)V
    .locals 0

    .prologue
    .line 375
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->openKeyboard()V

    return-void
.end method

.method private closeKeyboard()V
    .locals 3

    .prologue
    .line 381
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 382
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 383
    return-void
.end method

.method private convertDipsToPixels(F)I
    .locals 2
    .param p1, "pDIPs"    # F

    .prologue
    .line 371
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 372
    .local v0, "scale":F
    mul-float v1, p1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1
.end method

.method private openKeyboard()V
    .locals 3

    .prologue
    .line 376
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 377
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 378
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 17
    .param p1, "pSavedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 157
    invoke-super/range {p0 .. p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 159
    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getWindow()Landroid/view/Window;

    move-result-object v12

    new-instance v13, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v14, -0x80000000

    invoke-direct {v13, v14}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v12, v13}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 161
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-direct {v6, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 162
    .local v6, "layout":Landroid/widget/LinearLayout;
    const/4 v12, 0x1

    invoke-virtual {v6, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 164
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x1

    invoke-direct {v8, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 166
    .local v8, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v12, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mTextViewTitle:Landroid/widget/TextView;

    .line 167
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/4 v13, -0x2

    invoke-direct {v11, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 168
    .local v11, "textviewParams":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v12, 0x50

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 169
    const/high16 v12, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->convertDipsToPixels(F)I

    move-result v12

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 170
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mTextViewTitle:Landroid/widget/TextView;

    const/4 v13, 0x1

    const/high16 v14, 0x41a00000    # 20.0f

    invoke-virtual {v12, v13, v14}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 171
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mTextViewTitle:Landroid/widget/TextView;

    invoke-virtual {v6, v12, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    new-instance v12, Landroid/widget/EditText;

    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    .line 174
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x2

    invoke-direct {v3, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 175
    .local v3, "editTextParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v12, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->convertDipsToPixels(F)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 177
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v12, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-direct {v7, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 181
    .local v7, "layout1":Landroid/widget/LinearLayout;
    const/4 v12, 0x0

    invoke-virtual {v7, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 183
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x2

    invoke-direct {v9, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 185
    .local v9, "ltParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v6, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/4 v13, -0x1

    invoke-direct {v1, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 188
    .local v1, "btnParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v12, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->convertDipsToPixels(F)I

    move-result v12

    iput v12, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 190
    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v12, v12, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v13, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    mul-int/lit8 v13, v13, 0x2

    sub-int/2addr v12, v13

    int-to-double v12, v12

    const-wide v14, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v12, v14

    double-to-int v4, v12

    .line 192
    .local v4, "iOne":I
    div-int/lit8 v12, v4, 0x2

    iput v12, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 193
    const/high16 v12, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->convertDipsToPixels(F)I

    move-result v12

    iput v12, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v12, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 194
    new-instance v12, Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mOkBtn:Landroid/widget/Button;

    .line 195
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mOkBtn:Landroid/widget/Button;

    const-string v13, "\u786e\u5b9a"

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 196
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mOkBtn:Landroid/widget/Button;

    int-to-double v13, v4

    const-wide/high16 v15, 0x4012000000000000L    # 4.5

    mul-double/2addr v13, v15

    double-to-int v13, v13

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setWidth(I)V

    .line 197
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mOkBtn:Landroid/widget/Button;

    invoke-virtual {v7, v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/4 v13, -0x1

    invoke-direct {v2, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 200
    .local v2, "btnParams1":Landroid/widget/LinearLayout$LayoutParams;
    div-int/lit8 v12, v4, 0x2

    iput v12, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 201
    iget v12, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v12, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 202
    const/high16 v12, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->convertDipsToPixels(F)I

    move-result v12

    iput v12, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v12, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 203
    new-instance v12, Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mCancelBtn:Landroid/widget/Button;

    .line 204
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mCancelBtn:Landroid/widget/Button;

    const-string v13, "\u53d6\u6d88"

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 205
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mCancelBtn:Landroid/widget/Button;

    int-to-double v13, v4

    const-wide/high16 v15, 0x4012000000000000L    # 4.5

    mul-double/2addr v13, v15

    double-to-int v13, v13

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setWidth(I)V

    .line 206
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mCancelBtn:Landroid/widget/Button;

    invoke-virtual {v7, v12, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mOkBtn:Landroid/widget/Button;

    new-instance v13, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mCancelBtn:Landroid/widget/Button;

    new-instance v13, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$2;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$2;-><init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 241
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v8}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 243
    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->getWindow()Landroid/view/Window;

    move-result-object v12

    const/16 v13, 0x400

    invoke-virtual {v12, v13}, Landroid/view/Window;->addFlags(I)V

    .line 245
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mTextViewTitle:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mTitle:Ljava/lang/String;

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mMessage:Ljava/lang/String;

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v12}, Landroid/widget/EditText;->getImeOptions()I

    move-result v10

    .line 249
    .local v10, "oldImeOptions":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    const/high16 v13, 0x10000000

    or-int/2addr v13, v10

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 250
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v12}, Landroid/widget/EditText;->getImeOptions()I

    move-result v10

    .line 252
    move-object/from16 v0, p0

    iget v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputMode:I

    packed-switch v12, :pswitch_data_0

    .line 279
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mIsMultiline:Z

    if-eqz v12, :cond_0

    .line 280
    move-object/from16 v0, p0

    iget v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    const/high16 v13, 0x20000

    or-int/2addr v12, v13

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    .line 283
    :cond_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget v13, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    move-object/from16 v0, p0

    iget v14, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    or-int/2addr v13, v14

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setInputType(I)V

    .line 285
    move-object/from16 v0, p0

    iget v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlag:I

    packed-switch v12, :pswitch_data_1

    .line 305
    :goto_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget v13, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    move-object/from16 v0, p0

    iget v14, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    or-int/2addr v13, v14

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setInputType(I)V

    .line 307
    move-object/from16 v0, p0

    iget v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mReturnType:I

    packed-switch v12, :pswitch_data_2

    .line 324
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    or-int/lit8 v13, v10, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 328
    :goto_2
    move-object/from16 v0, p0

    iget v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mMaxLength:I

    if-lez v12, :cond_1

    .line 329
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    const/4 v13, 0x1

    new-array v13, v13, [Landroid/text/InputFilter;

    const/4 v14, 0x0

    new-instance v15, Landroid/text/InputFilter$LengthFilter;

    move-object/from16 v0, p0

    iget v0, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mMaxLength:I

    move/from16 v16, v0

    invoke-direct/range {v15 .. v16}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v15, v13, v14

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 332
    :cond_1
    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    .line 333
    .local v5, "initHandler":Landroid/os/Handler;
    new-instance v12, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$3;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$3;-><init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)V

    .line 340
    const-wide/16 v13, 0xc8

    .line 333
    invoke-virtual {v5, v12, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 342
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    new-instance v13, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$4;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog$4;-><init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 355
    return-void

    .line 254
    .end local v5    # "initHandler":Landroid/os/Handler;
    :pswitch_0
    const v12, 0x20001

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 257
    :pswitch_1
    const/16 v12, 0x21

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 260
    :pswitch_2
    const/16 v12, 0x1002

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 263
    :pswitch_3
    const/4 v12, 0x3

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 266
    :pswitch_4
    const/16 v12, 0x11

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 269
    :pswitch_5
    const/16 v12, 0x3002

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 272
    :pswitch_6
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputModeContraints:I

    goto/16 :goto_0

    .line 287
    :pswitch_7
    const/16 v12, 0x81

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    goto/16 :goto_1

    .line 290
    :pswitch_8
    const/high16 v12, 0x80000

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    goto/16 :goto_1

    .line 293
    :pswitch_9
    const/16 v12, 0x2000

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    goto/16 :goto_1

    .line 296
    :pswitch_a
    const/16 v12, 0x4000

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    goto/16 :goto_1

    .line 299
    :pswitch_b
    const/16 v12, 0x1000

    move-object/from16 v0, p0

    iput v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputFlagConstraints:I

    goto/16 :goto_1

    .line 309
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    or-int/lit8 v13, v10, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    goto/16 :goto_2

    .line 312
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    or-int/lit8 v13, v10, 0x6

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    goto/16 :goto_2

    .line 315
    :pswitch_e
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    or-int/lit8 v13, v10, 0x4

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    goto/16 :goto_2

    .line 318
    :pswitch_f
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    or-int/lit8 v13, v10, 0x3

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    goto/16 :goto_2

    .line 321
    :pswitch_10
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->mInputEditText:Landroid/widget/EditText;

    or-int/lit8 v13, v10, 0x2

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setImeOptions(I)V

    goto/16 :goto_2

    .line 252
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 285
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch

    .line 307
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method
