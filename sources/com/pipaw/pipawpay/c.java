package com.pipaw.pipawpay;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
class c implements Parcelable.Creator {
    c() {
    }

    @Override // android.os.Parcelable.Creator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public PipawPayRequest createFromParcel(Parcel parcel) {
        PipawPayRequest pipawPayRequest = new PipawPayRequest();
        pipawPayRequest.a = parcel.readString();
        pipawPayRequest.b = parcel.readString();
        pipawPayRequest.c = parcel.readString();
        pipawPayRequest.d = parcel.readString();
        pipawPayRequest.e = parcel.readString();
        pipawPayRequest.f = parcel.readString();
        pipawPayRequest.g = parcel.readString();
        pipawPayRequest.h = parcel.readString();
        pipawPayRequest.i = parcel.readString();
        return pipawPayRequest;
    }

    @Override // android.os.Parcelable.Creator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public PipawPayRequest[] newArray(int i) {
        return new PipawPayRequest[i];
    }
}
