package com.youai.sdks.utils;

import android.text.TextUtils;
import android.util.Log;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JSONUtils {
    public static JSONObject parse2JSONObject(String jsonString) {
        if (TextUtils.isEmpty(jsonString)) {
            return null;
        }
        try {
            JSONObject jsonObj = new JSONObject(jsonString);
            return jsonObj;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static JSONArray parse2JSONArray(String jsonString) {
        if (TextUtils.isEmpty(jsonString)) {
            return null;
        }
        try {
            JSONArray jsonArray = new JSONArray(jsonString);
            return jsonArray;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getString(JSONObject itemObj, String key) {
        String paramValue = StatConstants.MTA_COOPERATION_TAG;
        if (itemObj != null) {
            try {
                if (itemObj.has(key) && !itemObj.isNull(key)) {
                    paramValue = itemObj.getString(key);
                    return paramValue;
                }
            } catch (JSONException e) {
                Log.e("JSONObject error", "get value from JSONObject error," + e.getStackTrace());
                e.printStackTrace();
                return paramValue;
            }
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static int getInt(JSONObject itemObj, String key) {
        if (itemObj != null) {
            try {
                if (itemObj.has(key)) {
                    int paramValue = itemObj.getInt(key);
                    return paramValue;
                }
            } catch (JSONException e) {
                Log.e("JSONObject error", "get value from JSONObject error," + e.getStackTrace());
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    public static boolean getBoolean(JSONObject itemObj, String key) {
        if (itemObj != null) {
            try {
                if (itemObj.has(key)) {
                    boolean paramValue = itemObj.getBoolean(key);
                    return paramValue;
                }
            } catch (JSONException e) {
                Log.e("JSONObject error", "get value from JSONObject error," + e.getStackTrace());
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    public static ArrayList<JSONObject> parse2List(JSONArray jsonArray) {
        ArrayList<JSONObject> list = new ArrayList<>();
        int objCounter = jsonArray != null ? jsonArray.length() : 0;
        for (int i = 0; i < objCounter; i++) {
            try {
                list.add(jsonArray.getJSONObject(i));
            } catch (JSONException e) {
                Log.e("JSONObject error", "parse2List error," + e.getStackTrace());
                e.printStackTrace();
            }
        }
        return list;
    }

    public static ArrayList<JSONObject> parse2List(JSONArray jsonArray, int length) {
        ArrayList<JSONObject> list = new ArrayList<>();
        int objCounter = jsonArray != null ? jsonArray.length() : 0;
        if (objCounter > length) {
            objCounter = length;
        }
        for (int i = 0; i < objCounter; i++) {
            try {
                list.add(jsonArray.getJSONObject(i));
            } catch (JSONException e) {
                Log.e("JSONObject error", "parse2List error," + e.getStackTrace());
                e.printStackTrace();
            }
        }
        return list;
    }
}
