# Bash Scripting

## Introduction

### Terminal, Shell (Bash, zsh), `sh`

- **Terminal**: A program acts as a wrapper to enter commands
- **Shell**: A command line interpreter that receives and executes commands
  - Bash (Bourne-Again **SHell**) is one of the most commonly used Unix/Linux shells and is the default shell in many Linux distributions.
    - `$` when a shell is used interactively with user mode
    - `#` when a shell is used interactively with root mode
  - There are other shells available as well, such as Korn shell (`ksh`), C shell (`csh`), and Z shell (`zsh`).
- `sh` (or the Shell Command Language) is a _programming language_ described by the POSIX standard.
  - It has many implementations (ksh88, Dash, ...). Bash can also be considered an implementation of sh
  - Because sh is a specification, not an implementation, `/bin/sh` is a **symlink** (or a hard link) to an actual implementation on most POSIX systems.
    - In most GNU/Linux systems, `/bin/sh` used to point to `/bin/bash`
    - In macOS, zsh shell type `la /private/var/select` to know what `/bin/sh` will link to which. In this case, `sh -> /bin/bash`
    ```bash
    la /private/var/select
    # total 0
    # lrwxr-xr-x  1 root  wheel     9B Dec 15 22:43 sh -> /bin/bash
    ```

### Bash Script

- A bash script is a file containing a sequence of commands that are executed by the bash program line by line.

#### Execution

- If you run your script with `sh scriptname`, or run it with `scriptname` and have `#!/bin/sh` in the shebang line, you should expect POSIX `sh` **behavior**.
- If you run your script with `bash scriptname`, or run it with `scriptname` and have `#!/bin/bash`in the shebang line, you should expect **Bash behavior**.
- **NOTE**: If you want to execute the script only by `scriptname`, you will have to execute permission (`chmod a+x scriptname`)
