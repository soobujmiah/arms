# 12 — On-Device Desktop (Android phone → arm64 Linux desktop)

Turn an arm64 Android phone/tablet into a Linux desktop. All native arm64,
no QEMU. ✅

| Tool | Purpose | Source |
|------|---------|--------|
| **Termux** (F-Droid) | Native Linux userspace on Android | https://f-droid.org/en/packages/com.termux/ |
| **proot-distro** | Rootless Ubuntu/Debian/Kali rootfs (PRoot) | `pkg install proot-distro` |
| **Termux:X11** | GPU-accelerated X server (Turnip Adreno / Zink) | GitHub releases (arm64 APK) |
| **DroidDesk** | Turnkey desktop setup kit (Termux + X11 + PRoot) | [ramdi.fr writeup](https://ramdi.fr/github-stars/droiddesk-turning-arm64-android-phones-into-portable-linux-desktops-with-termux-and-proot/) |
| **proot-distro-scripts** | One-command XFCE/KDE desktops | https://github.com/01101010110/proot-distro-scripts |

### Quick start

```bash
pkg install x11-repo && pkg update
pkg install proot-distro termux-x11
proot-distro install ubuntu
proot-distro login ubuntu
```

*License: GPL (Termux/proot-distro), respective DE licenses. Collector holds no rights.*
