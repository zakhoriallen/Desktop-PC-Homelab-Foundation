# Resume Bullets

## Short Version

- Built a private desktop homelab using VirtualBox, Ubuntu Server, Docker Compose, Tailscale, UFW, and self-hosted infrastructure services.
- Deployed and documented Portainer, Uptime Kuma, AdGuard Home, and Homepage Dashboard with local and Tailscale-based access.
- Implemented baseline firewall rules, uptime monitoring, backup scripting, and troubleshooting documentation for a containerized homelab environment.

## Detailed Version

- Designed and deployed a Windows-hosted homelab using VirtualBox, Ubuntu Server, Docker Engine, and Docker Compose to run multiple self-hosted infrastructure services.
- Configured bridged networking, SSH access, Tailscale private remote access, and UFW firewall rules to keep services private while allowing secure remote administration.
- Deployed Portainer for container management, Uptime Kuma for service monitoring, AdGuard Home for DNS filtering, and Homepage as a centralized dashboard.
- Built and tested a Bash backup script for Docker Compose stacks and documentation, then verified backup archive contents using Linux command-line tools.
- Documented system architecture, ports, service URLs, screenshots, troubleshooting notes, lessons learned, and security constraints for portfolio and operational use.

## Interview Talking Points

- Why bridged networking was better than NAT for this use case.
- How Docker Compose stacks were organized and managed.
- How Tailscale provides remote access without public port exposure.
- Why AdGuard DNS should be tested on one client before router-wide deployment.
- What Uptime Kuma revealed about self-signed certificates and monitor configuration.
- How backups were scoped to configuration and documentation instead of container runtime data.

