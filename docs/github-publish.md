# GitHub Publish Notes

## Current State

The project is ready to publish after Git tooling is available.

Git was not available in the current Windows command environment:

```text
git: The term 'git' is not recognized
```

GitHub CLI was also not available:

```text
gh: not found
```

## Recommended Repo Name

```text
desktop-homelab-foundation
```

## Before Publishing

- Confirm screenshots do not expose passwords, tokens, private keys, or recovery codes.
- The Tailscale screenshot has been redacted.
- Keep the repository private if you want to avoid exposing private LAN/Tailscale addressing in documentation and screenshots.
- Do not commit backup archives.

## Option A: GitHub Desktop

1. Open GitHub Desktop.
2. Choose `File -> Add local repository`.
3. Select:

```text
C:\Users\USERNAME\OneDrive\Documents\Desktop PC Homelab Foundation
```

4. If prompted, create a repository.
5. Commit with a message like:

```text
Document desktop homelab foundation
```

6. Publish to GitHub.

## Option B: Git CLI

Install Git for Windows, then run:

```powershell
cd "C:\Users\USERNAME\OneDrive\Documents\Desktop PC Homelab Foundation"
git init
git add .
git commit -m "Document desktop homelab foundation"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/desktop-homelab-foundation.git
git push -u origin main
```

If the repo already exists locally:

```powershell
git status
git add .
git commit -m "Polish homelab docs for GitHub"
git push
```

## Suggested Repository Description

```text
Windows-hosted Ubuntu Server homelab with Docker Compose, Portainer, Uptime Kuma, AdGuard Home, Homepage, Tailscale, UFW, backups, and documentation.
```
