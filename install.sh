#!/bin/zsh

# This is the install script
DOTFILES=$HOME/.dotfiles
CONFIG=$HOME/.config
LOCAL_SHARE=$HOME/.local/share
LOCAL_BIN=$HOME/.local/bin
DIRCOLORS=$HOME/.dir_colors
DIRCOLORSHOME=$LOCAL_SHARE/nord_dir_colors
DIFFSOFANCY=$LOCAL_SHARE/diff-so-fancy

echo 
figlet -n ".dotfiles"
echo

if [[ $SHELL != "/bin/zsh" ]]; then
    echo "  -> ZSH not found. Please install ZSH."
    echo
    exit 1
fi

echo "First, let's update the system"
sudo dnf update -yq

echo "Enabling repos for termite and fira code fonts"
sudo dnf -yq copr enable skidnik/termite
sudo dnf -yq copr enable evana/fira-code-fonts

# Install basic tools
echo "Installing git, fzf, neovim, tmux, termite, fira code fonts and git-extras"
sudo dnf install -yq git fzf neovim tmux termite fira-code-fonts git-extras

[[ ! -d $CONFIG ]] && mkdir -p $CONFIG
[[ ! -d $LOCAL_SHARE ]] && mkdir -p $LOCAL_SHARE
[[ ! -d $LOCAL_BIN ]] && mkdir -p $LOCAL_BIN

echo
echo "Downloading plugin managers"

# Install plugin managers for ZSH, noevim and tmux
if [[ ! -d $HOME/.oh_my_zsh ]]; then
    echo -n "Installing Oh My Zsh!..."
    git clone -q https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh_my_zsh
    echo " done"
fi

ZSH_CUSTOM=$HOME/.oh_my_zsh/custom
[[ ! -d $ZSH_CUSTOM/themes/powerlevel10k/ ]] && git clone -q https://github.com/romkatv/powerlevel10k.git $HOME/.oh_my_zsh/custom/themes/powerlevel10k
[[ ! -d $ZSH_CUSTOM/plugins/fast-syntax-highlighting/ ]] && git clone -q https://github.com/zdharma/fast-syntax-highlighting.git $HOME/.oh_my_zsh/custom/plugins/fast-syntax-highlighting
[[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions/ ]] && git clone -q https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh_my_zsh/custom/plugins/zsh-autosuggestions

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
ln -sf $DOTFILES/oh_my_zshrc $HOME/.zshrc

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
