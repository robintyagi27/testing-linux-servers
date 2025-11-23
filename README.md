# System Monitoring, User Management, and Backup Configuration Report

## Task 1: System Monitoring Setup

### Requirements:

1. Install and configure monitoring tools (htop or nmon) to monitor CPU, memory, and process usage.

2. Set up disk usage monitoring to track storage availability using df and du.

3. Implement process monitoring to identify resource-intensive applications.

4. Create a basic reporting structure (e.g., save outputs to a log file for review).

[For more details: ](https://github.com/ranyabrkumar/Linux_Assignment_HeroVired/blob/main/Task1/SystemMonitoring.md)


---

## Task 2: User Management and Access Control

### Requirements:

1. Create user accounts for Sarah and Mike with secure passwords.

2. Set up dedicated directories: 

- Sarah: /home/Sarah/workspace

- Mike: /home/mike/workspace

 - Ensure only the respective users can access their directories using appropriate permissions.

3. Implement a password policy to enforce expiration and complexity (e.g., passwords expire every 30 days).

[For more details: ](https://github.com/ranyabrkumar/Linux_Assignment_HeroVired/blob/main/Task2/UserManagement.md)

---

## Task 3: Backup Configuration for Web Servers
### Requirements:

1. Sarah and Mike need to automate backups for their respective web server configurations and document roots: 

- Sarah: Backup the Apache configuration (/etc/httpd/) and document root (/var/www/html/).

- Mike: Backup the Nginx configuration (/etc/nginx/) and document root (/usr/share/nginx/html/).

2.  Schedule the backups to run every Tuesday at 12:00 AM using cron jobs.

3. Save the backups as compressed files in /backups/ with filenames including the server name and date (e.g., apache_backup_YYYY-MM-DD.tar.gz).

4. Verify the backup integrity after each run by listing the contents of the compressed file.

### Expected Output:

1. Cron job configurations for Sarah and Mike.

2. Backup files are created in the /backups/ directory.

3.  A verification log showing the backup integrity.

[For more details:](https://github.com/ranyabrkumar/Linux_Assignment_HeroVired/blob/main/Task3/BackUp_ReadMe.md)

