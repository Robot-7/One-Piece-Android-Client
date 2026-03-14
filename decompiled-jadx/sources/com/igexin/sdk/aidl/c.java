package com.igexin.sdk.aidl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* JADX INFO: loaded from: classes.dex */
public abstract class c extends Binder implements IGexinMsgService {
    public c() {
        attachInterface(this, "com.igexin.sdk.aidl.IGexinMsgService");
    }

    public static IGexinMsgService a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.igexin.sdk.aidl.IGexinMsgService");
        return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof IGexinMsgService)) ? new d(iBinder) : (IGexinMsgService) iInterfaceQueryLocalInterface;
    }

    @Override // android.os.IInterface
    public IBinder asBinder() {
        return this;
    }

    @Override // android.os.Binder
    public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        switch (i) {
            case 1:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iStartService = startService(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeInt(iStartService);
                return true;
            case 2:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iStopService = stopService(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeInt(iStopService);
                return true;
            case 3:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iIsStarted = isStarted(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeInt(iIsStarted);
                return true;
            case 4:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int silentTime = setSilentTime(parcel.readInt(), parcel.readInt(), parcel.readString());
                parcel2.writeNoException();
                parcel2.writeInt(silentTime);
                return true;
            case 5:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                byte[] bArrExtFunction = extFunction(parcel.createByteArray());
                parcel2.writeNoException();
                parcel2.writeByteArray(bArrExtFunction);
                return true;
            case 6:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iOnASNLConnected = onASNLConnected(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readLong());
                parcel2.writeNoException();
                parcel2.writeInt(iOnASNLConnected);
                return true;
            case 7:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iOnPSNLConnected = onPSNLConnected(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readLong());
                parcel2.writeNoException();
                parcel2.writeInt(iOnPSNLConnected);
                return true;
            case 8:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iSendByASNL = sendByASNL(parcel.readString(), parcel.readString(), parcel.createByteArray());
                parcel2.writeNoException();
                parcel2.writeInt(iSendByASNL);
                return true;
            case 9:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iReceiveToPSNL = receiveToPSNL(parcel.readString(), parcel.readString(), parcel.createByteArray());
                parcel2.writeNoException();
                parcel2.writeInt(iReceiveToPSNL);
                return true;
            case 10:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iOnASNLNetworkConnected = onASNLNetworkConnected();
                parcel2.writeNoException();
                parcel2.writeInt(iOnASNLNetworkConnected);
                return true;
            case 11:
                parcel.enforceInterface("com.igexin.sdk.aidl.IGexinMsgService");
                int iOnASNLNetworkDisconnected = onASNLNetworkDisconnected();
                parcel2.writeNoException();
                parcel2.writeInt(iOnASNLNetworkDisconnected);
                return true;
            case 1598968902:
                parcel2.writeString("com.igexin.sdk.aidl.IGexinMsgService");
                return true;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }
}
