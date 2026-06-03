# Lessons Learned

## VirtualBox Networking

Bridged Adapter was the right network mode for this phase. NAT gave the VM internet access, but bridged networking made SSH and browser access from Windows much simpler.

## Ubuntu Server Over Desktop

Ubuntu Server is the better fit for this homelab foundation because it uses fewer resources and keeps the VM focused on services rather than a desktop GUI.

## SSH First

Getting SSH working early made everything easier. Once SSH worked from Windows, Docker setup, service deployment, and troubleshooting could happen without relying on the VM console.

## Docker Compose Organization

Keeping each service in its own Compose stack under `~/homelab/stacks/` made the setup easier to manage and easier to inspect in Portainer.

## Portainer HTTPS

Portainer uses HTTPS on port `9443` with a self-signed certificate. That can briefly show as down in Uptime Kuma if certificate validation is strict. For a local-only Phase 1 build, this is acceptable.

## AdGuard DNS Port

Ubuntu may already use port `53` on loopback for its local resolver. Binding AdGuard DNS to the VM LAN IP avoids fighting Ubuntu's resolver.

## Homepage Host Validation

Homepage may reject access by IP and port unless `HOMEPAGE_ALLOWED_HOSTS` includes the host being used. The working value for this build is:

```text
HOMEPAGE_ALLOWED_HOSTS=LAN_VM_IP:3002,TAILSCALE_VM_IP:3002
```

## Tailscale

Tailscale solved remote access without opening public inbound ports. The VM can be reached by LAN IP or Tailscale IP:

```powershell
ssh USERNAME@LAN_VM_IP
ssh USERNAME@TAILSCALE_VM_IP
```

## UFW

UFW can be enabled safely after service ports are known. The important rule for Tailscale access is allowing inbound traffic on `tailscale0`.

## Backups

A small backup script is enough for the Phase 2 baseline. It captures:

- `~/homelab/stacks`
- `~/homelab/docs`
- `~/homelab/README.md`

The first tested backup was:

```text
~/homelab/backups/homelab-backup-2026-06-02_05-58-28.tar.gz
```

## Security

No services are exposed to the public internet. Passwords and secrets should stay out of documentation. The Linux password was changed after it was accidentally shared during setup.
