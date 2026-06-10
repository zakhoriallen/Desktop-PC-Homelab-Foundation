# Project Context

## Project

Desktop PC Homelab Foundation

## Goal

Build a working desktop-based homelab on a Windows PC using an Ubuntu Server VM and Docker services. Focus only on getting the homelab functional first.

## Current PC

- Host OS: Windows
- CPU: Ryzen 7 3700X
- RAM: 48 GB
- GPU: Intel Arc A770 16 GB
- Storage: 1.84 TB total, about 570 GB used at Phase 5 preflight
- SSD: 954 GB TEAM T2531TB for VM and active services
- HDD: 932 GB WDC WD10EZEX for backups, ISOs, screenshots, and documentation

## Architecture

Windows Desktop Host -> VirtualBox -> Ubuntu Server VM -> Docker containers

## VM Settings

- Name: `homelab-ubuntu`
- CPU: 4 cores
- RAM: 8 GB
- Storage: 120 GB on SSD
- Network: Bridged Adapter
- OS: Ubuntu Server LTS
- Enable OpenSSH Server during Ubuntu install
- Linux user: `USERNAME`
- Current VM IP: `LAN_VM_IP`
- Tailscale VM IP: `TAILSCALE_VM_IP`

## Phase 1 Objective

Get the Ubuntu Server VM running, reachable over SSH, and hosting basic Docker services.

Status: complete.

## Phase 2 Objective

Add private remote access, baseline firewalling, monitoring proof, and backup basics.

Status: mostly complete.

## Install Order

1. Install VirtualBox
2. Download Ubuntu Server LTS ISO
3. Create VM named `homelab-ubuntu`
4. Install Ubuntu Server manually
5. Enable OpenSSH Server during install
6. Boot VM and find its IP address
7. SSH into VM from Windows
8. Install Docker and Docker Compose
9. Deploy Portainer
10. Deploy Uptime Kuma
11. Deploy AdGuard Home
12. Deploy Homepage Dashboard
13. Start documentation/screenshots

## Core Services

- Portainer: Docker management
- Uptime Kuma: service uptime monitoring
- AdGuard Home: DNS filtering
- Homepage Dashboard: central homelab dashboard

## Security Rules

- Do not expose services to the public internet
- Keep everything local/private for now
- Use strong passwords
- Do not commit passwords, SSH keys, API keys, or secrets
- Document IP addresses, ports, setup steps, and screenshots

## Docker Install Goal

Install Docker Engine and Docker Compose plugin manually after Ubuntu is installed. Do not use the Docker snap during Ubuntu setup.

## First Service

Portainer

## Phase 1 Done When

- [ ] Ubuntu Server VM boots correctly
- [ ] VM has stable local IP
- [ ] SSH from Windows works
- [x] Docker works
- [x] Docker Compose works
- [x] Portainer works
- [x] Uptime Kuma works
- [x] AdGuard Home setup works
- [x] Homepage Dashboard works
- [x] README.md exists
- [x] `docker ps` proof screenshot captured
- [x] Phase 1 screenshots are saved neatly

## Current Phase 1 Status

- [x] Install VirtualBox
- [x] Download Ubuntu Server ISO
- [x] Create VM named `homelab-ubuntu`
- [x] Set VM network to Bridged Adapter
- [x] Install Ubuntu Server manually
- [x] Create Linux user: `USERNAME`
- [x] Enable OpenSSH Server
- [x] Boot into Ubuntu Server
- [x] Confirm VM IP: `LAN_VM_IP`
- [x] SSH from Windows PowerShell works
- [x] Update/upgrade Ubuntu
- [x] Reboot and reconnect successfully
- [x] Install basic tools
- [x] Install Docker and Docker Compose
- [x] Test Docker with `hello-world`
- [x] Deploy Portainer
- [x] Deploy Uptime Kuma
- [x] Deploy AdGuard Home
- [x] Deploy Homepage Dashboard
- [x] Create folder structure and README
- [x] Save Phase 1 screenshots neatly
- [x] Document architecture, services, ports, lessons learned

## Current Phase 2 Status

- [x] Tailscale installed on Ubuntu VM
- [x] Tailscale installed on Windows
- [x] Ubuntu VM and Windows host visible in Tailscale admin console
- [x] SSH works over LAN IP: `ssh USERNAME@LAN_VM_IP`
- [x] SSH works over Tailscale IP: `ssh USERNAME@TAILSCALE_VM_IP`
- [x] Browser access works over LAN IP
- [x] Browser access works over Tailscale IP
- [x] UFW installed and enabled
- [x] Required service ports allowed
- [x] Inbound traffic allowed on `tailscale0`
- [x] Backup script created and tested
- [x] Backup archive contents verified
- [x] Save Phase 2 screenshots neatly
- [ ] Optional SSH hardening

## Current Phase 5 Status

- [x] Phase 5 planning/runbook created
- [ ] Confirm Windows Server ISO/licensing/evaluation path
- [x] Confirm available host RAM and disk space
- [ ] Decide VirtualBox network mode
- [ ] Create Windows Server VM
- [ ] Install Active Directory Domain Services
- [ ] Promote server to Domain Controller
- [ ] Create Windows client VM
- [ ] Join Windows client to domain
- [ ] Test Group Policy
- [ ] Review Windows security events
- [ ] Save Phase 5 screenshots neatly

Phase 5 starts from `docs/phase-5-active-directory-plan.md`.

## Do Not Start Yet

- Raspberry Pi 5 cyberdeck
- Wazuh
- Cloud networking
- AWS/Azure
- Advanced security monitoring

## Future Phase

After the homelab works, buy/build a Raspberry Pi 5 cyberdeck as a portable admin/security console.

Cyberdeck role:

- SSH into homelab
- Connect through Tailscale/VPN
- Open dashboards
- Run `nmap`, `dig`, `curl`, `ping`, and `traceroute`
- Access security alerts later
- Manage cloud VM later
- Store offline command notes/playbooks
