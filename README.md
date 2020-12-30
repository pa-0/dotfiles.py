# DOTFILES

Configuration files as well as installation scrip for dependencies.

## Installation

To install the dotfiles and all the dependencies run the following commands:

```bash
git clone https://gitlab.com/mrswats/dotfiles.git $HOME/.config/dotfiles
cd $HOME/.config/dotfiles
./install.sh -an
```

You can check out more options by running `./install.sh -h`.

NOTE: The installer will only install packages using Red Hat's dnf. Otherwise
it will only install programs that are installed through git clone or curl.
Take into account that theese are the names for the fedora packages. Other
distros might have different names.

This is the list of packages that are installed through DNF:

- Development Tools (group install)
- util-linux-user
- alacritty
- neovim
- fira code fonts
- python3-pip
- zsh
- git
- git-extras
- tmux
- fzf
- fontawesome
- ShellCheck
- fd
- bat
- exa
- jq
- ripgrep

Note: bat, exa and ripgrep can be installed through cargo but cargo does not
have a way to update all packages automatically.

For i3 it will also install:

- i3
- rofi
- feh
- redshit
- dunst
- polybar
