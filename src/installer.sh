#!/usr/bin/sh

install_tools ()
{
    echo
    echo "Installing tools"
    echo

    if [ "$HAS_DNF" -eq 1 ]
    then
        if [ "$NO_UPDATES" -eq 0 ]
        then
        echo "Updating the system"
            sudo dnf update --assumeyes
        fi

        echo "Installing Development Tools"
        sudo dnf --assumeyes group install "Development Tools"

        echo "Enabling repos for alacritty and fira code fonts"
        sudo dnf install --assumeyes "dnf-command(copr)"
        sudo dnf --assumeyes copr enable agriffis/neovim-nightly
        sudo dnf --assumeyes copr enable pschyska/alacritty
        sudo dnf --assumeyes copr enable evana/fira-code-fonts

        echo "Installing essential programs"
        sudo dnf install --assumeyes \
            python3-pip util-linux-user xsel \
            fira-code-fonts fontawesome-fonts ShellCheck \
            zsh git git-extras alacritty tmux neovim fzf \
            fd-find bat exa jq ripgrep

        if [ ! "$(command -v docker)" ]
        then
            echo "Installing Docker"
            # From docker documentation: https://docs.docker.com/install/linux/docker-ce/fedora/
            sudo dnf install --assumeyes dnf-plugins-core

            # Add official repo and install all the tools.
            sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
            sudo dnf install --assumeyes docker-ce docker-ce-cli containerd.io

            # Once docker is installed, add user to the docker user group
            sudo systemctl start docker
            sudo groupadd docker
            sudo usermod -aG docker "$USER"
        fi
    fi

    if [ "$(command -v pip)" ]
    then
        echo "Installing python dependencies"
        python3 -m pip install --user --upgrade pipx jedi pynvim

        export PATH="$HOME/.local/bin/:$PATH"

        echo "Installing command line applications"
        for PACKAGE in black docformatter docker-compose ipython isort pycodestyle poetry virtualenv vim-vint; do
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

    # Install enact to take care of monitor hotplugging
    if [ "$(command -v cargo)" ]
    then
        cargo install --git https://github.com/chmln/enact
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

install_i3 ()
{
    echo
    echo "Installing i3 and tools"
    echo

    sudo dnf --assumeyes --quiet copr enable gregw/i3desktop

    # install i3, rofi, feh, polybar, redshift,
    sudo dnf --assumeyes --quiet install i3-gaps rofi feh redshift dunst polybar
}
