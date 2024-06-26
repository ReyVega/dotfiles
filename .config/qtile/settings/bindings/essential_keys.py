from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from .custom_functions import (
    kill_all_windows,
    kill_all_windows_except_current
)

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
mod = "mod4"
terminal = guess_terminal()


#---------------------------------------------------------------
#-- Initialize essential bindings
#---------------------------------------------------------------
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
    Key(
        [mod, "control"], "w",
        kill_all_windows,
        desc="Kill all windows"
    ),
    Key(
        [mod, "mod1"], "w",
        kill_all_windows_except_current,
        desc="Kill all windows except current"
    ),

    # Toggles
    Key(
        [mod], "f",
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
        lazy.hide_show_bar(position="all"),
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
