# Troubleshooting Notes

## VirtualBox Networking

Problem: the VM initially received a NAT-style IP and was awkward to reach from Windows.

Fix: switched the VM network adapter to Bridged Adapter so the VM received a normal LAN address and could be reached with SSH and browser dashboards.

## Portainer Certificate Warning

Problem: Portainer uses HTTPS with a self-signed certificate on port `9443`, which can show as down in Uptime Kuma.

Fix: configured the Uptime Kuma monitor to ignore TLS/SSL errors for the local Portainer check.

## Homepage Host Validation

Problem: Homepage loaded over LAN but failed over Tailscale with a host validation error.

Fix: added both allowed hosts to the Homepage Compose environment:

```yaml
HOMEPAGE_ALLOWED_HOSTS: LAN_VM_IP:3002,TAILSCALE_VM_IP:3002
```

## AdGuard DNS

Problem: DNS services can conflict with Ubuntu's local resolver or affect the whole network if changed too early.

Fix: kept router DNS unchanged and documented that AdGuard should be tested from one client before router-wide rollout.

## UFW Firewall

Problem: enabling a firewall can lock out SSH or dashboards if ports are not allowed first.

Fix: allowed SSH, service ports, DNS ports, and inbound traffic on `tailscale0` before relying on UFW.

## Backups

Problem: Docker service configuration and documentation should be easy to recover.

Fix: created `scripts/backup-homelab.sh`, tested it, and verified archive contents with `tar -tzf`.

