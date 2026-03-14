package com.youai.sdks.platform;

import android.app.Activity;
import android.widget.Toast;
import com.pipaw.pipawpay.PipawLoginListener;
import com.pipaw.pipawpay.PipawPayListener;
import com.pipaw.pipawpay.PipawPayRequest;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import com.youai.sdks.beans.LoginInfo;
import com.youai.sdks.beans.PayInfo;
import com.youai.sdks.beans.PlatformContacts;
import com.youai.sdks.beans.PlatformInfo;
import com.youai.sdks.beans.ShareInfo;
import com.youai.sdks.beans.YALastLoginHelp;
import com.youai.sdks.callback.YASdkInterface;
import com.youai.sdks.utils.YALog;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class PlatformPipaw extends PlatformBase {
    @Override // com.youai.sdks.platform.PlatformBase
    public void init(Activity context, PlatformInfo platformInfo, YASdkInterface sdkInterface) {
        super.init(context, platformInfo, sdkInterface);
        this.mIsLogined = false;
        sdkInterface.onInitComplete(1);
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void unInit() {
        super.unInit();
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void setDebugMode(boolean debug) {
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public int isSupportInSDKGameUpdate() {
        return 0;
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public PlatformInfo getPlatformInfo() {
        return this.platformInfo;
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public LoginInfo getLoginInfo() {
        return super.getLoginInfo();
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void callLogout(Activity context) {
        this.mIsLogined = false;
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void callCheckVersionUpate() {
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void callAccountManage(Activity context) {
        if (isEnteredGame()) {
            Toast.makeText(context, "暂未开通", 0).show();
            return;
        }
        if (this.mIsLogined) {
            callLogout(context);
        }
        callLogin(context);
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public int callPlatformFeedback(Activity context, YALastLoginHelp yaLastLoginHelp) {
        return 0;
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void callPlatformSupportThirdShare(Activity context, ShareInfo share_info) {
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void callPlatformGameBBS(Activity context, String url) {
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public boolean isLogin() {
        return this.mIsLogined;
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void setScreenOrientation(PlatformContacts.ScreenOrientation orientation) {
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public void callLogin(Activity context) {
        if (!this.mIsLogined) {
            PipawSDK.getInstance().login(context, String.valueOf(this.platformInfo.cpID), this.platformInfo.gameID, this.platformInfo.appID, new PipawLoginListener() { // from class: com.youai.sdks.platform.PlatformPipaw.1
                @Override // com.pipaw.pipawpay.PipawLoginListener
                public void callback(int resultCode, String data) {
                    if (resultCode != 2000) {
                        if (resultCode == 2001) {
                            try {
                                JSONObject dataJsonObj = new JSONObject(data);
                                String sid = dataJsonObj.getString("sid");
                                String username = dataJsonObj.getString("username");
                                String time = dataJsonObj.getString("time");
                                PlatformPipaw.this.getUid(sid, username, time);
                                return;
                            } catch (JSONException e) {
                                e.printStackTrace();
                                PlatformPipaw.this.returnLoginState(PlatformContacts.LoginState.Login_Error, "登录失败");
                                return;
                            }
                        }
                        if (resultCode != 2002) {
                            return;
                        }
                        PlatformPipaw.this.returnLoginState(PlatformContacts.LoginState.Login_Error, "登录失败:" + data);
                        return;
                    }
                    PlatformPipaw.this.returnLoginState(PlatformContacts.LoginState.Login_Cancel, "退出登录");
                }
            });
        }
    }

    @Override // com.youai.sdks.platform.PlatformBase
    public int callPayRecharge(Activity context, PayInfo pay_info) {
        this.pay_info = pay_info;
        String price = String.valueOf(pay_info.price);
        String cpprivateinfo = String.valueOf(pay_info.description) + "-" + pay_info.product_id + "-" + this.platformInfo.enShortName + this.login_info.uId;
        PipawPayRequest pipawPayRequest = new PipawPayRequest();
        pipawPayRequest.setMerchantId(String.valueOf(this.platformInfo.cpID));
        pipawPayRequest.setMerchantAppId(String.valueOf(this.platformInfo.gameID));
        pipawPayRequest.setAppId(this.platformInfo.appID);
        pipawPayRequest.setPayerId(String.valueOf(this.platformInfo.enShortName) + this.login_info.uId);
        pipawPayRequest.setExOrderNo(pay_info.order_serial);
        pipawPayRequest.setSubject(pay_info.product_name);
        pipawPayRequest.setPrice(price);
        pipawPayRequest.setExtraParam(cpprivateinfo);
        StringBuilder content = new StringBuilder();
        content.append(String.valueOf(this.platformInfo.cpID)).append(String.valueOf(this.platformInfo.gameID)).append(this.platformInfo.appID).append(String.valueOf(this.platformInfo.enShortName) + this.login_info.uId).append(pay_info.order_serial).append(pay_info.product_name).append(price).append(cpprivateinfo).append(this.platformInfo.privatestr);
        YALog.i("pay", "content " + ((Object) content));
        String merchantSign = getMd5(content.toString());
        YALog.i("pay", "merchantSign " + merchantSign);
        pipawPayRequest.setMerchantSign(merchantSign);
        PipawSDK.getInstance().pay(context, pipawPayRequest, new PipawPayListener() { // from class: com.youai.sdks.platform.PlatformPipaw.2
            @Override // com.pipaw.pipawpay.PipawPayListener
            public void callback(int resultCode, String data) {
                if (resultCode != 1000) {
                    if (resultCode == 1001) {
                        PlatformPipaw.this.pay_info.result = 0;
                        PlatformPipaw.this.returnpayState(PlatformContacts.PayState.Pay_Success, "支付成功");
                        return;
                    } else {
                        if (resultCode != 1002) {
                            if (resultCode != 1003) {
                                return;
                            }
                            PlatformPipaw.this.returnpayState(PlatformContacts.PayState.Pay_Failure, "验签失败:" + data);
                            return;
                        }
                        PlatformPipaw.this.returnpayState(PlatformContacts.PayState.Pay_Failure, "支付失败:" + data);
                        return;
                    }
                }
                PlatformPipaw.this.returnpayState(PlatformContacts.PayState.Pay_Cancel, "取消支付");
            }
        });
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getUid(final String sid, final String username, final String time) {
        new Thread(new Runnable() { // from class: com.youai.sdks.platform.PlatformPipaw.3
            public void loginFail() {
                PlatformPipaw.this.login_info.loginState = PlatformContacts.LoginState.Login_Error;
                PlatformPipaw.this.login_info.uId = StatConstants.MTA_COOPERATION_TAG;
                PlatformPipaw.this.login_info.uName = StatConstants.MTA_COOPERATION_TAG;
                PlatformPipaw.this.mIsLogined = false;
                PlatformPipaw.this.returnLoginState(PlatformContacts.LoginState.Login_Error, "登录失败");
            }

            @Override // java.lang.Runnable
            public void run() {
                HttpClient client = new DefaultHttpClient();
                HttpPost post = new HttpPost("http://106.55.254.14:81/appuser/Checksid.php");
                List<NameValuePair> paramList = new ArrayList<>();
                BasicNameValuePair param = new BasicNameValuePair("username", username);
                BasicNameValuePair param1 = new BasicNameValuePair("appId", PlatformPipaw.this.platformInfo.appID);
                BasicNameValuePair param2 = new BasicNameValuePair("merchantId", String.valueOf(PlatformPipaw.this.platformInfo.cpID));
                BasicNameValuePair param3 = new BasicNameValuePair("merchantAppId", PlatformPipaw.this.platformInfo.gameID);
                BasicNameValuePair param4 = new BasicNameValuePair("sid", sid);
                BasicNameValuePair param5 = new BasicNameValuePair("time", time);
                paramList.add(param);
                paramList.add(param1);
                paramList.add(param2);
                paramList.add(param3);
                paramList.add(param4);
                paramList.add(param5);
                try {
                    post.setEntity(new UrlEncodedFormEntity(paramList, "UTF-8"));
                    HttpResponse httpResponse = client.execute(post);
                    if (httpResponse.getStatusLine().getStatusCode() == 200) {
                        String resultStr = EntityUtils.toString(httpResponse.getEntity());
                        JSONObject jsonResult = new JSONObject(resultStr);
                        int result = jsonResult.optInt("result");
                        if (result == 1) {
                            String _uid = jsonResult.optString("uid");
                            String _username = jsonResult.optString("username");
                            PlatformPipaw.this.login_info.loginState = PlatformContacts.LoginState.Login_Success;
                            PlatformPipaw.this.login_info.uId = _uid;
                            PlatformPipaw.this.login_info.uName = _username;
                            PlatformPipaw.this.mIsLogined = true;
                            PlatformPipaw.this.returnLoginState(PlatformContacts.LoginState.Login_Success, "登录成功");
                        } else {
                            loginFail();
                        }
                    } else {
                        loginFail();
                    }
                } catch (UnsupportedEncodingException e) {
                    loginFail();
                } catch (ClientProtocolException e2) {
                    loginFail();
                } catch (IOException e3) {
                    loginFail();
                } catch (JSONException e4) {
                    loginFail();
                }
            }
        }).start();
    }

    public static String getMd5(String str) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes("UTF-8"));
            byte[] hash = md.digest();
            for (byte b : hash) {
                String s = Integer.toHexString(b & 255);
                if (s.length() == 1) {
                    sb.append("0");
                }
                sb.append(s);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e2) {
            e2.printStackTrace();
        }
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void returnLoginState(final PlatformContacts.LoginState loginState, final String msg) {
        this.context.runOnUiThread(new Runnable() { // from class: com.youai.sdks.platform.PlatformPipaw.4
            @Override // java.lang.Runnable
            public void run() {
                PlatformPipaw.this.sdkInterface.finishLoginProcess(loginState, msg);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void returnpayState(final PlatformContacts.PayState payState, final String msg) {
        this.context.runOnUiThread(new Runnable() { // from class: com.youai.sdks.platform.PlatformPipaw.5
            @Override // java.lang.Runnable
            public void run() {
                PlatformPipaw.this.sdkInterface.finishPayProcess(payState, msg);
            }
        });
    }
}
