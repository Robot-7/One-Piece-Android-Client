package com.youai.sdks.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class IniFileUtil {
    public static String GetPrivateProfileString(String file, String sec, String key, String defaults) {
        Map map = getIniAllValue(file);
        if (map == null) {
            return defaults;
        }
        ArrayList<String[]> section = (ArrayList) map.get(sec);
        if (section != null) {
            for (String[] kv : section) {
                if (kv != null && kv[0].equals(key.trim())) {
                    String result = dealCorpsSign(kv[1], 2);
                    return result;
                }
            }
        }
        return defaults;
    }

    public static boolean WritePrivateProfileString(String file, String sec, String key, String value) {
        String value2 = dealCorpsSign(value, 1);
        Map map = getIniAllValue(file);
        if (map == null) {
            map = new HashMap();
            ArrayList section = new ArrayList();
            section.add(new String[]{key, value2});
            map.put(sec, section);
        } else {
            int x = 0;
            int y = 0;
            ArrayList<String[]> al = (ArrayList) map.get(sec);
            if (al != null) {
                for (String[] kv : al) {
                    x++;
                    if (kv != null && kv[0].equals(key)) {
                        kv[1] = value2;
                        y++;
                    }
                }
            }
            if (x == 0) {
                ArrayList section2 = new ArrayList();
                section2.add(new String[]{key, value2});
                map.put(sec, section2);
            } else if (y == 0) {
                al.add(new String[]{key, value2});
                map.put(sec, al);
            }
        }
        try {
            PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(file)));
            for (Object obj : map.keySet()) {
                out.println(String.valueOf(System.getProperty("line.separator")) + "[" + obj + "]");
                ArrayList<String[]> aList = (ArrayList) map.get(obj);
                if (aList != null) {
                    for (String[] kv2 : aList) {
                        out.println(String.valueOf(kv2[0]) + "=" + kv2[1]);
                    }
                }
            }
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private static String dealCorpsSign(String str, int flag) {
        String xline = System.getProperty("line.separator");
        if (flag == 1) {
            return str.replace(xline, "□41◎3□");
        }
        return str.replace("□41◎3□", xline);
    }

    private static Map getIniAllValue(String file) {
        int index;
        Map map = new HashMap();
        try {
            File f = new File(file);
            if (!f.exists()) {
                return null;
            }
            BufferedReader in = new BufferedReader(new FileReader(file));
            ArrayList values = null;
            while (true) {
                String line = in.readLine();
                if (line != null) {
                    if (isSection(line)) {
                        values = new ArrayList();
                        map.put(line.substring(1, line.length() - 1), values);
                    } else if (values != null && (index = line.indexOf("=")) > 0) {
                        String k = line.substring(0, index).trim();
                        String note = k.substring(0, 1);
                        if (!note.equals("#") && !note.equals("/") && !note.equals(";")) {
                            String v = line.substring(index + 1).trim();
                            String[] kv = {k, v};
                            values.add(kv);
                        }
                    }
                } else {
                    in.close();
                    return map;
                }
            }
        } catch (Exception e) {
            return null;
        }
    }

    private static boolean isSection(String str) {
        if (str == null || !str.startsWith("[") || !str.endsWith("]")) {
            return false;
        }
        return true;
    }
}
