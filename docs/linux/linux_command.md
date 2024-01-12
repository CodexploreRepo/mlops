# Linux Command

## Common Commands

- `which` or `whereis` to find the location of source/binary file of a command and manuals sections for a specified file in Linux system.

```shell
which docker
# /usr/local/bin/docker
whereis docker
# docker: /usr/local/bin/docker
```

### `rm` commands

- `rm` deletes directories that may contain content such as files and subdirectories
  - `-r` recursively delete the contents of a directory (whether it's files or subdirectories)
- `rmdir` ONLY deletes empty directories.

```shell
# remove a file
rm test.txt

# remove a directory with contents
rm -r test_folder

# remove empty directory
rm -d test_folder
rmdir test_folder
```

## Special Commands

### `/dev/null`

- `/dev/null` is a virtual null device used to discard any output redirected to it.
- There are two types of output streams to redirect:
  - Standard output (stdout): `1`
  - Standard error (stderr): `2`
- To suppress one of these streams, we simply redirect it to `/dev/null` using the descriptor and `>` redirect operator:

```shell
command > /dev/null # default: suppress stdout
# echo 'Hello from CodeXplore' > /dev/null
command 1> /dev/null # suppress stdout

command 2> /dev/null # suppress stderr
# cat --INCORRECT_OPTION 2> /dev/null
```

- In order to suppress both streams in one command

```shell
command > /dev/null 2> /dev/null

# redirect "stdout" to /dev/null and then redirect "stderr" to "stdout"
# &1 notation means the destination is a file descriptor, not a file named 1
command > /dev/null 2> &1

# &>
command &> /dev/null
```
