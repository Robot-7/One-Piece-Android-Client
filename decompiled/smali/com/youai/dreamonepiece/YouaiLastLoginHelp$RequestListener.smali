.class public interface abstract Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;
.super Ljava/lang/Object;
.source "YouaiLastLoginHelp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/YouaiLastLoginHelp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RequestListener"
.end annotation


# virtual methods
.method public abstract onComplete(Ljava/lang/String;)V
.end method

.method public abstract onError(Ljava/lang/Exception;)V
.end method

.method public abstract onIOException(Ljava/io/IOException;)V
.end method
