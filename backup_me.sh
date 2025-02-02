#!/bin/bash

# Brendan Dileo - 2025-02-01
# Huge shoutout to @BugX for an awesome tutorial that made this script possible!

# Check if atleast two arguments are passed, the backup folder and atleast one file to backup
if [ $# -lt 2 ]; then
    echo "🚨 Oops! Looks like you forgot something."
    echo "To use: $0 <backup_directory> <file1> <file2> ... <fileN>"
    exit 1
fi

# Sets up the backup folder/directory and moves past the first argument so focus is on files
BACKUP_DIR="$1"
shift  

# Create the backup dir if it dosent exist already
mkdir -p "$BACKUP_DIR"

# Create the archive name by using the current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

# Check if the files passed as args exist
for file in "$@"; do
    if [ ! -e "$file" ]; then
        echo "❌ Can't find the file: '$file' – Please make sure it exists!"
        exit 1
    fi
done

# Creates the backup by creating the archive, and compressing the archive
echo "📦 Creating backup: $ARCHIVE_PATH..."
tar -czf "$ARCHIVE_PATH" "$@"

# Check if the backup was a success
if [ $? -eq 0 ]; then 
    echo "✅ Backup complete! File saved at: $ARCHIVE_PATH"
else 
    echo "❌ Uh oh! Something went wrong... Backup failed!"
    exit 1
fi

# Log the backup for reference
LOG_FILE="$BACKUP_DIR/backup_log.txt"
echo "$(date +"%Y-%m-%d %H:%M:%S") - Created: $ARCHIVE_NAME" >> "$LOG_FILE"

echo "📝 Logged the backup in: $LOG_FILE"

# Remove any old backups
RETENTION_DAYS="${BACKUP_RETENTION_DAYS:-7}"  # Default to 7 days if not set
echo "🧹 Tidying up... Removing backups older than $RETENTION_DAYS days."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +"$RETENTION_DAYS" -exec rm -v {} \;

echo "🎉 All done! Backup process finished."