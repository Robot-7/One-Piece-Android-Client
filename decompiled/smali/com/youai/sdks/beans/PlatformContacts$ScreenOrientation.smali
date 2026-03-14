.class public final enum Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;
.super Ljava/lang/Enum;
.source "PlatformContacts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/sdks/beans/PlatformContacts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScreenOrientation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

.field public static final enum SCREEN_ORIENTATION_AUTO:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

.field public static final enum SCREEN_ORIENTATION_LANDSCAPE:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

.field public static final enum SCREEN_ORIENTATION_PORTRAIT:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 106
    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    const-string v1, "SCREEN_ORIENTATION_PORTRAIT"

    invoke-direct {v0, v1, v2}, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->SCREEN_ORIENTATION_PORTRAIT:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    const-string v1, "SCREEN_ORIENTATION_LANDSCAPE"

    invoke-direct {v0, v1, v3}, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->SCREEN_ORIENTATION_LANDSCAPE:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    const-string v1, "SCREEN_ORIENTATION_AUTO"

    invoke-direct {v0, v1, v4}, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->SCREEN_ORIENTATION_AUTO:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    .line 105
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->SCREEN_ORIENTATION_PORTRAIT:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    aput-object v1, v0, v2

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->SCREEN_ORIENTATION_LANDSCAPE:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    aput-object v1, v0, v3

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->SCREEN_ORIENTATION_AUTO:Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    aput-object v1, v0, v4

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 105
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    return-object v0
.end method

.method public static values()[Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;->ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    array-length v1, v0

    new-array v2, v1, [Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
