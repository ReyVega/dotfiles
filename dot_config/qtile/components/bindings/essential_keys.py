from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

@lazy.function
def kill_all_windows(qtile):
	for window in qtile.current_group.windows:
		window.cmd_kill()

@lazy.function
def kill_all_windows_except_current(qtile):
    for window in qtile.current_group.windows:
        if window != qtile.current_window:
            window.cmd_kill()

def init_essential_keys():
    return [
        # Move among groups
        Key(
            [mod], "period",
            lazy.screen.next_group(skip_empty=False),
            desc="Move to next group"
        ),
        Key(
            [mod], "comma",
            lazy.screen.prev_group(skip_empty=False),
            desc="Move to previous group"
        ),

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
            desc="Kill all windows"
        ),

        # Switch focus of monitors
        Key(
            [mod, "shift"], "period",
            lazy.next_screen(),
            desc='Move focus to next monitor'
        ),
        Key(
            [mod, "shift"], "comma",
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
