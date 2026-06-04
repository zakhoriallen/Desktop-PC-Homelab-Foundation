# Wazuh Planning

## Purpose

Wazuh is being considered as a future SIEM and security monitoring layer for this homelab. It has not been installed yet.

The current goal is to document whether Wazuh should be added later, what the tradeoffs are, and which deployment option makes the most sense based on current resources.

## Current Resource Snapshot

Resource check evidence:

```text
docs/screenshots/15-resource-check-before-wazuh.png
```

Current observations from the Phase 4 resource check:

- VM memory: about 7.3 GiB total.
- Available memory during the check: about 6.3 GiB.
- Root filesystem free space: about 47 GiB available.
- Current Docker services are lightweight.
- Current containers include Homepage, AdGuard Home, Uptime Kuma, and Portainer.

Commands used:

```bash
free -h
df -h
docker stats --no-stream
htop
```

## Wazuh Deployment Options

### Option A: Same Ubuntu VM

Run Wazuh on the existing Ubuntu Server VM.

Pros:

- Simpler architecture.
- Uses the current homelab foundation.
- Fewer VMs to manage.
- Easier to access through the existing private network setup.

Cons:

- May add CPU, RAM, and disk pressure to the current VM.
- Wazuh indexing and logs can grow over time.
- Troubleshooting is harder if Wazuh affects existing services.
- A bad Wazuh configuration could impact the current monitoring stack.

### Option B: Separate Ubuntu Security VM

Create a second Ubuntu VM dedicated to Wazuh/security monitoring.

Pros:

- Cleaner separation between core services and security monitoring.
- Better portfolio architecture because it shows segmented lab design.
- Easier rollback if the Wazuh VM breaks or becomes too resource-heavy.
- Easier to tune CPU, RAM, and disk separately.

Cons:

- Uses more host RAM and storage.
- Adds another VM to maintain.
- Requires additional documentation, firewall rules, and backup planning.
- May be more complex than needed for the current phase.

### Option C: Defer Wazuh and Keep Lightweight Monitoring

Continue Phase 4 with existing tools: SSH logs, Docker logs, Uptime Kuma alerts, and resource checks.

Pros:

- Stable and simple.
- Less resource-heavy.
- Keeps the current homelab focused and reliable.
- Builds strong fundamentals before adding a larger SIEM stack.

Cons:

- Less direct SIEM experience.
- Fewer centralized log analysis features.
- No Wazuh dashboard, agents, rule engine, or alert correlation yet.

## Risks and Tradeoffs

- Wazuh can be resource-heavy compared with the current services.
- Logs and indexing can increase disk usage over time.
- More containers and services mean more maintenance.
- Wazuh should not be installed until backups and restore testing are solid.
- Adding a SIEM before the foundation is stable can make troubleshooting harder.

## Current Decision

Do not install Wazuh yet.

Keep Phase 4 lightweight for now. The current monitoring workflow uses:

- SSH log review.
- Docker log review.
- Uptime Kuma service monitoring.
- Uptime Kuma email alerting.
- Resource checks before heavier service deployment.

## Future Install Criteria

Only consider Wazuh installation after:

- [x] Backup restore test completed
- [ ] VM resource usage remains stable
- [ ] Enough disk space is confirmed
- [ ] Decision made: same VM or separate security VM
- [ ] Install steps are documented before execution

Backup restore proof:

```text
docs/screenshots/16-backup-restore-test.png
```

## Resume Value

Phase 4 currently demonstrates lightweight blue-team monitoring through SSH log review, Docker log review, service monitoring, alerting, and resource planning before SIEM deployment.
