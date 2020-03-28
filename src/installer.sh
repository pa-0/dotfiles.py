#!/usr/bin/sh

install_tools ()
{
    echo
    echo "Installing tools"
    echo

    echo "First, let's update the system."
    sudo dnf update --assumeyes --quiet

    echo "Enabling repos for alacritty and fira code fonts"
    sudo dnf --assumeyes copr enable agriffis/neovim-nightly
    sudo dnf --assumeyes copr enable pschyska/alacritty 
    sudo dnf --assumeyes copr enable evana/fira-code-fonts

    echo "Installing essential programs..."
    sudo dnf install --assumeyes \
        zsh git git-extras alacritty tmux neovim \
        fzf fira-code-fonts fontawesome-fonts \
        fd-find bat exa jq ripgrep

    echo "Installing python dependencies"
    python3 -m pip install --quiet --user pipx jedi pynvim virtualenv virtualenvwrapper

    echo "Installing command line applications"
    for PACKAGE in black docformatter docker-compose ipython isort pycodestyle poetry; do
        pipx install $PACKAGE
    done

    echo
    echo "Installing cargo"
    echo

    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly --profile complete
    export PATH="$HOME/.cargo/bin:$PATH"

    if ! $(which docker &> /dev/null); then
        echo "Installing Docker"
        # From docker documentation: https://docs.docker.com/install/linux/docker-ce/fedora/
        sudo dnf install --assumeyes dnf-plugins-core

        # Add official repo and install all the tools.
        sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
        sudo dnf install --assumeyes docker-ce docker-ce-cli containerd.io

        # Once docker is installed, add user to the docker user group
        sudo systemctl start docker
        sudo groupadd docker
        sudo usermod -aG docker $USER
    fi

    echo
    echo "Downloading plugin managers"

    # Install plugin managers for ZSH, noevim and tmux
    if [[ ! -d $HOME/.oh_my_zsh ]]; then
        echo -n "  Installing Oh My Zsh!..."
        git clone -q https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh_my_zsh
        echo " done"

        ZSH_CUSTOM=$HOME/.oh_my_zsh/custom

        if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k/ ]]; then
            echo -n "  Installing powerlevel10k..."
            git clone -q https://github.com/romkatv/powerlevel10k.git\
                $HOME/.oh_my_zsh/custom/themes/powerlevel10k
            echo " done"
        fi

        if [[ ! -d $ZSH_CUSTOM/plugins/fast-syntax-highlighting/ ]]; then
            echo -n "  Installing fast-syntax-highlighting..."
            git clone -q https://github.com/zdharma/fast-syntax-highlighting.git\
                $HOME/.oh_my_zsh/custom/plugins/fast-syntax-highlighting
            echo " done"
        fi

        if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions/ ]]; then
            echo -n "  Installing zsh-autosuggestions..."
            git clone -q https://github.com/zsh-users/zsh-autosuggestions.git\
                $HOME/.oh_my_zsh/custom/plugins/zsh-autosuggestions
            echo " done"
        fi
    fi

    if [[ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
        echo -n "  Installing vim.plug Plugin Manager for vim..."
        curl -sfLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo " done"
    fi

    if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
        echo -n "  Installing TPM plugin manager for Tmux..."
        git clone -q https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        echo " done"
    fi

    echo
    echo "Installing additional stuff"
    if [[ ! -d $DIRCOLORSHOME ]]; then
            echo -n "  Downloading nord dir_colors..."
            git clone -q https://github.com/arcticicestudio/nord-dircolors $DIRCOLORSHOME
            [[ ! -f $DIRCOLORS ]] && ln -sf $DIRCOLORSHOME/src/dir_colors $DIRCOLORS
            echo " done"
    fi

    # Diff-so-fancy
    if [[ ! -d $DIFFSOFANCY ]]; then
        echo -n "  Installing diff-so-fancy..."
        git clone -q https://github.com/so-fancy/diff-so-fancy $DIFFSOFANCY
        ln -sf $LOCAL_SHARE/diff-so-fancy/diff-so-fancy $LOCAL_BIN/diff-so-fancy
        echo " done"
    fi
}

install_i3 ()
{
    echo
    echo "Installing i3 and tools..."
    echo

    sudo dnf --assumeyes --quiet copr enable gregw/i3desktop

    # install i3, rofi, feh, polybar, redshift,
    sudo dnf --assumeyes --quiet install i3-gaps rofi feh redshift
}


