# 05 — Android SDK (arm64)

Google's Android SDK native binaries (build-tools, platform-tools, NDK) are
**officially x86_64-only** — but native arm64 builds exist from the community.

| Tool | arm64 status | Source |
|------|--------------|--------|
| **build-tools (aapt2, zipalign, d8, apksigner, aidl)** | 🔗 Community | [lzhiyong/android-sdk-tools](https://github.com/lzhiyong/android-sdk-tools/releases) · [HomuHomu833/android-sdk-custom](https://github.com/HomuHomu833/android-sdk-custom/releases) |
| **platform-tools (adb, fastboot)** | 🔗 Community | lzhiyong builds · [AndroidIDEOfficial/platform-tools](https://github.com/AndroidIDEOfficial/platform-tools/releases) (v34.0.4 arm64) |
| **NDK** | 🔗 Community | [HomuHomu833/android-ndk-custom](https://github.com/HomuHomu833/android-ndk-custom/releases) (r29 aarch64) |
| **cmdline-tools (sdkmanager/avdmanager)** | ✅ Works natively | `commandlinetools-linux-*_latest.zip` — sdkmanager is a **shell script + Java**, not ELF |
| **platforms;android-XX (android.jar)** | ✅ Arch-independent | JAR — works as-is |
| **SecFathy Android arm64 binaries** | 🔗 Community | [SecFathy/Android-arm64-Binaries](https://github.com/SecFathy/Android-arm64-Binaries) — NDK clang/gcc, coreutils, LLVM |
| **Emulator** | ❌ None (stable) | Experimental arm64 builds in AOSP CI (`ci.android.com`) — use physical device |
| **APK Workbench** | 🔗 Community | [Denuo-Web/APK-Workbench](https://github.com/Denuo-Web/APK-Workbench) — ARM64 SDK/NDK catalog + Gradle wrapper |

## Key downloads

```bash
# lzhiyong static aarch64 build-tools (34.0.0 + platform-tools)
curl -L -o aarch64-tools.zip \
  https://github.com/lzhiyong/android-sdk-tools/releases/download/34.0.3/android-sdk-tools-static-aarch64.zip

# HomuHomu aarch64 SDK (build-tools 36.1.0, musl)
curl -L -o sdk.tar.xz \
  https://github.com/HomuHomu833/android-sdk-custom/releases/download/36.0.0/android-sdk-aarch64-linux-musl.tar.xz

# HomuHomu aarch64 NDK (r29)
curl -L -o ndk.tar.xz \
  https://github.com/HomuHomu833/android-ndk-custom/releases/download/r29/android-ndk-r29-aarch64-linux-android.tar.xz

# Google cmdline-tools (sdkmanager — works on arm64 via Java)
curl -L -o cmdline-tools.zip \
  https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
```

## Important Gradle tip

Force Gradle to use the arm64 `aapt2` (instead of downloading x86_64):

```
# gradle.properties
android.aapt2FromMavenOverride=/path/to/arm64/aapt2
```

## sdkmanager on arm64 (confirmed working)

The `commandlinetools-linux` ZIP's `sdkmanager` is a **POSIX shell script**
that delegates to `java` — it runs natively on arm64 (needs JDK 17+). The
x86_64-only pieces are specifically the *native ELF* build-tools and
platform-tools binaries. See
[defenseunicorns/peat-mesh#143](https://github.com/defenseunicorns/peat-mesh/issues/143).

*License: Google SDK terms (proprietary). Community builds carry their own terms.
Collector holds no rights.*
