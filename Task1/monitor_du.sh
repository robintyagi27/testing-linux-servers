#!/bin/bash
LOGFILE="$HOME/system_monitor/system_info_$(date +%F).log"   # Log file path
mkdir -p "$HOME/system_monitor"                             # Create directory if it doesn't exist

if [ -f "$LOGFILE" ]; then                                  # If log file already exists, append to it

    echo "Time : $(date)" >> "$LOGFILE"
else                                                       # If log file does not exist, create it and add header

    echo "********************** System Information *********" > "$LOGFILE"
    echo "Time : $(date)" >> "$LOGFILE"
fi


# Collecting system information
#disk fragments [df] in the filesystem in human-readable format
echo "************************** Disk Usage (df -h) *********************" >> "$LOGFILE"
df -h >> "$LOGFILE"
#disk usage [du] in the home directory
echo "************************** Disk Usage (du -sh) ********************" >> "$LOGFILE"
du -sh $HOME/* 2>/dev/null >> "$LOGFILE"

# Collecting system load information
# top 10 CPU consuming processes
echo "************* Top 10 CPU consuming process running ****************" >> "$LOGFILE"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11 >> "$LOGFILE"
#top | head -n 4 | tail -n 2 >> >> "$LOGFILE"  --> this can also provide memory and cpu details
# top 10 memory consuming processes
echo "************ Top 10 memory consuming process running *************" >> "$LOGFILE"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11 >> "$LOGFILE"

echo "=====================================================================" >> "$LOGFILE"