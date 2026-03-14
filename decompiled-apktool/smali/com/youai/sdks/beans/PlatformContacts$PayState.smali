.class public final enum Lcom/youai/sdks/beans/PlatformContacts$PayState;
.super Ljava/lang/Enum;
.source "PlatformContacts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/sdks/beans/PlatformContacts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PayState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/youai/sdks/beans/PlatformContacts$PayState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$PayState;

.field public static final enum Pay_Asyn_Sms_Sent:Lcom/youai/sdks/beans/PlatformContacts$PayState;

.field public static final enum Pay_Cancel:Lcom/youai/sdks/beans/PlatformContacts$PayState;

.field public static final enum Pay_Failure:Lcom/youai/sdks/beans/PlatformContacts$PayState;

.field public static final enum Pay_Request_Submitted:Lcom/youai/sdks/beans/PlatformContacts$PayState;

.field public static final enum Pay_Success:Lcom/youai/sdks/beans/PlatformContacts$PayState;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 118
    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v1, "Pay_Failure"

    invoke-direct {v0, v1, v2}, Lcom/youai/sdks/beans/PlatformContacts$PayState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Failure:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v1, "Pay_Success"

    invoke-direct {v0, v1, v3}, Lcom/youai/sdks/beans/PlatformContacts$PayState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Success:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v1, "Pay_Cancel"

    invoke-direct {v0, v1, v4}, Lcom/youai/sdks/beans/PlatformContacts$PayState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Cancel:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v1, "Pay_Asyn_Sms_Sent"

    invoke-direct {v0, v1, v5}, Lcom/youai/sdks/beans/PlatformContacts$PayState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Asyn_Sms_Sent:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    const-string v1, "Pay_Request_Submitted"

    invoke-direct {v0, v1, v6}, Lcom/youai/sdks/beans/PlatformContacts$PayState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Request_Submitted:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    .line 117
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/youai/sdks/beans/PlatformContacts$PayState;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Failure:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Success:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Cancel:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Asyn_Sms_Sent:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$PayState;->Pay_Request_Submitted:Lcom/youai/sdks/beans/PlatformContacts$PayState;

    aput-object v1, v0, v6

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$PayState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 117
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/youai/sdks/beans/PlatformContacts$PayState;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;

    return-object v0
.end method

.method public static values()[Lcom/youai/sdks/beans/PlatformContacts$PayState;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$PayState;->ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$PayState;

    array-length v1, v0

    new-array v2, v1, [Lcom/youai/sdks/beans/PlatformContacts$PayState;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
