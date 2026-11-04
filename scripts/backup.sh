#!/bin/bash
# Folder backup with dated archives

#--CONFIGURATIONS
SOURCE_DIR="/home/arsh/lab/scripts"
BACKUP_DIR="/home/arsh/lab/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="backup_${DATE}.tar.gz"

# Make sure backup directry exists
mkdir -p "$BACKUP_DIR"

#perform compression using tar
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"


# Verify succcess
if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup saved to '${BACKUP_DIR}'"
else 
    echo "[ERROR] Backup process failed" >&2
    exit 1

fi



