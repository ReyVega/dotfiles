from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

essential_keys = [
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
        lazy.spawn(terminal + " --single-instance -e fish"),
        desc="Launch fish shell"
    ),

    Key(
        [mod, "shift"], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal (bash shell)"
    ),

    Key(
        [mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
    ),

    Key(
        [mod, "shift"], "w",
        lazy.spawn("xkill"),
        desc="Force to kill focused window"
    ),

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

    # Toggles
    Key(
        [mod], "f",
        lazy.hide_show_bar("top"),
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
        lazy.hide_show_bar("top"),
        desc='Hides bar'
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

    # Opens Qtile configuration
    Key(
        [mod, "control"],
        "a",
        lazy.spawn("kitty --directory ~/.config/qtile -e nvim"),
        desc="Opens Qtile config",
    ),
]
