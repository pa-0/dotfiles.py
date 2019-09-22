#!/bin/sh

# This is the install script
DOTFILES=$HOME/.dotfiles
CONFIG=$HOME/.config
LOCAL_SHARE=$HOME/.local/share
LOCAL_BIN=$HOME/.local/bin
DIRCOLORS=$HOME/.dir_colors
DIRCOLORSHOME=$LOCAL_SHARE/nord_dir_colors
DIFFSOFANCY=$LOCAL_SHARE/diff-so-fancy

echo 
echo "    Installing dotfiles!"
echo

cd $DOTFILES 
git pull

echo "Enabling repos for termite and fira code fonts"
sudo dnf -yq copr enable skidnik/termite
sudo dnf -yq copr enable evana/fira-code-fonts

# Install basic tools
echo "Installing zsh, git, fzf, neovim, tmux, termite, fira code fonts and git-extras"
sudo dnf install -yq zsh git fzf neovim tmux termite fira-code-fonts git-extras

[[ ! -d $CONFIG ]] && mkdir -p $CONFIG
[[ ! -d $LOCAL_SHARE ]] && mkdir -p $LOCAL_SHARE
[[ ! -d $LOCAL_BIN ]] && mkdir -p $LOCAL_BIN

echo
echo "Downloading plugin managers"

# Install plugin managers for ZSH, noevim and tmux
if [[ ! -d $HOME/.antigen ]]; then
    echo -n "Installing Antigen plugin manager for ZSH..."
    git clone -q https://github.com/zsh-users/antigen.git $HOME/.antigen
    echo " done"
fi

if [[ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
    echo -n "Installing vim.plug Plugin Manager for vim..."
    curl -sfLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo " done"
fi

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    echo -n "Installing TPM plugin manager for Tmux..."
    git clone -q https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    echo " done"
fi

echo
echo "Installing nice things"
if [[ ! -d $DIRCOLORSHOME ]]; then
        echo -n "Downloading nord dir_colors..."
        git clone -q https://github.com/arcticicestudio/nord-dircolors $DIRCOLORSHOME
        [[ ! -f $DIRCOLORS ]] && ln -sf $DIRCOLORSHOME/src/dir_colors $DIRCOLORS
        echo " done"
fi

# Diff-so-fancy
if [[ ! -d $DIFFSOFANCY ]]; then
    echo -n "Installing diff-so-fancy..."
    git clone -q https://github.com/so-fancy/diff-so-fancy $DIFFSOFANCY
    ln -sf $LOCAL_SHARE/diff-so-fancy/diff-so-fancy $LOCAL_BIN/diff-so-fancy
    echo " done"
fi

pip install --user virtualenv virtualenvwrapper jedi pynvim black ipython &> /dev/null

# Link all the things
echo
echo "Copying configuration files..."

# Zsh config file
ln -sf $DOTFILES/zshrc $HOME/.zshrc

# Git config
GITCONFIG=$HOME/.gitconfig
GITIGNORE=$HOME/.gitignore
[[ ! -f $GITCONFIG ]] && ln -sf $DOTFILES/gitconfig $GITCONFIG
[[ ! -f $GITIGNORE ]] && ln -sf $DOTFILES/gitignore $GITIGNORE

# Noevim
NVIMCONFIG=$CONFIG/nvim
[[ ! -d $NVIMCONFIG ]] && mkdir -p $NVIMCONFIG
[[ ! -f $NVIMCONFIG/init.vim ]] && ln -sf $DOTFILES/config/init.vim $NVIMCONFIG/init.vim
if [[ ! -d $LOCAL_SHARE/nvim/plugins ]]; then
    echo -n "Installing NeoVim plugins. It might take a while..."
    [[ ! -f /usr/bin/python ]] && sudo ln -s /usr/bin/python3 /usr/bin/python

    nvim --headless +"let g:plug_timeout = 180" +PlugInstall +qa &> /dev/null
    echo " done"
fi

# Termite
TERMITECONFIG=$CONFIG/termite
[[ ! -d $TERMITECONFIG ]] && mkdir -p $TERMITECONFIG
[[ ! -f $TERMITECONFIG/config ]] && ln -sf $DOTFILES/config/termite $TERMITECONFIG/config

# Tmux
TMUXCONFIG=$HOME/.tmux.conf
[[ ! -f $TMUXCONFIG ]] && ln -sf $DOTFILES/config/tmux.conf $TMUXCONFIG

# Virtualenv
VIRTUALENVHOME=$HOME/.virtualenv
[[ ! -d $VIRTUALENVHOME ]] && mkdir -p $VIRTUALENVHOME
for HOOK in $(ls $DOTFILES/python/virtualenvwrapper/); do
    [[ ! -f $VIRTUALENVHOME/$HOOK ]] && ln -sf $DOTFILES/python/virtualenvwrapper/$HOOK $VIRTUALENVHOME/$HOOK
done

# Flake8 and black
FLAKE8CONFIG=$CONFIG/flake8
FLAKE8BLACKCONFIG=$CONFIG/flake8-black
ISORTCONFIG=$HOME/.isort.cfg
[[ ! -f $FLAKE8CONFIG ]] && ln -sf $DOTFILES/python/flake8 $FLAKE8CONFIG
[[ ! -f $ISORTCONFIG ]] && ln -sf $DOTFILES/python/isort.cfg $ISORTCONFIG
[[ ! -d $FLAKE8BLACKCONFIG ]] && mkdir -p $FLAKE8BLACKCONFIG
[[ ! -f $FLAKE8BLACKCONFIG/pyproject.toml ]] && ln -sf $DOTFILES/python/flake8-black $FLAKE8BLACKCONFIG/pyproject.toml

echo
echo "Installation done, please restart the terminal!"
echo "The first time you reload the terminal after executing \
this script antigen will install all the ZSH plugins. \
virtualenvwrapper will also initialise the remained of scripts."
