package com.igexin.a.a.b.a.a;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;

/* JADX INFO: loaded from: classes.dex */
public final class d implements com.igexin.a.a.b.b, com.igexin.a.a.d.a.a {
    SocketChannel a;
    boolean b;
    long c;
    SelectionKey d;
    SelectionKey e;
    Selector f;

    public d(Selector selector) {
        this.f = selector;
        System.setProperty("java.net.preferIPv6Addresses", "false");
    }

    public void a() {
        try {
            a(false);
        } catch (Exception e) {
        }
        this.a = null;
        this.f = null;
    }

    final void a(Selector selector) {
        this.f = selector;
    }

    /* JADX WARN: Finally extract failed */
    public final void a(boolean z) {
        if (z) {
            this.b = true;
            return;
        }
        try {
            if (this.a != null) {
                this.a.close();
            }
            if (this.d != null) {
                this.d.cancel();
                this.d.attach(null);
            }
            this.d = null;
            if (this.e != null) {
                this.e.cancel();
                this.e.attach(null);
            }
            this.e = null;
        } catch (Throwable th) {
            if (this.d != null) {
                this.d.cancel();
                this.d.attach(null);
            }
            this.d = null;
            if (this.e != null) {
                this.e.cancel();
                this.e.attach(null);
            }
            this.e = null;
            throw th;
        }
    }

    public final boolean a(String str) throws IOException {
        if (this.b) {
            throw new IllegalStateException();
        }
        SocketChannel socketChannelC = c();
        String[] strArrA = com.igexin.a.a.b.g.a(str);
        InetSocketAddress inetSocketAddress = new InetSocketAddress(strArrA[1], Integer.parseInt(strArrA[2]));
        this.d = socketChannelC.register(this.f, 8);
        this.c = System.currentTimeMillis();
        socketChannelC.connect(inetSocketAddress);
        Socket socket = socketChannelC.socket();
        InetAddress localAddress = socket.getLocalAddress();
        com.igexin.a.a.c.a.a("connecting|" + inetSocketAddress.getAddress().getHostAddress() + ":" + inetSocketAddress.getPort() + "|" + (localAddress != null ? localAddress.getHostAddress() : "0.0.0.0") + ":" + socket.getLocalPort());
        this.a = socketChannelC;
        return true;
    }

    final void b(boolean z) {
        if (this.e == null || !this.e.isValid()) {
            return;
        }
        int iInterestOps = this.e.interestOps();
        this.e.interestOps(z ? iInterestOps | 4 : iInterestOps & (-5));
    }

    public final boolean b() {
        if (this.a == null || this.b || !this.a.isOpen()) {
            return false;
        }
        return this.a.isConnected() || this.a.isConnectionPending();
    }

    SocketChannel c() throws IOException {
        if (this.a != null && this.a.isOpen()) {
            return this.a;
        }
        SocketChannel socketChannelOpen = SocketChannel.open();
        socketChannelOpen.configureBlocking(false);
        Socket socket = socketChannelOpen.socket();
        socket.setTcpNoDelay(false);
        socket.setSoLinger(true, 0);
        socket.setSoTimeout(15000);
        return socketChannelOpen;
    }
}
