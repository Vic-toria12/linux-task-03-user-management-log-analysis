# Linux Task 03 - GitHub Workflow

User management, log analysis (grep, head, tail, cat, pipes) and file permissions/ownership in Linux.

## Structure

```
linux-task-03-github-workflow/
├── docs/                  # scripts + notes
│   └── scripts/           # part1a, part1b, part2, part3, part4, push_to_github.sh
├── evidence/              # terminal outputs (error_report.txt, permission checks, etc.)
├── logs/                  # sys_events.log (mock log, 22 lines)
├── screenshots/           # PNG screenshots (checklist in screenshots/README.md)
├── .gitignore
├── commands_used.txt      # exact commands used
├── explanations.md        # grep / chown / usermod + what I learned
└── README.md
```

## Where to run what

Git Bash cannot run `useradd`, `usermod`, `sudo` or `chown`. Run the Linux parts in **WSL (Ubuntu)**, an Ubuntu VM
or Linux. Use **Git Bash** to push to GitHub.

## Step 1 - Run the task (Ubuntu / WSL)

```bash
cd linux-task-03-github-workflow
sudo cp -r ../linux-task-03-github-workflow /tmp/ && sudo chmod -R a+rX /tmp/linux-task-03-github-workflow

bash docs/scripts/part1a_create_user.sh 2>&1 | tee evidence/part1a_output.txt
su - forensic01        # screenshot: whoami

# as forensic01
bash /tmp/linux-task-03-github-workflow/docs/scripts/part1b_create_logs.sh    2>&1 | tee ~/part1b_output.txt
bash /tmp/linux-task-03-github-workflow/docs/scripts/part2_log_analysis.sh    2>&1 | tee ~/part2_output.txt
bash /tmp/linux-task-03-github-workflow/docs/scripts/part3_permissions.sh     2>&1 | tee ~/part3_output.txt
bash /tmp/linux-task-03-github-workflow/docs/scripts/part4_user_management.sh 2>&1 | tee ~/part4_output.txt
exit
```

Copy the `partN_output.txt` files, `error_report.txt` into `evidence/` and `sys_events.log` into `logs/`
(use `sudo cp` from `/home/forensic01`). Save screenshots into `screenshots/`.

## Step 2 - Push with Git Bash

```bash
cd /c/Users/<you>/linux-task-03-github-workflow
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
# create an EMPTY repo on github.com first, then:
bash docs/scripts/push_to_github.sh https://github.com/<your-username>/linux-task-03-github-workflow.git
```

Use a GitHub Personal Access Token when asked for a password. Never commit real passwords.
