package com.tencent.stat.a;

import android.content.Context;
import com.tencent.stat.StatGameUser;
import com.tencent.stat.StatSpecifyReportedInfo;
import com.tencent.stat.common.q;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class g extends e {
    private StatGameUser a;

    public g(Context context, int i, StatGameUser statGameUser, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        super(context, i, statSpecifyReportedInfo);
        this.a = null;
        this.a = statGameUser.m3clone();
    }

    @Override // com.tencent.stat.a.e
    public f a() {
        return f.MTA_GAME_USER;
    }

    @Override // com.tencent.stat.a.e
    public boolean a(JSONObject jSONObject) throws JSONException {
        if (this.a == null) {
            return false;
        }
        q.a(jSONObject, "wod", this.a.getWorldName());
        q.a(jSONObject, "gid", this.a.getAccount());
        q.a(jSONObject, "lev", this.a.getLevel());
        return true;
    }
}
