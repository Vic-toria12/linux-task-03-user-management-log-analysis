# Screenshots

Save PNG screenshots in this folder using these names:

| # | File name | What to capture |
|---|-----------|-----------------|
| 1 | 01_user_created.png | `id forensic01` and `getent passwd forensic01` |
| 2 | 02_switch_user.png | `su - forensic01` then `whoami` |
| 3 | 03_logs_created.png | `ls -l /home/forensic01/logs/` and `wc -l sys_events.log` |
| 4 | 04_grep_error.png | `grep "ERROR" sys_events.log` |
| 5 | 05_grep_root_user01.png | `grep -E "root\|user01" sys_events.log` |
| 6 | 06_pipe_less.png | `grep "ERROR" sys_events.log \| less` |
| 7 | 07_error_report.png | `cat error_report.txt` |
| 8 | 08_head_tail.png | `head -n 5` and `tail -n 5` |
| 9 | 09_cat_full_log.png | `cat sys_events.log` |
| 10 | 10_chmod_600.png | `ls -l confidential.txt` after chmod |
| 11 | 11_chown_root.png | `ls -l confidential.txt` after chown |
| 12 | 12_permission_denied.png | failed `cat` / `>>` on confidential.txt |
| 13 | 13_guest_users.png | `id guest1`, `getent passwd guest2`, `ls /home` |
