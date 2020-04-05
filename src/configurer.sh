#!/usr/bin/sh

DOTFILES=$HOME/.dotfiles
CONFIG=$HOME/.config
LOCAL_SHARE=$HOME/.local/share
LOCAL_BIN=$HOME/.local/bin
DIRCOLORS=$HOME/.dir_colors


configure_tools ()
{
    # Link all the things
    echo
    echo "Configuring tools..."
    echo

    [[ ! -d $CONFIG ]] && mkdir -p $CONFIG
    [[ ! -d $LOCAL_SHARE ]] && mkdir -p $LOCAL_SHARE
    [[ ! -d $LOCAL_BIN ]] && mkdir -p $LOCAL_BIN

    # Zsh config file
    ln -sf $DOTFILES/zsh/antigenrc $HOME/.zshrc

    # diff-so-fancy
    ln -sf $LOCAL_SHARE/diff-so-fancy/diff-so-fancy $LOCAL_BIN/diff-so-fancy

    # nord dircolors
    ln -sf $LOCAL_SHARE/nord_dir_colors/src/dir_colors $HOME/.dir_colors

    # Git config
    ln -sf $DOTFILES/gitconfig $HOME/.gitconfig
    ln -sf $DOTFILES/gitignore $HOME/.gitignore

    # Noevim
    NVIMCONFIG=$CONFIG/nvim
    [[ ! -d $NVIMCONFIG ]] && mkdir -p $NVIMCONFIG
    ln -sf $DOTFILES/nvim/init.vim $NVIMCONFIG/init.vim

    # Termite
    ALACRITTYCONF=$CONFIG/alacritty
    [[ ! -d $ALACRITTYCONFIG ]] && mkdir -p $ALACRITTYCONF
    ln -sf $DOTFILES/alacritty/alacritty.yml $ALACRITTYCONF/alacritty.yml

    # Tmux
    ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

    # Virtualenv
    [[ ! -d $VIRTUALENVHOME ]] && mkdir -p $HOME/.virtualenv

    # Flake8 and black
    ln -sf $DOTFILES/python/isort.cfg $HOME/.isort.cfg
    ln -sf $DOTFILES/python/flake8 $CONFIG/flake8

    FLAKE8BLACKCONFIG=$CONFIG/flake8-black/
    [[ ! -d $FLAKE8BLACKCONFIG ]] && mkdir -p $FLAKE8BLACKCONFIG
    ln -sf $DOTFILES/python/black-config.toml $FLAKE8BLACKCONFIG/pyproject.toml
}

configure_i3 ()
{
    echo
    echo "Configuring i3"
    echo

    I3CONFIG=$CONFIG/i3
    [[ ! -d $I3CONFIG ]] && mkdir -p $I3CONFIG
    ln -sf $DOTFILES/i3/config $I3CONFIG/config

    # rofi config
    ROFICONFIG=$CONFIG/rofi
    [[ ! -d $ROFICONFIG ]] && mkdir -p $ROFICONFIG
    ln -sf $DOTFILES/i3/rofi/config.rasi $ROFICONFIG/config.rasi

    # polybar config
    POLYCONFIG=$CONFIG/polybar
    [[ ! -d $POLYCONFIG ]] && mkdir -p $POLYCONFIG
    ln -sf $DOTFILES/i3/polybar/config $POLYCONFIG/config

    # Redshift config
    ln -sf $DOTFILES/i3/redshift/redshift.conf $CONFIG/redshift.conf
}
