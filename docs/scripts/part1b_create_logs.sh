#!/bin/bash
# PART 1 (step 3): run AS forensic01 (after: su - forensic01)
# Creates /home/forensic01/logs/ and sys_events.log using cat and echo (22 lines)

echo "== Logged in as: $(whoami) =="
mkdir -p /home/forensic01/logs/
cd /home/forensic01/logs/ || exit 1

# 14 lines written with cat + heredoc
cat > sys_events.log << 'LOGEOF'
2026-11-09 08:00:01 INFO  system boot completed
2026-11-09 08:01:15 INFO  user01 logged in from tty1
2026-11-09 08:02:42 WARNING disk usage at 85% on /dev/sda1
2026-11-09 08:03:10 INFO  root started cron service
2026-11-09 08:05:27 ERROR user01 failed to open /etc/shadow: permission denied
2026-11-09 08:06:00 INFO  network interface eth0 up
2026-11-09 08:07:33 WARNING 3 failed login attempts for user01
2026-11-09 08:09:12 ERROR root failed to mount /dev/sdb1: device not found
2026-11-09 08:10:45 INFO  user01 changed directory to /var/log
2026-11-09 08:12:20 INFO  sshd service started
2026-11-09 08:14:08 WARNING high memory usage detected: 91%
2026-11-09 08:15:55 ERROR sshd authentication failure for invalid user admin
2026-11-09 08:17:30 INFO  root ran apt update
2026-11-09 08:19:02 INFO  user01 logged out
LOGEOF

# 8 more lines appended with echo
echo "2026-11-09 08:20:14 INFO  root created backup of /etc"                  >> sys_events.log
echo "2026-11-09 08:22:47 ERROR backup job failed: no space left on device"   >> sys_events.log
echo "2026-11-09 08:24:05 WARNING firewall rule changed by root"              >> sys_events.log
echo "2026-11-09 08:26:31 INFO  user01 logged in from 192.168.1.15"           >> sys_events.log
echo "2026-11-09 08:28:09 ERROR user01 segmentation fault in app.service"     >> sys_events.log
echo "2026-11-09 08:30:00 INFO  scheduled log rotation started"               >> sys_events.log
echo "2026-11-09 08:31:44 WARNING CPU temperature above threshold"            >> sys_events.log
echo "2026-11-09 08:33:12 INFO  system health check completed"                >> sys_events.log

echo "== Verify =="
pwd
ls -l /home/forensic01/logs/
wc -l sys_events.log
