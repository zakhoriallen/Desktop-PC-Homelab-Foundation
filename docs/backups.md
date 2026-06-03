# Backups

## Backup Script

Path:

```text
~/homelab/scripts/backup-homelab.sh
```

Local project copy:

```text
scripts/backup-homelab.sh
```

## What It Backs Up

- `~/homelab/stacks`
- `~/homelab/docs`
- `~/homelab/README.md`

## Tested Backup

```text
~/homelab/backups/homelab-backup-2026-06-02_05-58-28.tar.gz
~/homelab/backups/homelab-backup-2026-06-02_18-24-33.tar.gz
```

## Verification Command

```bash
tar -tzf ~/homelab/backups/homelab-backup-2026-06-02_05-58-28.tar.gz | head -30
```

Latest backup listing:

```bash
ls -lh ~/homelab/backups
```

Current backups:

```text
homelab-backup-2026-06-02_05-58-28.tar.gz
homelab-backup-2026-06-02_18-24-33.tar.gz
```

## Verified Contents

The backup archive includes:

- `home/khoto/homelab/stacks/`
- `home/khoto/homelab/docs/`
- `home/khoto/homelab/README.md`

## Next Backup Improvements

- Copy backups from VM storage to HDD.
- Keep multiple dated backups.
- Test restoring into a temporary folder.
- Avoid storing secrets in backup-visible documentation.
