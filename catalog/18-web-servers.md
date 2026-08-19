# 18 — Web Servers & Reverse Proxies

All have official **arm64** builds (native binaries and/or Docker images).

| Tool | Description | Install |
|------|-------------|---------|
| **nginx** | High-performance web server / reverse proxy (1.31 mainline) | `sudo apt install nginx` · `arm64v8/nginx` image |
| **Caddy** | Web server with automatic HTTPS (v2.11) | `sudo apt install caddy` (official repo) · Arch ARM `caddy` |
| **Traefik** | Cloud-native reverse proxy / ingress (v3.x) | `traefik_v3.2.1_linux_arm64.tar.gz` from GitHub releases |
| **Apache httpd** | Classic web server | `sudo apt install apache2` |
| **lighttpd** | Lightweight web server | `sudo apt install lighttpd` |

### Usage examples

```bash
# Caddy — automatic TLS with zero config
Caddyfile:
    example.com {
        reverse_proxy localhost:8080
    }
caddy run --config Caddyfile

# Traefik (single binary, no DB)
wget https://github.com/traefik/traefik/releases/download/v3.2.1/traefik_v3.2.1_linux_arm64.tar.gz
tar -xzf traefik_v3.2.1_linux_arm64.tar.gz && sudo mv traefik /usr/local/bin/
traefik version
```

### 2026 landscape notes

- Caddy ≈ nginx performance (within ~6%) with automatic HTTP/3 and 70% less config.
- Traefik auto-discovers Docker/K8s services; RKE2 v1.36 defaults to Traefik ingress.
- ingress-nginx reached end-of-life March 2026.

*License: BSD-2 (nginx), Apache-2.0 (Caddy/Traefik/Apache), BSD-3 (lighttpd). Collector holds no rights.*
