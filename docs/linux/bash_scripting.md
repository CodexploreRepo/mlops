# Bash & Bash Scripting

## Introduction

### Bash Script

- A bash script is a file containing a sequence of commands that are executed by the bash program line by line.

### Shebang

- Bash scripts start with a **shebang** which is `#!`
- Shebang tells the shell to execute it via `bash` shell.
  - Shebang is simply an absolute path to the bash interpreter.

```Bash
#!/bin/bash

# This shebang is to tell the shell to use default bash, located at bin/bash

#!/opt/homebrew/bin/bash

# This shebang is to tell the shell to use "bash 5.2" which installed via HomeBrew
```

### Making a file executable

- If the executable bit (`x`) is set on a file (with a proper shebang), it can be executed directly by the users with that permission.
  - For example: after you `chmod a+x myscript.py`, instead of running `python3 myscript.py`, you can just run `./myscript.py`, provided that `myscript.py` has the shebang `#!/usr/bin/python3`
- You can give the file executable to the current user, group or all users or the combination of those below flags:
  - `u` for user
  - `g` for group
  - `o` for others
  - `a` for all users

```bash
chmod ug+x myscript.py # give both user and group executable permission
```

### Bash Script Execution

- If you run your script with `sh scriptname`, or run it with `scriptname` and have `#!/bin/sh` in the shebang line, you should expect POSIX `sh` **behavior**.
- If you run your script with `bash scriptname`, or run it with `scriptname` and have `#!/bin/bash`in the shebang line, you should expect **Bash behavior**.
- **NOTE**: If you want to execute the script only by `scriptname`, you will have to execute permission (`chmod a+x scriptname`)

## Syntax

### Varibales

#### Variable Assignment

- To assign variables in bash, use the syntax `foo=bar`
  - Note: that `foo = bar` will not work since it is interpreted as calling the `foo` program with arguments `=` and `bar`
- To access the value of the variable with `$foo`
  foor

```bash
bash-5.2$ foo=bar
bash-5.2$ echo $foo
# bar
bash-5.2$ foo = bar
# bash: foo: command not found
```

#### String

- Strings in bash can be defined with `'` and `"` delimiters, but they are not equivalent.
  - Strings delimited with `'` are literal strings and will not substitute variable value
  - Strings delimited with `"` will

```bash
bash-5.2$ foo=bar
bash-5.2$ echo 'Value is $foo'
# Value is $foo

bash-5.2$ echo "Value is $foo" #
# Value is bar
```

### Functions

- Bash uses a variety of special variables to refer to arguments, error codes, and other relevant variables.
  - `$0` Name of the script
  - `$1` to `$9` Arguments to the script.
    - `$1` is the first argument and so on.
  - `$_` Last argument from the last command.
    - If you are in an interactive shell, you can also quickly get this value by typing **Esc** followed by **.** or **Alt+**.
  - `$@` All the arguments
  - `$#` Number of arguments
  - `$?` Return code of the previous command
  - `$$` Process identification number (PID) for the current script
  - `!!`Entire last command, including arguments.
    - A common pattern is to execute a command only for it to fail due to missing permissions; you can quickly re-execute the command with sudo by doing `sudo !!`

```bash
#############################
# in the basic_script.sh    #
#############################

#!/opt/homebrew/bin/bash
mcd () {
    mkdir -p "$1"
    echo "Successfully create $1 folder"
}

#############################
# in the interactive shell  #
#############################

bash-5.2$ source ./basic_script.sh
bash-5.2$ mcd today
# Successfully create today folder
bash-5.2$ rmdir $_ # this will refer to the last arg from last command which is `today`
bash-5.2$ ls       # the today folder has been deleted
# basic_script.sh  data
```
