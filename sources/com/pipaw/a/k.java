package com.pipaw.a;

import android.widget.Toast;

/* JADX INFO: loaded from: classes.dex */
public class k {
    private static final String a = d.a(k.class);
    private static Toast b;
    private static String c;
    private static long d;

    /* JADX WARN: Code restructure failed: missing block: B:10:0x002e, code lost:
    
        if (r2 < 2000) goto L11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static synchronized void a(android.content.Context r6, java.lang.String r7) {
        /*
            java.lang.Class<com.pipaw.a.k> r1 = com.pipaw.a.k.class
            monitor-enter(r1)
            android.widget.Toast r0 = com.pipaw.a.k.b     // Catch: java.lang.Throwable -> L45
            if (r0 == 0) goto L48
            java.lang.String r0 = com.pipaw.a.k.c     // Catch: java.lang.Throwable -> L45
            boolean r0 = r0.equals(r7)     // Catch: java.lang.Throwable -> L45
            if (r0 == 0) goto L32
            long r2 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L45
            long r4 = com.pipaw.a.k.d     // Catch: java.lang.Throwable -> L45
            long r2 = r2 - r4
            java.lang.String r0 = com.pipaw.a.k.a     // Catch: java.lang.Throwable -> L45
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L45
            java.lang.String r5 = "interval "
            r4.<init>(r5)     // Catch: java.lang.Throwable -> L45
            java.lang.StringBuilder r4 = r4.append(r2)     // Catch: java.lang.Throwable -> L45
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> L45
            com.pipaw.a.d.a(r0, r4)     // Catch: java.lang.Throwable -> L45
            r4 = 2000(0x7d0, double:9.88E-321)
            int r0 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r0 >= 0) goto L32
        L30:
            monitor-exit(r1)
            return
        L32:
            android.widget.Toast r0 = com.pipaw.a.k.b     // Catch: java.lang.Throwable -> L45
            r0.setText(r7)     // Catch: java.lang.Throwable -> L45
        L37:
            com.pipaw.a.k.c = r7     // Catch: java.lang.Throwable -> L45
            android.widget.Toast r0 = com.pipaw.a.k.b     // Catch: java.lang.Throwable -> L45
            r0.show()     // Catch: java.lang.Throwable -> L45
            long r2 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L45
            com.pipaw.a.k.d = r2     // Catch: java.lang.Throwable -> L45
            goto L30
        L45:
            r0 = move-exception
            monitor-exit(r1)
            throw r0
        L48:
            r0 = 0
            android.widget.Toast r0 = android.widget.Toast.makeText(r6, r7, r0)     // Catch: java.lang.Throwable -> L45
            com.pipaw.a.k.b = r0     // Catch: java.lang.Throwable -> L45
            goto L37
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pipaw.a.k.a(android.content.Context, java.lang.String):void");
    }
}
