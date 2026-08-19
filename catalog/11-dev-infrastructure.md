# 11 — Dev Infrastructure & Profilers

| Tool | arm64 status | Install |
|------|--------------|---------|
| **Git** | ✅ | `sudo apt install git` |
| **GitHub CLI (gh)** | ✅ | official arm64 release |
| **Docker Compose** | ✅ | `sudo apt install docker-compose-plugin` |
| **kubectl** | ✅ | official arm64 release |
| **Helm** | ✅ | official arm64 release |
| **k3s / Kubernetes** | ✅ | k3s ships arm64 |
| **Terraform** | ✅ | official arm64 release |
| **Ansible** | ✅ | Python — `sudo apt install ansible` |
| **JetBrains dotTrace CLI** | ⚠️ partial | NuGet `JetBrains.dotTrace.CommandLineTools.*` ships **windows-arm64** (2026.2.x); CLI is a free redistributable profiler for .NET/.NET Core/Mono/Unity |

## dotTrace CLI (profiler) detail

- Package: `JetBrains.dotTrace.CommandLineTools.windows-arm64` — v2026.2.x
  (stable `2026.2.0.2`, EAP `2026.2.0-eap04`).
- Collects performance snapshots from CLI (CI, remote servers).
- Snapshots require dotTrace/Rider to analyze.

> Note: the linked dotTrace package is the **Windows arm64** variant — for
> Linux profiling on arm64 use alternatives (perf, Async Profiler) or run via
> Box64. Recorded here for completeness of the arm64 tooling landscape.

*License: respective upstream licenses (JetBrains = redistributable/EULA).
Collector holds no rights.*
