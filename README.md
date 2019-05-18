# DOTFILES

This repo contains all interesting and important dotfile configuration for any new machine

- vimrc: Vim configuration
    `~/.vimrc`
- gitconfig: git configuration
    `~/.gitconfig`
- gitignore: default gitignore for git
    `~/.gitignore`
- zshrc: Zsh configuration using oh\_my\_zsh
    ~/.zshrc
- flake8: flake8 config should be in .config/flake8
    `~/.config/flake8`

```bash
export DOTFILES_HOME=~/local/dotfiles

ln -sf $DOTFILES_HOME/home/vimrc ~/.vimrc
ln -sf $DOTFILES_HOME/home/gitconfig ~/.gitconfig
ln -sf $DOTFILES_HOME/home/gitignore ~/.gitignore
ln -sf $DOTFILES_HOME/home/oh_my_zshrc ~/.zshrc
ln -sf $DOTFILES_HOME/home/zsh_aliases ~/.zsh_aliases
ln -sf $DOTFILES_HOME/home/pdbrc ~/.pdbrc
ln -sf $DOTFILES_HOME/config/flake8 ~/.config/flake8

# Virtualenvwrapper stuff
ln -sf $DOTFILES_HOME/virtualenvwrapper/postmkvirtualenv-rp ~/.virtualenvwrapper/postmkvirtualenv
ln -sf $DOTFILES_HOME/virtualenvwrapper/postactivate-rp ~/.virtualenvwrapper/postactivate
ln -sf $DOTFILES_HOME/virtualenvwrapper/predeactivate-rp ~/.virtualenvwrapper/predeactivate
```
