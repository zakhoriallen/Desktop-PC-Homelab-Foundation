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
- [ ] Normal activity examples documented
- [ ] Suspicious activity examples documented
- [ ] Screenshots saved
- [ ] README updated
- [ ] Commit Phase 4 lightweight monitoring workflow

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
