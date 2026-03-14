package com.flurry.sdk;

import android.location.Location;
import com.flurry.sdk.cx;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class di {
    private String a;
    private Map<String, String> e;
    private String f;
    private String g;
    private String i;
    private Location j;
    private Long m;
    private Map<String, cx.a> n;
    private List<db> o;
    private List<da> r;
    private long b = -1;
    private long c = -1;
    private long d = -1;
    private int h = -1;
    private int k = -1;
    private byte l = -1;
    private boolean p = false;
    private int q = -1;

    public void a(String str) {
        this.a = str;
    }

    public String a() {
        return this.a;
    }

    public void a(long j) {
        this.b = j;
    }

    public long b() {
        return this.b;
    }

    public void b(long j) {
        this.c = j;
    }

    public long c() {
        return this.c;
    }

    public void c(long j) {
        this.d = j;
    }

    public long d() {
        return this.d;
    }

    public Map<String, String> e() {
        return this.e;
    }

    public void b(String str) {
        this.f = str;
    }

    public String f() {
        return this.f;
    }

    public void c(String str) {
        this.g = str;
    }

    public String g() {
        return this.g;
    }

    public void a(int i) {
        this.h = i;
    }

    public int h() {
        return this.h;
    }

    public void d(String str) {
        this.i = str;
    }

    public String i() {
        return this.i;
    }

    public void a(Location location) {
        this.j = location;
    }

    public Location j() {
        return this.j;
    }

    public void b(int i) {
        this.k = i;
    }

    public int k() {
        return this.k;
    }

    public void a(byte b) {
        this.l = b;
    }

    public byte l() {
        return this.l;
    }

    public void a(Long l) {
        this.m = l;
    }

    public Long m() {
        return this.m;
    }

    public void a(Map<String, cx.a> map) {
        this.n = map;
    }

    public Map<String, cx.a> n() {
        return this.n;
    }

    public void a(List<db> list) {
        this.o = list;
    }

    public List<db> o() {
        return this.o;
    }

    public void a(boolean z) {
        this.p = z;
    }

    public boolean p() {
        return this.p;
    }

    public void c(int i) {
        this.q = i;
    }

    public int q() {
        return this.q;
    }

    public void b(List<da> list) {
        this.r = list;
    }

    public List<da> r() {
        return this.r;
    }
}
