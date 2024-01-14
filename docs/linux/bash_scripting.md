# Bash & Bash Scripting

- Reference: [Bash Scripting cheatsheet](https://devhints.io/bash)

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

- It is good practice to write shebang lines using the `/usr/bin/env` command that will resolve to wherever the command lives in the system, **increasing the portability** of your scripts.
- `/usr/bin/env` will ensure the interpreter used is the first one on your environment's `$PATH`
  - For example: if place `!#/usr/bin/env bash` in your script, this bash version `/opt/homebrew/bin/bash` will be used instead of `/bin/bash` since in the `$PATH` variable, `/opt/homebrew/bin` is placed before `/bin`

```bash
echo $PATH
# /opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin: .... :/usr/bin:/bin:/usr/sbin:/sbin:
```

- Note: Scripts need not necessarily be written in bash to be called from the terminal.
  - For example: The kernel knows to execute this script with a **python** interpreter with the shebang `#!/usr/bin/env python`

```Python
#############################
# in the python_script.py   #
#############################
#!/usr/bin/env python
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)

#############################
# in the interactive shell  #
#############################
bash-5.2$ chmod +x python_script.py
bash-5.2$ ./python_script.py a b c
# c
# b
# a
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

```bash
bash-5.2$ foo=bar
bash-5.2$ echo $foo
# bar
bash-5.2$ foo = bar
# bash: foo: command not found
```

### String

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

#### String Replacement

- In the below example, the `${original_string/world/$replacement}` expression replaces the **first occurrence **of the substring `"Hello"` in `original_string` with the content of the `replacement` variable.

```bash
original_string="Hello Hello, world!"
replacement="Goodbye"
result_string="${original_string/Hello/$replacement}"
echo "$result_string" # Goodbye Hello, world!
```

- If you want to replace all occurrences of a substring, you can use the `//` instead of a single `/`
  - In the below example, all `"world"` word has been replaced with `"Goodbye"`

```bash
original_string="Hello, world! Hello, world!"
result_string="${original_string//world/$replacement}"
echo "$result_string" # Hello, Goodbye! Hello, Goodbye!
```

#### String Splitting

- `IFS='/' read -ra my_array <<< "$my_path"`
  - `<<<` is a Bash operator known as a "here string", to provide the content of the variable `$my_path` as input to the `read` command.
  - `read` command then reads the string, splitting it into elements based on the Internal Field Separator (`IFS`), in this case is `/`
    - `-r` interpret backslashes (`\`) literally. Without this option, backslashes would be treated as escape characters, potentially altering the meaning of characters.
    - `-a` read the input into an array `my_array`

```bash
my_path="/home/quandv/Documents/home/m1/linux/scripts"

IFS="/" read -ra my_array <<< "$my_path"
for element in ${my_array[@]}
do
    echo "'$element'"
done
# 'home'
# 'quandv'
# 'Documents'
# 'home'
# 'm1'
# 'linux'
# 'scripts'
```

#### String Deletion

- To remove a specified number of characters from the beginning of a string, you can use the `${variable:offset}` syntax

##### Delete from the beginning of the string

- For example, to remove the first three characters

```bash
my_string="abcdef"
new_string="${my_string:3}"
echo "$new_string" # def
```

##### Delete from the end of the string

- To remove characters from the end of a string, you can use the `${variable:0:-count}`

```bash
my_string="abcdef"
new_string="${my_string:0:-3}"
echo "$new_string" # abc
```

##### Delete based on pattern

- `##` signifies greedy matching, so it matches from the start of the string as much as possible.
- `*` match everything
- `##*/`: This is a pattern that matches everything up to the last forward slash (`/`)

```bash
my_path="/home/quandv/Documents/home/m1/linux/scripts"
basename="${my_path##*/}"
echo "Basename: $basename" #script
```

### Array

```bash
my_array=(10 2 300)
echo "First element: ${my_array[0]}"        # 10
echo "Last element: ${my_array[-1]}"        # 300
echo "Number of elements: ${#my_array[@]}"  # 3
```

### Conditional Statements

#### `if-else-elif`

- Condition will be specified inside `[[, ]]`
  - For numerical operations, conditions (`>`, `<`, not `-gt`, `-lt`, etc) should be specified inside `((, ))`
- Comparison: `-lt` (less than), `-le` (less than or equal), `-gt` (greater than), `-ge` (greater than or equal), `-eq` (equal)
- Logical operators such as AND `-a` and OR `-o`
  - For example: `if [ $a -gt 60 -a $b -lt 100 ]`

```bash
if [[ $first_arg > 0 ]]; then
  echo "First argument is positive"
elif [[ $first_arg == 0 ]]; then
  echo "First argument is zero"
else
  echo "First argument is negative"
fi

# Don't use [[ 10 > 9 ]], but use
# (( 10 > 9 )) for numerical operations
if (( 10 > 9 )); then
  echo "10 > 9 is true"
else
  echo "10 > 9 is false" # if use [[ ]] will return 10 > 9 is false
fi
```

### Loop

#### `while` loop

- `(( i += 1 ))` is the counter statement that increments the value of i

```bash
i=1
while [[ $i -le 5 ]]
do
    echo "$i"
    ((i+=1))
done
```

#### `for` loop

```bash
for i in {1..5}
do
    echo $i
done
```

- To print all .sh files in the current directory

```bash
# For loop to look up .sh files
echo "All the .sh files in the current directory:"
for i in ./*.sh; do
    echo $i
done

# ./basic_script.sh
# ./calculate_frequency.sh
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
  - `$?` Return error code of the previous command
    - Error code:
      - `0` means no error
      - Anything different from 0 means an error occurred.
  - `$$` Process identification number (PID) for the current script
  - `!!` (Bang bang) Entire last command, including arguments.
    - A common pattern is to execute a command only for it to fail due to missing permissions; you can quickly re-execute the command with sudo by doing `sudo !!`

```bash
#############################
# in the basic_script.sh    #
#############################
echo "Running program $0 with $# arguments with pid $$"
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

## !!
bash-5.2$ ls
bash-5.2$ sudo !! # execute entire last command, including arguments.
# sudo ls
Password:
```

- Example: read text file function

```bash
file_path="./data/input.txt"

read_txt() {
    while read line
    do
        echo "$line"
    done < $1         # $1 = ./data/input.txt
}
read_txt $file_path
```

- Example: read csv file function
  - `read -r line`
    - `-r` interpret backslashes (`\`) literally. Without this option, backslashes would be treated as escape characters, potentially altering the meaning of characters.
  - `IFS=',' read -ra my_record <<< "$line"`
    - `<<<` is a Bash operator known as a "here string", to provide the content of the variable `$line` as input to the `read` command.
    - `read` command then reads the string, splitting it into elements based on the Internal Field Separator (`IFS`)
      - `-r` interpret backslashes (`\`) literally. Without this option, backslashes would be treated as escape characters, potentially altering the meaning of characters.
      - `-a` read the input into an array

```bash
# Read csv example
file_path="./data/data1.csv"
my_readfile_func() {
    while read -r line; do
        # Use Internal Field Separator (IFS) to split string,
        # then read the raw input (-r) and create a new array (-a), namely "my_record"
        IFS=',' read -ra my_record <<< "$line"
        echo ${my_record[-1]} # print the last element in "my_record" array
        # echo ${my_record[${#my_record[@]}-1]} # if run bash script in zsh
    done < $1 # the first argument that we pass to the my_readfile_func $1 = $filepath
}
my_readfile_func $file_path
```
