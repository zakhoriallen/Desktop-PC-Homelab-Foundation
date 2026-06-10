# Security Monitoring

Phase 4 completed the blue-team layer of the homelab with lightweight monitoring and evidence gathering. Wazuh is intentionally not installed yet; it is planned for a later decision after resource review.

The goal was to learn what normal activity looks like before adding a larger security monitoring platform.

## Scope

- Review SSH service health.
- Review SSH login logs.
- Search for failed and accepted SSH logins.
- Review Docker container status.
- Review Docker service logs.
- Verify Uptime Kuma email alerting.
- Validate backup restore proof.
- Validate AdGuard one-device DNS filtering.
- Add an Uptime Kuma AdGuard DNS monitor.
- Check VM resources before deciding whether to install Wazuh.
- Document examples of normal and suspicious activity.
- Save screenshots for proof of work.
- Keep all IP addresses, usernames, emails, passwords, tokens, and keys out of public documentation.

Use placeholders in notes and screenshots when needed:

```text
LAN_VM_IP
TAILSCALE_VM_IP
USERNAME
REMOTE_IP
SERVICE_NAME
EMAIL_ADDRESS
APP_PASSWORD_REDACTED
```

## SSH Log Review

Check SSH service status:

```bash
sudo systemctl status ssh --no-pager
```

Review SSH logs from the last 24 hours:

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

### Normal SSH Activity

Examples of normal SSH activity:

- An accepted login from a known local device.
- An accepted login from a known private VPN device.
- SSH service starting after a reboot.
- Short administrative sessions from `USERNAME`.

Example note:

```text
Normal: Accepted SSH login for USERNAME from REMOTE_IP during expected maintenance.
```

### Suspicious SSH Activity

Examples of suspicious SSH activity:

- Repeated failed password attempts.
- Login attempts for usernames that do not exist.
- SSH attempts from an unknown public IP address.
- Accepted login at an unexpected time.
- Many attempts in a short period.

Example note:

```text
Suspicious: Multiple failed SSH attempts for unknown users from REMOTE_IP.
```

## Docker Log Review

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

## Uptime Kuma Alerting Proof

Uptime Kuma email notifications were configured with Gmail SMTP and a Google App Password. Credential values are not stored in this repository.

Use placeholders when documenting notification settings:

```text
SMTP username: EMAIL_ADDRESS
SMTP password: APP_PASSWORD_REDACTED
```

Completed alerting proof:

- Uptime Kuma notification type: Email SMTP.
- Test notification result: `Sent Successfully`.
- Test email received in inbox.
- Evidence screenshot filename: `docs/screenshots/14-uptime-kuma-notification-test.png`.
- Real email address and credential values must be redacted before public commit.

Normal alerting activity:

- A manually triggered test notification arrives in the expected inbox.
- Uptime Kuma reports the notification test as successful.
- The email subject and body match the expected test message.

Suspicious alerting activity:

- Notification settings change unexpectedly.
- Test messages are sent to an unknown address.
- SMTP authentication failures repeat in logs.
- Alerts are disabled without a documented reason.

## Wazuh Readiness Resource Check

Wazuh has not been installed yet. Phase 4 completed the resource check and deferred Wazuh installation because the lightweight monitoring baseline is stable and sufficient for this phase.

Commands used for the resource check:

```bash
free -h
df -h
docker stats --no-stream
htop
```

What to review:

- Available memory after the existing Docker services are running.
- Available disk space for Wazuh indexes, logs, and future growth.
- Current container CPU and memory usage.
- Overall load and active processes in `htop`.

Evidence screenshot:

```text
docs/screenshots/15-resource-check-before-wazuh.png
```

Decision:

- Keep Phase 4 lightweight.
- Plan Wazuh carefully before any install.
- Consider a same-VM deployment only after confirming resources.
- Consider a separate security monitoring VM if isolation is preferred.

### Normal Docker Activity

Examples of normal Docker activity:

- Containers show `Up` in `docker ps`.
- Health checks report healthy.
- Uptime Kuma records `200 OK` for monitored dashboards.
- AdGuard Home starts normally and reports DNS service availability.
- Homepage starts without host validation errors.

Example note:

```text
Normal: SERVICE_NAME container is running and recent logs show expected startup messages.
```

### Suspicious Docker Activity

Examples of suspicious Docker or service activity:

- A container repeatedly restarts.
- Logs show repeated authentication failures.
- Logs show unexpected admin account changes.
- Logs show unknown clients making repeated requests.
- Logs show port binding errors.
- Logs show host validation failures after a configuration change.
- A service is reachable from a network path that was not intended.

Example note:

```text
Suspicious: SERVICE_NAME shows repeated login failures or unexpected requests from REMOTE_IP.
```

## Screenshot Evidence

Completed screenshot evidence:

- SSH service status.
- Failed SSH login search.
- Accepted SSH login search.
- `docker ps` output.
- Docker logs for each core service.
- Uptime Kuma showing monitored services up.
- Uptime Kuma notification test email with the real address redacted.
- Wazuh readiness resource check before installation.
- Backup restore test.
- AdGuard Query Log proof.
- Windows one-device AdGuard DNS test.
- Uptime Kuma AdGuard DNS monitor.

Redact or avoid capturing:

- Real public IPs.
- Personal email addresses.
- Passwords.
- Tokens.
- Private keys.
- Unredacted Tailscale machine details.

## Incident Notes Template

Use this format for basic incident notes:

```text
Date/time:
System:
Log source:
Command used:
What happened:
What looked normal:
What looked suspicious:
Action taken:
Follow-up:
Screenshot saved:
```

## Wazuh Planning

Wazuh is a future step, not part of this completed lightweight workflow.

Detailed planning notes are available in [wazuh-planning.md](wazuh-planning.md).

Before installing Wazuh:

- Confirm the VM has enough RAM and disk.
- Run a fresh backup.
- Verify the backup archive.
- Decide whether Wazuh belongs on the current VM or a separate security VM.
- Keep Wazuh private/local or reachable only through Tailscale.

## Success Criteria

- [x] SSH service status documented
- [x] SSH logs reviewed
- [x] Failed login search documented
- [x] Accepted login search documented
- [x] Docker container status reviewed
- [x] Docker service logs reviewed
- [x] Uptime Kuma notification configured
- [x] Notification test sent successfully
- [x] Test email received
- [x] Evidence screenshot saved/redacted
- [x] Redacted notification screenshot added to repository
- [x] Wazuh readiness resource check documented
- [x] Resource check screenshot saved/redacted
- [x] Normal activity examples documented
- [x] Suspicious activity examples documented
- [x] Screenshots saved/redacted
- [x] README updated
- [x] Backup restore proof completed
- [x] AdGuard DNS filtering proof completed
- [x] Phase 4 summary written
- [x] Phase 4 complete
