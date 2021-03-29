#!/usr/bin/sh

set -e

fedora_version () {
    grep -oP "\d{2}" /etc/fedora-release
}

install_tools ()
{
    echo "Installing tools"

    [ "$(command -v dnf)" ] && [ "$(command -v dnf)" ] && install_tools_fedora
    [ "$(command -v pip)" ] && install_pip_packages
    [ "$(command -v curl)" ] && install_tools_from_curl
    install_completions
}

install_pip_packages ()
{
    echo "Installing python dependencies"
    # Assume that pip will be installed by either of the installers
    python3 -m pip install --user --upgrade -r ./.setup/pip-requirements.txt

    export PATH="$HOME/.local/bin/:$PATH"

    echo "Installing command line applications"
    for PACKAGE in \
        awscli \
        black \
        docformatter \
        docker-compose \
        flakehell \
        ipython \
        isort \
        jedi-language-server \
        mypy \
        poetry \
        pycodestyle \
        vim-vint \
        vulture \
        yamllint
    do
        pipx install $PACKAGE
    done

    pipx inject flakehell \
        flake8-black \
        flake8-bugbear \
        flake8-builtins \
        flake8-comprehensions \
        flake8-docstrings \
        flake8-import-order \
        flake8-variables-names
}

install_completions ()
{
    if [ ! -d "$HOME/.local/share/zfunc" ]
    then
        mkdir "$HOME/.local/share/zfunc"
    fi

    if [ "$(command -v poetry)" ] && [ ! -f "$HOME/.local/share/zfunc/_poetry" ]
    then
        poetry completions zsh > "$HOME/.local/share/zfunc/_poetry"
    fi

    if [ ! -f "HOME/.local/share/zfunc/_docker-compose" ]
    then
        curl -sL https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/zsh/_docker-compose > "$HOME/.local/share/zfunc/_docker-compose"
    fi

    if [ ! -f "$HOME/.local/share/zfunc/_docker" ]
    then
        curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > "$HOME/.local/share/zfunc/_docker"
    fi

    if [ "$(command -v gh)" ] && [ ! -f "$HOME/.local/share/zfunc/_gh" ]
    then
        gh completion -s zsh >> "$HOME/.local/share/zfunc/_gh"
    fi

    if [ ! -f "$HOME/.local/share/zfunc/_exa" ]
    then
        curl -sL https://raw.githubusercontent.com/ogham/exa/master/completions/completions.zsh > ~/.local/share/zfunc/_exa
    fi
}

install_tools_from_curl ()
{
    ANTIGEN_HOME=$CONFIG/antigen
    if [ ! -d "$ANTIGEN_HOME" ]
    then
        echo "Installing Antigen"
        git clone -q https://github.com/zsh-users/antigen.git "$ANTIGEN_HOME"
    fi

    # starship
    if [ ! "$(command -v starship)" ]
    then
        echo "Installing Starship"
        curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
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

    # Install emojify
    if [ ! -d "$HOME/.local/bin/emojify" ]
    then
        echo "Installing emojify"
        curl -sL https://raw.githubusercontent.com/mrowa44/emojify/master/emojify \
            -o "$HOME/.local/bin/emojify" && chmod +x "$HOME/.local/bin/emojify"
    fi

    # Add NPM to install nodejs
    if [ "$(command -v yarn)" ]
    then
        echo "Installing prettier with yarn"
        for PROG in \
            lua-fmt \
            heroku \
            prettier \
            stylelint
        do
            command yarn global --prefix ~/.local/ add $PROG
        done
    fi

    # Install rust
    if [ ! -d "$HOME/.local/cargo/" ]
    then
        echo "Installing Rust"
        export CARGO_HOME="$HOME/.local/share/cargo"
        export RUSTUP_HOME="$HOME/.local/share/rustup"

        curl -sL --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain nightly

        echo "Installing Rust programs..."
        for PROG in \
            bat \
            exa \
            fd-find \
            git-delta \
            ripgrep
        do
            echo " - Installing $PROG"
            "$CARGO_HOME/bin/cargo" install $PROG
        done

        if [ ! "$(command -v rust-analyzer)" ]
        then
            curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux \
                -o ~/.local/bin/rust-analyzer && chmod +x ~/.local/bin/rust-analyzer
        fi
    fi

    # Install go tools: gopls, golint
    if [ "$(command -v go)" ]
    then
        echo "Installing golang tools"
        export GOPATH="$HOME/.local/share/go/"
        GO111MODULE=on go get golang.org/x/tools/gopls@latest
    fi

    # Install kubectl
    if [ -d "$(command -v kubectl)" ]
    then
    echo "Installing kubectl"
        curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
            mv ./kubectl "$HOME/.local/bin" && \
            chmod +x ~/.local/bin/kubectl
    fi
}

install_tools_fedora ()
{
    echo "Enabling repo for fira code fonts and neovim nightly"
    sudo dnf install --assumeyes "dnf-command(copr)"
    sudo dnf --assumeyes copr enable agriffis/neovim-nightly
    sudo dnf -q --assumeyes copr enable pschyska/alacritty
    sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
    [ "$(fedora_version)" -eq 30 ] && \
        sudo dnf copr enable evana/fira-code-fonts

    curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

    echo "Installing essential programs"
    sudo dnf install --assumeyes $(cat ./.setup/dnf_packages.txt)
}

install_qtile ()
{
    [ "$(command -v dnf)" ] || return
    # Install qtile and some dependencies
    sudo dnf -q --assumeyes install $(cat ./.setup/dnf_qtile_packages.txt)
    python3 -m pip install --user -r ./.setup/pip-qtile-requirements.txt
}

install_i3 ()
{
    [ "$(command -v dnf)" ] || return
    if [ "$(fedora_version)" -lt 32 ]
    # i3-gaps from this repo is not yet built for fedora 32
    then
        sudo dnf --assumeyes copr enable gregw/i3desktop
        I3="i3-gaps"
    else
        I3="i3"
    fi

    # install i3, rofi, feh, polybar, redshift,
    sudo dnf --assumeyes install "$I3" $(cat ./.setup/dnf_i3_packages.txt)
}
