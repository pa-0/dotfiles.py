#!/usr/bin/sh

set -e

install_tools ()
{
    echo "Installing tools"

    [ "$(command -v dnf)" ] && install_tools_fedora
    [ "$(command -v pacman)" ] && install_tools_arch

    # Exit if curl is not installed
    [ "$(command -v curl)" ] || return

    if [ "$(command -v pip)" ]
    then
        echo "Installing python dependencies"
        # Assume that pip will be installed by either of the installers
        python3 -m pip -q install --user --upgrade pipx jedi pynvim

        export PATH="$HOME/.local/bin/:$PATH"

        echo "Installing command line applications"
        for PACKAGE in black docformatter docker-compose ipython isort pycodestyle poetry virtualenv vim-vint mypy; do
            pipx install $PACKAGE
        done

        # inject virtualenvwrapper into virtualenv environment
        pipx inject virtualenv virtualenvwrapper
    fi

    if [ ! "$(command -v cargo)" ]
    then
        echo "Installing cargo"
        curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly --profile complete
        export PATH="$HOME/.cargo/bin:$PATH"
    fi

    # Install plugin managers for ZSH, noevim and tmux
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

    echo "Installing Development Tools"
    # sudo dnf --assumeyes group install "Development Tools"

    echo "Enabling repos for alacritty and fira code fonts"
    sudo dnf -q install --assumeyes "dnf-command(copr)"
    sudo dnf -q --assumeyes copr enable agriffis/neovim-nightly
    sudo dnf -q --assumeyes copr enable pschyska/alacritty
    sudo dnf -q --assumeyes copr enable evana/fira-code-fonts

    echo "Installing essential programs"
    sudo dnf -q install --assumeyes python3-pip \
        zsh git git-extras alacritty tmux neovim \
        fzf fira-code-fonts fontawesome-fonts ShellCheck \
        fd-find bat exa jq ripgrep util-linux-user

    # if [ ! "$(command -v docker)" ]
    # then
    #     echo "Installing Docker"
    #     # From docker documentation: https://docs.docker.com/install/linux/docker-ce/fedora/
    #     sudo dnf install --assumeyes dnf-plugins-core

    #     # Add official repo and install all the tools.
    #     sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    #     sudo dnf install --assumeyes docker-ce docker-ce-cli containerd.io

    #     # Once docker is installed, add user to the docker user group
    #     sudo systemctl start docker
    #     sudo groupadd docker
    #     [ "$USER" ] && sudo usermod -aG docker "$USER"
    # fi
}

install_tools_arch () {
    echo "Installing base-devel"
    sudo pacman -Sy base-devel libffi \
        zsh git alacritty neovim tmux \
        fzf otf-fira-code shellcheck \
        fd bat exa jq ripgrep docker

    mkdir -p "$HOME/.local/src"
    LOCAL_SRC="$HOME/.local/src"

    if [ ! "$(command -v git-extras)" ]
    then
        git clone https://aur.archlinux.org/git-extras.git "$LOCAL_SRC/"
        cd "$LOCAL_SRC/git-extras" || return
        makepkg -si
        cd ..
    fi

    is_installed=$(fc-list | grep fontawesome)
    if [ ! "$is_installed" ]
    then
        git clone https://aur.archlinux.org/ttf-font-awesome-4.git "$LOCAL_SRC"
        cd "$LOCAL_SRC/ttf-font-awesome-4" || return
        makepkg -si
        cd ..
    fi
}

install_i3 ()
{
    echo "Installing i3 and tools"

    [ "$(command -v dnf)" ] && install_i3_fedora
    [ "$(command -v pacman)" ] && install_i3_arch
}

install_i3_fedora ()
{
    sudo dnf --assumeyes copr enable gregw/i3desktop

    # install i3, rofi, feh, polybar, redshift,
    sudo dnf --assumeyes install i3-gaps rofi feh redshift dunst polybar
}

install_i3_arch ()
{
    echo "In construction..."
}
