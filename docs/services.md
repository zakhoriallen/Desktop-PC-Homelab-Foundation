# Services

## Service Inventory

| Service | Container | Stack Directory | URL | Purpose |
| --- | --- | --- | --- | --- |
| Portainer | `portainer` | `~/homelab/stacks/portainer` | `https://LAN_VM_IP:9443` | Docker management |
| Uptime Kuma | `uptime-kuma` | `~/homelab/stacks/uptime-kuma` | `http://LAN_VM_IP:3001` | Uptime monitoring |
| AdGuard Home | `adguard-home` | `~/homelab/stacks/adguard-home` | `http://LAN_VM_IP:3000` | DNS filtering |
| Homepage | `homepage` | `~/homelab/stacks/homepage` | `http://LAN_VM_IP:3002` | Homelab dashboard |

## Tailscale URLs

| Service | URL |
| --- | --- |
| Portainer | `https://TAILSCALE_VM_IP:9443` |
| Uptime Kuma | `http://TAILSCALE_VM_IP:3001` |
| AdGuard Home | `http://TAILSCALE_VM_IP:3000` |
| Homepage | `http://TAILSCALE_VM_IP:3002` |

## Ports

| Port | Service | Protocol | Notes |
| --- | --- | --- | --- |
| 22 | SSH | TCP | Ubuntu VM remote shell |
| 9443 | Portainer | HTTPS/TCP | Self-signed certificate is expected |
| 3001 | Uptime Kuma | HTTP/TCP | Monitors all homelab services |
| 3000 | AdGuard Home | HTTP/TCP | Web dashboard |
| 53 | AdGuard Home | TCP/UDP | DNS service bound to `LAN_VM_IP` |
| 3002 | Homepage | HTTP/TCP | Dashboard web UI |

## Current Monitor State

Uptime Kuma is monitoring:

- AdGuard DNS
- AdGuard Home
- Homepage
- Portainer
- Uptime Kuma

Current dashboard proof shows the core service monitors up, including a dedicated AdGuard DNS monitor.

## Notes

- Portainer uses HTTPS with a self-signed certificate, so browser and monitor certificate warnings are expected unless a trusted local certificate is configured later.
- AdGuard Home is running, but router-wide DNS should wait until DNS behavior is tested from one client first.
- Manual DNS tests confirmed AdGuard can resolve normal domains and block at least one ad/tracker domain over `LAN_VM_IP`.
- DNS over `TAILSCALE_VM_IP` is not enabled yet and returned connection refused during testing.
- Uptime Kuma now includes a dedicated `AdGuard DNS` monitor that checks the `google.com` A record through AdGuard DNS.
- Router-wide DNS remains deferred while the Windows one-device test runs for 24-48 hours.
- IPv4 DNS was tested first; IPv6 DNS handling is a future improvement.
- Homepage required `HOMEPAGE_ALLOWED_HOSTS=LAN_VM_IP:3002,TAILSCALE_VM_IP:3002` to avoid host validation errors across LAN and Tailscale.
