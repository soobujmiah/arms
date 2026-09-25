# arms — the arm64 Linux Tools Store

A curated catalog of tools that run **natively on arm64 / aarch64 Linux**, with a fast, static, single-file site.

**Live site:** https://soobujmiah.github.io/arms

## Why I built this

I work on arm64 Linux every day — Debian inside PRoot on an Android phone — and I kept hitting the same wall: a tool "supports Linux," but the vendor ships an x86_64 binary and nothing else. Native aarch64 support usually turns out to be buried in a release note, a forum thread, or a community build somebody posted once. This catalog collects what actually runs native on arm64 into one searchable place, with install commands and sources.

## What's in the catalog

The interactive catalog contains **145 tools across 20 categories**:

| # | Category | Tools | Details |
|---|----------|-------|---------|
| 01 | System & Shell | 15 | [catalog/01-system-shell-utilities.md](catalog/01-system-shell-utilities.md) |
| 02 | Language Runtimes | 7 | [catalog/02-language-runtimes.md](catalog/02-language-runtimes.md) |
| 03 | Build Tools | 7 | [catalog/03-build-tools.md](catalog/03-build-tools.md) |
| 04 | IDEs & Editors | 8 | [catalog/04-ides-editors.md](catalog/04-ides-editors.md) |
| 05 | Android SDK (arm64) | 9 | [catalog/05-android-sdk-arm64.md](catalog/05-android-sdk-arm64.md) |
| 06 | Cross-Compilation | 4 | [catalog/06-cross-compilation-toolchains.md](catalog/06-cross-compilation-toolchains.md) |
| 07 | Embedded & Hardware | 3 | [catalog/07-embedded-hardware-tools.md](catalog/07-embedded-hardware-tools.md) |
| 08 | Emulation Layers | 4 | [catalog/08-emulation-layers.md](catalog/08-emulation-layers.md) |
| 09 | Containers | 4 | [catalog/09-containers.md](catalog/09-containers.md) |
| 10 | Databases & Services | 8 | [catalog/10-databases-services.md](catalog/10-databases-services.md) |
| 11 | Dev Infrastructure | 9 | [catalog/11-dev-infrastructure.md](catalog/11-dev-infrastructure.md) |
| 12 | On-Device Desktop | 5 | [catalog/12-on-device-desktop.md](catalog/12-on-device-desktop.md) |
| 13 | Networking & VPN | 6 | [catalog/13-networking-vpn.md](catalog/13-networking-vpn.md) |
| 14 | Security | 12 | [catalog/14-networking-security.md](catalog/14-networking-security.md) |
| 15 | AI & Machine Learning | 3 | [catalog/15-ai-machine-learning.md](catalog/15-ai-machine-learning.md) |
| 16 | Media & Graphics | 14 | [catalog/16-media-graphics.md](catalog/16-media-graphics.md) |
| 17 | Monitoring | 5 | [catalog/17-monitoring-observability.md](catalog/17-monitoring-observability.md) |
| 18 | Web Servers | 5 | [catalog/18-web-servers.md](catalog/18-web-servers.md) |
| 19 | Backup & Sync | 7 | [catalog/19-backup-sync.md](catalog/19-backup-sync.md) |
| 20 | Package Managers | 10 | [catalog/20-package-managers.md](catalog/20-package-managers.md) |

Each `catalog/*.md` file is the fuller write-up of its category — background, versions, primary sources, and extra entries beyond the interactive list.

**Status legend:** ✅ native arm64 · ⚠️ needs a workaround · 🔗 third-party/community build · ❌ not available (use a physical device)

## Using the site

- **Search** matches tool names, descriptions, categories and install commands, live as you type.
- **Category chips** filter the catalog down to one category.
- Click any **card** for the detail view: status, install command, and notes.
- **Copy buttons** copy an install command with one tap; clicking the install command inside a detail view copies it too.
- Every install command is also collected in [INSTALL.md](INSTALL.md), one command per copyable code block.

## Sources and copyright

Entries are collected from public sources — vendor sites, GitHub releases, and community lists. Each `catalog/*.md` file names its primary sources.

> **I do NOT hold any copyright over the tools listed here.** This repository is a catalog/index only — a collection of names, descriptions, links and install instructions. All names, trademarks and binaries belong to their respective owners, each under its own license. Nothing here is a claim of ownership or authorship. If you are a rights holder and want something removed or corrected, open an issue and I'll act immediately.

Full legal statement: [DISCLAIMER.md](DISCLAIMER.md).

One entry in the catalog is mine: [ADT](https://github.com/soobujmiah/adt) — an Android SDK toolchain I build and maintain for Linux ARM64/glibc, validated end-to-end on a physical device.

## Project structure

- `index.html` — the entire site. Static, single file, no build step, no dependencies. The tool data lives in the `DATA` array inside it.
- `catalog/` — 20 markdown files, one per category, with fuller documentation and sources.
- `INSTALL.md` — every install command in copyable blocks.
- `scripts/setup.sh` — sets up a full Android development environment on aarch64/arm64 Linux (native build-tools, Gradle, cmdline-tools).
- `sample-app/` — a small Gradle Android test project.
- `.github/workflows/verify.yml` — CI: bash syntax + ShellCheck on the setup script, and a debug build of the sample app on every push to `main`.
- `.github/workflows/repo-knowledge-sync.yml` — reads `verify.yml`'s own results (doesn't re-run the Gradle build) and writes `.repo/project.yaml`/`.repo/STATUS.md`, machine-generated by `tools/repo_knowledge/` (vendored from `soobujmiah/skb`, see `governance/DETERMINISTIC_STATE_SYNC_POLICY.md`).

The site deploys through GitHub Pages from the `main` branch — pushing to `main` publishes it.

## Adding a tool

Open an issue or PR with: **name, description, arm64 status, install command, source URL, license**. Add the entry to the right `catalog/*.md` file and to the `DATA` array in `index.html` so the site and the docs stay in sync.
