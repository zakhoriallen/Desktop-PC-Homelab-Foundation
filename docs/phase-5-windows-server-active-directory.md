# Phase 5: Windows Server And Active Directory Lab

This is the short supporting note for Phase 5. The main build plan and checklist are in [phase-5-active-directory-plan.md](phase-5-active-directory-plan.md).

## Status

- Phase: ready to start
- Phase 4 is complete.
- Wazuh remains planned but not installed.
- Router-wide AdGuard DNS remains deferred.

## Objective

Build a small private Windows Server and Active Directory practice environment after the Linux/Docker homelab foundation.

## Scope

- Windows Server VM
- Active Directory Domain Services
- DNS for the lab domain
- OU, user, and group practice
- Windows client VM
- Domain join and domain login test
- Simple Group Policy test
- Windows Event Viewer review

## Out Of Scope For Now

- Router-wide DNS changes
- Public exposure of domain services
- Real production devices joined to the domain
- Wazuh Windows agent deployment
- Azure AD / Entra ID integration

## Starting Point

Begin with the preflight section in [phase-5-active-directory-plan.md](phase-5-active-directory-plan.md):

1. Confirm host RAM and disk space.
2. Decide VirtualBox network mode.
3. Download the Windows Server evaluation ISO.
4. Create the Windows Server VM.
5. Install AD DS and DNS only after the VM is stable.

## Safety Rules

- Keep the domain lab private.
- Do not expose AD, DNS, LDAP, Kerberos, SMB, RDP, or WinRM to the public internet.
- Do not use real personal passwords.
- Do not commit credentials, license keys, tokens, private keys, `.env` files, or backup archives.
- Use placeholders such as `DOMAIN_NAME`, `DC_IP`, `CLIENT_IP`, and `LAB_USERNAME`.
