#!/bin/bash
# Folder backup with dated archives

#--CONFIGURATIONS
if [[ $# -ne 1 ]]; then
    printf 'Usage: %s SOURCE_DIR\n' "$0" >&2
    exit 2
fi 

SOURCE_DIR=$1
BACKUP_DIR="/home/arsh/Documents/linux-lab/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="backup_${DATE}.tar.gz"

# If directry doesnt exist
if [[ ! -d "$SOURCE_DIR" ]]; then
    printf '[ERROR] Source directory does not exist: %s\n' "$SOURCE_DIR" >&2
    exit 1
fi

# Make sure backup directry exists
mkdir -p "$BACKUP_DIR"

#perform compression using tar and verify status
if tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" \
    -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then
    printf '[SUCCESS] Backup saved to %s\n' "$BACKUP_DIR/$ARCHIVE_NAME"
else
    printf '[ERROR] Backup process failed\n' >&2
    exit 1

fi






