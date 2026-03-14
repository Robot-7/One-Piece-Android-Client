package com.igexin.getuiext.a;

import com.igexin.sdk.PushConsts;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private static HashMap a = new HashMap();

    static {
        a.put(PushConsts.ACTION_BROADCAST_USER_PRESENT, new n());
        a.put("com.igexin.download.action.notify.click", new f());
        a.put("com.igexin.increment", new i());
        a.put("install", new j());
        a.put("download", new e());
        a.put("bindApp", new c());
        a.put("update", new l());
        a.put("handleUpdate", new g());
    }

    public static a a(String str) {
        return (a) a.get(str);
    }
}
