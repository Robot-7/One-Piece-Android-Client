.class public Lcom/youai/sdks/PlatformRegistery;
.super Ljava/lang/Object;
.source "PlatformRegistery.java"


# static fields
.field private static mInstance:Lcom/youai/sdks/PlatformRegistery;


# instance fields
.field public sparseArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    sput-object v0, Lcom/youai/sdks/PlatformRegistery;->mInstance:Lcom/youai/sdks/PlatformRegistery;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    .line 16
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    .line 17
    return-void
.end method

.method public static getInstance()Lcom/youai/sdks/PlatformRegistery;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/youai/sdks/PlatformRegistery;->mInstance:Lcom/youai/sdks/PlatformRegistery;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/youai/sdks/PlatformRegistery;

    invoke-direct {v0}, Lcom/youai/sdks/PlatformRegistery;-><init>()V

    sput-object v0, Lcom/youai/sdks/PlatformRegistery;->mInstance:Lcom/youai/sdks/PlatformRegistery;

    .line 22
    sget-object v0, Lcom/youai/sdks/PlatformRegistery;->mInstance:Lcom/youai/sdks/PlatformRegistery;

    invoke-direct {v0}, Lcom/youai/sdks/PlatformRegistery;->loadAdapters()V

    .line 26
    :cond_0
    sget-object v0, Lcom/youai/sdks/PlatformRegistery;->mInstance:Lcom/youai/sdks/PlatformRegistery;

    return-object v0
.end method

.method private loadAdapters()V
    .locals 8

    .prologue
    .line 30
    const-class v0, Lcom/youai/sdks/beans/PlatformContacts$Platforms;

    .line 31
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 33
    .local v3, "fields":[Ljava/lang/reflect/Field;
    array-length v5, v3

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v5, :cond_0

    .line 40
    iget-object v4, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 41
    return-void

    .line 33
    :cond_0
    aget-object v2, v3, v4

    .line 35
    .local v2, "f":Ljava/lang/reflect/Field;
    const/4 v6, 0x0

    :try_start_0
    invoke-virtual {v2, v6}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/youai/sdks/PlatformRegistery;->registerPlatform(Ljava/lang/Integer;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 36
    :catch_0
    move-exception v1

    .line 37
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public getPlatformClassForType(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p1, "adType"    # Ljava/lang/Integer;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPlatformTypeByName(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v2, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 52
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 57
    const/4 v2, -0x1

    :goto_1
    return v2

    .line 53
    :cond_0
    iget-object v2, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 54
    iget-object v2, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    goto :goto_1

    .line 52
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public registerPlatform(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 4
    .param p1, "type"    # Ljava/lang/Integer;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/youai/sdks/PlatformRegistery;->sparseArray:Landroid/util/SparseArray;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "com.youai.sdks.platform."

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    return-void
.end method
