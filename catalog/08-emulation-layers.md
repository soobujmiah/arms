# 08 — Emulation Layers

Run x86 / x86_64 Linux binaries on **arm64**. All of these are built *for*
arm64. ✅

| Tool | Purpose | Install |
|------|---------|---------|
| **Box64** | Run x86_64 Linux binaries on arm64 (dynarec) | build from [ptitSeb/box64](https://github.com/ptitSeb/box64) or Pi-Apps |
| **Box86** | Run x86 (32-bit) Linux binaries on arm64/armhf | [ptitSeb/box86](https://github.com/ptitSeb/box86) |
| **FEX-Emu** | Fast x86/x86_64 emulator for arm64 | https://fex-emu.com |
| **QEMU user-static** | Run foreign-arch *containers* (amd64 on arm64) | `sudo apt install qemu-user-static` |

### Box64 build (typical)

```bash
git clone --depth 1 https://github.com/ptitSeb/box64.git
cd box64 && mkdir build && cd build
cmake .. -DARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j$(nproc) && sudo make install
box64 --version
```

> Box64 is how x86_64-only Android tools (aapt2, zipalign, sdkmanager
> fallback) run on arm64 when no native build exists.

*License: MIT (Box64/Box86), GPL (QEMU). Collector holds no rights.*
