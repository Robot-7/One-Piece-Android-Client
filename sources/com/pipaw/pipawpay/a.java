package com.pipaw.pipawpay;

import android.content.Context;
import android.content.SharedPreferences;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private static final String a = com.pipaw.a.d.a(a.class);
    private static String b;
    private static String c;

    public static String a() {
        return b;
    }

    public static List a(Context context) {
        ArrayList arrayList = new ArrayList();
        try {
            SharedPreferences sharedPreferencesA = com.pipaw.a.i.a(context, "pipaw");
            for (String str : sharedPreferencesA.getAll().keySet()) {
                if (str.startsWith("pipawun_")) {
                    String string = sharedPreferencesA.getString(str, StatConstants.MTA_COOPERATION_TAG);
                    if (!com.pipaw.a.j.a(string)) {
                        arrayList.add(string);
                    }
                }
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
        return arrayList;
    }

    public static void a(Context context, String str) {
        try {
            if (com.pipaw.a.j.a(str)) {
                return;
            }
            SharedPreferences sharedPreferencesA = com.pipaw.a.i.a(context, "pipaw");
            String string = sharedPreferencesA.getString("pipawun", StatConstants.MTA_COOPERATION_TAG);
            SharedPreferences.Editor editorEdit = sharedPreferencesA.edit();
            if (string.equals(str)) {
                editorEdit.putString("pipawun", StatConstants.MTA_COOPERATION_TAG);
            }
            editorEdit.remove("pipawun_" + str);
            editorEdit.commit();
            context.deleteFile(com.pipaw.a.b.b(str));
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    public static void a(Context context, String str, String str2, boolean z) {
        try {
            SharedPreferences.Editor editorEdit = com.pipaw.a.i.a(context, "pipaw").edit();
            editorEdit.putString("pipawun", str);
            editorEdit.putString("pipawun_" + str, str);
            editorEdit.commit();
            String strB = com.pipaw.a.b.b(str);
            if (z) {
                context.openFileOutput(strB, 0).write(com.pipaw.a.b.a(str2));
            } else {
                context.deleteFile(strB);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    public static void a(Context context, String str, byte[] bArr) {
        try {
            SharedPreferences.Editor editorEdit = com.pipaw.a.i.a(context, "pipaw").edit();
            editorEdit.putString("pipawun", str);
            editorEdit.putString("pipawun_" + str, str);
            editorEdit.commit();
            context.openFileOutput(com.pipaw.a.b.b(str), 0).write(bArr);
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
    }

    public static void a(String str) {
        b = str;
    }

    public static String b() {
        return c;
    }

    public static String b(Context context) {
        return com.pipaw.a.i.a(context, "pipaw", "pipawun", StatConstants.MTA_COOPERATION_TAG);
    }

    public static String b(Context context, String str) {
        try {
            if (!com.pipaw.a.j.a(str)) {
                byte[] bArr = new byte[512];
                return com.pipaw.a.b.a(bArr, 0, context.openFileInput(com.pipaw.a.b.b(str)).read(bArr));
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static void b(String str) {
        c = str;
    }

    public static void c(Context context) {
        com.pipaw.a.i.b(context, "pipaw", "bind_tip_" + b(context), System.currentTimeMillis());
    }

    public static boolean c(Context context, String str) {
        try {
            long jA = com.pipaw.a.i.a(context, "pipaw", "bind_tip_" + str, 0L);
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(jA);
            Calendar calendar2 = Calendar.getInstance();
            calendar2.setTimeInMillis(System.currentTimeMillis());
            if (calendar2.get(1) == calendar.get(1) && calendar2.get(2) == calendar.get(2)) {
                if (calendar2.get(5) == calendar.get(5)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            com.pipaw.a.d.a(a, e);
            return false;
        }
    }
}
