# 04 — IDEs & Editors

| Tool | arm64 status | Details | Install |
|------|--------------|---------|---------|
| **VS Code** | ✅ Official | Official arm64 Linux builds + C++ ext | https://code.visualstudio.com/download → `.deb`/`.tar.gz` (arm64) |
| **IntelliJ IDEA CE/Ultimate** | ✅ Official | `aarch64` since **2022.3** | https://www.jetbrains.com/idea/download → `-aarch64.tar.gz` |
| **PyCharm / WebStorm / CLion / GoLand / Rider (Linux)** | ✅ Official | All JetBrains IDEs ship aarch64 | jetbrains.com downloads |
| **JetBrains Runtime (JBR)** | ✅ Official | `jbr-*-linux-aarch64-*.tar.gz` | https://github.com/JetBrains/JetBrainsRuntime/releases |
| **Eclipse / NetBeans** | ✅ Works | Run on arm64 JDK | via installer (JVM-based) |
| **Arduino IDE 2.x** | ⚠️ Community | No official arm64; community builds exist | https://github.com/matu6968/arduino-ide-arm64 |
| **Android Studio** | ⚠️ Workaround | **No official Linux arm64** | See workaround below |
| **Neovim** | ✅ | Terminal editor | see category 01 |

## Android Studio arm64 workaround (works, widely used)

Android Studio is mostly Java. Overlay the native arm64 pieces from IntelliJ
IDEA + an arm64 JBR:

1. Download Android Studio (`...-linux.tar.gz`, x86_64).
2. Overlay from `ideaIC-*-aarch64.tar.gz`: `bin/fsnotifier`, `bin/restarter`,
   `lib/jna`, `lib/native`, `lib/pty4j`.
3. Replace `jbr/` with an arm64 JBR.
4. Patch `bin/*.sh` + `product-info.json`: `amd64` → `aarch64`.

**Works:** building APKs, editor, Gradle. **Broken:** Compose preview, emulator.
Ready-made script: [Asahi Linux install script (reddit)](https://www.reddit.com/r/AsahiLinux/comments/1p38e15/install_script_to_mostly_get_android_studio/).

*License: respective upstream licenses (mostly proprietary/EULA). Collector holds no rights.*
