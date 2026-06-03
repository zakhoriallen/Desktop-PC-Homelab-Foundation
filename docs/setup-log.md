# Setup Log

## 2026-06-01

- Confirmed VM `homelab-ubuntu` is running in VirtualBox.
- Confirmed VM is using bridged networking.
- Confirmed VM IP: `LAN_VM_IP`.
- Confirmed SSH access for user `USERNAME`.
- Added key-based SSH access from Windows for setup automation.
- Confirmed Docker Engine is installed: `Docker version 29.5.2`.
- Confirmed Docker Compose plugin is installed: `Docker Compose version v5.1.4`.
- Confirmed user `USERNAME` is in the `docker` group.
- Ran `docker run --rm hello-world` successfully.
- Created `/home/USERNAME/homelab` folder structure.
- Copied README, docs, scripts, and Docker stacks to `/home/USERNAME/homelab`.
- Deployed Portainer.
- Deployed Uptime Kuma.
- Deployed AdGuard Home.
- Deployed Homepage Dashboard.
- Verified Windows can reach:
  - Portainer: `https://LAN_VM_IP:9443`
  - Uptime Kuma: `http://LAN_VM_IP:3001`
  - AdGuard Home setup: `http://LAN_VM_IP:3000`
  - Homepage: `http://LAN_VM_IP:3002`

## Remaining Phase 1 Tasks

- Save screenshots neatly under `docs/screenshots/`.
- Confirm AdGuard DNS from one client before using it router-wide.
- Keep service credentials out of documentation.

## 2026-06-02 Update

- Portainer first-run setup completed.
- Uptime Kuma first-run setup completed.
- Uptime Kuma is monitoring all four services.
- AdGuard Home first-run setup completed and protection is enabled.
- Homepage is running and reachable.
- Linux password changed after setup.
- `docker ps` proof screenshot captured.
- README and supporting docs updated for Phase 1 completion.

## 2026-06-02 Phase 2 Update

- Tailscale installed on Ubuntu VM.
- Tailscale installed on Windows.
- Ubuntu VM Tailscale IP recorded: `TAILSCALE_VM_IP`.
- SSH works over LAN and Tailscale:
  - `ssh USERNAME@LAN_VM_IP`
  - `ssh USERNAME@TAILSCALE_VM_IP`
- Browser service access works over Tailscale:
  - Portainer: `https://TAILSCALE_VM_IP:9443`
  - Uptime Kuma: `http://TAILSCALE_VM_IP:3001`
  - AdGuard Home: `http://TAILSCALE_VM_IP:3000`
  - Homepage: `http://TAILSCALE_VM_IP:3002`
- Homepage allowed hosts updated:
  - `LAN_VM_IP:3002`
  - `TAILSCALE_VM_IP:3002`
- UFW installed and enabled.
- Browser links still work after firewall activation.
- Backup script created and tested:
  - `~/homelab/scripts/backup-homelab.sh`
- Backup file created:
  - `~/homelab/backups/homelab-backup-2026-06-02_05-58-28.tar.gz`
- Backup contents verified with `tar -tzf`.
- Phase 1 proof screenshots renamed and organized under `docs/screenshots/`.
- Phase 2 proof screenshots saved:
  - Tailscale machines page
  - UFW status numbered
  - Backup script output
- Latest backup created:
  - `~/homelab/backups/homelab-backup-2026-06-02_18-24-33.tar.gz`
