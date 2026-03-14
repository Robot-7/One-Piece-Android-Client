.class public interface abstract Lcom/youai/dreamonepiece/GameInterface;
.super Ljava/lang/Object;
.source "GameInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;,
        Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;,
        Lcom/youai/dreamonepiece/GameInterface$IGameContextStateCallback;,
        Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;,
        Lcom/youai/dreamonepiece/GameInterface$IPlatformSDKStateCallback;,
        Lcom/youai/dreamonepiece/GameInterface$IYouaiUpdateStateCallback;,
        Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;
    }
.end annotation


# static fields
.field public static final GameAppStateID:I = 0x6

.field public static final GameContextStateID:I = 0x5

.field public static final GameLogoStateID:I = 0x1

.field public static final GameStateIDMax:I = 0x7

.field public static final GameStateIDMin:I = 0x0

.field public static final GameUpdateStateID:I = 0x4

.field public static final PlatformSDKStateID:I = 0x3

.field public static final YouaiUpdateStateID:I = 0x2
