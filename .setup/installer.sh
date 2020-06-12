#!/usr/bin/sh

set -e

fedora_version () {
    grep -oP "\d{2}" /etc/fedora-release
}

install_tools ()
{
    echo "Installing tools"

    [ "$(command -v dnf)" ] && [ "$(command -v dnf)" ] && install_tools_fedora
    if [ "$(command -v pip)" ]
    then
        echo "Installing python dependencies"
        # Assume that pip will be installed by either of the installers
        python3 -m pip -q install --user --upgrade pipx jedi pynvim screeninfo virtualenv virtualenvwrapper

        export PATH="$HOME/.local/bin/:$PATH"

        echo "Installing command line applications"
        for PACKAGE in black docformatter docker-compose flake8 ipython isort pycodestyle poetry vim-vint mypy; do
            pipx install $PACKAGE
        done

        pipx inject flake8 flake8-black flake8-bugbear flake8-builtins flake8-comprehensions flake8-isort flake8-variables-names
    fi

    # Exit if curl is not installed
    [ "$(command -v curl)" ] || return

    if [ ! -d "$HOME/.antigen" ]
    then
        echo "Installing Antigen"
        git clone -q https://github.com/zsh-users/antigen.git "$HOME/.antigen"
    fi

    # vim-plug
    if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]
    then
        echo "Installing vim-plug"
        curl -sfLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    # Tmux plugin manager
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]
    then
        echo "Installing Tmux Plugin Manager"
        git clone -q https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi

    # Nord dircolors
    if [ ! -d "$HOME/.local/share/nord_dir_colors" ]
    then
        echo "Installing nord dir_colors"
        git clone -q https://github.com/arcticicestudio/nord-dircolors "$HOME/.local/share/nord_dir_colors"
    fi

    # Diff-so-fancy
    if [ ! -d "$HOME/.local/share/diff-so-fancy" ]
    then
        echo "Installing diff-so-fancy"
        git clone -q https://github.com/so-fancy/diff-so-fancy "$HOME/.local/share/diff-so-fancy"
    fi

}

install_tools_fedora () {
    if [ "$NO_UPDATES" -eq 0 ]
    then
        echo "Updating the system"
        sudo dnf -q update --assumeyes
    fi

    if [ "$( test "$USER" )" ] && [ "$USER" != "root" ]
    then
        echo "Installing Development Tools"
        sudo dnf --assumeyes -q group install "Development Tools"
        sudo dnf --assumeyes -q install make cmake g++ python3-devel
    fi

    echo "Enabling repos for alacritty and fira code fonts"
    sudo dnf -q install --assumeyes "dnf-command(copr)"
    sudo dnf -q --assumeyes copr enable agriffis/neovim-nightly
    sudo dnf -q --assumeyes copr enable pschyska/alacritty
    [ "$(fedora_version)" -eq 30 ] && \
        sudo dnf copr enable evana/fira-code-fonts

    echo "Installing essential programs"
    sudo dnf -q install --assumeyes python3-devel python3-pip \
        zsh git git-extras alacritty tmux neovim \
        fzf fira-code-fonts fontawesome-fonts ShellCheck \
        fd-find bat exa jq ripgrep util-linux-user
}

install_qtile ()
{
    # Install qtile and some dependencies
    sudo dnf -q --assumeyes install qtile wireless-tools-devel ghc-iwlib-devel i3lock
    python3 -m pip install --user iwlib
}

install_i3 ()
{
    if [ "$(fedora_version)" -lt 32 ]
    # i3-gaps from this repo is not yet built for fedora 32
    then
        sudo dnf -q --assumeyes copr enable gregw/i3desktop
        I3="i3-gaps"
    else
        I3="i3"
    fi

    # install i3, rofi, feh, polybar, redshift,
    sudo dnf -q --assumeyes install "$I3" rofi feh redshift dunst polybar
}
