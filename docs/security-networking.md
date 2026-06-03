# Security And Networking

## Access Model

Services are private/local. Remote access is provided by Tailscale, not by public port forwarding.

## IP Addresses

| Network | IP |
| --- | --- |
| LAN | `LAN_VM_IP` |
| Tailscale | `TAILSCALE_VM_IP` |

## SSH

LAN:

```powershell
ssh USERNAME@LAN_VM_IP
```

Tailscale:

```powershell
ssh USERNAME@TAILSCALE_VM_IP
```

## UFW Rules

Firewall status: active.

Allowed:

- `22/tcp`
- `3000/tcp`
- `3001/tcp`
- `3002/tcp`
- `9443/tcp`
- `53/tcp`
- `53/udp`
- inbound on `tailscale0`

## Homepage Allowed Hosts

Homepage works over LAN and Tailscale with:

```yaml
HOMEPAGE_ALLOWED_HOSTS: LAN_VM_IP:3002,TAILSCALE_VM_IP:3002
```

## Rules

- Do not expose services directly to the public internet.
- Use Tailscale for private remote access.
- Do not store passwords, keys, or secrets in docs.
- Do not point router DNS to AdGuard yet.
- Test AdGuard DNS from one device only before wider use.

