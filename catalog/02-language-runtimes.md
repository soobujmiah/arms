# 02 — Language Runtimes

All fully supported natively on **arm64 / aarch64 Linux**. ✅

| Tool | Description | Install (Debian/Ubuntu arm64) | Termux |
|------|-------------|-------------------------------|--------|
| **OpenJDK 17 / 21** | Java runtime/compiler (Temurin, distro, Adoptium) | `sudo apt install openjdk-17-jdk` | `pkg install openjdk-17` |
| **Node.js** | JavaScript runtime | `curl -fsSL https://deb.nodesource.com/setup_20.x \| sudo bash - && apt install nodejs` | `pkg install nodejs` |
| **Python 3** | Python interpreter | `sudo apt install python3 python3-pip` | `pkg install python` |
| **Go** | Compiled language | `sudo apt install golang-go` (or official tarball) | `pkg install golang` |
| **Rust** | Compiled language (rustup) | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` | `pkg install rust` |
| **GCC / Clang / LLVM** | C/C++ toolchain | `sudo apt install gcc g++ clang llvm` | `pkg install clang` |
| **Dart** | Dart SDK (bundled with Flutter 3.0+) | via Flutter SDK | `pkg install dart` |

### Notes

- **OpenJDK**: official Temurin/Adoptium arm64 builds exist for all majors.
- **Dart/Flutter**: official arm64 Dart since Flutter 3.0; the Flutter SDK for
  Linux arm64 is obtainable by cloning the repo and running a `flutter` command
  to pull the arm64 Dart SDK (see [flutter#170329](https://github.com/flutter/flutter/issues/170329)).

*License: respective upstream licenses. Collector holds no rights.*
