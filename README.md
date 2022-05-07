# DOTFILES

Configuration files as well as installation scrip for dependencies.

## Installation

To install the dotfiles and all the dependencies run the following commands:

```bash
DOTFILES="$HOME/.config/dotfiles"
git clone https://gitlab.com/mrswats/dotfiles.git $DOTFILES
pip install --user pipx
pipx install dotbot
dotbot -c ./bootstrap/install.conf.yaml
```
