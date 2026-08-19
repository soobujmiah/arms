# 14 — Networking & Security Tools

All ship in Kali Linux ARM images (Raspberry Pi) and Debian/Ubuntu **arm64** repos. ✅
*For authorized security testing only — respect applicable laws.*

| Tool | Description | Install |
|------|-------------|---------|
| **nmap** | Network discovery & port scanner | `sudo apt install nmap` |
| **Wireshark** | Packet capture & protocol analysis (GUI) | `sudo apt install wireshark` |
| **tcpdump** | CLI packet capture | `sudo apt install tcpdump` |
| **aircrack-ng** | Wireless audit suite (airodump-ng, airbase-ng, etc.) | `sudo apt install aircrack-ng` |
| **Kismet** | Wireless discovery & monitoring | `sudo apt install kismet` |
| **bettercap** | Network visibility & MITM framework | `sudo apt install bettercap` |
| **hashcat** | GPU/CPU password recovery | `sudo apt install hashcat` |
| **John the Ripper** | Password cracker | `sudo apt install john` |
| **Metasploit Framework** | Penetration testing framework | `curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb \| sh` |
| **hydra** | Network login brute-forcer | `sudo apt install hydra` |
| **sqlmap** | SQL injection tool | `sudo apt install sqlmap` |
| **nikto** | Web server scanner | `sudo apt install nikto` |

### Usage examples

```bash
nmap -sV -p 1-1000 192.168.1.0/24          # service/version scan of subnet
sudo airodump-ng wlan0mon                    # capture wireless traffic
sudo tcpdump -i eth0 -w capture.pcap         # dump packets to file
hashcat -m 22000 hash.hc22000 wordlist.txt   # crack WPA2 handshake
hydra -l admin -P rockyou.txt ssh://10.0.0.1 # brute-force SSH login
```

### Ready-made distros

- **Kali Linux ARM** (Raspberry Pi images) — hundreds of tools preinstalled
  (metapackages: `kali-linux-default`, `kali-tools-passwords`, `kali-linux-wireless`…).
- **PwnPi / Raspberry Pwn** — legacy pentest dropbox distros for Pi.

*License: GPL/various (each tool). Collector holds no rights.*
