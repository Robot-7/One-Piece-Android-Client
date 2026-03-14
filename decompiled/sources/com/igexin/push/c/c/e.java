package com.igexin.push.c.c;

/* JADX INFO: loaded from: classes.dex */
public abstract class e extends com.igexin.a.a.d.a {
    public int i;
    public byte j;

    protected int a(String str) {
        if (str.equals("UTF-8")) {
            return 1;
        }
        if (str.equals("UTF-16")) {
            return 2;
        }
        if (str.equals("UTF-16BE")) {
            return 16;
        }
        if (str.equals("UTF-16LE")) {
            return 17;
        }
        if (str.equals("GBK")) {
            return 25;
        }
        if (str.equals("GB2312")) {
            return 26;
        }
        if (str.equals("GB18030")) {
            return 27;
        }
        return str.equals("ISO-8859-1") ? 33 : 1;
    }

    protected String a(byte b) {
        switch (b & 63) {
            case 1:
                break;
            case 2:
                break;
            case 16:
                break;
            case 17:
                break;
            case 25:
                break;
            case 26:
                break;
            case 27:
                break;
            case 33:
                break;
        }
        return "UTF-8";
    }

    public abstract void a(byte[] bArr);

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return this.i;
    }

    public abstract byte[] d();
}
