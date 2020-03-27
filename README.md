# DOTFILES

This repo contains all interesting and important dotfile configuration for any new machine

## Installation

To install the dotfiles first clone the repo:
```bash
git clone https://gitlab.com/mrswats/dotfiles.git $HOME/.dotfiles
sudo dnf install -y zsh util-linux
chsh -s $(which zsh)
cd .dotfiles
./install.sh
```
