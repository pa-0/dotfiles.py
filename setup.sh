# /bin/bash

DEFAULT_DOTFILES_HOME=~/local/dotfiles

if [ -f $(DOTFILES_HOME) ]; then
    echo "DOTFILE_HOME is not set"
    echo "Run $ export DOTFILES_HOME=$DEFAULT_DOTFILES_HOME"
    #echo "default is $DEFAULT_DOTFILES_HOME"
    #echo "Use default? (y/n)"
else
    # Make sure we're at the home directory
    cd ~

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
fi

