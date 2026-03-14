package com.igexin.push.core.a;

import com.igexin.push.core.bean.PushTaskBean;

/* JADX INFO: loaded from: classes.dex */
public class e extends a {
    private static final String a = com.igexin.push.a.j.a;

    private void a(String str, com.igexin.push.c.c.a aVar) {
        if (str != null) {
            String strSubstring = str.substring("CDN".length(), str.length());
            if (strSubstring.contains("@")) {
                String[] strArrSplit = strSubstring.split("\\@");
                String str2 = strArrSplit[0];
                if (strArrSplit[1].contains("|")) {
                    String[] strArrSplit2 = strArrSplit[1].split("\\|");
                    String str3 = strArrSplit2[0];
                    String str4 = strArrSplit2[1];
                    if (str2 == null || str3 == null || str4 == null) {
                        return;
                    }
                    PushTaskBean pushTaskBean = new PushTaskBean();
                    pushTaskBean.setAppid(com.igexin.push.core.g.c);
                    pushTaskBean.setMessageId(str2);
                    pushTaskBean.setTaskId(str3);
                    pushTaskBean.setId(str2);
                    pushTaskBean.setAppKey(com.igexin.push.core.g.d);
                    pushTaskBean.setCurrentActionid(1);
                    f.a().a(pushTaskBean);
                    f.a().a(str4, aVar, pushTaskBean);
                }
            }
        }
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(com.igexin.a.a.d.d dVar) {
        return super.a(dVar);
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(Object obj) {
        com.igexin.push.e.b.c cVarE;
        if (!(obj instanceof com.igexin.push.c.c.a)) {
            return true;
        }
        com.igexin.push.c.c.a aVar = (com.igexin.push.c.c.a) obj;
        if (aVar.c == null) {
            return true;
        }
        String str = (String) aVar.c;
        com.igexin.a.a.c.a.a("cdnpushmessage|" + str);
        if (!str.startsWith("RCV")) {
            if (!str.contains("CDN")) {
                return true;
            }
            a(str, aVar);
            return true;
        }
        String strSubstring = str.substring("RCV".length(), str.length());
        if (!com.igexin.push.core.g.ao.containsKey(strSubstring)) {
            return true;
        }
        com.igexin.push.c.c.c cVar = (com.igexin.push.c.c.c) com.igexin.push.core.g.ao.get(strSubstring);
        com.igexin.push.core.g.ao.remove(strSubstring);
        if (cVar == null || (cVarE = cVar.e()) == null) {
            return true;
        }
        cVarE.t();
        return true;
    }
}
