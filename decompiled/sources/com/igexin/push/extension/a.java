package com.igexin.push.extension;

import android.content.Context;
import com.igexin.push.a.j;
import com.igexin.push.a.k;
import com.igexin.push.core.bean.e;
import com.igexin.push.core.g;
import com.igexin.push.extension.stub.IPushExtension;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private static String a = j.a;
    private static a c;
    private List b = new ArrayList();

    private a() {
    }

    public static a a() {
        if (c == null) {
            c = new a();
        }
        return c;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x006e A[Catch: Exception -> 0x0077, TryCatch #6 {Exception -> 0x0077, blocks: (B:37:0x0069, B:39:0x006e, B:41:0x0073), top: B:65:0x0069 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0073 A[Catch: Exception -> 0x0077, TRY_LEAVE, TryCatch #6 {Exception -> 0x0077, blocks: (B:37:0x0069, B:39:0x006e, B:41:0x0073), top: B:65:0x0069 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0069 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void a(java.io.File r10, java.io.File r11, java.lang.String r12) throws java.lang.Throwable {
        /*
            r9 = this;
            r1 = 0
            java.io.FileInputStream r3 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L64 java.lang.Exception -> L8c
            r3.<init>(r10)     // Catch: java.lang.Throwable -> L64 java.lang.Exception -> L8c
            java.io.FileOutputStream r2 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L90
            r2.<init>(r11)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L90
            java.io.BufferedOutputStream r0 = new java.io.BufferedOutputStream     // Catch: java.lang.Throwable -> L7c java.lang.Exception -> L94
            r0.<init>(r2)     // Catch: java.lang.Throwable -> L7c java.lang.Exception -> L94
            r1 = 1024(0x400, float:1.435E-42)
            byte[] r1 = new byte[r1]     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
        L14:
            int r4 = r3.read(r1)     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            r5 = -1
            if (r4 == r5) goto L46
            byte[] r5 = new byte[r4]     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            r6 = 0
            r7 = 0
            java.lang.System.arraycopy(r1, r6, r5, r7, r4)     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            byte[] r4 = com.igexin.a.a.a.a.a(r5, r12)     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            r0.write(r4)     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            goto L14
        L2a:
            r1 = move-exception
            r1 = r2
            r2 = r3
        L2d:
            boolean r3 = r11.exists()     // Catch: java.lang.Throwable -> L83
            if (r3 == 0) goto L36
            r11.delete()     // Catch: java.lang.Throwable -> L83
        L36:
            if (r2 == 0) goto L3b
            r2.close()     // Catch: java.lang.Exception -> L8a
        L3b:
            if (r0 == 0) goto L40
            r0.close()     // Catch: java.lang.Exception -> L8a
        L40:
            if (r1 == 0) goto L45
            r1.close()     // Catch: java.lang.Exception -> L8a
        L45:
            return
        L46:
            r3.close()     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            r0.flush()     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            r0.close()     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            r2.close()     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L7e
            if (r3 == 0) goto L57
            r3.close()     // Catch: java.lang.Exception -> L62
        L57:
            if (r0 == 0) goto L5c
            r0.close()     // Catch: java.lang.Exception -> L62
        L5c:
            if (r2 == 0) goto L45
            r2.close()     // Catch: java.lang.Exception -> L62
            goto L45
        L62:
            r0 = move-exception
            goto L45
        L64:
            r0 = move-exception
            r2 = r1
            r3 = r1
        L67:
            if (r3 == 0) goto L6c
            r3.close()     // Catch: java.lang.Exception -> L77
        L6c:
            if (r1 == 0) goto L71
            r1.close()     // Catch: java.lang.Exception -> L77
        L71:
            if (r2 == 0) goto L76
            r2.close()     // Catch: java.lang.Exception -> L77
        L76:
            throw r0
        L77:
            r1 = move-exception
            goto L76
        L79:
            r0 = move-exception
            r2 = r1
            goto L67
        L7c:
            r0 = move-exception
            goto L67
        L7e:
            r1 = move-exception
            r8 = r1
            r1 = r0
            r0 = r8
            goto L67
        L83:
            r3 = move-exception
            r8 = r3
            r3 = r2
            r2 = r1
            r1 = r0
            r0 = r8
            goto L67
        L8a:
            r0 = move-exception
            goto L45
        L8c:
            r0 = move-exception
            r0 = r1
            r2 = r1
            goto L2d
        L90:
            r0 = move-exception
            r0 = r1
            r2 = r3
            goto L2d
        L94:
            r0 = move-exception
            r0 = r1
            r1 = r2
            r2 = r3
            goto L2d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.igexin.push.extension.a.a(java.io.File, java.io.File, java.lang.String):void");
    }

    public boolean a(Context context) {
        try {
            if (k.x == null) {
                ArrayList arrayList = new ArrayList();
                arrayList.add("com.igexin.push.extension.distribution.basic.stub.PushExtension");
                arrayList.add("com.igexin.push.extension.distribution.gbd.stub.PushExtension");
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    try {
                        IPushExtension iPushExtension = (IPushExtension) context.getClassLoader().loadClass((String) it.next()).newInstance();
                        iPushExtension.init(g.i);
                        this.b.add(iPushExtension);
                    } catch (Exception e) {
                    }
                }
                return true;
            }
            Map mapB = k.x.b();
            ArrayList arrayList2 = new ArrayList();
            for (Map.Entry entry : mapB.entrySet()) {
                int iIntValue = ((Integer) entry.getKey()).intValue();
                e eVar = (e) entry.getValue();
                String str = g.ad + "/" + eVar.c();
                File file = new File(str);
                if (file.exists()) {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    if (eVar.h() == 0 || eVar.i() + eVar.h() >= jCurrentTimeMillis) {
                        if (a(context, str, eVar.d(), eVar.j(), eVar.c()) && eVar.i() != 0) {
                            eVar.b(jCurrentTimeMillis);
                        }
                        if (eVar.g()) {
                            file.delete();
                            arrayList2.add(Integer.valueOf(iIntValue));
                        }
                    } else {
                        file.delete();
                        arrayList2.add(Integer.valueOf(iIntValue));
                    }
                } else {
                    arrayList2.add(Integer.valueOf(iIntValue));
                }
            }
            if (arrayList2 == null || arrayList2.size() <= 0) {
                return true;
            }
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                mapB.remove(Integer.valueOf(((Integer) it2.next()).intValue()));
            }
            com.igexin.push.a.a.a().g();
            return true;
        } catch (Exception e2) {
            return true;
        }
    }

    public boolean a(Context context, String str, String str2, String str3, String str4) throws Throwable {
        Class clsLoadClass = null;
        File file = new File(str);
        File file2 = new File(str + ".jar");
        File file3 = new File(context.getFilesDir().getAbsolutePath() + "/" + str4 + ".dex");
        a(file, file2, str3);
        if (file2.exists()) {
            try {
                try {
                    clsLoadClass = new DexClassLoader(file2.getAbsolutePath(), context.getFilesDir().getAbsolutePath(), null, context.getClassLoader()).loadClass(str2);
                } catch (Exception e) {
                }
                file2.delete();
                if (file3.exists()) {
                    file3.delete();
                }
                if (clsLoadClass == null) {
                    return false;
                }
                IPushExtension iPushExtension = (IPushExtension) clsLoadClass.newInstance();
                if (iPushExtension != null) {
                    iPushExtension.init(g.i);
                    this.b.add(iPushExtension);
                    return true;
                }
            } catch (Exception e2) {
                if (file2.exists()) {
                    file2.delete();
                }
                if (file3.exists()) {
                    file3.delete();
                }
            }
        }
        return false;
    }

    public void b() {
        Iterator it = this.b.iterator();
        while (it.hasNext()) {
            ((IPushExtension) it.next()).onDestroy();
        }
    }

    public List c() {
        return this.b;
    }
}
