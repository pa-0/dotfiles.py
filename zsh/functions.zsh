#!/bin/zsh
# update everything

function update_zsh_plugins () {
    # Update plugins that live in the oh-my-zsh! folder
    if [[ -v ZSH_CUSTOM ]]; then
        for CUSTOMDIR in $(ls -d $ZSH_CUSTOM/themes/* $ZSH_CUSTOM/plugins/*); do
            if [[ $(basename $CUSTOMDIR) =~ 'example.*' ]]; then
                # IGnore example files in oh my zsh custom folder
                continue
            fi
            echo -n "Updating $(basename $CUSTOMDIR)..."
            cd $CUSTOMDIR
            git pull --rebase --stat origin master --quiet
            cd -
            echo " done!"
        done
    fi
}

function update_cargo_programs () {
    # update cargo programs
    cargo install-update --all --quiet
}

function update_pipx_progs () {
    # upgrade programs installed with pipx
    PIP_REQUIRE_VIRTUALENV="" python3 -m pip install pipx --upgrade --quiet
    pipx upgrade-all &> /dev/null
}

function update_fedora () {
    # Update the system
    sudo dnf update --assumeyes --quiet
}

function update_nvim_plugins () {
    # upgrade neovim plugins
    nvim -c "PlugUpdate | PlugUpgrade | qa! " --headless
}

function update-all () {
    sudo -i exit
    update_fedora &
    update_cargo_programs &
    update_oh_my_zsh &> /dev/null &
    update_zsh_plugins &
    update_pipx_progs &
    upgrade_nvim_plugins &
}
