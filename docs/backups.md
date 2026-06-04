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

- `home/USERNAME/homelab/stacks/`
- `home/USERNAME/homelab/docs/`
- `home/USERNAME/homelab/README.md`

## Restore Test

Backup restore testing was completed successfully.

Commands used:

```bash
tar -tzf ~/homelab/backups/homelab-backup-2026-06-02_18-24-33.tar.gz | head -30
tar -xzf ~/homelab/backups/homelab-backup-2026-06-02_18-24-33.tar.gz -C ~/homelab/restore-test
find ~/homelab/restore-test -type f | head -30
ls -la ~/homelab/restore-test/home/USERNAME/homelab
```

The archive was extracted safely into:

```text
~/homelab/restore-test
```

The restored files appeared under:

```text
~/homelab/restore-test/home/USERNAME/homelab/
```

Note: an initial `find` command with `-maxdepth 3` did not show files because the archive preserved the original home directory structure and restored files into a deeper nested path. This was expected.

Evidence screenshot:

```text
docs/screenshots/16-backup-restore-test.png
```

## Next Backup Improvements

- Copy backups from VM storage to HDD.
- Keep multiple dated backups.
- Repeat restore testing after major stack changes.
- Avoid storing secrets in backup-visible documentation.
