# Linux Server Administration

## User Management

### User Information

- `cat /etc/passwd | grep home` to know how many existing users in the server
- `who` to check the current shell session belongs to which user
- `id` to check who is the user currently as you can switch user within a shell session
  - to check if the user belongs to whihc group

```bash
id
# uid=501(codexplore)

sudo su # switch to super user
id
# uid=0(root)
```

### Add User

- `sudo useradd new_user -m` to add user to the server
  - `-m` if you want to create the new home folder for `/home/new_user`
- `sudo passwd new_user` to provide new_user the password for authentication

### Switch User

- `su` command: substitute user identity
- `sudo su` &#8594; switch to root user (super user)
- `su - codexplore` to switch to **codexplore** user (default will use `sh` shell)
- `su - codexplore -s /bin/bash`
  - `-s` to specify which shell to use, in this case is Bash shell
- Note: Press `CTRL+D` to exit the session with current user

## User Permission

- `ls -l` to list down user permission for each file or directory

### Grant Permission

- **Note**: if a file has the read permission for others, but the directory or the parent directory containing that file does give the read permission for other, the other users cannot read the file.

### Revoke Permission

- `chmod o-x demo.sh` to revoke `-x` the executable of others for the file `demo.sh`

## Group Permission

- `sudo groupadd ds` to create a new group `ds`
- `cat /etc/group` to check how many group availables and which user belongs to which group
- `sudo usermod -aG ds codexplore` to add `codexplore` user to group `ds`
- `sudo chown :ds test.txt` change the group owner of the file `test.txt` to `ds` group
  - Note: chown `<user>:<group>`

## Common Commands

- `uptime` – show how long system has been running

```bash
uptime
17:25  up 18 days,  1:27, 2 users, load averages: 1.74 1.59 1.63
```
