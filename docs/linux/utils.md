# Utils

## Auto-suggestion

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file): Fish-like fast/unobtrusive autosuggestions for zsh.

## [fzf](https://github.com/junegunn/fzf)

- `fzf` is a general-purpose command-line fuzzy finder.
  - It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
- Note:

```
plugins=(
    git
    # other plugins...
    zsh-autosuggestions
)
```

### Usage

- `CTRL + R`: to search commands in the history
- `kill -9 **` + `TAB`: to list down process you want to kill
- `vim **` + `TAB`: to list down the files that can be editted in VIM

### Installation

```shell
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```
