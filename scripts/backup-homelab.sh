#!/usr/bin/env bash

set -e

BACKUP_DIR="$HOME/homelab/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT="$BACKUP_DIR/homelab-backup-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$OUTPUT" \
  "$HOME/homelab/stacks" \
  "$HOME/homelab/docs" \
  "$HOME/homelab/README.md"

echo "Backup created:"
echo "$OUTPUT"
