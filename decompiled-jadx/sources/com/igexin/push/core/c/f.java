package com.igexin.push.core.c;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/* JADX INFO: loaded from: classes.dex */
public class f implements a {
    private static final String a = com.igexin.push.a.j.a;
    private static f b;
    private Map c = new HashMap();

    private f() {
    }

    public static f a() {
        if (b == null) {
            b = new f();
        }
        return b;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SQLiteDatabase sQLiteDatabase, int i, String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", Integer.valueOf(i));
        contentValues.put("value", str);
        sQLiteDatabase.replace("runtime", null, contentValues);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SQLiteDatabase sQLiteDatabase, int i, byte[] bArr) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", Integer.valueOf(i));
        contentValues.put("value", bArr);
        sQLiteDatabase.replace("runtime", null, contentValues);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void d() throws Throwable {
        FileOutputStream fileOutputStream;
        Throwable th;
        FileOutputStream fileOutputStream2 = null;
        try {
            File file = new File(com.igexin.push.core.g.Y);
            if (!file.exists()) {
                file.createNewFile();
            }
            fileOutputStream = new FileOutputStream(com.igexin.push.core.g.Y);
            try {
                fileOutputStream.write(com.igexin.a.a.a.a.b((("v01" + com.igexin.push.core.g.z) + String.valueOf(com.igexin.push.core.g.t) + "|" + com.igexin.push.core.g.c).getBytes(), com.igexin.push.core.g.D));
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Exception e) {
                    }
                }
            } catch (Exception e2) {
                fileOutputStream2 = fileOutputStream;
                if (fileOutputStream2 != null) {
                    try {
                        fileOutputStream2.close();
                    } catch (Exception e3) {
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Exception e4) {
                    }
                }
                throw th;
            }
        } catch (Exception e5) {
        } catch (Throwable th3) {
            fileOutputStream = null;
            th = th3;
        }
    }

    private long e() throws Throwable {
        ByteArrayOutputStream byteArrayOutputStream;
        FileInputStream fileInputStream;
        long j = 0;
        FileInputStream fileInputStream2 = null;
        if (new File(com.igexin.push.core.g.Y).exists()) {
            byte[] bArr = new byte[1024];
            try {
                fileInputStream = new FileInputStream(com.igexin.push.core.g.Y);
                try {
                    byteArrayOutputStream = new ByteArrayOutputStream();
                    while (true) {
                        try {
                            int i = fileInputStream.read(bArr);
                            if (i == -1) {
                                break;
                            }
                            byteArrayOutputStream.write(bArr, 0, i);
                        } catch (Exception e) {
                            fileInputStream2 = fileInputStream;
                            if (fileInputStream2 != null) {
                                try {
                                    fileInputStream2.close();
                                } catch (Exception e2) {
                                }
                            }
                            if (byteArrayOutputStream != null) {
                                try {
                                    byteArrayOutputStream.close();
                                } catch (Exception e3) {
                                }
                            }
                        } catch (Throwable th) {
                            th = th;
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (Exception e4) {
                                }
                            }
                            if (byteArrayOutputStream == null) {
                                throw th;
                            }
                            try {
                                byteArrayOutputStream.close();
                                throw th;
                            } catch (Exception e5) {
                                throw th;
                            }
                        }
                    }
                    String str = new String(com.igexin.a.a.a.a.a(byteArrayOutputStream.toByteArray(), com.igexin.push.core.g.D));
                    if (str != null) {
                        String strSubstring = str.indexOf("null") >= 0 ? str.substring(7) : str.substring(20);
                        if (strSubstring != null) {
                            int iIndexOf = strSubstring.indexOf("|");
                            if (iIndexOf >= 0) {
                                strSubstring = strSubstring.substring(0, iIndexOf);
                            }
                            long j2 = Long.parseLong(strSubstring);
                            if (j2 != 0) {
                                j = j2;
                            }
                        }
                    }
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Exception e6) {
                        }
                    }
                    if (byteArrayOutputStream != null) {
                        try {
                            byteArrayOutputStream.close();
                        } catch (Exception e7) {
                        }
                    }
                } catch (Exception e8) {
                    byteArrayOutputStream = null;
                    fileInputStream2 = fileInputStream;
                } catch (Throwable th2) {
                    th = th2;
                    byteArrayOutputStream = null;
                }
            } catch (Exception e9) {
                byteArrayOutputStream = null;
            } catch (Throwable th3) {
                th = th3;
                byteArrayOutputStream = null;
                fileInputStream = null;
            }
        }
        return j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void f() throws Throwable {
        FileOutputStream fileOutputStream;
        Throwable th;
        FileOutputStream fileOutputStream2 = null;
        try {
            File file = new File(com.igexin.push.core.g.Z);
            if (!file.exists()) {
                file.createNewFile();
            }
            fileOutputStream = new FileOutputStream(com.igexin.push.core.g.Z);
            try {
                if (com.igexin.push.core.g.B == null) {
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                            return;
                        } catch (Exception e) {
                            return;
                        }
                    }
                    return;
                }
                fileOutputStream.write(com.igexin.push.core.g.B.getBytes("utf-8"));
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Exception e2) {
                    }
                }
            } catch (Exception e3) {
                fileOutputStream2 = fileOutputStream;
                if (fileOutputStream2 != null) {
                    try {
                        fileOutputStream2.close();
                    } catch (Exception e4) {
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Exception e5) {
                    }
                }
                throw th;
            }
        } catch (Exception e6) {
        } catch (Throwable th3) {
            fileOutputStream = null;
            th = th3;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String g() throws Throwable {
        ByteArrayOutputStream byteArrayOutputStream;
        FileInputStream fileInputStream;
        ByteArrayOutputStream byteArrayOutputStream2;
        FileInputStream fileInputStream2;
        if (new File(com.igexin.push.core.g.Z).exists()) {
            byte[] bArr = new byte[1024];
            try {
                fileInputStream = new FileInputStream(com.igexin.push.core.g.Z);
                try {
                    byteArrayOutputStream = new ByteArrayOutputStream();
                    while (true) {
                        try {
                            int i = fileInputStream.read(bArr);
                            if (i == -1) {
                                break;
                            }
                            byteArrayOutputStream.write(bArr, 0, i);
                        } catch (Exception e) {
                            byteArrayOutputStream2 = byteArrayOutputStream;
                            fileInputStream2 = fileInputStream;
                            if (fileInputStream2 != null) {
                                try {
                                    fileInputStream2.close();
                                } catch (Exception e2) {
                                }
                            }
                            if (byteArrayOutputStream2 != null) {
                                try {
                                    byteArrayOutputStream2.close();
                                    return null;
                                } catch (Exception e3) {
                                    return null;
                                }
                            }
                            return null;
                        } catch (Throwable th) {
                            th = th;
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (Exception e4) {
                                }
                            }
                            if (byteArrayOutputStream == null) {
                                throw th;
                            }
                            try {
                                byteArrayOutputStream.close();
                                throw th;
                            } catch (Exception e5) {
                                throw th;
                            }
                        }
                    }
                    String str = new String(byteArrayOutputStream.toByteArray(), "utf-8");
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Exception e6) {
                        }
                    }
                    if (byteArrayOutputStream == null) {
                        return str;
                    }
                    try {
                        byteArrayOutputStream.close();
                        return str;
                    } catch (Exception e7) {
                        return str;
                    }
                } catch (Exception e8) {
                    byteArrayOutputStream2 = null;
                    fileInputStream2 = fileInputStream;
                } catch (Throwable th2) {
                    th = th2;
                    byteArrayOutputStream = null;
                }
            } catch (Exception e9) {
                byteArrayOutputStream2 = null;
                fileInputStream2 = null;
            } catch (Throwable th3) {
                th = th3;
                byteArrayOutputStream = null;
                fileInputStream = null;
            }
        }
        return null;
    }

    private String h() {
        String str = StatConstants.MTA_COOPERATION_TAG;
        Random random = new Random(System.currentTimeMillis());
        for (int i = 0; i < 15; i++) {
            str = str + random.nextInt(10);
        }
        return str;
    }

    @Override // com.igexin.push.core.c.a
    public void a(SQLiteDatabase sQLiteDatabase) {
    }

    public boolean a(long j) {
        com.igexin.push.core.g.a(j);
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new j(this), false, true);
        return true;
    }

    public boolean a(String str) {
        com.igexin.push.core.g.B = str;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new k(this), false, true);
        return true;
    }

    public boolean a(boolean z) {
        if (com.igexin.push.core.g.Q == z) {
            return false;
        }
        com.igexin.push.core.g.Q = z;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new h(this), false, true);
        return true;
    }

    public void b() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new g(this), false, true);
    }

    @Override // com.igexin.push.core.c.a
    public void b(SQLiteDatabase sQLiteDatabase) throws Throwable {
        Cursor cursorRawQuery;
        byte[] blob;
        String string;
        long j;
        Cursor cursor = null;
        try {
            cursorRawQuery = sQLiteDatabase.rawQuery("select id, value from runtime order by id", null);
            if (cursorRawQuery != null) {
                while (cursorRawQuery.moveToNext()) {
                    try {
                        int i = cursorRawQuery.getInt(0);
                        if (i == 1 || i == 14) {
                            blob = cursorRawQuery.getBlob(1);
                            string = null;
                        } else {
                            string = cursorRawQuery.getString(1);
                            blob = null;
                        }
                        switch (i) {
                            case 1:
                                String str = new String(com.igexin.a.a.a.a.a(blob, com.igexin.push.core.g.D));
                                if (str != null) {
                                    try {
                                        if (!str.equals("null")) {
                                            j = Long.parseLong(str);
                                        }
                                        com.igexin.push.core.g.v = com.igexin.a.b.a.a(String.valueOf(j));
                                        com.igexin.push.core.g.a(j);
                                    } catch (NumberFormatException e) {
                                        com.igexin.push.core.g.t = 0L;
                                    }
                                    break;
                                }
                                j = 0;
                                com.igexin.push.core.g.v = com.igexin.a.b.a.a(String.valueOf(j));
                                com.igexin.push.core.g.a(j);
                                break;
                            case 2:
                                if (string.equals("null")) {
                                    string = null;
                                }
                                com.igexin.push.core.g.B = string;
                                break;
                            case 3:
                                if (string.equals("null")) {
                                    string = null;
                                }
                                com.igexin.push.core.g.C = string;
                                break;
                            case 4:
                                com.igexin.push.core.g.n = string.equals("null") ? true : Boolean.parseBoolean(string);
                                break;
                            case 5:
                                com.igexin.push.core.g.H = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 6:
                                com.igexin.push.core.g.I = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 7:
                                com.igexin.push.core.g.J = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 8:
                                com.igexin.push.core.g.K = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 9:
                                com.igexin.push.core.g.S = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 10:
                                com.igexin.push.core.g.T = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 11:
                                com.igexin.push.core.g.N = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 12:
                                com.igexin.push.core.g.O = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                            case 13:
                                if (string.equals("null")) {
                                    string = null;
                                }
                                com.igexin.push.core.g.P = string;
                                break;
                            case 14:
                                com.igexin.push.core.g.ax = new String(com.igexin.a.a.a.a.a(blob, com.igexin.push.core.g.D));
                                break;
                            case 15:
                                if (!string.equals("null")) {
                                    com.igexin.push.core.g.Q = Boolean.parseBoolean(string);
                                }
                                break;
                            case 16:
                                com.igexin.push.core.g.R = string.equals("null") ? 0L : Long.parseLong(string);
                                break;
                        }
                    } catch (Exception e2) {
                        if (cursorRawQuery != null) {
                            cursorRawQuery.close();
                        }
                    } catch (Throwable th) {
                        cursor = cursorRawQuery;
                        th = th;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                }
            }
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
        } catch (Exception e3) {
            cursorRawQuery = null;
        } catch (Throwable th2) {
            th = th2;
        }
        if (com.igexin.push.core.g.t == 0) {
            long jE = e();
            if (jE != 0) {
                com.igexin.push.core.g.v = com.igexin.a.b.a.a(String.valueOf(jE));
                com.igexin.push.core.g.a(jE);
                a(sQLiteDatabase, 1, com.igexin.push.f.b.a(String.valueOf(jE).getBytes()));
            }
        }
        if (com.igexin.push.core.g.ax == null || StatConstants.MTA_COOPERATION_TAG.equals(com.igexin.push.core.g.ax) || "null".equals(com.igexin.push.core.g.ax)) {
            com.igexin.push.core.g.ax = com.igexin.a.b.a.a(32);
            a(sQLiteDatabase, 14, com.igexin.push.f.b.a(com.igexin.push.core.g.ax.getBytes()));
        }
        String strG = g();
        if (com.igexin.push.core.g.B == null && strG != null && strG.length() > 5) {
            com.igexin.push.core.g.B = strG;
            a(sQLiteDatabase, 2, String.valueOf(com.igexin.push.core.g.B));
        }
        if (com.igexin.push.core.g.C == null) {
            String str2 = com.igexin.push.core.g.w;
            if (str2 == null) {
                str2 = "V" + h();
            }
            com.igexin.push.core.g.C = "A-" + str2 + "-" + System.currentTimeMillis();
            a(sQLiteDatabase, 3, String.valueOf(com.igexin.push.core.g.C));
        }
    }

    public boolean b(long j) {
        if (com.igexin.push.core.g.S == j) {
            return false;
        }
        com.igexin.push.core.g.S = j;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new l(this), false, true);
        return true;
    }

    public boolean b(String str) {
        if (str == null || str.equals(com.igexin.push.core.g.P)) {
            return false;
        }
        com.igexin.push.core.g.P = str;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new q(this), false, true);
        return true;
    }

    public Map c() {
        return this.c;
    }

    @Override // com.igexin.push.core.c.a
    public void c(SQLiteDatabase sQLiteDatabase) {
        a(sQLiteDatabase, 1, com.igexin.a.a.a.a.b(String.valueOf(com.igexin.push.core.g.t).getBytes(), com.igexin.push.core.g.D));
        a(sQLiteDatabase, 4, String.valueOf(com.igexin.push.core.g.n));
        a(sQLiteDatabase, 8, String.valueOf(com.igexin.push.core.g.K));
        a(sQLiteDatabase, 7, String.valueOf(com.igexin.push.core.g.J));
        a(sQLiteDatabase, 6, String.valueOf(com.igexin.push.core.g.I));
        a(sQLiteDatabase, 9, String.valueOf(com.igexin.push.core.g.S));
        a(sQLiteDatabase, 10, String.valueOf(com.igexin.push.core.g.T));
        a(sQLiteDatabase, 5, String.valueOf(com.igexin.push.core.g.H));
        a(sQLiteDatabase, 3, String.valueOf(com.igexin.push.core.g.C));
        a(sQLiteDatabase, 11, String.valueOf(com.igexin.push.core.g.N));
        a(sQLiteDatabase, 12, String.valueOf(com.igexin.push.core.g.O));
    }

    public boolean c(long j) {
        if (com.igexin.push.core.g.O == j) {
            return false;
        }
        com.igexin.push.core.g.O = j;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new m(this), false, true);
        return true;
    }

    public boolean d(long j) {
        if (com.igexin.push.core.g.T == j) {
            return false;
        }
        com.igexin.push.core.g.T = j;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new n(this), false, true);
        return true;
    }

    public boolean e(long j) {
        if (com.igexin.push.core.g.J == j) {
            return false;
        }
        com.igexin.push.core.g.J = j;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new o(this), false, true);
        return true;
    }

    public boolean f(long j) {
        if (com.igexin.push.core.g.N == j) {
            return false;
        }
        com.igexin.push.core.g.N = j;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new p(this), false, true);
        return true;
    }

    public boolean g(long j) {
        if (com.igexin.push.core.g.R == j) {
            return false;
        }
        com.igexin.push.core.g.R = j;
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new i(this), false, true);
        return true;
    }
}
