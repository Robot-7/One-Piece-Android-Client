package com.igexin.sdk;

import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public class Tag implements Serializable {
    private String a;

    private boolean a(String str) {
        boolean z = false;
        for (int length = str.length() - 1; length >= 0; length--) {
            char cCharAt = str.charAt(length);
            z = (cCharAt >= 19968 && cCharAt <= 40869) || (cCharAt >= 'A' && cCharAt <= 'Z') || ((cCharAt >= 'a' && cCharAt <= 'z') || ((cCharAt >= '0' && cCharAt <= '9') || cCharAt == '+' || cCharAt == '-' || cCharAt == '*' || cCharAt == '_' || cCharAt == ' ' || cCharAt == ':'));
            if (!z) {
                break;
            }
        }
        return z;
    }

    private boolean b(String str) {
        return a(str);
    }

    public String getName() {
        return this.a;
    }

    public void setName(String str) {
        if (b(str)) {
            this.a = str;
        }
    }
}
