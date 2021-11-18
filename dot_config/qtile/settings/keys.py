
from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal
from .path import qtile_path
from os import path

mod = "mod4"
terminal = guess_terminal()
notifications_folder = path.join(qtile_path, "notifications")

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    
    # ------------ Hardware Configs ------------

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn(notifications_folder + "/volume.sh down"), desc="Lower the volume"),
    Key([], "XF86AudioRaiseVolume",lazy.spawn(notifications_folder + "/volume.sh up"), desc="Turn up the volume"),
    Key([], "XF86AudioMute", lazy.spawn(notifications_folder + "/volume.sh mute"), desc="Mute the volume"),

    # Brightness
    Key([], "XF86MonBrightnessDown", lazy.spawn(notifications_folder + "/brightness.sh down"), desc='Brightness down'),
    Key([], "XF86MonBrightnessUp", lazy.spawn(notifications_folder + "/brightness.sh up"), desc='Brightness up'),

    # ------------ Extras ------------
    # Screenshots selected dimensions
    Key(["control", "shift"], "Print", lazy.spawn("scrot -s /tmp/screenshot.png -e 'xclip -selection c -t image/png < $f'"), desc="Takes screenshot of selected dimension and stores it within clipboard"),
    Key(["shift"], "Print", lazy.spawn("scrot -s /home/rey/Pictures/screenshot.png"), desc="Takes screenshot of selected dimension and stores it within Pictures folder"),

    # Screenshots fullscreen
    Key(["control"], "Print", lazy.spawn("scrot /tmp/screenshot.png -e 'xclip -selection c -t image/png < $f'"), desc="Takes screenshot of full screen and stores it within clipboard"),
    Key([], "Print", lazy.spawn("scrot /home/rey/Pictures/screenshot.png"), desc="Takes screenshot of fullscreen and stores it within Pictures folder"),

    # Browser
    Key([mod], "b", lazy.spawn("brave"), desc="Starts brave browser"),

    # File Manager
    Key([mod], "f", lazy.spawn("pcmanfm"), desc="Starts file manager"),

    # Discord
    Key([mod], "d", lazy.spawn("discord"), desc="Starts discord"),

    # VS Code
    Key([mod], "c", lazy.spawn("code"), desc="Starts vs-code"),
]
