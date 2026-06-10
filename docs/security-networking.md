# Security And Networking

## Access Model

Services are private/local. Remote access is provided by Tailscale, not by public port forwarding.

Port forwarding is possible on many home networks, but it is intentionally avoided for this homelab. Services stay local/private, and remote access uses Tailscale.

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
- Treat router-wide DNS rollout, IPv6 DNS configuration, Wazuh installation, and Active Directory as future/deferred work.

## AdGuard One-Device DNS Test

AdGuard DNS was tested from one device before router-wide DNS changes.

Current results:

- `google.com` resolved normally through `LAN_VM_IP`.
- `doubleclick.net` returned `SINKHOLE_IP` through `LAN_VM_IP`.
- DNS over `TAILSCALE_VM_IP` returned connection refused and is not enabled yet.

Current decision:

- Use `LAN_VM_IP` for one-device DNS testing.
- Keep router-wide DNS deferred until a future rollout decision.
- Keep Tailscale for dashboard access.
- Do not expose AdGuard publicly.
- Do not point router DNS to AdGuard yet.
- IPv4 DNS was tested first for simplicity.
- IPv6 DNS handling is a future improvement.

Detailed test notes are in [adguard-dns-testing.md](adguard-dns-testing.md).
