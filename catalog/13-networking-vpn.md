# 13 — Networking & VPN

Mesh VPNs and remote-access tools — all have native **arm64** support.

| Tool | Description | arm64 | Install |
|------|-------------|-------|---------|
| **Tailscale** | Zero-config mesh VPN built on WireGuard (STUN/NAT-traversal, DERP relays) | ✅ | `curl -fsSL https://tailscale.com/install.sh \| sh` |
| **WireGuard** | Fast kernel-level VPN (in kernel 5.6+; Ubuntu 26.04 kernel 7.0) | ✅ | `sudo apt install wireguard` |
| **OpenVPN** | Legacy TLS VPN | ✅ | `sudo apt install openvpn` |
| **Mosh** | Mobile shell — SSH replacement that survives roaming/disconnects | ✅ | `sudo apt install mosh` |
| **PiVPN** | One-command WireGuard/OpenVPN server setup for Pi | ✅ | `curl -L https://install.pivpn.io \| bash` |
| **RaspAP** | Web GUI for Wi-Fi AP + OpenVPN/WireGuard/Tailscale | ✅ | `curl -sL https://install.raspap.com \| bash` |

### Usage examples

```bash
# Tailscale — join a private tailnet, become an exit node
sudo tailscale up
sudo tailscale up --advertise-exit-node
sudo tailscale up --advertise-routes=10.0.1.0/24   # subnet router

# WireGuard — generate keys & configure a peer
wg genkey | tee privatekey | wg pubkey > publickey
sudo wg-quick up wg0

# Mosh — resilient remote shell
mosh user@server
```

### Performance notes

- Tailscale ≈ **95% of raw WireGuard** throughput on direct P2P; ~70% via DERP relay.
- 64-bit OS + 64-bit Tailscale gives **~44% higher throughput** than 32-bit on the same Pi hardware.

*License: BSD-3 (Tailscale), GPL-2.0 (WireGuard/OpenVPN/Mosh). Collector holds no rights.*
