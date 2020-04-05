# Functions to easily update stuff

function update_pipx_progs () {
    # upgrade programs installed with pipx
    PIP_REQUIRE_VIRTUALENV="" python3 -m pip install pipx --upgrade --quiet
    pipx upgrade-all &> /dev/null
}

function update_nvim_plugins () {
    # upgrade neovim plugins
    nvim -c "PlugUpdate | PlugUpgrade | qa! " --headless
}
