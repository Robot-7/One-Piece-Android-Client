package com.youai.dreamonepiece.platform.pipaw.wxapi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;
import com.tencent.mm.sdk.modelbase.BaseReq;
import com.tencent.mm.sdk.modelbase.BaseResp;
import com.tencent.mm.sdk.openapi.IWXAPIEventHandler;
import com.youai.dreamonepiece.GameActivity;
import com.youai.dreamonepiece.platform.pipaw.R;

/* JADX INFO: loaded from: classes.dex */
public class WXEntryActivity extends Activity implements IWXAPIEventHandler {
    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getIntent() != null) {
            GameActivity.api.handleIntent(getIntent(), this);
        }
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        if (intent != null) {
            GameActivity.api.handleIntent(intent, this);
        }
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPIEventHandler
    public void onReq(BaseReq arg0) {
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPIEventHandler
    public void onResp(BaseResp resp) {
        int result;
        Log.i("WXEntryActivity", "onResp" + resp.errCode);
        switch (resp.errCode) {
            case BaseResp.ErrCode.ERR_AUTH_DENIED /* -4 */:
                result = R.string.errcode_deny;
                break;
            case BaseResp.ErrCode.ERR_SENT_FAILED /* -3 */:
            case -1:
            default:
                result = R.string.errcode_unknown;
                break;
            case -2:
                result = R.string.errcode_cancel;
                break;
            case 0:
                result = R.string.errcode_success;
                GameActivity.weChatHave = true;
                break;
        }
        Toast.makeText(this, result, 1).show();
        finish();
    }
}
