# qtile config
#        _   _ _
#   __ _| |_(_) | ___
#  / _` | __| | |/ _ \
# | (_| | |_| | |  __/
#  \__, |\__|_|_|\___|
#     |_|

import os
import pathlib
import platform
import subprocess
from typing import List

from libqtile import bar
from libqtile import config
from libqtile import hook
from libqtile import layout
from libqtile import widget
import screeninfo


try:
    from libqtile.lazy import lazy
except ImportError:
    # For compatibility with earlier versions of qtile
    from libqtile.command import lazy


class Colors:
    polar = ["#2e3440", "#3b4252", "#434c5e", "#4c566a"]
    storm = ["#d8dee9", "#e5e9f0", "#eceff4"]
    frost = ["#8fbcbb", "#88c0d0", "#81a1c1", "#5e81ac"]
    aurora = ["#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#b48ead"]


term = "alacritty"
mod = "mod4"
down = "j"
up = "k"
dotfiles = pathlib.Path(str(os.getenv("DOTFILES")))

keys = [
    # Switch between windows in current stack pane
    config.Key([mod], down, lazy.layout.down()),
    config.Key([mod], up, lazy.layout.up()),
    # Move windows up or down in current stack
    config.Key([mod, "shift"], down, lazy.layout.shuffle_down()),
    config.Key([mod, "shift"], up, lazy.layout.shuffle_up()),
    # Toggle between different layouts as defined below
    config.Key([mod], "t", lazy.next_layout()),
    config.Key([mod, "shift"], "t", lazy.prev_layout()),
    # Kill current window
    config.Key([mod], "w", lazy.window.kill()),
    config.Key([mod], "r", lazy.spawncmd()),
    # Restart and logout
    config.Key([mod, "control"], "r", lazy.restart()),
    config.Key([mod, "control"], "q", lazy.shutdown()),
    config.Key([mod, "control"], "p", lazy.spawn("i3lock -ntfe -c #2e3440")),
    config.Key([mod], "Return", lazy.spawn(term)),
]

for i in "asdfuiop":
    group = config.Group(i)
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            config.Key([mod], group.name, lazy.group[group.name].toscreen()),
            # mod1 + shift + letter of group = switch to & move focused window to group
            config.Key([mod, "shift"], group.name, lazy.window.togroup(group.name)),
        ]
    )

layouts = [
    # Maximized window
    layout.Max(),
    layout.MonadTall(single_border_width=0, border_width=2, border_focus=Colors.frost[3], ratio=0.60),
    layout.MonadWide(single_border_width=0, border_width=2, border_focus=Colors.frost[3], ratio=0.70),
]

widget_defaults = {"font": "FiraCode Retina", "fontsize": 14, "padding": 3}
extension_defaults = widget_defaults.copy()


def widgets():

    widgets_left = [
        widget.GroupBox(),
        widget.CurrentLayout(),
        widget.Prompt(),
        # widget.CPU(format="cpu: {load_percent}%"),
        # widget.PulseVolume(),
    ]

    widgets_right = [
        widget.KeyboardLayout(option="caps:escape,grp:alt_space_toggle", configured_keyboards=["us", "es"]),
        widget.Clock(format="%H:%M %A %d %B, %Y"),
    ]

    if platform.node() == "rp":
        widgets_right = [widget.Battery(format="battery: {char} {percent:2.0%}"), *widgets_right]

    return [*widgets_left, widget.Spacer(), *widgets_right]


screens = [config.Screen(top=bar.Bar(widgets=widgets(), size=24)) for _monitor in screeninfo.get_monitors()]


# Drag floating layouts.
mouse = [
    config.Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    config.Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    config.Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules: List = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def startup_once():
    subprocess.Popen([dotfiles.joinpath("bin/autostart.sh")])


@hook.subscribe.startup
def startup():
    subprocess.Popen([dotfiles.joinpath("bin/autostart_always.sh")])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
