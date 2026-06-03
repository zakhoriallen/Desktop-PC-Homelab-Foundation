# Network Notes

## Current VM

- VM name: `homelab-ubuntu`
- Host OS: Windows
- VM network mode: Bridged Adapter
- Ubuntu username: `USERNAME`
- VM IP address: `LAN_VM_IP`
- Tailscale VM IP address: `TAILSCALE_VM_IP`

## Commands

Find Ubuntu IP:

```bash
hostname -I
ip addr
```

Test from Windows PowerShell:

```powershell
ping LAN_VM_IP
ssh USERNAME@LAN_VM_IP
ssh USERNAME@TAILSCALE_VM_IP
```

## Service Ports

| Service | Port | Protocol |
| --- | --- | --- |
| SSH | 22 | TCP |
| Portainer | 9443 | TCP/HTTPS |
| Uptime Kuma | 3001 | TCP/HTTP |
| AdGuard Home setup | 3000 | TCP/HTTP |
| AdGuard Home admin | 8080 | TCP/HTTP |
| AdGuard DNS | 53 | TCP/UDP |
| Homepage | 3002 | TCP/HTTP |

## Current Service URLs

| Service | URL | Status |
| --- | --- | --- |
| Portainer | `https://LAN_VM_IP:9443` | Running |
| Uptime Kuma | `http://LAN_VM_IP:3001` | Running and monitoring all services |
| AdGuard Home | `http://LAN_VM_IP:3000` | Running, protection enabled |
| Homepage | `http://LAN_VM_IP:3002` | Running |

## Tailscale Service URLs

| Service | URL |
| --- | --- |
| Portainer | `https://TAILSCALE_VM_IP:9443` |
| Uptime Kuma | `http://TAILSCALE_VM_IP:3001` |
| AdGuard Home | `http://TAILSCALE_VM_IP:3000` |
| Homepage | `http://TAILSCALE_VM_IP:3002` |

## UFW Rules

UFW is active.

Allowed:

- `22/tcp` for SSH
- `3000/tcp` for AdGuard Home dashboard
- `3001/tcp` for Uptime Kuma
- `3002/tcp` for Homepage
- `9443/tcp` for Portainer
- `53/tcp` for DNS
- `53/udp` for DNS
- inbound traffic on `tailscale0`

## AdGuard Home Port 53 Note

AdGuard Home needs port `53` for DNS. On some Ubuntu installs, `systemd-resolved` may already be listening on `127.0.0.53:53`.

Check what is using port `53`:

```bash
sudo ss -tulpn | grep ':53'
```

AdGuard Home is currently configured to bind DNS on `LAN_VM_IP:53` to avoid conflicting with Ubuntu's loopback resolver.

Do not change router-wide DNS until AdGuard DNS is tested from one client first.
