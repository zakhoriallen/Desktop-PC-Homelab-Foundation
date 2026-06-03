# Architecture

## Overview

The homelab runs on a Windows desktop host using VirtualBox for virtualization. The Ubuntu Server VM provides Docker Engine and Docker Compose. Each core homelab service runs as a containerized Compose stack.

```text
Windows Desktop Host
-> VirtualBox
-> homelab-ubuntu
-> Docker Engine
-> Docker Compose stacks
-> Tailscale private remote access
```

## Network

- Network mode: VirtualBox Bridged Adapter
- VM IP: `LAN_VM_IP`
- Tailscale IP: `TAILSCALE_VM_IP`
- Access model: local LAN only
- Public exposure: none

Bridged networking lets the Ubuntu VM appear as a normal device on the local network, which makes SSH and dashboard access straightforward from Windows.

Tailscale adds private remote access without exposing services directly to the public internet.

## Service Layer

Docker Compose stacks live under:

```text
~/homelab/stacks/
```

Each service has its own directory and `docker-compose.yml` file.

## Security Layer

- UFW firewall is active.
- Required local service ports are allowed.
- Inbound traffic on `tailscale0` is allowed.
- Tailscale is used for private remote access.
- Services are not intentionally exposed to the public internet.

## Storage

- VM and active Docker services live on SSD-backed VM storage.
- Backups, screenshots, ISOs, and documentation are intended for HDD storage.
