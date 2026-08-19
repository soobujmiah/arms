# 19 — Backup & Sync

Encrypted, deduplicating backups and file sync — native **arm64**. ✅

| Tool | Description | Install |
|------|-------------|---------|
| **restic** | Encrypted dedup backup (S3/B2/Azure/GCS/SFTP/local/rclone) — single Go binary | `sudo apt install restic` or GitHub `linux_arm64` release |
| **BorgBackup** | Dedup/compressed backups via SSH (Python/C) | `sudo apt install borgbackup` |
| **Kopia** | Modern dedup backup + GUI | GitHub `linux-arm64` release |
| **rclone** | Sync to 50+ cloud backends | `sudo apt install rclone` |
| **rsync** | Classic incremental file sync | preinstalled / `sudo apt install rsync` |
| **Timeshift** | System snapshots (BTRFS/rsync) | `sudo apt install timeshift` |
| **duplicity** | Encrypted incremental backups | `sudo apt install duplicity` |

### Usage examples

```bash
# restic — init a repo and back up
restic -r s3:s3.amazonaws.com/bucket init
restic -r s3:s3.amazonaws.com/bucket backup /home
restic -r rclone:GoogleDrive:Backup backup /data   # via rclone backend

# borg — SSH backup + mount
borg init user@host:/backup
borg create user@host:/backup::home-{now} /home
borg mount user@host:/backup::home-2026 /mnt       # browse as filesystem

# rclone — sync to cloud
rclone sync /data remote:bucket
```

### Choosing a tool

| Need | Pick |
|------|------|
| Cloud/S3 backends + cross-platform | **restic** (or **Kopia**) |
| SSH-only, smallest compressed size | **BorgBackup** |
| Many backends / cloud sync | **rclone** |
| System rollback snapshots | **Timeshift** |

> Automate restic with cron/systemd timers, or **borgmatic** (YAML wrapper for Borg).

*License: BSD-2 (restic), BSD-3 (Borg), Apache-2.0 (Kopia), MIT (rclone), GPL (rsync/Timeshift/duplicity). Collector holds no rights.*
