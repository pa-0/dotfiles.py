#! /bin/zsh

# Dirs
DOTFILES=$HOME/.dotfiles
CONFIG=$HOME/.config
LOCAL_BIN=$HOME/.local/bin

if [[ $(which figlet &> /dev/null) ]]; then
    figlet -n "i3"
else
    echo "i3"
fi

if [[ ! $(which zsh) ]]; then
    echo "  -> ZSH not found. Please install ZSH."
    echo
    exit 1
fi

echo "Installing i3 and other helper programs"
# install i3, rofi, feh, polybar, redshift,
sudo dnf --assumeyes --quiet copr enable gregw/i3desktop
sudo dnf --assumeyes --quiet install i3-gaps rofi feh redshift

# i3 config
I3CONFIG=$CONFIG/i3
[[ ! -d $I3CONFIG ]] && mkdir -p $I3CONFIG
[[ ! -f $I3CONFIG/config ]] && ln -sf $DOTFILES/i3/i3_config $I3CONFIG/config

# rofi config
ROFICONFIG=$CONFIG/rofi
[[ ! -d $ROFICONFIG ]] && mkdir -p $ROFICONFIG
[[ ! -f $ROFICONFIG/config ]] && ln -sf $DOTFILES/i3/rofi/config $ROFICONFIG/config

# polybar config
POLYCONFIG=$CONFIG/polybar
[[ ! -d $POLYCONFIG ]] && mkdir -p $POLYCONFIG
[[ ! -f $POLYCONFIG/config ]] && ln -sf $DOTFILES/i3/polybar/config $POLYCONFIG/config

# Redshift config
REDSHIFTCONF=$CONFIG
[[ ! -f $REDSHIFTCONF/config ]] && ln -sf $DOTFILES/i3/redshift/redshift.conf $REDSHIFTCONF/redshift.conf

# Aux scripts
[[ ! -f $LOCAL_BIN/screens.zsh ]] && ln -sf $DOTFILES/i3/screens.zsh $LOCAL_BIN/screens.zsh
[[ ! -f $LOCAL_BIN/launch.zsh ]] && ln -sf $DOTFILES/i3/polybar/launch.zsh $LOCAL_BIN/launch.sh

# Wallpapers
[[ ! -f $HOME/Pictures/wallpaper.jpg ]] && ln -sf $DOTFILES/wallpaper/space_wallpaper_1020x1080.jpg $HOME/Pictures/wallpaper.jpg
[[ ! -f $HOME/Pictures/fedora_nord_wallpaper.jpg ]] && ln -sf $DOTFILES/wallpaper/fedora_nord_wallpaper_1920x1080.jpg $HOME/Pictures/fedora_nord_wallpaper.jpg

echo "To install polybar please read POLYBAR_INSTALL.md"
echo "Everything is ready! Log out to log in with i3."
