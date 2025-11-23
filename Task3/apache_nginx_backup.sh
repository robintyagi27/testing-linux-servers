#!/bin/bash

BACKUP_DIR="$HOME/backups"
APACHE_BACKUP_DIR="$BACKUP_DIR/apache"
NGINX_BACKUP_DIR="$BACKUP_DIR/nginx"
# Ensure the backup directory exists
# Create backup directories if they do not exist
if [ ! -d "$APACHE_BACKUP_DIR" ]; then
    mkdir -p "$APACHE_BACKUP_DIR"
fi
if [ ! -d "$NGINX_BACKUP_DIR" ]; then
    mkdir -p "$NGINX_BACKUP_DIR"
fi
mkdir -p "$APACHE_BACKUP_DIR" "$NGINX_BACKUP_DIR"
# Backup script for Apache and Nginx configurations and web content

DATE=$(date +%F_%H-%M)


# Apache backup
if [ -d /etc/apache2 ] && [ -d /var/www/html ]; then
    BACKUP_DIR="$APACHE_BACKUP_DIR"
    LOGFILE="$BACKUP_DIR/backup_log_$DATE.txt"
    APACHE_BACKUP="$BACKUP_DIR/apache_backup_$DATE.tar.gz";
    # Create a backup of Apache configuration and web content
    tar -czf "$APACHE_BACKUP" /etc/apache2 /var/www/html 2>>"$LOGFILE"
    echo "[$(date)] Apache backup created: $APACHE_BACKUP" >> "$LOGFILE"
    # Verify integrity
    # checks if the archive can be read without errors
    tar -tzf "$APACHE_BACKUP" &>/dev/null 
    # If the command succeeds, it means the archive is valid
    if [ $? -eq 0 ]; then
        echo "[$(date)] Apache backup integrity: OK" >> "$LOGFILE"
    else
        echo "[$(date)] Apache backup integrity: FAILED" >> "$LOGFILE"
    fi
else
    echo "[$(date)] Apache directories not found. Skipping backup." >> "$LOGFILE"
    exit 1
fi

# Nginx backup
if [ -d /etc/nginx ] && [ -d /usr/share/nginx/html ]; then
    BACKUP_DIR="$NGINX_BACKUP_DIR"
    LOGFILE="$BACKUP_DIR/backup_log_$DATE.txt"
    NGINX_BACKUP="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"
    # Create a backup of Nginx configuration and web content
    tar -czf "$NGINX_BACKUP" /etc/nginx /usr/share/nginx/html 2>>"$LOGFILE"
    echo "[$(date)] Nginx backup created: $NGINX_BACKUP" >> "$LOGFILE"
    # Verify integrity
    # checks if the archive can be read without errors
    tar -tzf "$NGINX_BACKUP" &>/dev/null
    # If the command succeeds, it means the archive is valid
    if [ $? -eq 0 ]; then
        echo "[$(date)] Nginx backup integrity: OK" >> "$LOGFILE"
    else
        echo "[$(date)] Nginx backup integrity: FAILED" >> "$LOGFILE"
    fi
else
    echo "[$(date)] Nginx directories not found. Skipping backup." >> "$LOGFILE"
    exit 1
fi

echo "[$(date)] Backup job completed." >> "$LOGFILE"