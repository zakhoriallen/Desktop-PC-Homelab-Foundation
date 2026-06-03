# Security Monitoring

Phase 4 adds a beginner blue-team layer to the homelab. The first step is not to install a heavy tool immediately. The first step is to learn what normal system, SSH, and Docker logs look like.

## Goals

- Review Linux system logs.
- Review SSH login behavior.
- Review Docker container logs.
- Document normal activity and suspicious activity.
- Add Wazuh or another SIEM-style tool only after resource checks.

## Resource Checks

Run these before adding Wazuh:

```bash
free -h
df -h
htop
docker ps
```

Record:

- Available memory
- Available disk space
- Current container count
- Current CPU load

## SSH Monitoring

Check the SSH service:

```bash
sudo systemctl status ssh --no-pager
```

Review SSH logs from the last 24 hours:

```bash
sudo journalctl -u ssh --since "24 hours ago"
```

Look for:

- Accepted logins
- Failed password attempts
- Unknown usernames
- Unexpected source IPs
- Repeated login attempts

## System Log Review

Recent system messages:

```bash
journalctl --since "24 hours ago" --no-pager
```

Boot messages:

```bash
journalctl -b --no-pager
```

Kernel messages:

```bash
journalctl -k --since "24 hours ago" --no-pager
```

## Docker Log Review

Check running containers:

```bash
docker ps
```

Review logs:

```bash
docker logs --tail 50 portainer
docker logs --tail 50 uptime-kuma
docker logs --tail 50 adguard-home
docker logs --tail 50 homepage
```

Look for:

- Restart loops
- Repeated errors
- Authentication failures
- Host validation errors
- DNS or port binding problems

## Incident Notes Template

Use this format for basic incident notes:

```text
Date/time:
System:
Log source:
What happened:
What looked normal:
What looked suspicious:
Command used:
Action taken:
Follow-up:
Screenshot saved:
```

## Wazuh Planning

Before deploying Wazuh:

- Confirm the VM has enough RAM and disk.
- Run a fresh backup.
- Verify the backup archive.
- Decide whether Wazuh belongs on the current VM or a separate security VM.
- Keep Wazuh private/local or reachable only through Tailscale.

## Success Criteria

- [ ] SSH logs reviewed
- [ ] Docker logs reviewed
- [ ] Normal login behavior documented
- [ ] Failed login behavior documented if present
- [ ] Incident notes template used at least once
- [ ] Screenshots saved
- [ ] Wazuh deployment decision made

