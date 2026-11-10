# Short Explanation

## What the commands do

**grep** searches a file (or piped input) line by line and prints only the lines that match a pattern.
`grep "ERROR" file` finds one keyword, while `grep -E "root|user01" file` uses extended regex so `|` means "or".
It is the main tool for filtering large logs quickly.

**chown** changes the owner (and optionally the group) of a file or directory.
`sudo chown root confidential.txt` makes root the owner. Only root, or a user using sudo, can change ownership.
Ownership decides which permission set (owner / group / others) applies to a user.

**usermod** modifies an existing user account without deleting it.
`sudo usermod -aG sudo guest1` appends (`-a`) guest1 to the supplementary group (`-G`) `sudo`, giving admin rights.
Without `-a`, the user would be removed from all other supplementary groups.

## What I learned from accessing confidential.txt after changing ownership

After `chmod 600` the file was `-rw-------` owned by forensic01, so only forensic01 could read or write it.
After `sudo chown root`, the owner became root, and forensic01 fell into the "others" category, which has no permissions.
Both `cat` and `>>` returned **Permission denied**, even though forensic01 is in the sudo group.
Group membership alone does not bypass permissions; forensic01 must explicitly use `sudo` to read the file.
This shows how ownership and permissions protect sensitive evidence files.
(Note: because forensic01 still owns the `logs/` directory, it could still delete or rename the file, since that
depends on directory permissions, not file permissions.)
