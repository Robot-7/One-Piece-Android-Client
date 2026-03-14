package com.youai.sdks.callback;

import com.youai.sdks.beans.PlatformContacts;

/* JADX INFO: Access modifiers changed from: package-private */
/* JADX INFO: compiled from: YASdkInterface.java */
/* JADX INFO: loaded from: classes.dex */
public interface YAOnPayProcessListener {
    void finishPayProcess(PlatformContacts.PayState payState, String str);
}
