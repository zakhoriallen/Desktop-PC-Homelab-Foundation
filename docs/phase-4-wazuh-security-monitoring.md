# Phase 4: Security Monitoring With Wazuh

Goal: add security monitoring without destabilizing the working homelab foundation.

## Status

- Phase: planned
- Do not deploy until the current homelab backup is confirmed and the VM has enough free CPU/RAM/disk.

## Objectives

- Learn SIEM basics.
- Monitor the Ubuntu Server VM.
- Collect security events and system logs.
- Practice alert review and basic triage.
- Keep everything private/local or reachable only through Tailscale.

## Proposed Architecture

```text
Windows Host
-> VirtualBox
-> homelab-ubuntu
-> Docker
-> Wazuh Manager / Indexer / Dashboard
-> Wazuh Agent on monitored systems
```

## Resource Caution

Wazuh can be heavier than the current Phase 1/2 services. Before deployment:

- Confirm VM memory usage.
- Confirm free disk space.
- Consider increasing VM RAM if needed.
- Consider a separate VM if performance suffers.

## Preflight Checklist

- [ ] Confirm current services are healthy in Uptime Kuma
- [ ] Run `docker ps`
- [ ] Run a fresh homelab backup
- [ ] Verify backup archive contents
- [ ] Capture current VM resource usage
- [ ] Decide whether Wazuh runs on current VM or a separate security VM

## Deployment Rules

- Do not expose Wazuh to the public internet.
- Prefer Tailscale-only access for dashboards.
- Do not commit Wazuh credentials or enrollment keys.
- Document ports, URLs, and screenshots.
- Add Wazuh to Uptime Kuma only after it is stable.

## Success Criteria

- [ ] Wazuh dashboard reachable privately
- [ ] Ubuntu VM enrolled as an agent
- [ ] Basic security events visible
- [ ] Uptime Kuma monitor added
- [ ] Documentation updated
- [ ] Screenshots saved

