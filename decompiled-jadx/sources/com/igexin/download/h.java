package com.igexin.download;

import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Environment;
import android.os.StatFs;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.webkit.MimeTypeMap;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class h {
    public static Random a = new Random(SystemClock.uptimeMillis());
    private static final Pattern b = Pattern.compile("attachment;\\s*filename\\s*=\\s*\"([^\"]*)\"");

    public static a a(Context context, String str, String str2, String str3, String str4, String str5, int i, int i2) {
        String strA;
        String strSubstring;
        String strA2 = a(str, str2, str3, str4, i);
        int iIndexOf = strA2.indexOf(46);
        if (iIndexOf < 0) {
            strA = a(str5, true);
            strSubstring = strA2;
        } else {
            strA = a(str5, i, strA2, iIndexOf);
            strSubstring = strA2.substring(0, iIndexOf);
        }
        if (strA != null && strA.equals(".bin")) {
            int iIndexOf2 = str.indexOf("?");
            if (iIndexOf2 >= 0) {
                str = str.substring(0, iIndexOf2);
            }
            int iLastIndexOf = str.lastIndexOf(".");
            int iLastIndexOf2 = str.lastIndexOf("/");
            if (iLastIndexOf >= 0 && iLastIndexOf2 >= 0 && iLastIndexOf > iLastIndexOf2) {
                strA = str.substring(iLastIndexOf);
            }
        }
        if (!Environment.getExternalStorageState().equals("mounted")) {
            return new a(null, null, Downloads.STATUS_FILE_ERROR);
        }
        String path = Environment.getExternalStorageDirectory().getPath();
        File file = new File(path + SdkDownLoader.b);
        if (!file.isDirectory()) {
            String[] strArrSplit = SdkDownLoader.b.split("/");
            for (int i3 = 0; i3 < strArrSplit.length; i3++) {
                if (strArrSplit[i3] != null && strArrSplit[i3].length() > 0) {
                    File file2 = new File(path + "/" + strArrSplit[i3]);
                    if (!file2.exists()) {
                        file2.mkdir();
                    }
                }
            }
            if (!file.mkdir()) {
                return new a(null, null, Downloads.STATUS_FILE_ERROR);
            }
        }
        StatFs statFs = new StatFs(file.getPath());
        if (((long) statFs.getBlockSize()) * (((long) statFs.getAvailableBlocks()) - 4) < i2) {
            return new a(null, null, Downloads.STATUS_FILE_ERROR);
        }
        String strA3 = a(i, file.getPath() + File.separator + strSubstring, strA, "recovery".equalsIgnoreCase(strSubstring + strA));
        return strA3 != null ? new a(strA3, new FileOutputStream(strA3), 0) : new a(null, null, Downloads.STATUS_FILE_ERROR);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0075, code lost:
    
        r3 = r3 * 10;
        r1 = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String a(int r6, java.lang.String r7, java.lang.String r8, boolean r9) {
        /*
            r1 = 1
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.StringBuilder r0 = r0.append(r7)
            java.lang.StringBuilder r0 = r0.append(r8)
            java.lang.String r0 = r0.toString()
            java.io.File r2 = new java.io.File
            r2.<init>(r0)
            boolean r2 = r2.exists()
            if (r2 != 0) goto L28
            if (r9 == 0) goto L27
            if (r6 == r1) goto L28
            r2 = 2
            if (r6 == r2) goto L28
            r2 = 3
            if (r6 == r2) goto L28
        L27:
            return r0
        L28:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.StringBuilder r0 = r0.append(r7)
            java.lang.String r2 = "-"
            java.lang.StringBuilder r0 = r0.append(r2)
            java.lang.String r4 = r0.toString()
            r3 = r1
        L3c:
            r0 = 1000000000(0x3b9aca00, float:0.0047237873)
            if (r3 >= r0) goto L7a
            r0 = 0
            r2 = r1
            r1 = r0
        L44:
            r0 = 9
            if (r1 >= r0) goto L75
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.StringBuilder r0 = r0.append(r4)
            java.lang.StringBuilder r0 = r0.append(r2)
            java.lang.StringBuilder r0 = r0.append(r8)
            java.lang.String r0 = r0.toString()
            java.io.File r5 = new java.io.File
            r5.<init>(r0)
            boolean r5 = r5.exists()
            if (r5 == 0) goto L27
            java.util.Random r0 = com.igexin.download.h.a
            int r0 = r0.nextInt(r3)
            int r0 = r0 + 1
            int r2 = r2 + r0
            int r0 = r1 + 1
            r1 = r0
            goto L44
        L75:
            int r0 = r3 * 10
            r3 = r0
            r1 = r2
            goto L3c
        L7a:
            r0 = 0
            goto L27
        */
        throw new UnsupportedOperationException("Method not decompiled: com.igexin.download.h.a(int, java.lang.String, java.lang.String, boolean):java.lang.String");
    }

    private static String a(String str, int i, String str2, int i2) {
        String strA = null;
        if (str != null) {
            String mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(str2.substring(str2.lastIndexOf(46) + 1));
            if ((mimeTypeFromExtension == null || !mimeTypeFromExtension.equalsIgnoreCase(str)) && (strA = a(str, false)) != null) {
            }
        }
        return strA == null ? str2.substring(i2) : strA;
    }

    private static String a(String str, String str2, String str3, String str4, int i) {
        String strSubstring;
        String strDecode;
        int iLastIndexOf;
        int iLastIndexOf2;
        String strB = null;
        if (0 == 0 && str2 != null && !str2.endsWith("/") && str2.length() > 0) {
            int iLastIndexOf3 = str2.lastIndexOf(47) + 1;
            strB = iLastIndexOf3 > 0 ? str2.substring(iLastIndexOf3) : str2;
        }
        if (strB == null && str3 != null && (strB = b(str3)) != null && (iLastIndexOf2 = strB.lastIndexOf(47) + 1) > 0) {
            strB = strB.substring(iLastIndexOf2);
        }
        if (strB != null || str4 == null || (strSubstring = Uri.decode(str4)) == null || strSubstring.endsWith("/") || strSubstring.indexOf(63) >= 0) {
            strSubstring = strB;
        } else {
            int iLastIndexOf4 = strSubstring.lastIndexOf(47) + 1;
            if (iLastIndexOf4 > 0) {
                strSubstring = strSubstring.substring(iLastIndexOf4);
            }
        }
        if (strSubstring == null && (strDecode = Uri.decode(str)) != null && !strDecode.endsWith("/") && strDecode.indexOf(63) < 0 && (iLastIndexOf = strDecode.lastIndexOf(47) + 1) > 0) {
            strSubstring = strDecode.substring(iLastIndexOf);
        }
        return strSubstring == null ? "downloadfile" : strSubstring;
    }

    private static String a(String str, boolean z) {
        String extensionFromMimeType = null;
        if (str != null && (extensionFromMimeType = MimeTypeMap.getSingleton().getExtensionFromMimeType(str)) != null) {
            extensionFromMimeType = "." + extensionFromMimeType;
        }
        return extensionFromMimeType == null ? (str == null || !str.toLowerCase().startsWith("text/")) ? z ? ".bin" : extensionFromMimeType : str.equalsIgnoreCase("text/html") ? ".html" : z ? ".txt" : extensionFromMimeType : extensionFromMimeType;
    }

    private static void a(i iVar) {
        while (true) {
            if (iVar.a() == 1) {
                iVar.b();
                a(iVar);
                if (iVar.a() != 2) {
                    throw new IllegalArgumentException("syntax error, unmatched parenthese");
                }
                iVar.b();
            } else {
                b(iVar);
            }
            if (iVar.a() != 3) {
                return;
            } else {
                iVar.b();
            }
        }
    }

    public static void a(String str, Set set) {
        if (str == null) {
            return;
        }
        try {
            i iVar = new i(str, set);
            a(iVar);
            if (iVar.a() != 9) {
                throw new IllegalArgumentException("syntax error");
            }
        } catch (RuntimeException e) {
            throw e;
        }
    }

    public static boolean a(Context context) {
        NetworkInfo[] allNetworkInfo;
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager == null || (allNetworkInfo = connectivityManager.getAllNetworkInfo()) == null) {
            return false;
        }
        for (NetworkInfo networkInfo : allNetworkInfo) {
            if (networkInfo.getState() == NetworkInfo.State.CONNECTED) {
                return true;
            }
        }
        return false;
    }

    public static final boolean a(Context context, long j) throws Throwable {
        Cursor cursorQuery;
        long length;
        Cursor cursor = null;
        try {
            cursorQuery = context.getContentResolver().query(Downloads.a, null, "( status = '200' AND destination = '2' )", null, Downloads.COLUMN_LAST_MODIFICATION);
        } catch (Exception e) {
            cursorQuery = null;
            length = 0;
        } catch (Throwable th) {
            th = th;
        }
        if (cursorQuery == null) {
            cursorQuery.close();
            return false;
        }
        try {
            try {
                cursorQuery.moveToFirst();
                length = 0;
                while (!cursorQuery.isAfterLast() && length < j) {
                    try {
                        File file = new File(cursorQuery.getString(cursorQuery.getColumnIndex(Downloads._DATA)));
                        length += file.length();
                        file.delete();
                        context.getContentResolver().delete(ContentUris.withAppendedId(Downloads.a, cursorQuery.getLong(cursorQuery.getColumnIndex("_id"))), null, null);
                        cursorQuery.moveToNext();
                    } catch (Exception e2) {
                        cursorQuery.close();
                    }
                }
                cursorQuery.close();
            } catch (Throwable th2) {
                cursor = cursorQuery;
                th = th2;
                cursor.close();
                throw th;
            }
        } catch (Exception e3) {
            length = 0;
        }
        return length > 0;
    }

    public static boolean a(String str) {
        File parentFile = new File(str).getParentFile();
        return parentFile.equals(Environment.getDownloadCacheDirectory()) || parentFile.equals(new File(new StringBuilder().append(Environment.getExternalStorageDirectory()).append("/libs/tmp").toString()));
    }

    private static String b(String str) {
        try {
            Matcher matcher = b.matcher(str);
            if (matcher.find()) {
                return matcher.group(1);
            }
        } catch (IllegalStateException e) {
        }
        return null;
    }

    private static void b(i iVar) {
        if (iVar.a() != 4) {
            throw new IllegalArgumentException("syntax error, expected column name");
        }
        iVar.b();
        if (iVar.a() == 5) {
            iVar.b();
            if (iVar.a() != 6) {
                throw new IllegalArgumentException("syntax error, expected quoted string");
            }
            iVar.b();
            return;
        }
        if (iVar.a() != 7) {
            throw new IllegalArgumentException("syntax error after column name");
        }
        iVar.b();
        if (iVar.a() != 8) {
            throw new IllegalArgumentException("syntax error, expected NULL");
        }
        iVar.b();
    }

    public static boolean b(Context context) {
        NetworkInfo activeNetworkInfo;
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        return (connectivityManager == null || (activeNetworkInfo = connectivityManager.getActiveNetworkInfo()) == null || activeNetworkInfo.getType() != 1) ? false : true;
    }

    public static boolean c(Context context) {
        NetworkInfo activeNetworkInfo;
        TelephonyManager telephonyManager;
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        return (connectivityManager == null || (activeNetworkInfo = connectivityManager.getActiveNetworkInfo()) == null || activeNetworkInfo.getType() != 0 || (telephonyManager = (TelephonyManager) context.getSystemService("phone")) == null || !telephonyManager.isNetworkRoaming()) ? false : true;
    }
}
