#!/bin/bash
set -e

PATH="$HOME/.local/bin:$PATH"

test_command ()
{
    command -v "$1" > /dev/null || echo "$1 not found!"
}

test_dirfile ()
{
    ls "$1" 1>&2 > /dev/null || echo "$1 file or dir not found!"
}

test_commmands ()
{
    test_command alacritty
    test_command bat
    test_command black
    test_command delta
    test_command docformatter
    test_command docker-compose
    test_command dunst
    test_command exa
    test_command fd
    test_command feh
    test_command flake8
    test_command fzf
    test_command git
    test_command i3
    test_command ipython
    test_command jq
    test_command nvim
    test_command pipx
    test_command poetry
    test_command polybar
    test_command qtile
    test_command redshift
    test_command rg
    test_command rofi
    test_command shellcheck
    test_command starship
    test_command tmux
    test_command vint
    test_command virtualenv
    test_command vulture
}

test_files ()
{
  test_dirfile "$HOME/.antigen"
  test_dirfile "$HOME/.config"
  test_dirfile "$HOME/.config/alacritty/alacritty.yml"
  test_dirfile "$HOME/.config/flake8"
  test_dirfile "$HOME/.config/flake8-black/pyproject.toml"
  test_dirfile "$HOME/.config/git/config"
  test_dirfile "$HOME/.config/i3/config"
  test_dirfile "$HOME/.config/nvim/init.vim"
  test_dirfile "$HOME/.config/qtile/config.py"
  test_dirfile "$HOME/.config/rofi/config.rasi"
  test_dirfile "$HOME/.config/starship.toml"
  test_dirfile "$HOME/.isort.cfg"
  test_dirfile "$HOME/.local/bin"
  test_dirfile "$HOME/.local/bin/diff-so-fancy"
  test_dirfile "$HOME/.local/share"
  test_dirfile "$HOME/.local/share/nord_dir_colors"
  test_dirfile "$HOME/.local/share/nvim/site/autoload/plug.vim"
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
