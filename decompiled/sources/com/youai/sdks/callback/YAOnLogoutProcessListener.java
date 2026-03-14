package com.youai.sdks.callback;

import com.youai.sdks.beans.PlatformContacts;

/* JADX INFO: compiled from: YASdkInterface.java */
/* JADX INFO: loaded from: classes.dex */
interface YAOnLogoutProcessListener {
    void finishLogoutProcess(PlatformContacts.LoginState loginState, String str);
}
