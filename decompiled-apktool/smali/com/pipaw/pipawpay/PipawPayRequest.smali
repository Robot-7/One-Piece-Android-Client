.class public Lcom/pipaw/pipawpay/PipawPayRequest;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/pipaw/pipawpay/c;

    invoke-direct {v0}, Lcom/pipaw/pipawpay/c;-><init>()V

    sput-object v0, Lcom/pipaw/pipawpay/PipawPayRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->a:Ljava/lang/String;

    return-void
.end method

.method static synthetic b(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->b:Ljava/lang/String;

    return-void
.end method

.method static synthetic c(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->c:Ljava/lang/String;

    return-void
.end method

.method static synthetic d(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->d:Ljava/lang/String;

    return-void
.end method

.method static synthetic e(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->e:Ljava/lang/String;

    return-void
.end method

.method static synthetic f(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->f:Ljava/lang/String;

    return-void
.end method

.method static synthetic g(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->g:Ljava/lang/String;

    return-void
.end method

.method static synthetic h(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->h:Ljava/lang/String;

    return-void
.end method

.method static synthetic i(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->c:Ljava/lang/String;

    return-object v0
.end method

.method public getExOrderNo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->e:Ljava/lang/String;

    return-object v0
.end method

.method public getExtraParam()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->h:Ljava/lang/String;

    return-object v0
.end method

.method public getMerchantAppId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->b:Ljava/lang/String;

    return-object v0
.end method

.method public getMerchantId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->a:Ljava/lang/String;

    return-object v0
.end method

.method public getMerchantSign()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->i:Ljava/lang/String;

    return-object v0
.end method

.method public getPayerId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->d:Ljava/lang/String;

    return-object v0
.end method

.method public getPrice()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->g:Ljava/lang/String;

    return-object v0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->f:Ljava/lang/String;

    return-object v0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->c:Ljava/lang/String;

    return-void
.end method

.method public setExOrderNo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->e:Ljava/lang/String;

    return-void
.end method

.method public setExtraParam(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->h:Ljava/lang/String;

    return-void
.end method

.method public setMerchantAppId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->b:Ljava/lang/String;

    return-void
.end method

.method public setMerchantId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->a:Ljava/lang/String;

    return-void
.end method

.method public setMerchantSign(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->i:Ljava/lang/String;

    return-void
.end method

.method public setPayerId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->d:Ljava/lang/String;

    return-void
.end method

.method public setPrice(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->g:Ljava/lang/String;

    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->f:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->h:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayRequest;->i:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
