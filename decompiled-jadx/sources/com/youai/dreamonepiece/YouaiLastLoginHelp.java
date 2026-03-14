package com.youai.dreamonepiece;

import android.content.Context;
import android.os.Environment;
import android.os.SystemClock;
import android.util.Log;
import com.igexin.download.Downloads;
import com.tencent.stat.common.StatConstants;
import com.youai.DeviceUtil;
import com.youai.IniFileUtil;
import com.youai.MD5;
import com.youai.PlatformAndGameInfo;
import com.youai.RSAUtil;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class YouaiLastLoginHelp {
    static GameActivity activityGame;
    static File dynamicFile;
    static boolean found;
    static String gameId;
    private static File saveFile;
    private static File savePath;
    static String yaUid;
    static ArrayList<YouaiServerInfo> youaiInfos;
    public static final String Tag = YouaiLastLoginHelp.class.getSimpleName();
    static String platform_str = "Android";
    static boolean switchPushGet = false;
    private static boolean mDesBol = false;
    private static String gexingClientId = StatConstants.MTA_COOPERATION_TAG;
    private static String gexingTags = StatConstants.MTA_COOPERATION_TAG;

    public interface RequestListener {
        void onComplete(String str);

        void onError(Exception exc);

        void onIOException(IOException iOException);
    }

    public static void setYouaiLastLoginHelp(GameActivity pActivity) {
        activityGame = pActivity;
        youaiInfos = new ArrayList<>();
        savePath = new File(Environment.getExternalStorageDirectory() + File.separator + "youai" + File.separator);
        if (!savePath.exists()) {
            savePath.mkdirs();
        }
    }

    public static void updateServerInfo(int serverID, YouaiServerInfo pYouaiInfo, boolean pushSvr) throws Throwable {
        String _yaUid;
        String _yaUid2;
        String _yaUid3;
        String _yaUid4;
        String _yaUid5;
        String _yaUid6;
        Log.w("YouaiLastLoginHelp", "updateServerInfo" + serverID);
        platform_str = pYouaiInfo.getPlatform();
        if (platform_str.equals(PlatformAndGameInfo.enPlatformName_Youai)) {
            mDesBol = true;
        }
        if (gameId == null || gameId.equals(StatConstants.MTA_COOPERATION_TAG) || yaUid == null || yaUid.equals(StatConstants.MTA_COOPERATION_TAG)) {
            Log.w("YouaiLastLoginHelp", "gameid or yauid invalid");
            return;
        }
        switchPushGet = pushSvr;
        JSONObject message = new JSONObject();
        JSONObject data = new JSONObject();
        try {
            data.put("puid", yaUid);
            data.put("serverId", serverID);
            data.put("playerId", pYouaiInfo.getPlayerId());
            data.put("playerName", pYouaiInfo.getPlayerName());
            data.put("gameCoin1", pYouaiInfo.getGameCoin1());
            data.put("gameCoin2", pYouaiInfo.getGameCoin2());
            data.put("vipLvl", pYouaiInfo.getVipLv1());
            data.put("playerLvl", pYouaiInfo.getPlayerLv1());
            data.put("geXingClientId", gexingClientId);
            data.put("geXingTags", gexingTags);
            message.put("data", data);
            JSONObject header = new JSONObject();
            header.put("gameId", gameId);
            header.put("platform", platform_str);
            header.put("deviceMacId", DeviceUtil.getDeviceUUID(activityGame));
            header.put("timestamp", SystemClock.currentThreadTimeMillis());
            header.put("deviceName", DeviceUtil.getDeviceProductName(activityGame));
            message.put("header", header);
        } catch (JSONException e1) {
            e1.printStackTrace();
        }
        String pushMsg = message.toString();
        Log.w("YouaiLastLoginHelp:message.toString", pushMsg);
        if (switchPushGet) {
            pushforclient(pushMsg, new RequestListener() { // from class: com.youai.dreamonepiece.YouaiLastLoginHelp.1
                @Override // com.youai.dreamonepiece.YouaiLastLoginHelp.RequestListener
                public void onComplete(String response) {
                    Log.w("YouaiLastLoginHelp", response);
                }

                @Override // com.youai.dreamonepiece.YouaiLastLoginHelp.RequestListener
                public void onIOException(IOException e) {
                    Log.w("YouaiLastLoginHelp", "IOException");
                }

                @Override // com.youai.dreamonepiece.YouaiLastLoginHelp.RequestListener
                public void onError(Exception e) {
                    Log.w("YouaiLastLoginHelp", "Exception");
                }
            });
        }
        String jsonsavestr = readJSONFromSD();
        if (jsonsavestr == null || jsonsavestr.equals(StatConstants.MTA_COOPERATION_TAG)) {
            JSONObject jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            JSONObject tosaveitem = new JSONObject();
            try {
                if (mDesBol) {
                    _yaUid = DES.encryptDES("com4love", yaUid);
                } else {
                    _yaUid = yaUid;
                }
                tosaveitem.put("puid", _yaUid);
                tosaveitem.put("gameId", gameId);
                tosaveitem.put("playerName", pYouaiInfo.getPlayerName());
                tosaveitem.put("serverId", serverID);
                tosaveitem.put("lastlogintime", System.currentTimeMillis());
                jSONArray.put(tosaveitem);
                jSONObject.put(_yaUid, jSONArray);
                writeJSONObjectToSdCard(jSONObject);
                return;
            } catch (JSONException e) {
                e.printStackTrace();
                return;
            } catch (Exception e2) {
                e2.printStackTrace();
                return;
            }
        }
        JSONObject jSONObject2 = null;
        JSONArray savejsonUser = null;
        try {
            JSONObject jsonsave = new JSONObject(jsonsavestr);
            try {
                if (mDesBol) {
                    _yaUid6 = DES.encryptDES("com4love", yaUid);
                } else {
                    _yaUid6 = yaUid;
                }
                savejsonUser = jsonsave.optJSONArray(_yaUid6);
                jSONObject2 = jsonsave;
            } catch (JSONException e3) {
                e = e3;
                e.printStackTrace();
                JSONObject jSONObject3 = new JSONObject();
                JSONArray jSONArray2 = new JSONArray();
                JSONObject tosaveitem2 = new JSONObject();
                try {
                    if (mDesBol) {
                        _yaUid2 = DES.encryptDES("com4love", yaUid);
                    } else {
                        _yaUid2 = yaUid;
                    }
                    tosaveitem2.put("puid", _yaUid2);
                    tosaveitem2.put("gameId", gameId);
                    tosaveitem2.put("playerName", pYouaiInfo.getPlayerName());
                    tosaveitem2.put("serverId", serverID);
                    tosaveitem2.put("lastlogintime", System.currentTimeMillis());
                    jSONArray2.put(tosaveitem2);
                    jSONObject3.put(_yaUid2, jSONArray2);
                    writeJSONObjectToSdCard(jSONObject3);
                    return;
                } catch (JSONException e22) {
                    e22.printStackTrace();
                    return;
                } catch (Exception e4) {
                    e.printStackTrace();
                    return;
                }
            } catch (Exception e5) {
                e = e5;
                jSONObject2 = jsonsave;
                e.printStackTrace();
            }
        } catch (JSONException e6) {
            e = e6;
        } catch (Exception e7) {
            e = e7;
        }
        if (readJSONFromSD() == null) {
            savejsonUser = null;
        }
        if (savejsonUser == null) {
            JSONArray jSONArray3 = new JSONArray();
            JSONObject tosaveitem3 = new JSONObject();
            try {
                if (mDesBol) {
                    _yaUid5 = DES.encryptDES("com4love", yaUid);
                } else {
                    _yaUid5 = yaUid;
                }
                tosaveitem3.put("puid", _yaUid5);
                tosaveitem3.put("gameId", gameId);
                tosaveitem3.put("playerName", pYouaiInfo.getPlayerName());
                tosaveitem3.put("serverId", serverID);
                tosaveitem3.put("lastlogintime", System.currentTimeMillis());
                jSONArray3.put(tosaveitem3);
                jSONObject2.put(_yaUid5, jSONArray3);
            } catch (JSONException e8) {
                e8.printStackTrace();
            } catch (Exception e9) {
                e9.printStackTrace();
            }
        } else {
            found = false;
            int length = savejsonUser.length();
            for (int i = 0; i < length; i++) {
                try {
                    JSONObject saveitem = savejsonUser.getJSONObject(i);
                    Log.w("YouaiLastLoginHelp", "serverId" + saveitem.getInt("serverId"));
                    if (saveitem.getInt("serverId") == serverID) {
                        found = true;
                        saveitem.put("lastlogintime", System.currentTimeMillis());
                        if (mDesBol) {
                            _yaUid4 = DES.encryptDES("com4love", yaUid);
                        } else {
                            _yaUid4 = yaUid;
                        }
                        jSONObject2.put(_yaUid4, savejsonUser);
                        break;
                    }
                    continue;
                } catch (JSONException e10) {
                    e10.printStackTrace();
                } catch (Exception e11) {
                    e11.printStackTrace();
                }
            }
            if (!found) {
                JSONObject tosaveitem4 = new JSONObject();
                try {
                    if (mDesBol) {
                        _yaUid3 = DES.encryptDES("com4love", yaUid);
                    } else {
                        _yaUid3 = yaUid;
                    }
                    tosaveitem4.put("puid", _yaUid3);
                    tosaveitem4.put("gameId", gameId);
                    tosaveitem4.put("playerName", pYouaiInfo.getPlayerName());
                    tosaveitem4.put("serverId", serverID);
                    tosaveitem4.put("lastlogintime", System.currentTimeMillis());
                    savejsonUser.put(tosaveitem4);
                } catch (JSONException e12) {
                    e12.printStackTrace();
                } catch (Exception e13) {
                    e13.printStackTrace();
                }
            }
        }
        writeJSONObjectToSdCard(jSONObject2);
        Iterator<YouaiServerInfo> it = youaiInfos.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            YouaiServerInfo aInfo = it.next();
            if (aInfo.getServerId() == serverID) {
                found = true;
                aInfo.setLastLoginTime(Long.valueOf(System.currentTimeMillis()));
                break;
            }
        }
        if (!found) {
            YouaiServerInfo nowuserServer = new YouaiServerInfo();
            nowuserServer.setPuid(yaUid);
            nowuserServer.setGameCoin1(pYouaiInfo.getGameCoin1());
            nowuserServer.setGameCoin2(pYouaiInfo.getGameCoin2());
            nowuserServer.setPlayerLv1(pYouaiInfo.getPlayerLv1());
            nowuserServer.setServerId(serverID);
            nowuserServer.setVipLv1(pYouaiInfo.getVipLv1());
            nowuserServer.setPlayerName(pYouaiInfo.getPlayerName());
            nowuserServer.setGameId(gameId);
            nowuserServer.setLastLoginTime(Long.valueOf(System.currentTimeMillis()));
            youaiInfos.add(nowuserServer);
        }
        if (youaiInfos.size() > 0) {
            Ordercomparator comp = new Ordercomparator();
            Collections.sort(youaiInfos, comp);
        }
    }

    public static void refreshServerInfo(String gameid, String puid, YouaiServerInfo pYouaiServerInfo, boolean getSvr) {
        JSONObject jsonsave;
        String _yaUid;
        int length;
        Log.w("YouaiLastLoginHelp", "refreshServerInfo+gameid" + gameid + "puid" + puid);
        if (gameId != gameid || yaUid != puid) {
            switchPushGet = getSvr;
            File rootfiles = new File(activityGame.getAppFilesResourcesPath());
            dynamicFile = new File(rootfiles.getAbsoluteFile() + File.separator + "dynamic.ini");
            if (dynamicFile.exists() && dynamicFile.isFile()) {
                String _switch = IniFileUtil.GetPrivateProfileString(dynamicFile.getAbsolutePath(), "Push_Get", "Switch", "0");
                Log.w("YouaiLastLoginHelp", "_switch" + _switch);
            }
            gameId = gameid;
            yaUid = puid;
            youaiInfos.clear();
            if (pYouaiServerInfo.getPlatform().equals(PlatformAndGameInfo.enPlatformName_Youai)) {
                mDesBol = true;
            }
            saveFile = new File(Environment.getExternalStorageDirectory() + File.separator + "youai" + File.separator + gameid + pYouaiServerInfo.getPlatform() + "_user");
            if (!saveFile.exists()) {
                try {
                    saveFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            String jsonsavestr = readJSONFromSD();
            if (jsonsavestr == null || jsonsavestr.equals(StatConstants.MTA_COOPERATION_TAG)) {
                pYouaiServerInfo.setGameId(gameid);
                pYouaiServerInfo.setPuid(puid);
                JSONObject message = new JSONObject();
                JSONObject data = new JSONObject();
                try {
                    data.put("puid", puid);
                    message.put("data", data);
                    message.put("header", makeHead(activityGame, pYouaiServerInfo));
                } catch (JSONException e1) {
                    e1.printStackTrace();
                }
                if (switchPushGet) {
                    getFromNet(message);
                }
            } else {
                try {
                    jsonsave = new JSONObject(jsonsavestr);
                } catch (JSONException e2) {
                    e = e2;
                } catch (Exception e3) {
                    e = e3;
                }
                try {
                    if (mDesBol) {
                        _yaUid = DES.encryptDES("com4love", yaUid);
                    } else {
                        _yaUid = yaUid;
                    }
                    JSONArray savejsonUser = jsonsave.optJSONArray(_yaUid);
                    if (savejsonUser == null) {
                        length = 0;
                    } else {
                        length = savejsonUser.length();
                    }
                    if (length == 0) {
                        YouaiServerInfo pYouaiInfo = new YouaiServerInfo();
                        pYouaiInfo.setGameId(gameid);
                        pYouaiInfo.setPuid(puid);
                        JSONObject message2 = new JSONObject();
                        JSONObject data2 = new JSONObject();
                        try {
                            data2.put("puid", puid);
                            message2.put("data", data2);
                            message2.put("header", makeHead(activityGame, pYouaiInfo));
                        } catch (JSONException e12) {
                            e12.printStackTrace();
                        }
                        if (switchPushGet) {
                            getFromNet(message2);
                        }
                    } else {
                        Log.w("YouaiLastLoginHelp", "length" + length);
                        for (int i = 0; i < length; i++) {
                            try {
                                JSONObject saveitem = savejsonUser.getJSONObject(i);
                                YouaiServerInfo _userServer = new YouaiServerInfo();
                                if (mDesBol) {
                                    _userServer.setPuid(DES.decryptDES("com4love", saveitem.getString("puid")));
                                } else {
                                    _userServer.setPuid(saveitem.getString("puid"));
                                }
                                _userServer.setServerId(saveitem.getInt("serverId"));
                                _userServer.setPlayerName(saveitem.getString("playerName"));
                                _userServer.setLastLoginTime(Long.valueOf(saveitem.optLong("lastlogintime")));
                                youaiInfos.add(_userServer);
                            } catch (JSONException e4) {
                                e4.printStackTrace();
                            } catch (Exception e5) {
                                e5.printStackTrace();
                            }
                        }
                    }
                } catch (JSONException e6) {
                    e = e6;
                    e.printStackTrace();
                    return;
                } catch (Exception e7) {
                    e = e7;
                    e.printStackTrace();
                    return;
                }
            }
            if (youaiInfos.size() > 0) {
                Ordercomparator comp = new Ordercomparator();
                Collections.sort(youaiInfos, comp);
            }
            Log.i("youaiInfos", "youaiInfos" + youaiInfos.size());
        }
    }

    static void getFromNet(JSONObject pMessage) {
        getPlayerList(pMessage.toString(), new RequestListener() { // from class: com.youai.dreamonepiece.YouaiLastLoginHelp.2
            @Override // com.youai.dreamonepiece.YouaiLastLoginHelp.RequestListener
            public void onIOException(IOException e) {
                Log.w("onIOException", "onIOException" + e.toString());
            }

            @Override // com.youai.dreamonepiece.YouaiLastLoginHelp.RequestListener
            public void onError(Exception e) {
                Log.w("onError", "onError" + e.toString());
            }

            @Override // com.youai.dreamonepiece.YouaiLastLoginHelp.RequestListener
            public void onComplete(String response) throws Throwable {
                String _yaUid;
                Log.w("onComplete", "onComplete" + response);
                try {
                    JSONObject jsonServer = new JSONObject(response);
                    String error = jsonServer.getString("error");
                    if (error.equals("200")) {
                        JSONArray players = jsonServer.getJSONObject("data").getJSONArray("players");
                        int length = players.length();
                        for (int i = 0; i < length; i++) {
                            YouaiServerInfo serverUser = new YouaiServerInfo();
                            String playerName = players.getJSONObject(i).getString("name");
                            int serverId = players.getJSONObject(i).getInt("serverId");
                            serverUser.setPlayerName(playerName);
                            serverUser.setGameId(YouaiLastLoginHelp.gameId);
                            serverUser.setServerId(serverId);
                            boolean bContinue = false;
                            Iterator<YouaiServerInfo> it = YouaiLastLoginHelp.youaiInfos.iterator();
                            while (true) {
                                if (!it.hasNext()) {
                                    break;
                                }
                                YouaiServerInfo info = it.next();
                                if (info.getServerId() == serverId) {
                                    bContinue = true;
                                    break;
                                }
                            }
                            if (!bContinue) {
                                YouaiLastLoginHelp.youaiInfos.add(serverUser);
                            }
                        }
                        JSONObject tosaveObj = new JSONObject();
                        JSONArray tosavearray = new JSONArray();
                        long _lastTime = 0;
                        try {
                            if (YouaiLastLoginHelp.mDesBol) {
                                _yaUid = DES.encryptDES("com4love", YouaiLastLoginHelp.yaUid);
                            } else {
                                _yaUid = YouaiLastLoginHelp.yaUid;
                            }
                            for (int i2 = YouaiLastLoginHelp.youaiInfos.size() - 1; i2 >= 0; i2--) {
                                JSONObject tosaveitem = new JSONObject();
                                try {
                                    try {
                                        tosaveitem.put("puid", _yaUid);
                                        tosaveitem.put("gameId", YouaiLastLoginHelp.gameId);
                                        tosaveitem.put("playerName", YouaiLastLoginHelp.youaiInfos.get(i2).getPlayerName());
                                        tosaveitem.put("serverId", YouaiLastLoginHelp.youaiInfos.get(i2).getServerId());
                                        long time = System.currentTimeMillis();
                                        tosaveitem.put("lastlogintime", time);
                                        if (time == _lastTime) {
                                            time++;
                                        }
                                        _lastTime = time;
                                        YouaiLastLoginHelp.youaiInfos.get(i2).setLastLoginTime(Long.valueOf(time));
                                        tosavearray = tosavearray.put(tosaveitem);
                                        tosaveObj = tosaveObj.put(_yaUid, tosavearray);
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                } catch (JSONException e2) {
                                    e2.printStackTrace();
                                }
                            }
                            if (players.length() > 0) {
                                YouaiLastLoginHelp.writeJSONObjectToSdCard(tosaveObj);
                            }
                        } catch (Exception e1) {
                            e1.printStackTrace();
                        }
                    }
                } catch (JSONException e3) {
                    e3.printStackTrace();
                }
            }
        });
    }

    public static JSONObject makeHead(Context context, YouaiServerInfo pYouaiInfo) {
        JSONObject header = new JSONObject();
        try {
            header.put("gameId", pYouaiInfo.getGameId());
            header.put("platform", pYouaiInfo.getPlatform());
            header.put("deviceMacId", DeviceUtil.getDeviceUUID(context));
            header.put("timestamp", SystemClock.currentThreadTimeMillis());
            header.put("deviceName", DeviceUtil.getDeviceProductName(context));
        } catch (JSONException e1) {
            e1.printStackTrace();
        }
        return header;
    }

    public static int getServerInfoCount() {
        Log.w("YouaiLastLoginHelp", "getServerInfoCount" + youaiInfos.size());
        int size = youaiInfos.size();
        if (size > 12) {
            return 12;
        }
        return size;
    }

    public static int getServerUserByIndex(int index) {
        Log.w("YouaiLastLoginHelp", "getServerUserByIndex" + index);
        if (youaiInfos.size() <= 0) {
            return 0;
        }
        Log.w("YouaiLastLoginHelp", "serverId:" + youaiInfos.get(index).getServerId());
        return youaiInfos.get(index).getServerId();
    }

    public static String readJSONFromSD() {
        String _yaUid;
        String jsonStr = StatConstants.MTA_COOPERATION_TAG;
        if (saveFile.exists()) {
            try {
                FileReader fileRe = new FileReader(saveFile);
                BufferedReader buffRe = new BufferedReader(fileRe);
                while (true) {
                    String temp = buffRe.readLine();
                    if (temp == null) {
                        break;
                    }
                    jsonStr = jsonStr + temp;
                }
                buffRe.close();
                fileRe.close();
            } catch (FileNotFoundException e) {
                Log.i("YouaiLastLoginHelp", e.toString());
                return null;
            } catch (IOException e2) {
                Log.i("YouaiLastLoginHelp", e2.toString());
                return null;
            }
        }
        try {
            JSONObject jsonsave = new JSONObject(jsonStr);
            try {
                if (mDesBol) {
                    _yaUid = DES.encryptDES("com4love", yaUid);
                } else {
                    _yaUid = yaUid;
                }
                JSONArray savejsonUser = jsonsave.optJSONArray(_yaUid);
                if (savejsonUser != null) {
                    for (int i = 0; i < savejsonUser.length(); i++) {
                        try {
                            JSONObject testsaveitem = savejsonUser.optJSONObject(i);
                            testsaveitem.get("puid");
                            testsaveitem.get("gameId");
                            testsaveitem.get("playerName");
                            testsaveitem.get("serverId");
                            testsaveitem.get("lastlogintime");
                        } catch (Exception e3) {
                            return null;
                        }
                    }
                    return jsonStr;
                }
                return jsonStr;
            } catch (Exception e1) {
                e1.printStackTrace();
                return null;
            }
        } catch (JSONException e4) {
            return null;
        }
    }

    public static void writeJSONObjectToSdCard(JSONObject pServerObj) throws Throwable {
        PrintStream outputStream;
        if (!saveFile.getParentFile().exists()) {
            saveFile.getParentFile().mkdirs();
        }
        if (!saveFile.exists() && !saveFile.isFile()) {
            try {
                saveFile.createNewFile();
            } catch (IOException e) {
                Log.i("YouaiLastLoginHelp", e.toString());
                return;
            }
        }
        PrintStream outputStream2 = null;
        try {
            try {
                outputStream = new PrintStream(new FileOutputStream(saveFile));
            } catch (FileNotFoundException e2) {
                e = e2;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            outputStream.print(pServerObj.toString());
            if (outputStream != null) {
                outputStream.close();
            }
        } catch (FileNotFoundException e3) {
            e = e3;
            outputStream2 = outputStream;
            e.printStackTrace();
            if (outputStream2 != null) {
                outputStream2.close();
            }
        } catch (Throwable th2) {
            th = th2;
            outputStream2 = outputStream;
            if (outputStream2 != null) {
                outputStream2.close();
            }
            throw th;
        }
    }

    public static void getPlayerList(String param, RequestListener listener) {
        HttpURLConnection url_con = null;
        try {
            try {
                String encript = RSAUtil.encryptByPubKey(param, RSAUtil.pub_key_hand);
                String checksum = MD5.sign(encript, YouaiConfig.md5key);
                URL url = new URL(YouaiConfig.getPlayerList);
                url_con = (HttpURLConnection) url.openConnection();
                url_con.setRequestMethod("PUT");
                url_con.addRequestProperty("Game-Checksum", checksum);
                url_con.setDoOutput(true);
                url_con.setConnectTimeout(3000);
                url_con.setReadTimeout(3000);
                url_con.getOutputStream().write(encript.getBytes());
                url_con.getOutputStream().flush();
                url_con.getOutputStream().close();
                Log.w("YouaiLastLogin", Downloads.COLUMN_STATUS + url_con.getResponseCode());
                if (url_con.getResponseCode() == 200) {
                    InputStream in = url_con.getInputStream();
                    BufferedReader bufferRe = new BufferedReader(new InputStreamReader(in));
                    StringBuffer sb = new StringBuffer(StatConstants.MTA_COOPERATION_TAG);
                    while (true) {
                        String line = bufferRe.readLine();
                        if (line == null) {
                            break;
                        } else {
                            sb.append(line);
                        }
                    }
                    in.close();
                    String tempStr = sb.toString();
                    String response = RSAUtil.decryptByPubKey(tempStr, RSAUtil.pub_key_hand);
                    listener.onComplete(response);
                } else {
                    listener.onError(new Exception("url_con.getResponseCode()"));
                }
            } catch (MalformedURLException e) {
                listener.onError(e);
                if (0 == 0) {
                    return;
                }
            } catch (IOException e2) {
                listener.onIOException(e2);
                if (0 == 0) {
                    return;
                }
            } catch (Exception e3) {
                Log.w("YouaiLastLoginHelp", "catch Exception :" + e3.toString());
                listener.onError(e3);
                if (0 == 0) {
                    return;
                }
            }
            if (url_con != null) {
                url_con.disconnect();
            }
        } catch (Throwable th) {
            if (0 != 0) {
                url_con.disconnect();
            }
            throw th;
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.youai.dreamonepiece.YouaiLastLoginHelp$3] */
    public static void pushforclient(final String param, final RequestListener listener) {
        new Thread() { // from class: com.youai.dreamonepiece.YouaiLastLoginHelp.3
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                HttpURLConnection url_con = null;
                try {
                    try {
                        try {
                            String encript = RSAUtil.encryptByPubKey(param, RSAUtil.pub_key_hand);
                            String checksum = MD5.sign(encript, YouaiConfig.md5key);
                            URL url = new URL(YouaiConfig.pushforclient);
                            url_con = (HttpURLConnection) url.openConnection();
                            url_con.setRequestMethod("PUT");
                            url_con.addRequestProperty("Game-Checksum", checksum);
                            url_con.setDoOutput(true);
                            url_con.getOutputStream().write(encript.getBytes());
                            url_con.getOutputStream().flush();
                            url_con.getOutputStream().close();
                            Log.w("YouaiLastLogin", Downloads.COLUMN_STATUS + url_con.getResponseCode());
                            InputStream in = url_con.getInputStream();
                            BufferedReader bufferRe = new BufferedReader(new InputStreamReader(in));
                            StringBuffer sb = new StringBuffer(StatConstants.MTA_COOPERATION_TAG);
                            while (true) {
                                String line = bufferRe.readLine();
                                if (line == null) {
                                    break;
                                } else {
                                    sb.append(line);
                                }
                            }
                            in.close();
                            String tempStr = sb.toString();
                            listener.onComplete(RSAUtil.decryptByPubKey(tempStr, RSAUtil.pub_key_hand));
                            if (url_con == null) {
                                return;
                            }
                        } catch (MalformedURLException e) {
                            listener.onError(e);
                            if (url_con == null) {
                                return;
                            }
                        }
                    } catch (IOException e2) {
                        listener.onIOException(e2);
                        if (url_con == null) {
                            return;
                        }
                    } catch (Exception e3) {
                        e3.printStackTrace();
                        if (url_con == null) {
                            return;
                        }
                    }
                    url_con.disconnect();
                } catch (Throwable th) {
                    if (url_con != null) {
                        url_con.disconnect();
                    }
                    throw th;
                }
            }
        }.start();
    }

    public static void setGexingClientId(String gexingClientId2) {
        gexingClientId = gexingClientId2;
    }

    public static void setGexingTags(String gexingTags2) {
        gexingTags = gexingTags2;
    }
}
