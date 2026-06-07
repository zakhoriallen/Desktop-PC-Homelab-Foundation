# Phase 4 Checklist

Phase 4 starts with lightweight security monitoring using existing Ubuntu and Docker logs. Wazuh is intentionally deferred until the baseline workflow is documented and understood.

## Lightweight Log Review Workflow

- [ ] SSH service status documented
- [ ] SSH logs reviewed
- [ ] Failed login search documented
- [ ] Accepted login search documented
- [ ] Docker container status reviewed
- [ ] Docker service logs reviewed
- [x] Uptime Kuma notification configured
- [x] Notification test sent successfully
- [x] Test email received
- [x] Evidence screenshot saved/redacted
- [x] Redacted notification screenshot added to repository
- [x] Wazuh readiness resource check documented
- [x] Resource check screenshot saved/redacted
- [x] Resource check before Wazuh completed
- [x] Wazuh planning documented
- [x] Wazuh install deferred
- [x] Backup restore test completed
- [ ] Wazuh deployment option selected
- [ ] Normal activity examples documented
- [ ] Suspicious activity examples documented
- [ ] Screenshots saved
- [ ] README updated
- [ ] Commit Phase 4 lightweight monitoring workflow

## AdGuard One-Device DNS Filtering Test

- [x] AdGuard DNS resolves normal domain over LAN
- [x] AdGuard blocks tracker/ad domain over LAN
- [x] Tailscale DNS access tested and documented as not enabled
- [x] Windows PowerShell DNS test completed
- [x] AdGuard Query Log screenshot saved
- [x] Temporary Windows DNS test completed
- [x] Rollback steps documented
- [x] Uptime Kuma AdGuard DNS monitor added
- [x] DNS monitor screenshot saved
- [x] One-device AdGuard DNS filtering test evidence completed
- [x] Manual AdGuard DNS test completed
- [x] Router-wide DNS deferred
- [x] IPv4 tested first; IPv6 DNS documented as future improvement

Evidence screenshots:

```text
docs/screenshots/17-adguard-query-log-manual-test.png
docs/screenshots/18-windows-dns-adguard-test.png
docs/screenshots/19-uptime-kuma-adguard-dns-monitor.png
```

## Commands To Run

Check SSH service:

```bash
sudo systemctl status ssh --no-pager
```

Review SSH logs from last 24 hours:

```bash
sudo journalctl -u ssh --since "24 hours ago"
```

Search for failed SSH attempts:

```bash
sudo journalctl -u ssh --since "24 hours ago" | grep -i "failed"
```

Search for accepted SSH logins:

```bash
sudo journalctl -u ssh --since "24 hours ago" | grep -i "accepted"
```

Review running Docker containers:

```bash
docker ps
```

Review service logs:

```bash
docker logs --tail 50 portainer
docker logs --tail 50 uptime-kuma
docker logs --tail 50 adguard-home
docker logs --tail 50 homepage
```

Follow logs live:

```bash
docker logs -f --tail 50 portainer
```

## Wazuh Readiness Resource Check

Wazuh has not been installed yet. The next decision is whether the current VM has enough CPU, RAM, and disk space for Wazuh or whether Phase 4 should stay lightweight.

- [x] Memory checked with `free -h`
- [x] Disk checked with `df -h`
- [x] Container resource usage checked with `docker stats --no-stream`
- [ ] Process/load view checked with `htop`
- [x] Evidence screenshot saved/redacted as `docs/screenshots/15-resource-check-before-wazuh.png`
- [ ] Decide whether to install Wazuh later, increase VM resources, or keep Phase 4 lightweight
- [x] Wazuh planning documented in `docs/wazuh-planning.md`
- [x] Wazuh install deferred
- [x] Backup restore test completed
- [ ] Wazuh deployment option selected

## Backup Restore Test

- [x] Backup archive listed successfully
- [x] Backup archive extracted safely into `~/homelab/restore-test`
- [x] Restored files found under `~/homelab/restore-test/home/USERNAME/homelab/`
- [x] Nested restore path documented
- [x] Evidence screenshot saved/redacted as `docs/screenshots/16-backup-restore-test.png`

Commands:

```bash
free -h
df -h
docker stats --no-stream
htop
```

## Alerting Proof

- [x] Uptime Kuma Email SMTP notification configured
- [x] Gmail SMTP authentication documented with placeholders only
- [x] Google App Password value omitted from documentation
- [x] Test notification returned `Sent Successfully`
- [x] Test email received in inbox
- [x] Evidence screenshot captured/redacted
- [x] Redacted screenshot added to repo as `docs/screenshots/14-uptime-kuma-notification-test.png`

Use placeholders only:

```text
EMAIL_ADDRESS
APP_PASSWORD_REDACTED
```

## Documentation Rules

- Use placeholders for real IPs, usernames, emails, and sensitive details.
- Do not store passwords, tokens, API keys, SSH keys, private keys, or `.env` files in the repo.
- Do not commit backup archives.
- Save screenshots only after checking that sensitive details are hidden or acceptable for public GitHub.
- Redact real email addresses from notification screenshots before committing.

## Suggested Commit Message

```text
Add Phase 4 lightweight security monitoring workflow
```
