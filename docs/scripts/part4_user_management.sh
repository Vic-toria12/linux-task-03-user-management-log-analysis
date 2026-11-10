#!/bin/bash
# PART 4: user management -- run as forensic01 (sudo user)

echo "== 1. Create guest1 and guest2 =="
sudo useradd -m guest1
sudo useradd -m guest2
getent passwd guest1 guest2

echo; echo "== 2. Add guest1 to sudo group =="
sudo usermod -aG sudo guest1
id guest1

echo; echo "== 3. Delete guest2 including home directory =="
sudo userdel -r guest2
getent passwd guest2 || echo ">> guest2 no longer exists"
ls /home
