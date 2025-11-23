# APACHE_NGINUX_BKPUP.sh

This script automates the backup of Apache and Nginx configuration files and web content. It creates compressed archives and logs the backup process.

## Features

- Backs up Apache (`/etc/apache2`, `/var/www/html`) and Nginx (`/etc/nginx`, `/usr/share/nginx/html`) directories. [using tar -czf command]
- Stores backups in `$HOME/backups/apache` and `$HOME/backups/nginx`.
- Verifies backup archive integrity. [verify the backup using tar -tzf command to ensure the archive can be read without any error]
- Logs all actions and results. [logs are also captured in backup folders]

## Usage

1. Place the script on your Linux system.

2. Run the script:
    ```bash
    ./APACHE_NGINUX_BKPUP.sh
    ```
## Steps:
1. Ensure the backup directories exist; if not, create them. [`$HOME/backups/apache` and `$HOME/backups/nginx`]
   ![backup_folders](https://github.com/user-attachments/assets/2edc9f78-02c1-4118-9ab0-fcb2e9a3b4dc)
3. Taking Apache web server backup:
   - Set `BACKUP_DIR="$APACHE_BACKUP_DIR"`, `LOGFILE="$BACKUP_DIR/backup_log_$DATE.txt"`, and `APACHE_BACKUP="$BACKUP_DIR/apache_backup_$DATE.tar.gz"`.
    - Create a backup of Apache configuration and web content using `tar -czf <filename> <directories path> 2>>"$LOGFILE"`.
    - Verify the integrity of the backup archive with `tar -tzf` to ensure it can be read without errors.
    - Log all actions and results in the log file.
    ![Apache_bckup_dir](https://github.com/user-attachments/assets/2aacb516-8c31-4082-a933-3497cfd73b6c)
4. Taking Nginx web server backup:
   - Set `BACKUP_DIR="$NGINX_BACKUP_DIR"`, `LOGFILE="$BACKUP_DIR/backup_log_$DATE.txt"` and `NGINX_BACKUP="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"`;
   - Create a backup of Nginx configuration and web content [`tar -czf <filename> <directories path> 2>>"$LOGFILE"`]
   - Check the integrity of the backup using `tar -tzf` command [checks if the archive can be read without errors]
   - All these details are logged in the log file.
   ![Nginx_bckup_dir](https://github.com/user-attachments/assets/0e331436-e24d-4c21-b597-bcc1eabcc5e6)
5. Configure a cron job to execute the script at every Tuesday 12:00 AM
   ``` bash
           0 0 * * 2 /bin/bash $HOME/apache_nginx_backup.sh
   ```

![Crontab](https://github.com/user-attachments/assets/3dc35d5d-6c7b-44d0-92d8-a476910f3a18)



## Notes
- /etc/apache2/ is used for backup of Apache config instead of httpd folder.
- Run as a user with read access to the configuration and web directories.
- Backup archives and logs are stored in your home directory under `backups/apache` and `backups/nginx`.
- Check the log files for backup status and integrity verification.

