# One-Piece-Android-Client

该仓库内容为从 APK 反编译导出的工程文件。

- 源 APK：`和之国.apk`

## 目录说明

当前已将反编译内容直接平铺到仓库根目录，主要包括：

- apktool 导出：`AndroidManifest.xml`、`smali/`、`assets/`、`res/` 等
- jadx 导出：`sources/`（Java 源码）、`resources/`（资源）

## 反编译与合并命令

```bash
# apktool
apktool d -f 和之国.apk -o decompiled-apktool

# jadx
jadx -d decompiled-jadx 和之国.apk

# 合并到仓库根目录
rsync -a decompiled-apktool/ ./
rsync -a decompiled-jadx/ ./
rm -rf decompiled-apktool decompiled-jadx
```
