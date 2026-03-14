# One-Piece-Android-Client

该仓库内容为从 APK 反编译导出的工程文件。

- 源 APK：`和之国.apk`

## 目录说明

- `decompiled/`：合并后的反编译目录（位于仓库根目录）
  - 含 apktool 导出（Manifest、smali、assets、res 等）
  - 含 jadx 导出（Java 源码 `sources/` 与资源 `resources/`）

## 反编译命令

```bash
# apktool
apktool d -f 和之国.apk -o decompiled-apktool

# jadx
jadx -d decompiled-jadx 和之国.apk

# 合并到根目录 decompiled/
mkdir -p decompiled
rsync -a decompiled-apktool/ decompiled/
rsync -a decompiled-jadx/ decompiled/
```
