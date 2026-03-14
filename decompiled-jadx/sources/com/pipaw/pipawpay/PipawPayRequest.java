package com.pipaw.pipawpay;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class PipawPayRequest implements Parcelable {
    public static final Parcelable.Creator CREATOR = new c();
    private String a;
    private String b;
    private String c;
    private String d;
    private String e;
    private String f;
    private String g;
    private String h;
    private String i;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getAppId() {
        return this.c;
    }

    public String getExOrderNo() {
        return this.e;
    }

    public String getExtraParam() {
        return this.h;
    }

    public String getMerchantAppId() {
        return this.b;
    }

    public String getMerchantId() {
        return this.a;
    }

    public String getMerchantSign() {
        return this.i;
    }

    public String getPayerId() {
        return this.d;
    }

    public String getPrice() {
        return this.g;
    }

    public String getSubject() {
        return this.f;
    }

    public void setAppId(String str) {
        this.c = str;
    }

    public void setExOrderNo(String str) {
        this.e = str;
    }

    public void setExtraParam(String str) {
        this.h = str;
    }

    public void setMerchantAppId(String str) {
        this.b = str;
    }

    public void setMerchantId(String str) {
        this.a = str;
    }

    public void setMerchantSign(String str) {
        this.i = str;
    }

    public void setPayerId(String str) {
        this.d = str;
    }

    public void setPrice(String str) {
        this.g = str;
    }

    public void setSubject(String str) {
        this.f = str;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeString(this.c);
        parcel.writeString(this.d);
        parcel.writeString(this.e);
        parcel.writeString(this.f);
        parcel.writeString(this.g);
        parcel.writeString(this.h);
        parcel.writeString(this.i);
    }
}
