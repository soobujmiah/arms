# 03 — Build Tools

Build systems & task runners. JVM-based tools are architecture-independent
(run on any arm64 JDK). ✅

| Tool | Type | arm64 status | Install |
|------|------|--------------|---------|
| **Gradle** | JVM build (Android/Java/Kotlin) | ✅ Pure JVM | `sdk install gradle` or download `-bin.zip` |
| **Maven** | JVM build | ✅ Pure JVM | `sudo apt install maven` |
| **CMake** | C/C++ meta-build | ✅ Native | `sudo apt install cmake` |
| **Make** | Classic build | ✅ Native | `sudo apt install make` |
| **Ninja** | Fast build backend | ✅ Native | `sudo apt install ninja-build` |
| **Bazel** | Google's build system | ✅ Native | via Bazelisk: `apt install bazel-bootstrap` or GitHub release |
| **Meson** | Python build system | ✅ Native | `sudo apt install meson` |

### Notes

- Gradle & Maven only need a JVM (arm64 OpenJDK) — no native binaries.
- Bazel publishes official `linux-arm64` releases.
- Meson pairs with Ninja; both have arm64 packages.

*License: respective upstream licenses. Collector holds no rights.*
