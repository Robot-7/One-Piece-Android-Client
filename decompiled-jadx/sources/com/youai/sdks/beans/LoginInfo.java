package com.youai.sdks.beans;

import com.youai.sdks.beans.PlatformContacts;

/* JADX INFO: loaded from: classes.dex */
public class LoginInfo {
    public PlatformContacts.LoginState loginState;
    public String sessionId;
    public String token;
    public String uId;
    public String uName;

    public String toString() {
        return "LoginInfo = [ loginState " + this.loginState + " uId " + this.uId + " uName " + this.uName + " token " + this.token + " sessionId " + this.sessionId + " ]";
    }
}
