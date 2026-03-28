# 🚀 Linux DevOps Server Automation & Monitoring Project

## 📌 Overview
This project demonstrates a real-world Linux server setup with **automation, monitoring, and security**.

It simulates how DevOps engineers manage production servers using shell scripting and system tools.

---

## 🔧 Tech Stack
- Linux (Ubuntu)
- Bash Scripting
- NGINX
- Cron Jobs
- UFW Firewall

---

## ⚙️ Features

### 🔐 Security
- Created non-root user with sudo access
- Disabled root login
- Configured firewall (UFW)

### 🌐 Web Server
- Installed and configured NGINX
- Hosted a static website

### 📊 Monitoring Script
- Disk usage check (threshold alert)
- Memory usage monitoring
- CPU load tracking
- NGINX service monitoring

### 🔁 Self-Healing System
- Detects if NGINX is down
- Automatically restarts service
- Logs success/failure

### ⏰ Automation
- Cron job runs script every minute

### 📁 Logging
- Logs stored at: