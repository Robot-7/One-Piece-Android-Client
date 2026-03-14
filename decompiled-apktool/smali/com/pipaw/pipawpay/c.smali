.class Lcom/pipaw/pipawpay/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/os/Parcel;)Lcom/pipaw/pipawpay/PipawPayRequest;
    .locals 2

    new-instance v0, Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-direct {v0}, Lcom/pipaw/pipawpay/PipawPayRequest;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->a(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->b(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->c(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->d(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->e(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->f(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->g(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->h(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->i(Lcom/pipaw/pipawpay/PipawPayRequest;Ljava/lang/String;)V

    return-object v0
.end method

.method public a(I)[Lcom/pipaw/pipawpay/PipawPayRequest;
    .locals 1

    new-array v0, p1, [Lcom/pipaw/pipawpay/PipawPayRequest;

    return-object v0
.end method

.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/c;->a(Landroid/os/Parcel;)Lcom/pipaw/pipawpay/PipawPayRequest;

    move-result-object v0

    return-object v0
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/c;->a(I)[Lcom/pipaw/pipawpay/PipawPayRequest;

    move-result-object v0

    return-object v0
.end method
