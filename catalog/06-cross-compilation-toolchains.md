# 06 — Cross-Compilation Toolchains

Toolchains that *target* arm64 (and, on arm64 hosts, run natively).

| Tool | Description | Install (Linux) |
|------|-------------|-----------------|
| **gcc-aarch64-linux-gnu** | GNU C compiler targeting aarch64 | `sudo apt install gcc-aarch64-linux-gnu` |
| **binutils-aarch64-linux-gnu** | Assembler/linker (`as`, `ld`, `objdump`) for aarch64 | `sudo apt install binutils-aarch64-linux-gnu` |
| **binutils-aarch64-linux-gnu-dbg** | Debug symbols for the above | `sudo apt install binutils-aarch64-linux-gnu-dbg` |
| **gdb-multiarch** | Multi-architecture debugger (Linux-only) | `sudo apt install gdb-multiarch` |

## macOS (Apple Silicon) equivalents

| Tool | Install |
|------|---------|
| Xcode / Command Line Tools | Native arm64 `clang` + assembler (AArch64 syntax) |
| gcc-aarch64-embedded | `brew install --cask gcc-aarch64-embedded` |
| Cross toolchains (Homebrew) | https://github.com/messense/homebrew-macos-cross-toolchains |

> On an **arm64 Linux host**, these packages are native arm64 binaries
> (compiling *for* arm64 *on* arm64). On x86_64 hosts they're cross-compilers.

*Source discussion: [HN 39008891](https://news.ycombinator.com/item?id=39008891).*
*License: GPL (GNU toolchain). Collector holds no rights.*
