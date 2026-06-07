# Phase 5: Windows Server + Active Directory Lab

## Purpose

Phase 5 will build an enterprise IT identity lab to practice Windows Server administration, Active Directory, DNS, users/groups, OUs, Group Policy, domain joining, and authentication basics.

This is planning documentation only. Windows Server should not be installed until explicitly started.

## Current Decision

- Do not start installing Windows Server yet.
- Keep the AdGuard one-device DNS test running for 24-48 hours before any router-wide DNS changes.
- Phase 5 planning can begin while AdGuard stability testing continues.
- Keep all future Active Directory services private/local.
- Do not store domain passwords, recovery keys, license keys, or secrets in this repo.

## Planned Architecture

```text
Windows Host
-> VirtualBox
   |-> Ubuntu Homelab VM
   |   `-> Docker services
   |-> Windows Server VM
   |   |-> Active Directory Domain Services
   |   |-> DNS
   |   `-> Domain Controller
   `-> Windows Client VM
       `-> Domain-joined test machine
```

## Phase 5 Checklist

- [ ] Download Windows Server evaluation ISO
- [ ] Create Windows Server VM
- [ ] Allocate CPU/RAM/storage carefully
- [ ] Install Windows Server
- [ ] Set hostname
- [ ] Assign static IP inside Windows Server VM
- [ ] Install Active Directory Domain Services
- [ ] Promote server to Domain Controller
- [ ] Create test domain
- [ ] Configure DNS
- [ ] Create OUs
- [ ] Create users and groups
- [ ] Create Windows Client VM
- [ ] Join Windows Client to domain
- [ ] Test domain login
- [ ] Create simple Group Policy
- [ ] Review login/security events
- [ ] Capture screenshots
- [ ] Update README/docs
- [ ] Commit Phase 5 documentation

## Learning Goals

- Windows Server basics
- Active Directory
- Domain Controller concepts
- DNS in enterprise networks
- Users, groups, and OUs
- Group Policy
- Authentication
- Windows event logs
- Identity and access management basics

## Planning Notes

- Start with a small lab design and avoid overloading the desktop host.
- Keep Active Directory DNS separate from home router DNS until the lab design is clear.
- Use lab-only domain names, users, groups, and passwords.
- Document architecture, IP placeholders, screenshots, and rollback notes.
- Keep the Ubuntu homelab services independent from the Windows domain unless a later integration is intentionally planned.

## Safety Rules

- Do not expose Windows Server, Active Directory, DNS, LDAP, Kerberos, SMB, or RDP directly to the public internet.
- Do not use real personal passwords.
- Do not commit credentials, license keys, tokens, private keys, `.env` files, or backup archives.
- Use placeholders such as `WINDOWS_SERVER_IP`, `WINDOWS_CLIENT_IP`, `DOMAIN_NAME`, and `USERNAME` in public documentation.

## Future Evidence To Capture

- Windows Server VM settings
- Windows Server installed and renamed
- Static IP configuration using placeholders
- AD DS role installation
- Domain Controller promotion
- DNS Manager
- Active Directory Users and Computers
- OU/user/group creation
- Windows Client domain join
- Domain login proof
- Group Policy proof
- Windows Event Viewer login/security events
