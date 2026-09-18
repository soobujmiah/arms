# 📋 arms — All Install Commands (copy-paste)

> Every tool's native **arm64** install command in a copyable code block.
> Click the copy icon on any block in the GitHub file view.

---


## 🖥️ System & Shell

### tmux — Terminal multiplexer

```bash
sudo apt install tmux
```

### fish — Friendly interactive shell

```bash
sudo apt install fish
```

### neovim — Vim-fork editor

```bash
sudo apt install neovim
```

### bat — cat clone w/ syntax highlighting

```bash
sudo apt install bat
```

### eza — Modern ls replacement

```bash
sudo apt install eza
```

### fd — Fast find alternative

```bash
sudo apt install fd-find
```

### ripgrep — Fast regex search

```bash
sudo apt install ripgrep
```

### fzf — Fuzzy finder

```bash
sudo apt install fzf
```

### jq — JSON processor

```bash
sudo apt install jq
```

### btop — Resource monitor

```bash
sudo apt install btop
```

### zoxide — Smarter cd

```bash
sudo apt install zoxide
```

### starship — Cross-shell prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

### yazi — Async file manager

```bash
sudo apt install yazi
```

### duf — Better df

```bash
sudo apt install duf
```

### delta — Syntax-highlighting diff

```bash
sudo apt install git-delta
```


## ☕ Language Runtimes

### OpenJDK 17/21 — Java runtime & compiler

```bash
sudo apt install openjdk-17-jdk
```

### Node.js — JavaScript runtime

```bash
curl -fsSL https://deb.nodesource.com/setup_20.sh | sudo bash -
```

### Python 3 — Python interpreter

```bash
sudo apt install python3 python3-pip
```

### Go — Compiled language

```bash
sudo apt install golang-go
```

### Rust — Compiled language

```bash
curl https://sh.rustup.rs -sSf | sh
```

### GCC/Clang/LLVM — C/C++ toolchain

```bash
sudo apt install gcc g++ clang llvm
```

### Dart — Dart SDK

```bash
via Flutter SDK
```


## 🔨 Build Tools

### Gradle — JVM build (Android/Java/Kotlin)

```bash
sdk install gradle
```

### Maven — JVM build

```bash
sudo apt install maven
```

### CMake — C/C++ meta-build

```bash
sudo apt install cmake
```

### Make — Classic build

```bash
sudo apt install make
```

### Ninja — Fast build backend

```bash
sudo apt install ninja-build
```

### Bazel — Google build system

```bash
sudo apt install bazel-bootstrap
```

### Meson — Python build system

```bash
sudo apt install meson
```


## 💻 IDEs & Editors

### VS Code — Code editor

```bash
code.visualstudio.com → arm64
```

### IntelliJ IDEA — Java/Kotlin IDE

```bash
jetbrains.com → aarch64
```

### PyCharm/WebStorm/CLion — JetBrains IDEs

```bash
jetbrains.com downloads
```

### JetBrains Runtime — JBR

```bash
github.com/JetBrains/JetBrainsRuntime
```

### Eclipse/NetBeans — Java IDEs

```bash
installer (JVM)
```

### Arduino IDE 2.x — Embedded IDE

```bash
community arm64 build
```

### Android Studio — Android IDE

```bash
workaround (merge IntelliJ aarch64)
```

### Neovim — Terminal editor

```bash
sudo apt install neovim
```


## 🤖 Android SDK

### ADT — Android SDK toolchain built for Linux ARM64/glibc (self-built)

```bash
git clone https://github.com/soobujmiah/adt
cd adt && ./setup.sh install-profile validated
```

### build-tools (aapt2) — Resource compiler

```bash
lzhiyong/HomuHomu releases
```

### platform-tools (adb) — Device bridge

```bash
lzhiyong / AndroidIDE builds
```

### NDK — Native toolchain

```bash
HomuHomu833/android-ndk-custom r29
```

### cmdline-tools (sdkmanager) — SDK manager

```bash
commandlinetools-linux zip
```

### platforms android.jar — API stubs

```bash
arch-independent JAR
```

### APK Workbench — ARM64 SDK/NDK catalog

```bash
github.com/Denuo-Web/APK-Workbench
```

### Emulator — AVD emulation

```bash
use physical device
```

### SecFathy binaries — NDK compilers + coreutils

```bash
github.com/SecFathy/Android-arm64-Binaries
```


## 🎯 Cross-Compilation

### gcc-aarch64-linux-gnu — GNU C compiler → aarch64

```bash
sudo apt install gcc-aarch64-linux-gnu
```

### binutils-aarch64-linux-gnu — Assembler/linker → aarch64

```bash
sudo apt install binutils-aarch64-linux-gnu
```

### gdb-multiarch — Multi-arch debugger

```bash
sudo apt install gdb-multiarch
```

### Xcode clang (macOS) — arm64 toolchain

```bash
xcode-select --install
```


## 🔌 Embedded & Hardware

### nRF Command Line Tools — nrfjprog/mergehex flasher

```bash
nordicsemi.com → arm64
```

### SEGGER J-Link — Debug probe software

```bash
segger.com
```

### GNU ARM Embedded — arm-none-eabi-gcc

```bash
developer.arm.com
```


## 🔁 Emulation Layers

### Box64 — Run x86_64 binaries on arm64

```bash
build from ptitSeb/box64
```

### Box86 — Run x86 (32-bit) binaries

```bash
ptitSeb/box86
```

### FEX-Emu — Fast x86/x86_64 emulator

```bash
fex-emu.com
```

### QEMU user-static — Foreign-arch containers

```bash
sudo apt install qemu-user-static
```


## 📦 Containers

### Docker Engine — Container runtime

```bash
curl -fsSL https://get.docker.com | sh
```

### Podman — Rootless containers

```bash
sudo apt install podman
```

### Docker Buildx — Multi-arch builds

```bash
docker buildx plugin
```

### containerd/nerdctl — Container runtime

```bash
sudo apt install containerd
```


## 🗄️ Databases & Services

### PostgreSQL — Relational DB

```bash
sudo apt install postgresql
```

### MySQL — Relational DB

```bash
sudo apt install mysql-server
```

### MariaDB — Relational DB

```bash
sudo apt install mariadb-server
```

### SQLite — Embedded DB

```bash
sudo apt install sqlite3
```

### Redis — In-memory store

```bash
sudo apt install redis-server
```

### MongoDB — Document DB

```bash
official arm64 tarball
```

### RabbitMQ — Message broker

```bash
sudo apt install rabbitmq-server
```

### Apache Kafka — Stream platform

```bash
JVM — arm64 JDK
```


## ⚙️ Dev Infrastructure

### Git — Version control

```bash
sudo apt install git
```

### GitHub CLI (gh) — GitHub from terminal

```bash
official arm64 release
```

### Docker Compose — Compose plugin

```bash
sudo apt install docker-compose-plugin
```

### kubectl — K8s CLI

```bash
official arm64 release
```

### Helm — K8s package manager

```bash
official arm64 release
```

### k3s — Lightweight Kubernetes

```bash
k3s ships arm64
```

### Terraform — IaC

```bash
official arm64 release
```

### Ansible — Config automation

```bash
sudo apt install ansible
```

### dotTrace CLI — .NET profiler

```bash
NuGet windows-arm64
```


## 📱 On-Device Desktop

### Termux — Linux userspace on Android

```bash
f-droid.org → Termux
```

### proot-distro — Rootless distro (PRoot)

```bash
pkg install proot-distro
```

### Termux:X11 — GPU-accelerated X server

```bash
GitHub arm64 APK
```

### DroidDesk — Turnkey desktop kit

```bash
ramdi.fr writeup
```

### proot-distro-scripts — 1-command desktops

```bash
github.com/01101010110
```


## 🌐 Networking & VPN

### Tailscale — Zero-config mesh VPN

```bash
curl -fsSL https://tailscale.com/install.sh | sh
```

### WireGuard — Kernel VPN

```bash
sudo apt install wireguard
```

### OpenVPN — TLS VPN

```bash
sudo apt install openvpn
```

### Mosh — Resilient mobile shell

```bash
sudo apt install mosh
```

### PiVPN — 1-command VPN server

```bash
curl -L https://install.pivpn.io | bash
```

### RaspAP — Wi-Fi AP + VPN GUI

```bash
curl -sL https://install.raspap.com | bash
```


## 🛡️ Security

### nmap — Network scanner

```bash
sudo apt install nmap
```

### Wireshark — Packet analyzer

```bash
sudo apt install wireshark
```

### tcpdump — CLI packet capture

```bash
sudo apt install tcpdump
```

### aircrack-ng — Wireless audit suite

```bash
sudo apt install aircrack-ng
```

### Kismet — Wireless discovery

```bash
sudo apt install kismet
```

### bettercap — Network MITM framework

```bash
sudo apt install bettercap
```

### hashcat — Password recovery

```bash
sudo apt install hashcat
```

### John the Ripper — Password cracker

```bash
sudo apt install john
```

### Metasploit — Pentest framework

```bash
sudo apt install metasploit-framework
```

### hydra — Login brute-forcer

```bash
sudo apt install hydra
```

### sqlmap — SQL injection tool

```bash
sudo apt install sqlmap
```

### nikto — Web scanner

```bash
sudo apt install nikto
```


## 🧠 AI & Machine Learning

### Ollama — Local LLM server

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

### llama.cpp — CPU-first inference

```bash
cmake -B build -DGGML_NATIVE=ON
```

### whisper.cpp — Speech-to-text

```bash
git clone ggml-org/whisper.cpp
```


## 🎨 Media & Graphics

### ffmpeg — Transcode/stream media

```bash
sudo apt install ffmpeg
```

### mpv — Video player

```bash
sudo apt install mpv
```

### ImageMagick — Image manipulation

```bash
sudo apt install imagemagick
```

### sox — Audio processing

```bash
sudo apt install sox
```

### GIMP — Image editor

```bash
GIMP-*-aarch64.AppImage
```

### Blender — 3D creation suite

```bash
sudo apt install blender
```

### Inkscape — Vector graphics

```bash
sudo apt install inkscape
```

### Krita — Digital painting

```bash
AppImage/Flatpak
```

### LibreOffice — Office suite

```bash
sudo apt install libreoffice
```

### Kdenlive — Video editor

```bash
sudo apt install kdenlive
```

### Shotcut — Video editor

```bash
AppImage
```

### OBS Studio — Live streaming

```bash
sudo apt install obs-studio
```

### Audacity — Audio editor

```bash
sudo apt install audacity
```

### digiKam — Photo manager

```bash
AppImage
```


## 📈 Monitoring

### Prometheus — Time-series DB

```bash
prometheus-*-linux-arm64.tar.gz
```

### Grafana — Dashboards

```bash
grafana.com arm64 .deb
```

### node_exporter — System metrics

```bash
node_exporter-*-linux-arm64.tar.gz
```

### Alertmanager — Alert routing

```bash
Prometheus release
```

### ntopng — Traffic analyzer

```bash
packages.ntop.org/RaspberryPI
```


## 🌍 Web Servers

### nginx — Reverse proxy / web server

```bash
sudo apt install nginx
```

### Caddy — Auto-HTTPS web server

```bash
sudo apt install caddy
```

### Traefik — Cloud-native ingress

```bash
traefik_*_linux_arm64.tar.gz
```

### Apache httpd — Classic web server

```bash
sudo apt install apache2
```

### lighttpd — Lightweight server

```bash
sudo apt install lighttpd
```


## 💾 Backup & Sync

### restic — Encrypted dedup backup

```bash
sudo apt install restic
```

### BorgBackup — SSH compressed backup

```bash
sudo apt install borgbackup
```

### Kopia — Dedup backup + GUI

```bash
linux-arm64 release
```

### rclone — Sync 50+ cloud backends

```bash
sudo apt install rclone
```

### rsync — Incremental sync

```bash
sudo apt install rsync
```

### Timeshift — System snapshots

```bash
sudo apt install timeshift
```

### duplicity — Encrypted incremental

```bash
sudo apt install duplicity
```


## 📥 Package Managers

### apt — Debian/Ubuntu/RPi OS

```bash
built-in
```

### pacman — Arch Linux ARM

```bash
built-in
```

### dnf — Fedora arm64

```bash
built-in
```

### apk — Alpine arm64

```bash
built-in
```

### pkg — Termux

```bash
built-in
```

### Nix — Reproducible manager

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### Flatpak — Sandboxed apps

```bash
sudo apt install flatpak
```

### Snap — Universal packages

```bash
sudo apt install snapd
```

### AppImage — Portable single-file

```bash
download *-aarch64.AppImage
```

### Homebrew — macOS-style brew

```bash
x86_64-only on Linux
```


---

**Total: 144 install commands.**


> ⚠️ *No copyright claimed — see [DISCLAIMER.md](DISCLAIMER.md). All commands belong to their respective projects.*
