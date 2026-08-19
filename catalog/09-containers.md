# 09 — Containers

| Tool | arm64 status | Install |
|------|--------------|---------|
| **Docker Engine** | ✅ Official | `curl -fsSL https://get.docker.com \| sh` (installs arm64) |
| **Podman** | ✅ Official | `sudo apt install podman` (aarch64 pkg in Arch ARM / Fedora / Ubuntu) |
| **Docker Buildx** | ✅ | `docker buildx` plugin (multi-arch builds) |
| **containerd / nerdctl** | ✅ | `sudo apt install containerd` |

## Multi-arch building on arm64

```bash
# Build amd64 + arm64 images on an arm64 host
docker buildx create --use --name multi
docker buildx build --platform linux/amd64,linux/arm64 -t myapp:latest .
```

*License: Apache-2.0. Collector holds no rights.*
