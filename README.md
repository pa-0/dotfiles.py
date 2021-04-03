# DOTFILES

Configuration files as well as installation scrip for dependencies.

## Installation

To install the dotfiles and all the dependencies run the following commands:

```bash
git clone https://gitlab.com/mrswats/dotfiles.git $HOME/.config/dotfiles
cd $HOME/.config/dotfiles
./install.sh -a
```

You can check out more options by running `./install.sh -h`.

NOTE: The installer will only install packages using dnf. Otherwise
it will only install programs that are installed through git clone or curl.
Take into account that theese are the names for the fedora packages. Other
distros might have different names.
