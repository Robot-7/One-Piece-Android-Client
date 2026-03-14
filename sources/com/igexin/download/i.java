package com.igexin.download;

import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
class i {
    private final String a;
    private final Set b;
    private int c = 0;
    private int d = 0;
    private final char[] e;

    public i(String str, Set set) {
        this.a = str;
        this.b = set;
        this.e = new char[this.a.length()];
        this.a.getChars(0, this.e.length, this.e, 0);
        b();
    }

    private static final boolean a(char c) {
        return c == '_' || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
    }

    private static final boolean b(char c) {
        return c == '_' || (c >= 'A' && c <= 'Z') || ((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9'));
    }

    public int a() {
        return this.d;
    }

    public void b() {
        char[] cArr = this.e;
        while (this.c < cArr.length && cArr[this.c] == ' ') {
            this.c++;
        }
        if (this.c == cArr.length) {
            this.d = 9;
            return;
        }
        if (cArr[this.c] == '(') {
            this.c++;
            this.d = 1;
            return;
        }
        if (cArr[this.c] == ')') {
            this.c++;
            this.d = 2;
            return;
        }
        if (cArr[this.c] == '?') {
            this.c++;
            this.d = 6;
            return;
        }
        if (cArr[this.c] == '=') {
            this.c++;
            this.d = 5;
            if (this.c >= cArr.length || cArr[this.c] != '=') {
                return;
            }
            this.c++;
            return;
        }
        if (cArr[this.c] == '>') {
            this.c++;
            this.d = 5;
            if (this.c >= cArr.length || cArr[this.c] != '=') {
                return;
            }
            this.c++;
            return;
        }
        if (cArr[this.c] == '<') {
            this.c++;
            this.d = 5;
            if (this.c < cArr.length) {
                if (cArr[this.c] == '=' || cArr[this.c] == '>') {
                    this.c++;
                    return;
                }
                return;
            }
            return;
        }
        if (cArr[this.c] == '!') {
            this.c++;
            this.d = 5;
            if (this.c >= cArr.length || cArr[this.c] != '=') {
                throw new IllegalArgumentException("Unexpected character after !");
            }
            this.c++;
            return;
        }
        if (!a(cArr[this.c])) {
            if (cArr[this.c] != '\'') {
                throw new IllegalArgumentException("illegal character");
            }
            this.c++;
            while (this.c < cArr.length) {
                if (cArr[this.c] == '\'') {
                    if (this.c + 1 >= cArr.length || cArr[this.c + 1] != '\'') {
                        break;
                    } else {
                        this.c++;
                    }
                }
                this.c++;
            }
            if (this.c == cArr.length) {
                throw new IllegalArgumentException("unterminated string");
            }
            this.c++;
            this.d = 6;
            return;
        }
        int i = this.c;
        this.c++;
        while (this.c < cArr.length && b(cArr[this.c])) {
            this.c++;
        }
        String strSubstring = this.a.substring(i, this.c);
        if (this.c - i <= 4) {
            if (strSubstring.equals("IS")) {
                this.d = 7;
                return;
            } else if (strSubstring.equals("OR") || strSubstring.equals("AND")) {
                this.d = 3;
                return;
            } else if (strSubstring.equals("NULL")) {
                this.d = 8;
                return;
            }
        }
        if (!this.b.contains(strSubstring)) {
            throw new IllegalArgumentException("unrecognized column or keyword");
        }
        this.d = 4;
    }
}
