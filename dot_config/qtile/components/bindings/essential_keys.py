from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

def init_essential_keys():
    return [
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
            lazy.spawn(f"{terminal} -e fish"),
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
            lazy.hide_show_bar(position="all"),
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

        # Restart, reload and shutdown qtile
        Key(
            [mod, "control"], "r",
            lazy.reload_config(),
            desc="Reload Qtile"
        ),
        Key(
            [mod, "shift"], "r",
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
            [mod, "control"], "a",
            lazy.spawn(f"{terminal} -d ~/.config/qtile -e nvim config.py"),
            desc="Opens Qtile config",
        ),
    ]
