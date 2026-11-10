#!/bin/bash
# PART 1 (steps 1-2): create forensic01 -- run as your normal admin user (needs sudo)
# Usage (interactive):  bash scripts/part1a_create_user.sh
# Usage (CI only):      FORENSIC_PASS='something' bash scripts/part1a_create_user.sh

echo "== Create user forensic01 with home dir and /bin/bash =="
sudo useradd -m -s /bin/bash forensic01

echo "== Add forensic01 to the sudo group =="
sudo usermod -aG sudo forensic01

echo "== Set password =="
if [ -n "${FORENSIC_PASS:-}" ]; then
  echo "forensic01:${FORENSIC_PASS}" | sudo chpasswd      # non-interactive (CI)
else
  sudo passwd forensic01                                   # interactive prompt
fi

echo "== Verify =="
id forensic01
getent passwd forensic01
echo
echo "NEXT (manual, take a screenshot):  su - forensic01     then run: whoami"
