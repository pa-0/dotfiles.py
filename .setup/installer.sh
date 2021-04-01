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
        mypy \
        poetry \
        pycodestyle \
        pyls \
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
    echo -n "Installing completions: "
    ZFUNC_DIR="$HOME/.local/share/zfunc"
    if [ ! -d "$ZFUNC_DIR" ]
    then
        mkdir "$ZFUNC_DIR"
    fi

    if [ "$(command -v poetry)" ] && [ ! -f "$ZFUNC_DIR/_poetry" ]
    then
        echo -n "poetry, "
        poetry completions zsh > "$ZFUNC_DIR/_poetry"
    fi

    if [ ! -f "$ZFUNC_DIR/_docker-compose" ]
    then
        echo -n "docker-compose, "
        curl -sL https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/zsh/_docker-compose > "$ZFUNC_DIR/_docker-compose"
    fi

    if [ ! -f "$ZFUNC_DIR/_docker" ]
    then
        echo -n "docker, "
        curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > "$ZFUNC_DIR/_docker"
    fi

    if [ "$(command -v gh)" ] && [ ! -f "$ZFUNC_DIR/_gh" ]
    then
        echo -n "Github CLI, "
        gh completion -s zsh > "$ZFUNC_DIR/_gh"
    fi

    if [ ! -f "$ZFUNC_DIR/_exa" ]
    then
        echo "and exa."
        curl -sL https://raw.githubusercontent.com/ogham/exa/master/completions/completions.zsh > "$ZFUNC_DIR/_exa"
    fi
}

install_tools_from_curl ()
{
    LOCAL_SHARE="$HOME/.local/share"
    LOCAL_BIN="$HOME/.local/bin"

    ANTIGEN_HOME="$LOCAL_SHARE/antigen"
    if [ ! -d "$ANTIGEN_HOME" ]
    then
        echo "Installing Antigen"
        mkdir "$ANTIGEN_HOME"
        curl -sL git.io/antigen-nightly > "$ANTIGEN_HOME/antigen.zsh"
    fi

    # starship
    if [ ! "$(command -v starship)" ]
    then
        echo "Installing Starship"
        curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
    fi

    # vim-plug
    if [ ! -f "$LOCAL_SHARE/nvim/site/autoload/plug.vim" ]
    then
        echo "Installing vim-plug"
        curl -sfLo "$LOCAL_SHARE/nvim/site/autoload/plug.vim" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    # Tmux plugin manager
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]
    then
        echo "Installing Tmux Plugin Manager"
        git clone -q https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi

    # Nord dircolors
    if [ ! -d "$LOCAL_SHARE/nord_dir_colors" ]
    then
        echo "Installing nord dir_colors"
        git clone -q https://github.com/arcticicestudio/nord-dircolors "$LOCAL_SHARE/nord_dir_colors"
    fi

    # Install emojify
    if [ ! -d "$LOCAL_BIN/emojify" ]
    then
        echo "Installing emojify"
        curl -sL https://raw.githubusercontent.com/mrowa44/emojify/master/emojify \
            -o "$LOCAL_BIN/emojify" && chmod +x "$LOCAL_BIN/emojify"
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
            command yarn global --prefix ~/.local/ add "$PROG"
        done
    fi

    # Install rust
    export CARGO_HOME="$LOCAL_SHARE/cargo"
    export RUSTUP_HOME="$LOCAL_SHARE/rustup"
    if [ ! -d "$CARGO_HOME" ]
    then
        echo "Installing Rust"

        curl -sL --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain nightly
    fi

    # Install rust-analyzer (Rust Language Server)
    if [ ! "$(command -v rust-analyzer)" ]
    then
        curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux \
            -o "$LOCAL_BIN/rust-analyzer" && chmod +x "$LOCAL_BIN/rust-analyzer"
    fi

    # Install go tools: gopls, golint
    if [ "$(command -v go)" ]
    then
        echo "Installing golang tools"
        export GOPATH="$LOCAL_SHARE/go/"
        GO111MODULE=on go get golang.org/x/tools/gopls@latest
    fi
}

install_tools_fedora ()
{
    echo "Enabling copr repos: neovim nightly, alacritty, github CLI, fira-code-fonts."
    sudo dnf install -q --assumeyes "dnf-command(copr)"
    sudo dnf -q --assumeyes copr enable agriffis/neovim-nightly
    sudo dnf -q --assumeyes copr enable pschyska/alacritty
    sudo dnf -q config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

    echo "Enabling NPM and YARN repos."
    curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

    echo "Enabling kubernetes repo."
    cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

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
    echo "Installing i3 and i3-tools"
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
