# 17 — Monitoring & Observability

The Prometheus stack + alternatives — all publish official **linux-arm64** binaries. ✅

| Tool | Role | Port | Install (arm64) |
|------|------|------|-----------------|
| **Prometheus** | Time-series DB + scraper | 9090 | `prometheus-*-linux-arm64.tar.gz` from prometheus.io/download |
| **Grafana** | Dashboards/visualization | 3000 | official ARM `.deb` from grafana.com/download |
| **node_exporter** | Exposes system metrics | 9100 | `node_exporter-*-linux-arm64.tar.gz` |
| **Alertmanager** | Alert routing | 9093 | part of Prometheus release |
| **ntopng** | Network traffic analyzer | 3000 | packages.ntop.org/RaspberryPI |

### Install Prometheus + node_exporter (arm64)

```bash
# Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.53.0/prometheus-2.53.0.linux-arm64.tar.gz
tar xf prometheus-2.53.0.linux-arm64.tar.gz && sudo mv prometheus-2.53.0.linux-arm64/prometheus /usr/local/bin/

# node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-arm64.tar.gz
tar xf node_exporter-1.8.2.linux-arm64.tar.gz
sudo mv node_exporter-1.8.2.linux-arm64/node_exporter /usr/local/bin/
```

### Config (prometheus.yml scrape target)

```yaml
scrape_configs:
  - job_name: "node"
    static_configs:
      - targets: ["localhost:9100"]
```

### Useful Grafana dashboards (import IDs)

| ID | Dashboard |
|----|-----------|
| 1860 | Node Exporter Full |
| 11074 | Node Exporter for Prometheus |
| 7039 | Pi Dashboard (Raspberry Pi specific) |

### Architectures supported

Pi 5/4/3 (64-bit OS) → `linux-arm64` · Pi 4/3 (32-bit) → `linux-armv7` · Pi Zero/1 → `linux-armv6`.

*License: Apache-2.0 (Prometheus stack), AGPL-3.0 (Grafana). Collector holds no rights.*
