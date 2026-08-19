# 07 — Embedded & Hardware Tools

| Tool | arm64 status | Details | Source |
|------|--------------|---------|--------|
| **nRF Command Line Tools (nrfjprog, mergehex)** | ✅ Official | arm64 Linux since **v10.15.4** (earlier armhf-only failed on arm64) | [Nordic DevZone #71749](https://devzone.nordicsemi.com/f/nordic-q-a/71749/nrf-command-line-tools-for-arm-aarch64) |
| **SEGGER J-Link** | ✅ Official | J-Link software supports arm64 (7.x native M1/arm) | segger.com |
| **GNU ARM Embedded Toolchain (arm-none-eabi-gcc)** | ✅ Official | ARM provides aarch64 Linux builds | developer.arm.com |

## Notes

- **nRF CLT**: closed-source; depends on the **SEGGER J-Link library** — keep
  J-Link lib version in sync (J-Link 7.x broke nrfjprog on ARM Macs).
- Native builds: Linux x86/x64, Linux armhf, **Linux arm64/aarch64**,
  macOS (incl. Apple Silicon), Windows.

*License: proprietary (vendor EULA). Collector holds no rights.*
