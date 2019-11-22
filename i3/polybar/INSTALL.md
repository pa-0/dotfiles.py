# Polybar

To install polybar please follow these steps:

```bash
    git clone -q https://github.com/polybar/polybar.git $HOME/Downloads/polybar
    sudo dnf install --assumeyes --quiet gcc-c++ clang git cmake\
        @development-tools python3-sphinx cairo-devel xcb-util-devel\
        libxcb-devel xcb-proto xcb-util-image-devel xcb-util-wm-devel\
        xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel\
        jsoncpp-devel libmpdclient-devel wireless-tools-devel libnl3-devel
    cd $HOME/Downloads/polybar
    $HOME/Downloads/polybar/build.sh --i3 --alsa --pulseaudio --network --mpd --ipc --gcc --auto > polybar_build.log
```

Finally, check that polybar is correctly installed by running `polybar --version`
