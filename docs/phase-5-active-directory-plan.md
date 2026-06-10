# Phase 5: Windows Server + Active Directory Lab

## Purpose

Phase 5 builds a small enterprise identity lab on the existing Windows desktop homelab. The focus is Windows Server administration, Active Directory Domain Services, DNS, users, groups, OUs, Group Policy, domain joining, authentication testing, and Windows event log review.

This phase should stay private/local. Do not expose Active Directory, DNS, LDAP, Kerberos, SMB, WinRM, or RDP directly to the public internet.

## Current Decision

- Phase 4 is complete and ready to hand off into Phase 5.
- Start with planning, resource checks, ISO download, and VM design.
- Do not change router-wide DNS for this phase.
- Keep AdGuard Home and Ubuntu Docker services independent from the Windows domain unless a later integration is intentionally planned.
- Do not store domain passwords, recovery keys, license keys, private IPs, or secrets in this repo.

## Planned Architecture

```text
Windows Desktop Host
-> VirtualBox
   |-> homelab-ubuntu
   |   |-> Docker services
   |   |-> Uptime Kuma
   |   |-> AdGuard Home
   |   `-> Homepage
   |-> Windows Server VM
   |   |-> Active Directory Domain Services
   |   |-> DNS
   |   `-> Domain Controller
   `-> Windows Client VM
       `-> Domain-joined test workstation
```

## Lab Naming Placeholders

Use placeholders in public documentation and screenshots:

| Item | Placeholder |
| --- | --- |
| Domain name | `DOMAIN_NAME` |
| NetBIOS name | `NETBIOS_NAME` |
| Domain Controller hostname | `DC_HOSTNAME` |
| Domain Controller IP | `DC_IP` |
| Windows client hostname | `CLIENT_HOSTNAME` |
| Windows client IP | `CLIENT_IP` |
| Lab user | `LAB_USERNAME` |
| Admin user | `LAB_ADMIN_USERNAME` |

Suggested private lab pattern:

- Domain: `homelab.local` or another lab-only internal name.
- Domain Controller: `DC01`.
- Client: `WIN10-CLIENT01` or `WIN11-CLIENT01`.

Do not use a real public domain name unless the lab is intentionally designed for that later.

## Resource Plan

Host hardware:

- CPU: AMD Ryzen 7 3700X
- RAM: 48 GB
- GPU: Intel Arc A770 16 GB
- Storage: 1.84 TB total, about 570 GB used at Phase 5 preflight
- SSD: 954 GB TEAM T2531TB for VM and active services
- HDD: 932 GB WDC WD10EZEX for backups, ISOs, screenshots, and documentation
- Current Ubuntu VM: 4 CPU cores, 8 GB RAM, 120 GB disk

Suggested starting allocation:

| VM | CPU | RAM | Disk |
| --- | ---: | ---: | ---: |
| Windows Server Domain Controller | 2 cores | 4-6 GB | 80-120 GB |
| Windows Client | 2 cores | 4 GB | 60-80 GB |

Current headroom is enough for the planned Phase 5 lab if the Windows Server VM is started first and the client VM is added only after the Domain Controller and DNS are stable.

## Network Decision

Recommended starting approach:

- Use a private VirtualBox lab network if the goal is maximum isolation.
- Use bridged networking only if the Domain Controller needs to be reachable from the physical Windows host or other local devices during testing.
- Keep the home router DNS unchanged.
- Keep AdGuard Home DNS unchanged.
- Configure only the Windows client VM to use the Domain Controller as DNS during the domain-join test.

Decision to make before install:

| Option | Use When | Tradeoff |
| --- | --- | --- |
| Internal Network | Best isolation for AD practice | Host cannot reach the lab without extra adapter/routing |
| Host-only Adapter | Host can manage lab privately | Lab may need a second NAT adapter for internet updates |
| Bridged Adapter | Simple LAN reachability | More care needed to avoid affecting home network DNS |

Recommended for this phase: host-only plus NAT if VirtualBox networking is available and easy to manage. If that becomes too much friction, use bridged networking but keep DNS changes limited to the Windows client VM.

## Phase 5 Build Checklist

### 1. Preflight

- [x] Confirm available SSD/HDD space for Windows Server and client VM disks.
- [x] Confirm current host RAM headroom before adding new VMs.
- [ ] Decide VirtualBox network mode.
- [ ] Download Windows Server evaluation ISO.
- [ ] Download Windows client evaluation ISO if a separate client VM will be used.
- [ ] Create a documentation folder for Phase 5 screenshots.
- [ ] Confirm no credentials, keys, or license values will be captured in screenshots.

### 2. Windows Server VM

- [ ] Create Windows Server VM in VirtualBox.
- [ ] Assign 2 CPU cores.
- [ ] Assign 4-6 GB RAM.
- [ ] Assign 80-120 GB disk.
- [ ] Attach Windows Server ISO.
- [ ] Install Windows Server with Desktop Experience unless practicing Server Core intentionally.
- [ ] Install VirtualBox Guest Additions if needed.
- [ ] Rename server to `DC_HOSTNAME`.
- [ ] Configure static IP as `DC_IP`.
- [ ] Set DNS on the server to itself after AD DS/DNS is installed.
- [ ] Run Windows Update.
- [ ] Capture server VM settings and installed-server proof screenshots.

### 3. AD DS + DNS

- [ ] Add the Active Directory Domain Services role.
- [ ] Include DNS Server role when promoting the Domain Controller.
- [ ] Promote the server to a new forest.
- [ ] Create `DOMAIN_NAME`.
- [ ] Reboot after promotion.
- [ ] Confirm DNS Manager opens.
- [ ] Confirm Active Directory Users and Computers opens.
- [ ] Confirm the server resolves the domain name.
- [ ] Capture AD DS, DNS, and Domain Controller proof screenshots.

### 4. OU, Users, And Groups

- [ ] Create a top-level lab OU structure.
- [ ] Create a test user account.
- [ ] Create a test admin account only if needed.
- [ ] Create a security group.
- [ ] Add the test user to the group.
- [ ] Document the OU and group naming pattern.
- [ ] Capture Active Directory Users and Computers proof screenshot.

Suggested OU structure:

```text
DOMAIN_NAME
`-- Homelab
    |-- Users
    |-- Groups
    |-- Workstations
    `-- Servers
```

### 5. Windows Client VM

- [ ] Create Windows client VM.
- [ ] Assign 2 CPU cores.
- [ ] Assign 4 GB RAM.
- [ ] Assign 60-80 GB disk.
- [ ] Attach Windows client ISO.
- [ ] Install Windows client OS.
- [ ] Rename client to `CLIENT_HOSTNAME`.
- [ ] Configure client DNS to point to `DC_IP`.
- [ ] Join client to `DOMAIN_NAME`.
- [ ] Reboot.
- [ ] Log in as `DOMAIN_NAME\LAB_USERNAME`.
- [ ] Capture domain join and login proof screenshots.

### 6. Group Policy Test

- [ ] Open Group Policy Management.
- [ ] Create a simple test GPO.
- [ ] Link it to the lab workstation OU.
- [ ] Apply a low-risk setting such as a desktop wallpaper, password policy observation, or control panel restriction.
- [ ] Run `gpupdate /force` on the client.
- [ ] Run `gpresult /r` or `gpresult /h` on the client.
- [ ] Capture GPO proof screenshot.

### 7. Event Log Review

- [ ] Review Domain Controller security logs.
- [ ] Find successful domain login events.
- [ ] Find failed login events if a safe test is performed.
- [ ] Review DNS Server logs if enabled.
- [ ] Document normal vs suspicious examples.
- [ ] Capture Event Viewer proof screenshots with sensitive values redacted.

Useful event IDs to learn:

| Event ID | Meaning |
| ---: | --- |
| 4624 | Successful logon |
| 4625 | Failed logon |
| 4634 | Logoff |
| 4720 | User account created |
| 4726 | User account deleted |
| 4732 | Member added to local group |
| 4740 | Account lockout |

### 8. Documentation And Wrap-Up

- [ ] Add screenshots to `docs/screenshots/`.
- [ ] Update README status.
- [ ] Update `docs/project-context.md`.
- [ ] Add a Phase 5 summary under `docs/phases/`.
- [ ] Add troubleshooting notes.
- [ ] Add resume bullet examples for Active Directory practice.
- [ ] Run a credential/sensitive-value review before publishing.
- [ ] Commit Phase 5 documentation.

## Success Criteria

Phase 5 is complete when:

- [ ] Windows Server VM is installed.
- [ ] Server hostname and static IP are documented with placeholders.
- [ ] AD DS and DNS are installed.
- [ ] A new lab domain exists.
- [ ] OU, user, and group structure exists.
- [ ] Windows client VM is joined to the domain.
- [ ] Domain user login is tested.
- [ ] A simple GPO is applied and verified.
- [ ] Relevant Windows security events are reviewed.
- [ ] Screenshots are saved and redacted.
- [ ] README and phase summary are updated.

## Rollback Plan

- Take VirtualBox snapshots before AD DS promotion and before joining the client.
- If domain promotion fails, revert the Windows Server VM snapshot rather than trying repeated partial fixes.
- If client domain join fails, confirm DNS first. The client must use the Domain Controller as DNS.
- Do not point the home router, host OS, or AdGuard Home to the Domain Controller until a separate future integration plan exists.

## Safety Rules

- Do not expose AD, DNS, LDAP, Kerberos, SMB, RDP, or WinRM to the public internet.
- Do not reuse real personal passwords.
- Do not commit secrets, private keys, tokens, recovery keys, license keys, `.env` files, or backup archives.
- Redact screenshots before publishing.
- Use placeholders such as `DOMAIN_NAME`, `DC_IP`, `CLIENT_IP`, and `LAB_USERNAME`.
- Keep this phase isolated from router-wide DNS and production devices.

## Future Expansion Ideas

- Add Windows Server event forwarding.
- Add Wazuh Windows agent later if the SIEM phase is approved.
- Add basic PowerShell administration scripts.
- Add file share permissions practice.
- Add least-privilege admin delegation practice.
- Add backup and restore practice for AD documentation and VM snapshots.
