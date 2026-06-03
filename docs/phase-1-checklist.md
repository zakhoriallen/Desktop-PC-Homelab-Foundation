# Phase 1 Checklist

## VM

- [x] VirtualBox installed
- [x] Ubuntu Server LTS ISO downloaded
- [x] VM created as `homelab-ubuntu`
- [x] VM storage placed on SSD
- [x] VM configured with 4 CPU cores
- [x] VM configured with 8 GB RAM
- [x] VM configured with 120 GB disk
- [x] Network mode set to Bridged Adapter
- [x] Ubuntu Server installed manually
- [x] Linux user created: `USERNAME`
- [x] OpenSSH Server enabled during install

## Access

- [x] VM boots correctly
- [x] VM IP recorded: `LAN_VM_IP`
- [x] SSH works from Windows PowerShell
- [x] Ubuntu packages updated/upgraded
- [x] Reboot and reconnect successful
- [x] Base tools installed

## Docker

- [x] Docker Engine installed from official Docker apt repository
- [x] Docker Compose plugin installed
- [x] User added to `docker` group
- [x] `docker --version` works
- [x] `docker compose version` works
- [x] `docker run hello-world` works

## Services

- [x] Portainer deployed
- [x] Portainer reachable at `https://LAN_VM_IP:9443`
- [x] Uptime Kuma deployed
- [x] Uptime Kuma reachable at `http://LAN_VM_IP:3001`
- [x] AdGuard Home deployed
- [x] AdGuard Home setup reachable at `http://LAN_VM_IP:3000`
- [x] Homepage deployed
- [x] Homepage reachable at `http://LAN_VM_IP:3002`
- [x] Uptime Kuma monitoring all services

## Documentation

- [x] VM IP documented
- [x] Service ports documented
- [x] Setup steps documented
- [x] Homelab folder structure created on Ubuntu VM
- [x] README.md copied to Ubuntu VM
- [x] `docker ps` proof screenshot captured
- [x] Screenshots saved neatly
- [x] Passwords and secrets excluded from docs

## Roadmap Status Snapshot

- [x] 1. Install VirtualBox
- [x] 2. Download Ubuntu Server ISO
- [x] 3. Create VM named `homelab-ubuntu`
- [x] 4. Set VM network to Bridged Adapter
- [x] 5. Install Ubuntu Server manually
- [x] 6. Create Linux user: `USERNAME`
- [x] 7. Enable OpenSSH Server
- [x] 8. Boot into Ubuntu Server
- [x] 9. Confirm VM IP: `LAN_VM_IP`
- [x] 10. SSH from Windows PowerShell works
- [x] 11. Update/upgrade Ubuntu
- [x] 12. Reboot and reconnect successfully
- [x] 13. Install basic tools
- [x] 14. Install Docker and Docker Compose
- [x] 15. Test Docker with `hello-world`
- [x] 16. Deploy Portainer
- [x] 17. Deploy Uptime Kuma
- [x] 18. Deploy AdGuard Home
- [x] 19. Deploy Homepage Dashboard
- [x] 20. Create folder structure and README
- [x] 21. Save screenshots neatly

## Current Completion Status

- [x] Ubuntu Server VM
- [x] SSH from Windows
- [x] Docker installed
- [x] Docker Compose installed
- [x] Portainer running
- [x] Uptime Kuma running
- [x] AdGuard Home running
- [x] Homepage running
- [x] Uptime Kuma monitoring all services
- [x] Linux password changed
- [x] `docker ps` proof screenshot captured
- [x] Save screenshots neatly
- [x] Create/update README.md
- [x] Document architecture, services, ports, lessons learned
