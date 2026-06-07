# AdGuard DNS Testing

## Purpose

This test proves that AdGuard Home is not just installed, but actually functioning as a DNS resolver and filtering service for a test device.

The goal is to validate DNS behavior safely before making any router-wide DNS changes.

## Safety Approach

- Test one device first.
- Do not change router-wide DNS yet.
- Keep Windows using AdGuard DNS for 24-48 hours to test stability before expanding.
- Keep rollback instructions documented.
- Keep AdGuard private/local.
- Use Tailscale for dashboard access, not public exposure.
- Use placeholders in public documentation:

```text
LAN_VM_IP
TAILSCALE_VM_IP
USERNAME
EMAIL_ADDRESS
```

## Manual DNS Test Commands

Manual DNS tests were run from the Ubuntu VM using placeholders in documentation:

```bash
nslookup google.com LAN_VM_IP
nslookup google.com TAILSCALE_VM_IP
nslookup doubleclick.net LAN_VM_IP
```

## Test Results

| Test | Result | Interpretation |
| --- | --- | --- |
| `nslookup google.com LAN_VM_IP` | Passed | AdGuard resolved a normal domain over LAN DNS. |
| `nslookup google.com TAILSCALE_VM_IP` | Failed with connection refused | AdGuard DNS is not currently listening or reachable over the Tailscale IP on port 53. |
| `nslookup doubleclick.net LAN_VM_IP` | Returned `0.0.0.0` | AdGuard blocked/sinkholed an ad or tracker domain. |

Interpretation:

- AdGuard DNS works over LAN.
- AdGuard can resolve normal domains.
- AdGuard can block ad/tracker domains.
- AdGuard DNS over Tailscale is not enabled yet.
- Tailscale DNS access is documented as a later optional improvement.
- IPv4 DNS was tested first for simplicity and troubleshooting clarity.
- IPv6 DNS was not configured yet and is documented as a future improvement.

## Windows One-Device Test Plan

Run these from Windows PowerShell:

```powershell
nslookup google.com LAN_VM_IP
nslookup doubleclick.net LAN_VM_IP
```

Then temporarily set the Windows test device DNS:

```text
Preferred DNS server: LAN_VM_IP
Alternate DNS server: 1.1.1.1 or blank for a stricter test
```

Flush DNS:

```powershell
ipconfig /flushdns
```

Then test normal DNS behavior:

```powershell
nslookup google.com
nslookup doubleclick.net
```

Expected results:

- `google.com` resolves normally.
- `doubleclick.net` is blocked or sinkholed by AdGuard.
- AdGuard Query Log shows the Windows test device making DNS requests.

Windows DNS test evidence:

- Windows DNS cache was flushed with `ipconfig /flushdns`.
- `nslookup google.com` resolved through AdGuard DNS.
- `nslookup doubleclick.net` returned `0.0.0.0`.
- This confirms one-device DNS filtering worked without changing router-wide DNS.
- The Windows PC successfully used AdGuard as DNS over the LAN.

Screenshot:

```text
docs/screenshots/18-windows-dns-adguard-test.png
```

## AdGuard Query Log

The AdGuard Query Log should show:

- `google.com` allowed.
- `doubleclick.net` blocked or sinkholed.

Screenshot:

```text
docs/screenshots/17-adguard-query-log-manual-test.png
```

Status:

- [x] Query Log showed `google.com` processed/allowed.
- [x] Query Log showed `doubleclick.net` blocked/sinkholed.
- [x] Query Log screenshot saved/redacted.

## Rollback Instructions

If DNS breaks on Windows:

1. Open the active network adapter IPv4 DNS settings.
2. Select `Obtain DNS server address automatically`.
3. Run:

```powershell
ipconfig /flushdns
```

4. Confirm browsing works again.

## Uptime Kuma DNS Monitor

An Uptime Kuma DNS monitor was added after one-device DNS behavior was confirmed.

Monitor configuration:

```text
Name: AdGuard DNS
Type: DNS
Resolver: LAN_VM_IP
Port: 53
Hostname: google.com
```

Evidence:

- Uptime Kuma includes a dedicated monitor named `AdGuard DNS`.
- The monitor checks the `google.com` A record through AdGuard DNS.
- The AdGuard DNS monitor reports `Up`.
- Existing service monitors remain `Up`.

Screenshot:

```text
docs/screenshots/19-uptime-kuma-adguard-dns-monitor.png
```

## Screenshot Checklist

- [x] `docs/screenshots/17-adguard-query-log-manual-test.png`
- [x] `docs/screenshots/18-windows-dns-adguard-test.png`
- [x] `docs/screenshots/19-uptime-kuma-adguard-dns-monitor.png`

## Current Completion Status

- [x] Manual AdGuard DNS test completed
- [x] Windows one-device DNS test completed
- [x] AdGuard Query Log screenshot saved
- [x] Uptime Kuma AdGuard DNS monitor added
- [x] DNS monitor screenshot saved
- [x] Rollback steps documented
- [x] Router-wide DNS deferred
- [x] One-device AdGuard DNS filtering test evidence completed

## Future Improvements

- Router-wide DNS rollout after one-device testing stays stable for 24-48 hours.
- Tailscale DNS access investigation.
- IPv6 DNS handling.
- AdGuard DHCP mode only if router DNS options are limited.
- Add more blocklists carefully.
- Monitor query volume and false positives.
