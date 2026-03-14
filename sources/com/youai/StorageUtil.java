package com.youai;

import android.os.Environment;
import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class StorageUtil {
    private static final String TAG = StorageUtil.class.getSimpleName();

    public static void removeFileDirectory(File file) {
        if (file.exists()) {
            if (file.isDirectory()) {
                File[] files = file.listFiles();
                for (File of : files) {
                    removeFileDirectory(of);
                }
                file.delete();
                return;
            }
            if (file.isFile()) {
                file.delete();
            } else {
                file.delete();
            }
        }
    }

    public static String getSecondStorageWithFreeSize(long freebytes) throws Throwable {
        HashSet<String> storageSet = getSecondStorageSet();
        if (storageSet != null && !storageSet.isEmpty()) {
            for (String storage : storageSet) {
                File tempDir = new File(storage);
                if (tempDir.exists() && tempDir.isDirectory() && tempDir.canWrite() && tempDir.canRead() && tempDir.getUsableSpace() > freebytes) {
                    return storage;
                }
            }
        }
        File externalStorageDir = Environment.getExternalStorageDirectory();
        if (externalStorageDir != null) {
            if (!externalStorageDir.getAbsolutePath().equalsIgnoreCase("/mnt/sdcard1")) {
                File dir1 = new File("/mnt/sdcard1");
                if (dir1.exists() && dir1.isDirectory() && dir1.getUsableSpace() > freebytes) {
                    return "/mnt/sdcard1";
                }
            }
            if (!externalStorageDir.getAbsolutePath().equalsIgnoreCase("/storage/sdcard1")) {
                File dir12 = new File("/storage/sdcard1");
                if (dir12.exists() && dir12.isDirectory() && dir12.getUsableSpace() > freebytes) {
                    return "/storage/sdcard1";
                }
            }
        }
        File dir13 = new File("/mnt/sdcard2");
        if (dir13.exists() && dir13.isDirectory() && dir13.getUsableSpace() > freebytes) {
            return "/mnt/sdcard2";
        }
        File dir14 = new File("/storage/sdcard2");
        if (dir14.exists() && dir14.isDirectory() && dir14.getUsableSpace() > freebytes) {
            return "/storage/sdcard2";
        }
        return null;
    }

    public static HashSet<String> getSecondStorageSet() throws Throwable {
        HashSet<String> storageSet = getStorageSet(new File("/system/etc/vold.fstab"), true);
        if (storageSet != null) {
            storageSet.addAll(getStorageSet(new File("/proc/mounts"), false));
        }
        if (storageSet == null || storageSet.isEmpty()) {
        }
        return storageSet;
    }

    public static HashSet<String> getStorageSet() throws Throwable {
        HashSet<String> storageSet = getStorageSet(new File("/system/etc/vold.fstab"), true);
        if (storageSet != null) {
            storageSet.addAll(getStorageSet(new File("/proc/mounts"), false));
            storageSet.add(Environment.getExternalStorageDirectory().getAbsolutePath());
        }
        if (storageSet == null || storageSet.isEmpty()) {
            HashSet<String> storageSet2 = new HashSet<>();
            storageSet2.add(Environment.getExternalStorageDirectory().getAbsolutePath());
            return storageSet2;
        }
        return storageSet;
    }

    public static HashSet<String> getStorageSet(File file, boolean is_fstab_file) throws Throwable {
        HashSet<String> _storage;
        HashSet<String> storageSet = new HashSet<>();
        BufferedReader reader = null;
        try {
            try {
                BufferedReader reader2 = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
                while (true) {
                    try {
                        String line = reader2.readLine();
                        if (line != null) {
                            if (is_fstab_file) {
                                _storage = parseVoldFile(line);
                            } else {
                                _storage = parseMountsFile(line);
                            }
                            if (_storage != null) {
                                storageSet.addAll(_storage);
                            }
                        } else {
                            try {
                                break;
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    } catch (Exception e2) {
                        e = e2;
                        reader = reader2;
                        e.printStackTrace();
                        try {
                            reader.close();
                        } catch (Exception e3) {
                            e3.printStackTrace();
                        }
                        reader = null;
                    } catch (Throwable th) {
                        th = th;
                        reader = reader2;
                        try {
                            reader.close();
                        } catch (Exception e4) {
                            e4.printStackTrace();
                        }
                        throw th;
                    }
                }
                reader2.close();
                reader = null;
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e5) {
            e = e5;
        }
        return storageSet;
    }

    private static HashSet<String> parseMountsFile(String str) {
        HashSet<String> storageSet = null;
        if (str != null && str.length() != 0 && !str.startsWith("#")) {
            storageSet = new HashSet<>();
            Pattern patter = Pattern.compile("/dev/block/vold.*?(/mnt|storage/.+?) vfat .*");
            Matcher matcher = patter.matcher(str);
            boolean b = matcher.find();
            if (b) {
                String _group = matcher.group(1);
                if (!_group.startsWith("/")) {
                    _group = "/" + _group;
                }
                storageSet.add(_group);
                Log.d(TAG, "parseMountsFile: " + _group);
            }
        }
        return storageSet;
    }

    private static HashSet<String> parseVoldFile(String str) {
        HashSet<String> storageSet = null;
        if (str != null && str.length() != 0 && !str.startsWith("#")) {
            storageSet = new HashSet<>();
            Pattern patter1 = Pattern.compile("(/mnt|storage/[^ ]+?)((?=[ ]+auto[ ]+)|(?=[ ]+(\\d*[ ]+)))");
            Pattern patter2 = Pattern.compile("(/mnt|storage/.+?)[ ]+");
            Matcher matcher1 = patter1.matcher(str);
            boolean b1 = matcher1.find();
            if (b1) {
                String _group = matcher1.group(1);
                if (!_group.startsWith("/")) {
                    _group = "/" + _group;
                }
                storageSet.add(_group);
                Log.d(TAG, "parseVoldFile: " + _group);
            }
            Matcher matcher2 = patter2.matcher(str);
            boolean b2 = matcher2.find();
            if (!b1 && b2) {
                String _group2 = matcher2.group(1);
                if (!_group2.startsWith("/")) {
                    _group2 = "/" + _group2;
                }
                storageSet.add(_group2);
                Log.d(TAG, "parseVoldFile: " + _group2);
            }
        }
        return storageSet;
    }
}
