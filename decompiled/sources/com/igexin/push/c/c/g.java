package com.igexin.push.c.c;

import org.codehaus.jackson.org.objectweb.asm.Opcodes;

/* JADX INFO: loaded from: classes.dex */
public class g {
    public static int a = 5;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public byte g;
    public byte h;
    public byte i;

    public void a() {
        this.g = (byte) (this.e & 128);
        this.h = (byte) (this.e & Opcodes.IREM);
        this.i = (byte) (this.e & 15);
    }

    public void a(byte b) {
        this.e = b & 255;
        a();
    }

    public void b() {
        this.e |= this.g;
        this.e |= this.h;
        this.e |= this.i;
    }

    public int c() {
        b();
        return this.e;
    }
}
