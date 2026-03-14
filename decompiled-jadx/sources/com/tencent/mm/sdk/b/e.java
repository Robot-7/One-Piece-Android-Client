package com.tencent.mm.sdk.b;

import java.util.TimeZone;

/* JADX INFO: loaded from: classes.dex */
public final class e {
    private static final long[] G = {300, 200, 300, 200};
    private static final long[] H = {300, 50, 300, 50};
    private static final TimeZone GMT = TimeZone.getTimeZone("GMT");
    private static final char[] I = {'<', '>', '\"', '\'', '&'};
    private static final String[] J = {"&lt;", "&gt;", "&quot;", "&apos;", "&amp;"};

    public static boolean j(String str) {
        return str == null || str.length() <= 0;
    }
}
