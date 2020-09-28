#!/usr/bin/sh

CONFIG=$HOME/.config
DOTFILES=$CONFIG/dotfiles
LOCAL_SHARE=$HOME/.local/share
LOCAL_BIN=$HOME/.local/bin


configure_tools ()
{
    # Link all the things
    echo "Configuring tools"

    [ -d "$CONFIG" ] || mkdir -p "$CONFIG"
    [ -d "$LOCAL_SHARE" ] || mkdir -p "$LOCAL_SHARE"
    [ -d "$LOCAL_BIN" ] || mkdir -p "$LOCAL_BIN"

    # Make zsh the default shell if it isn't
    if [ "$SHELL" != "$(command -v zsh)" ] && [ "$(command -v chsh)" ]
    then
      chsh -s "$(command -v zsh)"
    fi

    # Zsh config file
    ln -sf "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
    ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

    # diff-so-fancy
    ln -sf "$LOCAL_SHARE/diff-so-fancy/diff-so-fancy" "$LOCAL_BIN/diff-so-fancy"

    # redshift config
    ln -sf "$DOTFILES/redshift/redshift.conf" "$CONFIG/redshift.conf"

    # Git config
    GITCONFIG="$CONFIG/git"
    [ -d "$GITCONFIG" ] || mkdir -p "$GITCONFIG"
    ln -sf "$DOTFILES/git/config" "$GITCONFIG/config"

    # Noevim
    NVIMCONFIG=$CONFIG/nvim
    [ -d "$NVIMCONFIG" ] || mkdir -p "$NVIMCONFIG"
    ln -sf "$DOTFILES/nvim/init.vim" "$NVIMCONFIG/init.vim"

    # Alacritty
    ALACRITTYCONF=$CONFIG/alacritty
    [ -d "$ALACRITTYCONF" ] || mkdir -p "$ALACRITTYCONF"
    ln -sf "$DOTFILES/alacritty/alacritty.yml" "$ALACRITTYCONF/alacritty.yml"

    # Starship
    ln -sf "$DOTFILES/zsh/starship/starship.toml" "$CONFIG/starship.toml"

    # Tmux
    ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

    # Virtualenv
    [ -d "$VIRTUALENVHOME" ] || mkdir -p "$HOME/.local/virtualenv"

    # Flake8 and black
    ln -sf "$DOTFILES/python/isort.cfg" "$HOME/.isort.cfg"
    ln -sf "$DOTFILES/python/flake8" "$CONFIG/flake8"

    FLAKE8BLACKCONFIG=$CONFIG/flake8-black/
    [ -d "$FLAKE8BLACKCONFIG" ] || mkdir -p "$FLAKE8BLACKCONFIG"
    ln -sf "$DOTFILES/python/black-config.toml" "$FLAKE8BLACKCONFIG/pyproject.toml"

    echo "Tools configured"
}

configure_i3 ()
{
    echo "Configuring i3"

    I3CONFIG=$CONFIG/i3
    [ -d "$I3CONFIG" ] || mkdir -p "$I3CONFIG"
    ln -sf "$DOTFILES/i3/config" "$I3CONFIG/config"

    # rofi config
    ROFICONFIG=$CONFIG/rofi
    [ -d "$ROFICONFIG" ] || mkdir -p "$ROFICONFIG"
    ln -sf "$DOTFILES/rofi/config.rasi" "$ROFICONFIG/config.rasi"

    echo "i3 configured"
}

configure_qtile ()
{
    echo "Configuring Qtile"

    QTILECONFIG=$CONFIG/qtile
    [ -d "$QTILECONFIG" ] || mkdir -p "$QTILECONFIG"
    ln -sf "$DOTFILES/qtile/config.py" "$QTILECONFIG/config.py"

    echo "Qtile configured"
}
