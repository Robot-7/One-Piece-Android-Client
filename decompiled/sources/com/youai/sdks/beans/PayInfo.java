package com.youai.sdks.beans;

/* JADX INFO: loaded from: classes.dex */
public class PayInfo {
    public int count;
    public String description;
    public String order_serial;
    public float orignal_price;
    public String payUrl;
    public float price;
    public String product_id;
    public String product_name;
    public int result;
    public String waresId;

    public String toString() {
        return "PayInfo = [ order_serial " + this.order_serial + " product_id " + this.product_id + " product_name " + this.product_name + " price " + this.price + " orignal_price " + this.orignal_price + " count " + this.count + " description " + this.description + " ]";
    }
}
