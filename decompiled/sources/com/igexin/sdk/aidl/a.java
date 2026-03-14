package com.igexin.sdk.aidl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* JADX INFO: loaded from: classes.dex */
public abstract class a extends Binder implements ICACallback {
    public static ICACallback a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.igexin.sdk.aidl.ICACallback");
        return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof ICACallback)) ? new b(iBinder) : (ICACallback) iInterfaceQueryLocalInterface;
    }

    @Override // android.os.Binder
    public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        switch (i) {
            case 1:
                parcel.enforceInterface("com.igexin.sdk.aidl.ICACallback");
                boolean zOnAuthenticated = onAuthenticated(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readLong());
                parcel2.writeNoException();
                parcel2.writeInt(zOnAuthenticated ? 1 : 0);
                return true;
            case 2:
                parcel.enforceInterface("com.igexin.sdk.aidl.ICACallback");
                boolean zOnError = onError(parcel.readInt());
                parcel2.writeNoException();
                parcel2.writeInt(zOnError ? 1 : 0);
                return true;
            case 1598968902:
                parcel2.writeString("com.igexin.sdk.aidl.ICACallback");
                return true;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }
}
