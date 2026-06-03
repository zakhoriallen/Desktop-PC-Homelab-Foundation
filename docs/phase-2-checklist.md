# Phase 2 Checklist

## Tailscale

- [x] Tailscale installed on Ubuntu VM
- [x] Tailscale installed on Windows
- [x] Ubuntu VM visible in Tailscale admin console
- [x] Windows host visible in Tailscale admin console
- [x] VM Tailscale IP documented: `TAILSCALE_VM_IP`
- [x] SSH works over Tailscale
- [x] Browser service access works over Tailscale

## Firewall

- [x] UFW installed
- [x] UFW enabled
- [x] SSH allowed: `22/tcp`
- [x] AdGuard Home dashboard allowed: `3000/tcp`
- [x] Uptime Kuma allowed: `3001/tcp`
- [x] Homepage allowed: `3002/tcp`
- [x] Portainer allowed: `9443/tcp`
- [x] DNS TCP allowed: `53/tcp`
- [x] DNS UDP allowed: `53/udp`
- [x] Tailscale interface allowed: `tailscale0`
- [x] Browser links still work after firewall activation

## Backups

- [x] Backup script created: `~/homelab/scripts/backup-homelab.sh`
- [x] Backup script tested
- [x] Backup archive created: `~/homelab/backups/homelab-backup-2026-06-02_05-58-28.tar.gz`
- [x] Latest backup archive created: `~/homelab/backups/homelab-backup-2026-06-02_18-24-33.tar.gz`
- [x] Backup archive contents verified

## Documentation

- [x] Tailscale IP documented
- [x] UFW rules documented
- [x] Backup script path documented
- [x] Backup file path documented
- [x] Homepage allowed hosts fix documented
- [x] Tailscale access URLs documented
- [x] Phase 2 screenshots saved neatly

## Optional Later

- [ ] Set up SSH key login
- [ ] Disable password SSH after key login is confirmed
- [ ] Add Uptime Kuma notifications
- [ ] Test AdGuard DNS from one device only
- [ ] Do not change router DNS yet
