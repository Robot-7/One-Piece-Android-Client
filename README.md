# One-Piece-Android-Client

该仓库内容为从 APK 反编译导出的工程文件。

- 源 APK：`和之国.apk`

## 目录说明

- `decompiled-apktool/`：apktool 导出（资源、Manifest、smali 等）
- `decompiled-jadx/`：jadx 导出（Java 源码 + 资源）

## 反编译命令

```bash
# apktool
apktool d -f 和之国.apk -o decompiled-apktool

# jadx
jadx -d decompiled-jadx 和之国.apk
```
