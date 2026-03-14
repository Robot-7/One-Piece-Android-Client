package com.igexin.getuiext.service;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.igexin.getuiext.data.Consts;
import com.igexin.getuiext.ui.promotion.m;
import com.tencent.stat.common.StatConstants;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public class a {
    public static String a(com.igexin.getuiext.data.a.a aVar, int i) {
        String str = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date());
        if (aVar instanceof com.igexin.getuiext.data.a.e) {
            com.igexin.getuiext.data.a.e eVar = (com.igexin.getuiext.data.a.e) aVar;
            return str + "|" + Consts.VERSION + "|" + Consts.CID + "|" + Consts.APPID + "|" + eVar.j + "|" + eVar.k + "|" + i + "|" + eVar.b + "|" + eVar.n + "|" + eVar.m + "|" + eVar.d;
        }
        if (!(aVar instanceof com.igexin.getuiext.ui.promotion.f)) {
            return null;
        }
        com.igexin.getuiext.ui.promotion.f fVar = (com.igexin.getuiext.ui.promotion.f) aVar;
        return str + "|" + Consts.VERSION + "|" + Consts.CID + "|" + Consts.APPID + "|" + fVar.j + "|" + fVar.k + "|" + i + "|" + fVar.b + "|" + fVar.m;
    }

    public static ArrayList a(String str) {
        return com.igexin.getuiext.b.c.d().b().a(str);
    }

    public static void a(Context context, com.igexin.getuiext.data.a.a aVar, int i) {
        String strA = a(aVar, i);
        if (aVar instanceof com.igexin.getuiext.data.a.e) {
            a(context, strA, Consts.BITYPE_UPDATE);
        } else if (aVar instanceof com.igexin.getuiext.ui.promotion.f) {
            a(context, strA, Consts.BITYPE_RECOMMEND);
        }
    }

    public static void a(Context context, m mVar, int i, String str, String str2) {
        String str3 = StatConstants.MTA_COOPERATION_TAG;
        switch (mVar) {
            case IMG:
                str3 = Consts.PROMOTION_TYPE_IMG;
                break;
            case TEXT:
                str3 = Consts.PROMOTION_TYPE_TEXT;
                break;
        }
        String str4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date());
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(str4).append("|").append(Consts.VERSION).append("|").append(Consts.CID).append("|").append(Consts.APPID).append("|").append(str).append("|").append(str2).append("|").append(str3).append("|").append(i);
        a(context, stringBuffer.toString(), Consts.BITYPE_PROMOTION_TEXT_OR_IMG);
    }

    public static void a(Context context, String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        Intent intent = new Intent(context, (Class<?>) GetuiExtService.class);
        intent.putExtra("BIData", str);
        intent.putExtra("BIType", str2);
        intent.putExtra("what", Consts.SEND_BI);
        context.startService(intent);
    }

    public static void a(String str, int i) {
        com.igexin.getuiext.b.c.d().b().a(str, i);
    }

    public static void b(String str) {
        com.igexin.getuiext.b.c.d().b().b(str);
    }
}
