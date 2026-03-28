#!/bin/bash

LOGFILE="/var/log/system_monitor.log"
DATE=$(date)

echo "===== System Report: $DATE =====" >> $LOGFILE

# 🔹 Disk Usage Check
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage: $DISK_USAGE%" >> $LOGFILE

if [ $DISK_USAGE -gt 80 ]; then
    echo "ALERT: Disk usage is above 80%!" >> $LOGFILE
else
    echo "Disk usage is normal" >> $LOGFILE
fi

# 🔹 Memory Usage Check
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

echo "Memory Usage: $MEM_USAGE%" >> $LOGFILE

if [ $MEM_USAGE -gt 80 ]; then
    echo "ALERT: Memory usage is high!" >> $LOGFILE
else
    echo "Memory usage is normal" >> $LOGFILE
fi

# 🔹 CPU Load Check
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }')

echo "CPU Load:$CPU_LOAD" >> $LOGFILE

# 🔹 Nginx Service Check
if systemctl is-active --quiet nginx; then
    echo "Nginx Status: RUNNING" | tee -a $LOGFILE
else
    echo "ALERT: Nginx is DOWN! Restarting..." | tee -a $LOGFILE
    sudo systemctl start nginx

    if systemctl is-active --quiet nginx; then
        echo "Nginx restarted successfully" |tee -a $LOGFILE
    else
        echo "CRITICAL: Failed to restart Nginx" | tee -a $LOGFILE
    fi
fi

# 🔹 Open Ports Check
echo "Open Ports:" >> $LOGFILE
ss -tulnp | grep LISTEN >> $LOGFILE

echo "--------------------------------------" >> $LOGFILE
echo "" >> $LOGFILE
