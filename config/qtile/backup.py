# Copyright (c) 2010 Aldo Cortesh
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import DropDown, ScratchPad, Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

import os
import subprocess

mod = "mod4"
terminal = "alacritty"
globalFont = "Iosevka Curly Term"
def create_keybinds(mods=[mod],key="enter",action=lazy.spawn(terminal),desc="terminal"):
    return Key(mods, key,action,desc)
keys = [
    # Key(modifiers: list[str], key: list(str), function: lazy or custom function, desc)

    # MOVEMENT 
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # WINDOW SIZE CHANGE

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod ], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # STACK SETTINGS
    Key([mod,"shift"],"Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    
    # APPLICATION LAUNCH
    # default: Key([mod], "Return", lazy.spawn(""), desc=""),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "e", lazy.spawn("thunar"), desc="Launches my file manager"),


    # LAYOUTS
    Key([mod, "shift"], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # QTILE
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show run"), desc="Spawn a command using a prompt widget"),
    Key([mod], "Escape", lazy.spawn("xfce4-screensaver-command -a"), desc="lock the screen. requires xfce4-screensaver daemon"),
    Key([], "Print", lazy.spawn("xfce4-screenshooter")),
    Key([mod, "shift"], "Escape", lazy.spawn("systemctl suspend"), desc="suspend to ram"),

]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name)),
        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

colors = {
    "background": "#0F1419",
    "foreground": "#E6E1CF",
    "normal": {
        "black": "#000000",
        "red": "#FF3333",
        "green": "#B8CC52",
        "yellow": "#E7C547",
        "blue": "#36A3D9",
        "magenta": "#F07178",
        "cyan": "#95E6CB",
        "white": "#FFFFFF",
    },
    "bright": {
        "black": "#323232",
        "red": "#FF6565",
        "green": "#EAFE84",
        "yellow": "#EAFE84",
        "blue": "#68D5FF",
        "magenta": "#FFA3AA",
        "cyan": "#C7FFFD",
        "white": "#FFFFFF",
    },
}

layout_defaults = {
    "border_focus": colors["bright"]["green"],
    "border_normal": colors["normal"]["red"],
    "border_width": 1,
    "margin": 3,
}
layouts = [
    layout.Columns(
        **layout_defaults,
    ),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    layout.TreeTab(
        **layout_defaults,
        font=globalFont,
        fontsize=10,
        bg_color=colors["normal"]["black"],
        active_bg = colors["bright"]["black"],
        active_fg = colors["bright"]["green"],
        inactive_bg=colors["background"],
        inactive_fg=colors["foreground"],
        panel_width=100,
    ),
    # layout.VerticalTile(),
    # layout.Zoomy(),
:


widget_defaults = dict(
    font=globalFont,
    fontsize=16,
    padding=3,
    background=colors["background"],
    foreground=colors["foreground"],
    border_width=0,
    border=colors["bright"]["red"]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Clock(
                    format='%Y-%m-%d %a %I:%M %p'),
                widget.PulseVolume(
                    get_volume_command = lazy.spawn_cmd("echo 'Volume' && pamixer --get-volume-human && pamixer --get-mute"),
                    volume_app = lazy.spawn_cmd("pavucontrol"),
                    update_interval = 0.09
                    ),
                widget.Systray(),
            ]
            ,
            22,
            margin=2,
            opacity=0.9
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout_defaults,
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
