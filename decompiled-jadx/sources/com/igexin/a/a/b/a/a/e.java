package com.igexin.a.a.b.a.a;

import android.os.PowerManager;
import java.io.EOFException;
import java.io.IOException;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.ByteBuffer;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: loaded from: classes.dex */
public final class e extends com.igexin.a.a.b.f {
    static volatile e l;
    Selector e;
    Selector f;
    AtomicBoolean g;
    AtomicBoolean h;
    volatile boolean i;
    final long j;
    int k;
    volatile long m;
    volatile long n;
    volatile long o;
    ConcurrentLinkedQueue p;
    List q;
    d r;
    ByteBuffer s;
    boolean t;
    int u;
    final Comparator v;

    public e(int i, String str, com.igexin.a.a.b.c cVar) {
        super(i, str, cVar);
        this.j = 15000L;
        this.v = new f(this);
        this.g = new AtomicBoolean(false);
        this.h = new AtomicBoolean(true);
        this.p = new ConcurrentLinkedQueue();
        this.q = new ArrayList(16);
        this.s = ByteBuffer.allocate(61440);
    }

    public static e a(String str, com.igexin.a.a.b.c cVar) {
        if (l == null || l.F || l.x) {
            e eVar = new e(-2047, str, cVar);
            l = eVar;
            return eVar;
        }
        if (l.a.equals(str)) {
            return l;
        }
        throw new IllegalArgumentException();
    }

    public static e h() {
        return l;
    }

    final void a(SocketChannel socketChannel) throws ClosedChannelException, EOFException {
        int i;
        do {
            try {
                i = socketChannel.read(this.s);
                if (i < 0) {
                    com.igexin.a.a.c.a.a("socketread|-1|");
                    this.u++;
                    if (this.u > 20) {
                        this.u = 0;
                        throw new EOFException("NioConnection Read EOF!");
                    }
                    return;
                }
                if (i == 0) {
                    com.igexin.a.a.c.a.a("socketread|0|");
                    return;
                }
                this.t = true;
                this.s.flip();
                int iRemaining = this.s.remaining();
                if (com.igexin.a.a.b.d.f) {
                    com.igexin.a.a.b.d.c().d += (long) iRemaining;
                } else {
                    com.igexin.a.a.b.d.c().b += (long) iRemaining;
                }
                if (this.b != null) {
                    this.b.c(this, this.d, this.s);
                }
                this.s.clear();
            } catch (EOFException e) {
                com.igexin.a.a.c.a.a("exceptionsocketread|" + e.getMessage());
                throw e;
            } catch (Exception e2) {
                com.igexin.a.a.c.a.a("exceptionsocketread|" + e2.getMessage());
                throw new ClosedChannelException();
            }
        } while (i > 0);
    }

    @Override // com.igexin.a.a.d.d
    public void a_() throws IOException {
        PowerManager.WakeLock wakeLockL;
        int iSelect;
        boolean z;
        boolean z2 = false;
        super.a_();
        if (this.d == null) {
            try {
                if (l() != null) {
                    l().release();
                }
                g();
                if (wakeLockL != null) {
                    return;
                } else {
                    return;
                }
            } finally {
                if (l() != null) {
                    l().acquire();
                }
            }
        }
        if (this.g.get() || this.r.b) {
            if (this.g.get()) {
                b bVar = new b();
                bVar.a = 1;
                com.igexin.a.a.b.d.c().a(bVar);
            }
            throw new ClosedChannelException();
        }
        if (!this.p.isEmpty()) {
            this.r.b(true);
        }
        if (this.m < 0) {
            this.m = 0L;
        }
        this.n = System.currentTimeMillis();
        this.h.set(false);
        try {
            if (l() != null) {
                com.igexin.a.a.c.a.a("wakelock|niosockettask|off");
                l().release();
            }
            if (this.m > 0) {
                Q.b(this.n + this.m + com.igexin.a.a.d.e.z);
                iSelect = this.e.select(this.m);
                Q.f();
            } else {
                iSelect = this.e.select();
            }
            this.m = -1L;
            this.o = System.currentTimeMillis() - this.n;
            if (this.o >= 30 || iSelect != 0) {
                this.k = 0;
            } else {
                this.k++;
                Thread.yield();
                if (this.k > 59) {
                    com.igexin.a.a.c.a.a("exceptionrebuildselector");
                    this.f = Selector.open();
                    for (SelectionKey selectionKey : this.e.keys()) {
                        if (!selectionKey.isValid() || selectionKey.interestOps() == 0) {
                            selectionKey.cancel();
                        } else {
                            this.r.e = this.r.a.register(this.f, selectionKey.interestOps(), selectionKey.attachment());
                        }
                    }
                    this.k = 0;
                    this.e.selectNow();
                    this.e.close();
                    this.e = this.f;
                    return;
                }
            }
            if (iSelect > 0) {
                this.t = false;
                Set<SelectionKey> setSelectedKeys = this.e.selectedKeys();
                for (SelectionKey selectionKey2 : setSelectedKeys) {
                    setSelectedKeys.remove(selectionKey2);
                    if (selectionKey2.isValid() && selectionKey2.isWritable()) {
                        this.m = b((SocketChannel) selectionKey2.channel());
                    }
                    if (selectionKey2.isValid() && selectionKey2.isReadable()) {
                        a((SocketChannel) selectionKey2.channel());
                    }
                }
                return;
            }
            if (this.q.isEmpty()) {
                return;
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            Iterator it = this.q.iterator();
            while (it.hasNext()) {
                g gVar = (g) it.next();
                if (gVar.P != null) {
                    if (!gVar.P.b()) {
                        gVar.o();
                        z = z2;
                    } else if (this.t || z2) {
                        gVar.o();
                        gVar.P.b(gVar);
                        z = z2;
                    } else if (gVar.P.a(jCurrentTimeMillis, gVar)) {
                        gVar.o();
                        gVar.P.a(gVar);
                        z = true;
                    } else {
                        long jB = gVar.P.b(jCurrentTimeMillis, gVar);
                        if (this.m < 0 || this.m < jB) {
                            this.m = jB;
                        }
                    }
                    it.remove();
                    z2 = z;
                } else {
                    gVar.o();
                    it.remove();
                }
            }
            if (z2) {
                throw new SocketTimeoutException("SocketTask do timeOut!");
            }
        } finally {
            if (l() != null) {
                l().acquire();
                com.igexin.a.a.c.a.a("wakelock|niosockettask|on");
            }
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2047;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0118, code lost:
    
        com.igexin.a.a.c.a.a("socketwrite|-2|" + r2.toString());
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0139, code lost:
    
        throw new java.net.SocketTimeoutException("write data error!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final long b(java.nio.channels.SocketChannel r12) {
        /*
            Method dump skipped, instruction units count: 420
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.igexin.a.a.b.a.a.e.b(java.nio.channels.SocketChannel):long");
    }

    @Override // com.igexin.a.a.d.d
    public final void d() {
        super.d();
        this.z = true;
        this.A = true;
        this.U = true;
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }

    @Override // com.igexin.a.a.b.f, com.igexin.a.a.d.d
    public void f() {
        try {
            this.r.a();
        } catch (Exception e) {
        }
        if (this.e != null) {
            try {
                this.e.selectNow();
                this.e.close();
            } catch (Exception e2) {
            }
        }
        this.e = null;
        this.g = null;
        if (!this.p.isEmpty()) {
            for (g gVar : this.p) {
                gVar.o();
                com.igexin.a.a.b.d.c().a(gVar);
            }
            this.p.clear();
        }
        this.p = null;
        if (!this.q.isEmpty()) {
            for (g gVar2 : this.q) {
                gVar2.o();
                com.igexin.a.a.b.d.c().a(gVar2);
            }
            this.q.clear();
        }
        this.s.clear();
        this.s = null;
        this.h = null;
        this.g = null;
        if (l == this) {
            l = null;
        }
        super.f();
    }

    final void g() throws IOException {
        if (this.e == null) {
            this.e = Selector.open();
        }
        if (this.r == null) {
            this.r = new d(this.e);
        }
        if (!this.r.b()) {
            this.r.a(this.a);
        }
        if (this.g.get()) {
            b bVar = new b();
            bVar.a = 2;
            com.igexin.a.a.b.d.c().a(bVar);
            throw new ClosedChannelException();
        }
        if (this.e.select(15000L) <= 0) {
            throw new SocketTimeoutException();
        }
        Set<SelectionKey> setSelectedKeys = this.e.selectedKeys();
        for (SelectionKey selectionKey : setSelectedKeys) {
            setSelectedKeys.remove(selectionKey);
            if (selectionKey.isValid() && selectionKey.isConnectable()) {
                SocketChannel socketChannel = (SocketChannel) selectionKey.channel();
                if (socketChannel.finishConnect()) {
                    this.i = true;
                    this.d = new com.igexin.a.a.b.e();
                    this.d.a((com.igexin.a.a.b.b) this.r);
                    Socket socket = socketChannel.socket();
                    com.igexin.a.a.c.a.a("connected|" + (socket.getInetAddress() != null ? socketChannel.socket().getInetAddress().getHostAddress() : "0.0.0.0") + ":" + socketChannel.socket().getPort() + "|" + (socket.getLocalAddress() != null ? socketChannel.socket().getLocalAddress().getHostAddress() : "0.0.0.0") + ":" + socketChannel.socket().getLocalPort());
                }
            }
        }
        if (this.d == null) {
            return;
        }
        this.e.selectNow();
        this.e.close();
        this.e = null;
        this.e = Selector.open();
        this.r.a(this.e);
        this.r.e = this.r.c().register(this.e, 1);
    }

    public void i() {
        if (this.e == null) {
            throw new NullPointerException();
        }
        if (!this.e.isOpen()) {
            throw new IllegalStateException();
        }
        if (this.h.compareAndSet(false, true)) {
            this.e.wakeup();
        }
    }
}
