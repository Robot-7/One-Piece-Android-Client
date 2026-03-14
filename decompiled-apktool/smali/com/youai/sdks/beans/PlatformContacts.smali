.class public Lcom/youai/sdks/beans/PlatformContacts;
.super Ljava/lang/Object;
.source "PlatformContacts.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/sdks/beans/PlatformContacts$LoginState;,
        Lcom/youai/sdks/beans/PlatformContacts$PayState;,
        Lcom/youai/sdks/beans/PlatformContacts$Platforms;,
        Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;,
        Lcom/youai/sdks/beans/PlatformContacts$SwitchAccount;
    }
.end annotation


# static fields
.field public static final PLATFORM_INIT_FAILED:I = 0x0

.field public static final PLATFORM_INIT_SUCCESS:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
