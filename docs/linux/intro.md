# Linux Introduction

## Introduction

### Unix-like Operating System

- A **Unix-like Operating System** includes a kernel, compilers, editors, text formatters, mail software, graphical interfaces, libraries, games and many other things.
- GNU/Linux is a Unix-like operating system

### GNU/Linux = GNU System + Linux Kernel

- [READ MORE](https://www.gnu.org/gnu/linux-and-gnu.en.html)
- **GNU Operating System (OS)** is a complete free software system, upward-compatible with Unix. GNU stands for “GNU's Not Unix.”
  - By 1990 they had either found or written all the major components except one—the **kernel**.
  - Then **Linux**, a _Unix-like kernel_, was developed by Linus Torvalds in 1991 and made free software in 1992.
  - Combining Linux with the almost-complete GNU system resulted in a complete operating system, called as **GNU/Linux**
- GNU/Linux is an alternative solution to AT&T Unix OS (not free)

#### Linux Kernel

- **Linux** is the **kernel**: the program in the system that allocates the machine's resource (CPU, memory and disk, etc.) to the other programs that you run.
- An **operating system** includes a kernel, compilers, editors, text formatters, mail software, graphical interfaces, libraries, games and many other things.
  - The **kernel** is an essential part of an operating system, but useless by itself; it can only function in the context of a complete operating system.

<p align="center"><img src="../../assets/img/kernel_layout.png" width=300/></p>

- Linux is normally used in combination with the GNU OS: the whole system is basically GNU with Linux added, or `GNU/Linux`.
- All the so-called “Linux” distributions such as Ubuntu, Debian, Kali Linux, are really distributions of GNU/Linux.

### Unix vs GNU/Linux

|               | AT&T Unix                                  | GNU/Linux                              |
| ------------- | ------------------------------------------ | -------------------------------------- |
|               | Closed-sourced, require a license for use  | Open-source                            |
| Default Shell | Bourne Shell                               | BASH                                   |
| Use-case      | Enterprise-level servers and workstations. | Both enterprise and personal computers |

## Linux Directory Structure

```shell
\        # root
├── home # or Users in macOS: Files and directories for users
│   ├── quannguyen # user1
│   ├── codexplore # user2
├── bin           # essential command such as sh, ls, bash
├── sbin          # essential system management programs such as reboot, shutdown
├── usr
│   ├── bin       # non-essential command: ssh, telnet, less
│   ├── sbin      # non-essential system command
│   ├── local
│   │   ├── bin   # user’s programs that you install from source such as docker, kubectl
│   │   ├── sbin  # system administration commands belong to users
├── dev  # files representing both physical and virtual devices
├── proc # files for monitoring processes such as /proc/meminfo
├── etc  # configuration files such as passwd and hosts.allow
├── tmp  # programs's temporary files
```

### `/` Root

- The only root user has the right to write under this directory.
- Every single file and directory start from the root `/` directory.

#### `/home` (in MacOS will be `/Users`)

- Users’ home directories, containing saved files
  - For example: `/home/quannguyen`, `/home/vannguyen`

#### `/bin`

- contains essential command binaries that need to be available in single user mode; for all users:
  - serves as a standard location for key programs like`sh`, `ls`, `echo`, `bash`, `mkdir`, `rm`

#### `/sbin`

- contains essential system management programs needed before `/usr` is mounted.
  - For example: `iptables`, `reboot`, `fdisk`, `ifconfig`, `swapon`

#### `/usr`

- `/usr/bin` contains non-essential command binaries for user programs.
  - If you can’t find a user binary under `/bin`, look under `/usr/bin`.
  - For example: `at`, `awk`, `cc`, `less`, `scp`
- `/usr/sbin` contains non-essential command binaries for system administrators.
  - If you can’t find a system binary under `/sbin`, look under `/usr/sbin`.
  - For example: `atd`, `cron`, `sshd`, `useradd`, `userdel`
  - A similar tool to `useradd` is `/usr/sbin/sysadminctl` on macOS via `sudo sysadminctl -addUser xxx -password xxxxxxxx interactive`
- `/usr/local/bin` contains user’s programs that you install from source.
  - For example, when you install **docker** from source, it goes under `/usr/local/docker`
- `/usr/local/sbin` locally installed programs for system administration.

#### `/dev`

- In Linux systems, devices are files stored in the /dev directory.
- These files can represent both physical and virtual devices.
  - For example: `/dev/null` is a virtual null device used to discard any output redirected to it.

#### `/proc`

- files for monitoring processes such as `/proc/meminfo`

#### `/etc`

- Configuration files such as
  `passwd` and `hosts.allow`
