# Phase 4 — Lightweight Security Monitoring, Backup Restore, AdGuard DNS Proof, and Wazuh Planning

## Purpose

Phase 4 added lightweight operational and security monitoring, alerting, backup restore proof, AdGuard DNS filtering proof, and Wazuh planning without installing a heavy SIEM yet.

## What Was Built

- SSH log review workflow.
- Docker log review workflow.
- Uptime Kuma service monitors.
- Uptime Kuma email alerting.
- Backup restore test.
- AdGuard DNS filtering proof.
- AdGuard DNS monitor.
- Wazuh readiness/resource check.
- Wazuh planning document.
- Port forwarding documentation showing it is possible but intentionally avoided.

## Evidence Screenshots

- `docs/screenshots/10-ssh-service-status.png`
- `docs/screenshots/11-ssh-accepted-logins.png`
- `docs/screenshots/12-ssh-failed-login-search.png`
- `docs/screenshots/13-docker-ps-phase-4.png`
- `docs/screenshots/14-uptime-kuma-notification-test.png`
- `docs/screenshots/15-resource-check-before-wazuh.png`
- `docs/screenshots/16-backup-restore-test.png`
- `docs/screenshots/17-adguard-query-log-manual-test.png`
- `docs/screenshots/18-windows-dns-adguard-test.png`
- `docs/screenshots/19-uptime-kuma-adguard-dns-monitor.png`

## What Broke / Troubleshooting

- Gmail SMTP failed with a normal password and required a Google App Password.
- Homepage previously needed allowed host configuration for LAN and Tailscale access.
- AdGuard DNS over Tailscale returned connection refused and was deferred.
- Backup restore testing initially used too shallow of a `find` max depth.
- SSH confusion occurred between Windows PowerShell and the Ubuntu SSH session.
- Router-wide DNS was intentionally not enabled yet.
- Screenshots were redacted and the documentation safety scan did not find exposed credentials.

## Lessons Learned

- Monitoring should test actual service function, not just web dashboards.
- A backup is not proven until it is restored.
- DNS filtering should be tested on one device before router-wide rollout.
- IPv4 DNS was validated first because it is simpler to troubleshoot.
- IPv6 DNS may require separate handling later.
- Wazuh should be planned carefully because it is heavier than the current lightweight stack.
- Public GitHub documentation must use placeholders and redacted screenshots.

## Current Final Phase 4 Status

- [x] Phase 4 complete
- [x] Wazuh planned but not installed
- [x] Router-wide DNS deferred
- [x] Ready for Phase 5 planning/build

## Resume Value

This phase demonstrates lightweight blue-team monitoring, service availability monitoring, alerting, backup/restore validation, DNS filtering, and SIEM planning.
