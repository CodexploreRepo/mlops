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
