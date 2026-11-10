#!/bin/bash
# PART 2: log filtering & analysis -- run as forensic01
# TIP: for the screenshot of "less", run the piped commands by hand in a real terminal.
cd /home/forensic01/logs/ || exit 1

echo "== 1a. All lines with ERROR =="
grep "ERROR" sys_events.log

echo; echo "== 1b. Lines mentioning root or user01 =="
grep -E "root|user01" sys_events.log

echo; echo "== 2a. Pipe to less (interactive; press q to quit) =="
grep "ERROR" sys_events.log | less
grep -E "root|user01" sys_events.log | less

echo; echo "== 2b. Save output to error_report.txt =="
grep "ERROR" sys_events.log > error_report.txt
echo "---- lines mentioning root or user01 ----" >> error_report.txt
grep -E "root|user01" sys_events.log >> error_report.txt
cat error_report.txt

echo; echo "== 3. First 5 and last 5 lines =="
head -n 5 sys_events.log
echo "..."
tail -n 5 sys_events.log

echo; echo "== 4. Full log with cat =="
cat sys_events.log
