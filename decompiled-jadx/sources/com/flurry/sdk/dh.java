package com.flurry.sdk;

import com.flurry.sdk.cx;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class dh {
    private static final String b = dh.class.getSimpleName();
    byte[] a;

    public dh(byte[] bArr) {
        this.a = bArr;
    }

    public dh(di diVar) throws Throwable {
        DataOutputStream dataOutputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        int i;
        DataOutputStream dataOutputStream2 = null;
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            dataOutputStream = new DataOutputStream(byteArrayOutputStream);
        } catch (IOException e) {
            e = e;
        } catch (Throwable th) {
            th = th;
            dataOutputStream = null;
        }
        try {
            dataOutputStream.writeShort(3);
            dataOutputStream.writeUTF(diVar.a());
            dataOutputStream.writeLong(diVar.b());
            dataOutputStream.writeLong(diVar.c());
            dataOutputStream.writeLong(diVar.d());
            Map<String, String> mapE = diVar.e();
            if (mapE == null) {
                dataOutputStream.writeShort(0);
            } else {
                dataOutputStream.writeShort(mapE.size());
                for (Map.Entry<String, String> entry : mapE.entrySet()) {
                    dataOutputStream.writeUTF(entry.getKey());
                    dataOutputStream.writeUTF(entry.getValue());
                    dataOutputStream.writeByte(0);
                }
            }
            dataOutputStream.writeUTF(diVar.f());
            dataOutputStream.writeUTF(diVar.g());
            dataOutputStream.writeByte(diVar.h());
            dataOutputStream.writeUTF(diVar.i());
            if (diVar.j() == null) {
                dataOutputStream.writeBoolean(false);
            } else {
                dataOutputStream.writeBoolean(true);
                dataOutputStream.writeDouble(a(diVar.j().getLatitude()));
                dataOutputStream.writeDouble(a(diVar.j().getLongitude()));
                dataOutputStream.writeFloat(diVar.j().getAccuracy());
            }
            dataOutputStream.writeInt(diVar.k());
            dataOutputStream.writeByte(-1);
            dataOutputStream.writeByte(-1);
            dataOutputStream.writeByte(diVar.l());
            if (diVar.m() == null) {
                dataOutputStream.writeBoolean(false);
            } else {
                dataOutputStream.writeBoolean(true);
                dataOutputStream.writeLong(diVar.m().longValue());
            }
            Map<String, cx.a> mapN = diVar.n();
            if (mapN == null) {
                dataOutputStream.writeShort(0);
            } else {
                dataOutputStream.writeShort(mapN.size());
                for (Map.Entry<String, cx.a> entry2 : mapN.entrySet()) {
                    dataOutputStream.writeUTF(entry2.getKey());
                    dataOutputStream.writeInt(entry2.getValue().a);
                }
            }
            List<db> listO = diVar.o();
            if (listO == null) {
                dataOutputStream.writeShort(0);
            } else {
                dataOutputStream.writeShort(listO.size());
                Iterator<db> it = listO.iterator();
                while (it.hasNext()) {
                    dataOutputStream.write(it.next().e());
                }
            }
            dataOutputStream.writeBoolean(diVar.p());
            List<da> listR = diVar.r();
            if (listR != null) {
                int i2 = 0;
                int iA = 0;
                int i3 = 0;
                while (true) {
                    if (i2 >= listR.size()) {
                        i = i3;
                        break;
                    }
                    iA += listR.get(i2).a();
                    if (iA > 160000) {
                        el.a(5, b, "Error Log size exceeded. No more event details logged.");
                        i = i3;
                        break;
                    } else {
                        i3++;
                        i2++;
                    }
                }
            } else {
                i = 0;
            }
            dataOutputStream.writeInt(diVar.q());
            dataOutputStream.writeShort(i);
            for (int i4 = 0; i4 < i; i4++) {
                dataOutputStream.write(listR.get(i4).b());
            }
            dataOutputStream.writeInt(-1);
            dataOutputStream.writeShort(0);
            dataOutputStream.writeShort(0);
            dataOutputStream.writeShort(0);
            this.a = byteArrayOutputStream.toByteArray();
            fb.a(dataOutputStream);
        } catch (IOException e2) {
            e = e2;
            dataOutputStream2 = dataOutputStream;
            try {
                el.a(6, b, StatConstants.MTA_COOPERATION_TAG, e);
                throw e;
            } catch (Throwable th2) {
                th = th2;
                dataOutputStream = dataOutputStream2;
                fb.a(dataOutputStream);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            fb.a(dataOutputStream);
            throw th;
        }
    }

    public byte[] a() {
        return this.a;
    }

    double a(double d) {
        return Math.round(d * 1000.0d) / 1000.0d;
    }
}
