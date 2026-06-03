# Phase 4 Checklist

## Public Repo Review

- [x] Final GitHub safety scan completed
- [x] No backup archives found
- [x] No `.env` file found
- [x] No private keys found
- [x] No secrets directory found
- [x] No shared password found
- [x] No real LAN IP found
- [x] No real Tailscale IP found
- [x] No account email found
- [ ] GitHub README reviewed in browser
- [ ] GitHub screenshots reviewed in browser
- [ ] GitHub docs links reviewed in browser
- [ ] Repository made public if clean

## Security Monitoring Prep

- [ ] Confirm current services are healthy in Uptime Kuma
- [ ] Run `docker ps`
- [ ] Run a fresh backup
- [ ] Verify backup archive contents
- [ ] Check memory with `free -h`
- [ ] Check disk with `df -h`
- [ ] Check load/processes with `htop`

## Log Review

- [ ] Check SSH service status
- [ ] Review SSH logs from the last 24 hours
- [ ] Review system logs from the last 24 hours
- [ ] Review Docker logs for Portainer
- [ ] Review Docker logs for Uptime Kuma
- [ ] Review Docker logs for AdGuard Home
- [ ] Review Docker logs for Homepage
- [ ] Document normal login behavior
- [ ] Document any failed login attempts

## Wazuh Research

- [ ] Research lightweight Wazuh deployment options
- [ ] Confirm VM has enough RAM/CPU/disk
- [ ] Decide current VM vs separate security VM
- [ ] Document expected ports and access method
- [ ] Do not deploy until backup is verified

## Documentation

- [x] Create `docs/security-monitoring.md`
- [x] Create `docs/phase-4-checklist.md`
- [ ] Add screenshots
- [ ] Update README with Phase 4 progress after log review
- [ ] Add troubleshooting notes
- [ ] Commit Phase 4 documentation changes

