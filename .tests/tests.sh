#!/bin/bash
set -euo pipefail

PATH="$HOME/.local/bin/:$HOME/.local/share/cargo/bin/:$HOME/.local/share/go/bin/:$PATH"

test_command ()
{
    (command -v "$1" > /dev/null) || (echo "$1 not found!" && exit 1)
}

test_dirfile ()
{
    (ls "$1" &> /dev/null) || (echo "$1 file or dir not found!" && exit 1)
}

test_commmands ()
{
    test_command alacritty
    test_command aws
    test_command bat
    test_command black
    test_command cargo
    test_command delta
    test_command docformatter
    test_command docker-compose
    test_command dunst
    test_command emojify
    test_command exa
    test_command fd
    test_command feh
    test_command flakehell
    test_command fzf
    test_command gh
    test_command git
    test_command go
    test_command gofmt
    # test_command golint
    test_command gopls
    test_command heroku
    test_command i3
    test_command ipython
    test_command jq
    test_command kubectl
    test_command luafmt
    test_command npm
    test_command nvim
    test_command pipx
    test_command poetry
    test_command polybar
    test_command prettier
    test_command redshift
    test_command rg
    test_command rofi
    test_command rust-analyzer
    test_command rustc
    test_command rustfmt
    test_command shellcheck
    test_command starship
    test_command stylelint
    test_command tmux
    test_command vint
    test_command virtualenv
    test_command vulture
    test_command xsel
    test_command yamllint
    test_command yarn
    test_command zsh
}

test_files ()
{
  test_dirfile "$HOME/.config"
  test_dirfile "$HOME/.config/alacritty/alacritty.yml"
  test_dirfile "$HOME/.config/antigen"
  test_dirfile "$HOME/.config/cargo"
  test_dirfile "$HOME/.config/flake8"
  test_dirfile "$HOME/.config/flake8-black/pyproject.toml"
  test_dirfile "$HOME/.config/git/config"
  test_dirfile "$HOME/.config/i3/config"
  test_dirfile "$HOME/.config/nvim/init.vim"
  test_dirfile "$HOME/.config/rofi/config.rasi"
  test_dirfile "$HOME/.isort.cfg"
  test_dirfile "$HOME/.local/bin"
  test_dirfile "$HOME/.local/share"
  test_dirfile "$HOME/.local/share/nord_dir_colors"
  test_dirfile "$HOME/.local/share/nvim/site/autoload/plug.vim"
  test_dirfile "$HOME/.local/share/zfunc/"
  test_dirfile "$HOME/.local/share/zfunc/_docker"
  test_dirfile "$HOME/.local/share/zfunc/_docker-compose"
  test_dirfile "$HOME/.local/share/zfunc/_exa"
  test_dirfile "$HOME/.local/share/zfunc/_gh"
  test_dirfile "$HOME/.local/share/zfunc/_poetry"
  test_dirfile "$HOME/.tmux.conf"
  test_dirfile "$HOME/.tmux/plugins/tpm"
  test_dirfile "$HOME/.zshenv"
  test_dirfile "$HOME/.zshrc"
}

test ()
{
    test_commmands
    test_files
}

test
