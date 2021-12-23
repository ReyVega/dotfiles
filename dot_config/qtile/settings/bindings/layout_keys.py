from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"

layout_keys = [
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
]
