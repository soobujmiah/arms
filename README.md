# 🛒 arms — the arm64 Linux Tools Store

> **A curated catalog of tools that run natively on arm64 / aarch64 Linux.**
> Everything here is collected from public sources across the internet.
>
> 🚀 **Live site:** https://soobujmiah.github.io/arms · **Repo:** https://github.com/soobujmiah/arms

---

## 🧠 Knowledge continuity

This repository participates in Sobuj's canonical knowledge-continuity system: [`soobujmiah/skb`](https://github.com/soobujmiah/skb).

For substantive work, follow this repository's own instructions first, then consult the relevant SKB context before making project-level decisions. Use only the minimum relevant context; do not blindly copy SKB content here.

At the end of substantive work, review whether durable facts, decisions, constraints, important discoveries, failures, or evidence from this repository should be recorded back into SKB. Record only supported, useful knowledge; never return secrets, credentials, private payloads, routine noise, or unsupported claims.

Repository-local evidence and explicit human decisions remain authoritative for this repository. SKB provides continuity and context; it does not silently override local rules or human authority.

Work structure, documentation, language, tooling, tests, and implementation choices must be selected adaptively for the actual task rather than copied from a fixed template.

---

## ⚠️ IMPORTANT — COPYRIGHT DISCLAIMER

> **I do NOT hold any copyright over the tools listed in this repository.**
> This repository is **not** the author, owner, publisher, or distributor of
> any software listed here. It is only a **catalog / index / collector** —
> a list of links, names, descriptions, and install instructions gathered from
> random public sources on the internet.
>
> - All names, trademarks, logos, and binaries belong to their **respective owners**.
> - Each tool retains its **own license** (see the upstream source for each).
> - Nothing in this repository is a claim of ownership or authorship.
> - I am simply a **collector** who documents what is available for arm64 Linux.
>
> If you are the copyright owner of any material referenced here and wish it to
> be removed or corrected, please open an issue or contact me — I will remove it
> immediately.

*See [DISCLAIMER.md](DISCLAIMER.md) for the full legal statement.*

---

## 📚 What is this store?

A single place to find **native arm64 / aarch64 Linux** tools — because Google
and several vendors still ship many tools x86_64-only. This catalog documents
what works natively on arm64, and where to get it.

**Legend:** ✅ native arm64 · ⚠️ needs workaround · 🔗 third-party/community build

## 📊 Catalog by category

| # | Category | Tools | File |
|---|----------|-------|------|
| 01 | System & Shell Utilities | ~29 | [catalog/01-system-shell-utilities.md](catalog/01-system-shell-utilities.md) |
| 02 | Language Runtimes | 7 | [catalog/02-language-runtimes.md](catalog/02-language-runtimes.md) |
| 03 | Build Tools | 7 | [catalog/03-build-tools.md](catalog/03-build-tools.md) |
| 04 | IDEs & Editors | 8 | [catalog/04-ides-editors.md](catalog/04-ides-editors.md) |
| 05 | Android SDK (arm64) | 9 | [catalog/05-android-sdk-arm64.md](catalog/05-android-sdk-arm64.md) |
| 06 | Cross-Compilation Toolchains | 4 | [catalog/06-cross-compilation-toolchains.md](catalog/06-cross-compilation-toolchains.md) |
| 07 | Embedded & Hardware | 3 | [catalog/07-embedded-hardware-tools.md](catalog/07-embedded-hardware-tools.md) |
| 08 | Emulation Layers | 4 | [catalog/08-emulation-layers.md](catalog/08-emulation-layers.md) |
| 09 | Containers | 4 | [catalog/09-containers.md](catalog/09-containers.md) |
| 10 | Databases & Services | 8 | [catalog/10-databases-services.md](catalog/10-databases-services.md) |
| 11 | Dev Infrastructure & Profilers | 9 | [catalog/11-dev-infrastructure.md](catalog/11-dev-infrastructure.md) |
| 12 | On-Device Desktop (Android phone) | 5 | [catalog/12-on-device-desktop.md](catalog/12-on-device-desktop.md) |
| 13 | Networking & VPN | 6 | [catalog/13-networking-vpn.md](catalog/13-networking-vpn.md) |
| 14 | Networking & Security Tools | 12 | [catalog/14-networking-security.md](catalog/14-networking-security.md) |
| 15 | AI & Machine Learning | 3 | [catalog/15-ai-machine-learning.md](catalog/15-ai-machine-learning.md) |
| 16 | Media & Graphics | 16 | [catalog/16-media-graphics.md](catalog/16-media-graphics.md) |
| 17 | Monitoring & Observability | 5 | [catalog/17-monitoring-observability.md](catalog/17-monitoring-observability.md) |
| 18 | Web Servers & Reverse Proxies | 5 | [catalog/18-web-servers.md](catalog/18-web-servers.md) |
| 19 | Backup & Sync | 7 | [catalog/19-backup-sync.md](catalog/19-backup-sync.md) |
| 20 | Package Managers & Distribution | 10 | [catalog/20-package-managers.md](catalog/20-package-managers.md) |

**Total: ~150 tools** documented across 20 categories.

## 📋 Copy-paste all install commands

Every tool's install command is collected into a single copyable file —
each command sits in its own code block (GitHub shows a **copy button** on each):

👉 **[INSTALL.md](INSTALL.md) — all install commands**

## 🚀 Quick view — the essentials

| Tool | Type | arm64 |
|------|------|-------|
| VS Code | Editor/IDE | ✅ Official |
| IntelliJ IDEA (all JetBrains) | IDE | ✅ Official (2022.3+) |
| OpenJDK 17/21 | Runtime | ✅ |
| Node.js / Python / Go / Rust | Runtime | ✅ |
| Gradle / Maven / CMake | Build | ✅ |
| tmux / fish / neovim | Shell | ✅ (static) |
| ffmpeg / mpv / GIMP / Blender | Media/Graphics | ✅ |
| Ollama / llama.cpp | Local AI | ✅ (CPU) |
| Prometheus / Grafana | Monitoring | ✅ (arm64 tarballs) |
| nginx / Caddy / Traefik | Web server | ✅ |
| restic / Borg / rclone | Backup | ✅ |
| Tailscale / WireGuard | VPN | ✅ |
| nmap / Wireshark / aircrack-ng | Security | ✅ |
| Box64 / FEX-Emu | x86_64 emulation | ✅ |
| Docker / Podman | Container | ✅ |
| lzhiyong & HomuHomu SDK | Android build-tools | 🔗 Community |
| [ADT](https://github.com/soobujmiah/adt) | Android SDK toolchain (Linux/glibc) | ⭐ Self-built, real-device-validated |
| nRF Command Line Tools | Embedded | ✅ (10.15.4+) |
| Android Studio | IDE | ⚠️ Workaround |
| Android emulator | Emulator | ❌ Use device |

## 🔎 How to contribute / add tools

Found another arm64-supported tool? Open a PR adding a row to the right
category file. Please include: **name, description, arch support, install
command, source URL, license**.

## ⚖️ License of this repository

The catalog itself (this text) is provided as-is for informational purposes.
All listed software belongs to its respective owners.
