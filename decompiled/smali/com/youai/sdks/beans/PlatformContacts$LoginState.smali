.class public final enum Lcom/youai/sdks/beans/PlatformContacts$LoginState;
.super Ljava/lang/Enum;
.source "PlatformContacts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/sdks/beans/PlatformContacts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LoginState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/youai/sdks/beans/PlatformContacts$LoginState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field public static final enum Login_Cancel:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field public static final enum Login_CheckToken:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field public static final enum Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field public static final enum Login_Guest:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field public static final enum Login_Not:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

.field public static final enum Login_Success:Lcom/youai/sdks/beans/PlatformContacts$LoginState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 114
    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v1, "Login_Not"

    invoke-direct {v0, v1, v3}, Lcom/youai/sdks/beans/PlatformContacts$LoginState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Not:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v1, "Login_Success"

    invoke-direct {v0, v1, v4}, Lcom/youai/sdks/beans/PlatformContacts$LoginState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Success:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v1, "Login_CheckToken"

    invoke-direct {v0, v1, v5}, Lcom/youai/sdks/beans/PlatformContacts$LoginState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_CheckToken:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v1, "Login_Guest"

    invoke-direct {v0, v1, v6}, Lcom/youai/sdks/beans/PlatformContacts$LoginState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Guest:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v1, "Login_Error"

    invoke-direct {v0, v1, v7}, Lcom/youai/sdks/beans/PlatformContacts$LoginState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    new-instance v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    const-string v1, "Login_Cancel"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/youai/sdks/beans/PlatformContacts$LoginState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Cancel:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    .line 113
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Not:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Success:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_CheckToken:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Guest:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Error:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->Login_Cancel:Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    aput-object v2, v0, v1

    sput-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 113
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/youai/sdks/beans/PlatformContacts$LoginState;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    return-object v0
.end method

.method public static values()[Lcom/youai/sdks/beans/PlatformContacts$LoginState;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/youai/sdks/beans/PlatformContacts$LoginState;->ENUM$VALUES:[Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    array-length v1, v0

    new-array v2, v1, [Lcom/youai/sdks/beans/PlatformContacts$LoginState;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
