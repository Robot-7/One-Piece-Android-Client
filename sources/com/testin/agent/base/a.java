package com.testin.agent.base;

import android.os.Process;
import com.testin.agent.b.e;
import java.io.RandomAccessFile;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
class a extends Thread {
    final /* synthetic */ TestinGVariables a;

    a(TestinGVariables testinGVariables) {
        this.a = testinGVariables;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile("/proc/stat", "r");
            RandomAccessFile randomAccessFile2 = new RandomAccessFile("/proc/" + Process.myPid() + "/stat", "r");
            String line = randomAccessFile.readLine();
            String line2 = randomAccessFile2.readLine();
            String[] strArrSplit = line.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            String[] strArrSplit2 = line2.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            long j = Long.parseLong(strArrSplit[2]) + Long.parseLong(strArrSplit[3]) + Long.parseLong(strArrSplit[4]) + Long.parseLong(strArrSplit[5]) + Long.parseLong(strArrSplit[6]) + Long.parseLong(strArrSplit[7]) + Long.parseLong(strArrSplit[8]);
            long j2 = Long.parseLong(strArrSplit2[16]) + Long.parseLong(strArrSplit2[13]) + Long.parseLong(strArrSplit2[14]) + Long.parseLong(strArrSplit2[15]);
            this.a.h = Long.valueOf(j);
            this.a.i = Long.valueOf(j2);
        } catch (Exception e) {
            e.a(e);
        }
        super.run();
    }
}
