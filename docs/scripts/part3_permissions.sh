#!/bin/bash
# PART 3: permissions & ownership -- run as forensic01 (uses sudo)
cd /home/forensic01/logs/ || exit 1

echo "== 1. Create confidential.txt and set chmod 600 =="
echo "TOP SECRET: forensic case notes" > confidential.txt
chmod 600 confidential.txt          # owner rw-, group ---, others ---
ls -l confidential.txt

echo; echo "== 2. Change owner to root (sudo) =="
sudo chown root confidential.txt
ls -l confidential.txt

echo; echo "== 3. Try to READ as forensic01 (expect: Permission denied) =="
cat confidential.txt || echo ">> read failed"

echo; echo "== 3b. Try to EDIT as forensic01 (expect: Permission denied) =="
echo "new line" >> confidential.txt || echo ">> write failed"

echo; echo "== 3c. Using sudo still works =="
sudo cat confidential.txt
