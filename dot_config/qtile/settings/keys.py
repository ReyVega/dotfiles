from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal
from .paths import widgets_path

mod = "mod4"
terminal = guess_terminal()

keys = [

    # ------------ Layouts Config ------------

    # Switch between windows
    Key(
        [mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"
    ),
    Key(
        [mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"
    ),
    Key(
        [mod], "j",
        lazy.layout.down(),
        desc="Move focus down"
    ),
    Key(
        [mod], "k",
        lazy.layout.up(),
        desc="Move focus up"
    ),

    # Switch windows positions
    Key(
        [mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
    ),

    Key(
        [mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
    ),

    Key(
        [mod, "shift"], "j",
        # TreeTab
        lazy.layout.section_down(),
        # Others
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),

    Key(
        [mod, "shift"], "k",
        # TreeTab
        lazy.layout.section_up(),
        # Others
        lazy.layout.shuffle_up(),
        desc="Move window up"
    ),

    # MonadTall
    Key(
        [mod], "i",
        lazy.layout.shrink(),
    ),
    Key(
        [mod], "o",
        lazy.layout.grow(),
    ),
    Key(
        [mod], "m",
        lazy.layout.maximize()
    ),
    Key(
        [mod], "n",
        lazy.layout.normalize(),
        desc="Reset secondary window sizes"
    ),
    Key(
        [mod], "r",
        lazy.layout.reset(),
        desc="Reset all windows sizes"
    ),

    # Stack
    Key(
        [mod], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"
    ),

    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
    ),

    # Switch monadtall main pane position and rotate stacks position
    Key(
        [mod, "shift"], "space",
        lazy.layout.flip(),
        lazy.layout.rotate(),
        desc="Flip mondatall main pane and rotate stacks"
    ),

    # Floating
    Key([mod, "shift"], "i",
        lazy.window.toggle_minimize(),
        lazy.group.next_window(),
        lazy.window.bring_to_front(),
        desc="Minimize and Maximize windows"
    ),

    # Toggles
     Key(
        [mod], "f",
        lazy.hide_show_bar(),
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
    ),

    Key(
        [mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
    ),

    # Hide bar
    Key(
        [mod], "u",
        lazy.hide_show_bar(),
        desc='Hides bar'
    ),

    # ------------ Screens Config ------------
    # Switch focus of monitors
    Key(
        [mod], "period",
        lazy.next_screen(),
        desc='Move focus to next monitor'
    ),

    Key(
        [mod], "comma",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'
    ),

    # ------------ Essential Config ------------
    # Toggle between layouts
    Key(
        [mod], "Tab",
        lazy.next_layout(),
        desc="Change to next layout"
    ),
    Key(
        [mod, "shift"],
        "Tab", lazy.prev_layout(),
        desc="Change to previous layout"
    ),

    # Launch terminal and kill windows
    Key(
        [mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"
    ),
    Key(
        [mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
    ),

    # Restart and shutdown qtile
    Key(
        [mod, "control"], "r",
        lazy.restart(),
        desc="Restart Qtile"
    ),
    Key(
        [mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
    ),

    # ------------ Hardware Config ------------

    # Volume
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn(widgets_path + "/volume.sh down"),
        desc="Lower the volume"
    ),

    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn(widgets_path + "/volume.sh up"),
        desc="Turn up the volume"
    ),

    Key(
        [], "XF86AudioMute",
        lazy.spawn(widgets_path + "/volume.sh mute"),
        desc="Mute volume"
    ),

    # Brightness
    Key(
        [], "XF86MonBrightnessDown",
        lazy.spawn(widgets_path + "/brightness.sh down"),
        desc='Bright down'
    ),

    Key(
        [], "XF86MonBrightnessUp",
        lazy.spawn(widgets_path + "/brightness.sh up"),
        desc='Bright up'
    ),

    # ------------ Extras ------------
    # Screenshots selected dimensions
    Key(
        ["control", "shift"], "Print",
        lazy.spawn("scrot -s /tmp/screenshot.png -e 'xclip -selection c -t image/png < $f'"),
        desc="Takes screenshot of selected dimension and stores it within clipboard"
    ),

    Key(
        ["shift"], "Print",
        lazy.spawn("scrot -s /home/rey/Pictures/screenshot.png"),
        desc="Takes screenshot of selected dimension and stores it within Pictures folder"
    ),

    # Screenshots fullscreen
    Key(
        ["control"], "Print",
        lazy.spawn("scrot /tmp/screenshot.png -e 'xclip -selection c -t image/png < $f'"),
        desc="Takes screenshot of full screen and stores it within clipboard"
    ),

    Key(
        [], "Print",
        lazy.spawn("scrot /home/rey/Pictures/screenshot.png"),
        desc="Takes screenshot of fullscreen and stores it within Pictures folder"
    ),

    # Browser
    Key(
        [mod], "b",
        lazy.spawn("brave"),
        desc="Starts brave browser"
    ),

    # File Manager
    Key(
        [mod], "p",
        lazy.spawn("pcmanfm"),
        desc="Starts file manager"
    ),

    # Discord
    Key(
        [mod], "d",
        lazy.spawn("discord"),
        desc="Starts discord"
    ),

    # VS Code
    Key(
        [mod], "c",
        lazy.spawn("code"),
        desc="Starts vs-code"
    ),

    # VS Code
    Key(
        [mod], "z",
        lazy.spawn("zoom"),
        desc="Starts zoom"
    ),

    # Rofi (Applications)
    Key(
        [mod], "s",
        lazy.spawn("rofi -show drun"),
        desc="Starts rofi"
    ),

    # Rofi (Powermenu)
    Key(
        [mod], "q",
        lazy.spawn(widgets_path + "/powermenu.sh"),
        desc="Starts rofi"
    ),
]
