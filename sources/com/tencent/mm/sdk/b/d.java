package com.tencent.mm.sdk.b;

/* JADX INFO: loaded from: classes.dex */
public final class d {
    private final com.tencent.mm.a.a E;
    private c<String, String> F;

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0083 -> B:20:0x0019). Please report as a decompilation issue!!! */
    public final String i(String str) {
        String str2;
        try {
        } catch (Exception e) {
            e = e;
        }
        if (!str.startsWith("!")) {
            str2 = str;
        } else if (this.F.a(str)) {
            str2 = this.F.get(str);
        } else {
            String strSubstring = str.substring(1);
            try {
                String[] strArrSplit = strSubstring.split("@");
                if (strArrSplit.length > 1) {
                    String str3 = strArrSplit[0];
                    int iIntValue = Integer.valueOf(strArrSplit[0]).intValue();
                    String str4 = this.E.h(strSubstring.substring(str3.length() + 1, str3.length() + 1 + iIntValue)) + strSubstring.substring(iIntValue + str3.length() + 1);
                    this.F.put(str, str4);
                    str2 = str4;
                } else {
                    str = strSubstring;
                }
            } catch (Exception e2) {
                str = strSubstring;
                e = e2;
                e.printStackTrace();
                str = "[td]" + str;
            }
            str2 = str;
        }
        return str2;
    }
}
