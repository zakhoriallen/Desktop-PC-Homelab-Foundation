# Phase 5: Windows Server And Active Directory Lab

Goal: build a small Windows Server and Active Directory practice environment after the Linux/Docker homelab foundation is stable.

## Status

- Phase: planned
- Do not deploy until Phase 4 planning is complete and VM resource capacity is reviewed.

## Objectives

- Learn Windows Server administration.
- Create a small Active Directory domain.
- Practice users, groups, OUs, DNS, and Group Policy.
- Understand Windows event logs and basic domain security.
- Later connect Windows telemetry into security monitoring.

## Proposed Architecture

```text
Windows Host
-> VirtualBox
   |-> homelab-ubuntu
   |   `-> Docker services
   `-> Windows Server VM
       `-> Active Directory Domain Services
```

## VM Planning

Suggested starting resources:

- CPU: 2 cores
- RAM: 4-6 GB
- Disk: 80-120 GB
- Network: bridged or isolated lab network, depending on safety goals

## Preflight Checklist

- [ ] Confirm Windows Server ISO/licensing/evaluation path
- [ ] Confirm available host RAM and disk space
- [ ] Decide network mode
- [ ] Create a backup/checkpoint before major changes
- [ ] Document domain name choice
- [ ] Do not reuse real passwords

## Deployment Rules

- Keep the domain lab private.
- Do not expose domain services to the public internet.
- Use lab-only usernames and passwords.
- Document everything without storing credentials.
- Avoid changing the main home router DNS for AD until the lab design is clear.

## Success Criteria

- [ ] Windows Server VM installed
- [ ] Static/private lab IP documented
- [ ] AD DS installed
- [ ] Domain created
- [ ] Test user created
- [ ] Test Windows client joined, if added
- [ ] Basic GPO tested
- [ ] Documentation and screenshots saved

