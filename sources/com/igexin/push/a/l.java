package com.igexin.push.a;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/* JADX INFO: loaded from: classes.dex */
public class l {
    private static String a = "FileConfig";

    public static void a() throws Throwable {
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2 = null;
        inputStreamOpen = null;
        InputStream inputStreamOpen = null;
        if (!new File(com.igexin.push.core.g.X).exists()) {
            try {
                inputStreamOpen = com.igexin.push.core.g.i.getResources().getAssets().open(com.igexin.push.core.g.g + ".properties");
                a(inputStreamOpen);
                if (inputStreamOpen != null) {
                    try {
                        inputStreamOpen.close();
                        return;
                    } catch (Exception e) {
                        return;
                    }
                }
                return;
            } catch (Exception e2) {
                if (inputStreamOpen != null) {
                    try {
                        inputStreamOpen.close();
                        return;
                    } catch (Exception e3) {
                        return;
                    }
                }
                return;
            } catch (Throwable th) {
                if (inputStreamOpen != null) {
                    try {
                        inputStreamOpen.close();
                    } catch (Exception e4) {
                    }
                }
                throw th;
            }
        }
        try {
            fileInputStream = new FileInputStream(com.igexin.push.core.g.X);
        } catch (Exception e5) {
            fileInputStream = null;
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            a(fileInputStream);
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (Exception e6) {
                }
            }
        } catch (Exception e7) {
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (Exception e8) {
                }
            }
        } catch (Throwable th3) {
            fileInputStream2 = fileInputStream;
            th = th3;
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (Exception e9) {
                }
            }
            throw th;
        }
    }

    public static void a(Context context) throws Throwable {
        BufferedReader bufferedReader;
        InputStreamReader inputStreamReader;
        BufferedReader bufferedReader2;
        InputStreamReader inputStreamReader2;
        String[] strArrSplit;
        AssetFileDescriptor assetFileDescriptor = null;
        try {
            inputStreamReader2 = new InputStreamReader(context.getResources().getAssets().open("green.cfg"));
            try {
                bufferedReader2 = new BufferedReader(inputStreamReader2);
                while (true) {
                    try {
                        String line = bufferedReader2.readLine();
                        if (line == null) {
                            break;
                        }
                        if (line != null && (strArrSplit = line.split("=")) != null && strArrSplit.length == 2) {
                            com.igexin.push.core.g.c().put(strArrSplit[0].trim(), strArrSplit[1].trim());
                        }
                    } catch (IOException e) {
                        if (inputStreamReader2 != null) {
                            try {
                                inputStreamReader2.close();
                            } catch (IOException e2) {
                                return;
                            }
                        }
                        if (bufferedReader2 != null) {
                            bufferedReader2.close();
                        }
                        if (0 != 0) {
                            assetFileDescriptor.close();
                            return;
                        }
                        return;
                    } catch (Throwable th) {
                        inputStreamReader = inputStreamReader2;
                        bufferedReader = bufferedReader2;
                        th = th;
                        if (inputStreamReader != null) {
                            try {
                                inputStreamReader.close();
                            } catch (IOException e3) {
                                throw th;
                            }
                        }
                        if (bufferedReader != null) {
                            bufferedReader.close();
                        }
                        if (0 != 0) {
                            assetFileDescriptor.close();
                        }
                        throw th;
                    }
                }
                if (inputStreamReader2 != null) {
                    try {
                        inputStreamReader2.close();
                    } catch (IOException e4) {
                        return;
                    }
                }
                if (bufferedReader2 != null) {
                    bufferedReader2.close();
                }
                if (0 != 0) {
                    assetFileDescriptor.close();
                }
            } catch (IOException e5) {
                bufferedReader2 = null;
            } catch (Throwable th2) {
                th = th2;
                inputStreamReader = inputStreamReader2;
                bufferedReader = null;
            }
        } catch (IOException e6) {
            bufferedReader2 = null;
            inputStreamReader2 = null;
        } catch (Throwable th3) {
            th = th3;
            bufferedReader = null;
            inputStreamReader = null;
        }
    }

    public static void a(InputStream inputStream) {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    bufferedReader.close();
                    return;
                }
                if (!line.startsWith("#")) {
                    String[] strArrSplit = line.split("=");
                    if (strArrSplit.length >= 2) {
                        String strTrim = strArrSplit[0].trim();
                        String strTrim2 = strArrSplit[1].trim();
                        if (strTrim.equals("sdk.cm_address")) {
                            k.a = strTrim2.split(",");
                            com.igexin.push.core.g.a = k.a[0];
                        } else if (strTrim.equals("sdk.phone_address")) {
                            com.igexin.push.core.g.b = strTrim2;
                        } else if (strTrim.equals("sdk.cm_address_backup")) {
                            k.c = strTrim2.split(",");
                        } else if (strTrim.equals("sdk.phone_address_backup")) {
                            k.d = strTrim2;
                        } else if (!strTrim.equals("sdk.debug")) {
                            if (strTrim.equals("sdk.domainbackup.enable")) {
                                k.j = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.readlocalcell.enable")) {
                                k.k = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.uploadapplist.enable")) {
                                k.l = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.feature.sendmessage.enable")) {
                                k.m = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.feature.settag.enable")) {
                                k.n = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.feature.setsilenttime.enable")) {
                                k.o = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.ca.enable")) {
                                k.r = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.snl.enable")) {
                                k.s = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.snl.maxactiveflow")) {
                                k.t = Long.valueOf(strTrim2).longValue();
                            } else if (strTrim.equals("sdk.feature.setheartbeatinterval.enable")) {
                                k.p = Boolean.valueOf(strTrim2).booleanValue();
                            } else if (strTrim.equals("sdk.feature.setsockettimeout.enable")) {
                                k.q = Boolean.valueOf(strTrim2).booleanValue();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
        }
    }
}
