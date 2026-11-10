#!/bin/bash
# Run in GIT BASH from the repo root:
#   bash docs/scripts/push_to_github.sh https://github.com/<your-username>/linux-task-03.git
URL="$1"
if [ -z "$URL" ]; then echo "Usage: bash docs/scripts/push_to_github.sh <repo-url>"; exit 1; fi

git init
git add .
git commit -m "Add Linux Task 03: user management, log analysis, permissions"
git branch -M main
git remote add origin "$URL" 2>/dev/null || git remote set-url origin "$URL"
git push -u origin main
