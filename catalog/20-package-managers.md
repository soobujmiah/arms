# 20 — Package Managers & App Distribution

How to install software on **arm64** Linux.

## System package managers (all fully arm64)

| Tool | Distro | Install |
|------|--------|---------|
| **apt** | Debian/Ubuntu/Raspberry Pi OS | built-in |
| **pacman** | Arch Linux ARM | built-in |
| **dnf** | Fedora arm64 | built-in |
| **apk** | Alpine (arm64) | built-in |
| **pkg** | Termux (Android) | built-in |

## Cross-distro / universal

| Tool | Description | arm64 |
|------|-------------|-------|
| **Nix** | Reproducible package manager (multi-platform) | ✅ `sh <(curl -L https://nixos.org/nix/install)` |
| **Flatpak** | Sandboxed apps (Flathub) | ✅ `sudo apt install flatpak` |
| **Snap** | Canonical's universal packages | ✅ `sudo apt install snapd` |
| **AppImage** | Portable single-file apps (`*-aarch64.AppImage`) | ✅ download + `chmod +x` |

### Homebrew on Linux arm64

⚠️ **Not officially supported.** Homebrew's Linux support is x86_64-only;
aarch64 Linux requires community patches/forks (e.g. a patched installer or
`ZhongRuoyu/homebrew-aarch64-linux`). Prefer **Nix** or your distro's native
package manager on arm64 Linux.

### Examples

```bash
# Flatpak
flatpak install flathub org.gimp.GIMP

# AppImage (arm64)
chmod +x GIMP-3.2.4-aarch64.AppImage && ./GIMP-3.2.4-aarch64.AppImage

# Nix
nix profile install nixpkgs#ripgrep
```

*License: GPL (apt/dnf), MIT (Nix), LGPL (Flatpak), GPL-3 (Snap), MIT (AppImageKit). Collector holds no rights.*
