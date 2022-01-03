from libqtile.config import Key
from libqtile.command import lazy
from .. functions import Function

mod = "mod4"

def init_layout_keys():
    return [
        # Switch between windows
        Key(
            [mod], "h",
            lazy.layout.left(),
            lazy.layout.previous(),
            desc="Move focus to left"
        ),
        Key(
            [mod], "l",
            lazy.layout.right(),
            lazy.layout.next(),
            desc="Move focus to right"
        ),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

        # Switch windows positions
        Key(
            [mod, "shift"], "h",
            lazy.layout.shuffle_left(),
            lazy.layout.swap_left(),
            lazy.layout.client_to_previous(),
            desc="Move window to the left"
        ),
        Key(
            [mod, "shift"], "l",
            lazy.layout.shuffle_right(),
            lazy.layout.swap_right(),
            lazy.layout.client_to_next(),
            desc="Move window to the right"
        ),
        Key(
            [mod, "shift"], "j",
            lazy.layout.section_down(),
            lazy.layout.shuffle_down(),
            desc="Move window down"
        ),
        Key(
            [mod, "shift"], "k",
            lazy.layout.section_up(),
            lazy.layout.shuffle_up(),
            desc="Move window up"
        ),

        # Bsp
        Key([mod, "mod1"], "j", lazy.layout.flip_down()),
        Key([mod, "mod1"], "k", lazy.layout.flip_up()),
        Key([mod, "mod1"], "h", lazy.layout.flip_left()),
        Key([mod, "mod1"], "l", lazy.layout.flip_right()),
        Key([mod, "control"], "j", Function.resize_down()),
        Key([mod, "control"], "k", Function.resize_up()),
        Key([mod, "control"], "h", Function.resize_left()),
        Key([mod, "control"], "l", Function.resize_right()),

        # MonadTall and MonadWide
        Key([mod], "i", lazy.layout.shrink()),
        Key([mod], "o", lazy.layout.grow()),
        Key([mod], "m", lazy.layout.maximize()),
        Key([mod], "r", lazy.layout.reset()),

        # Stack
        Key([mod], "a", lazy.layout.add()),
        Key([mod], "d", lazy.layout.delete()),

        # Bsp, MonadTall, MonadWide
        Key([mod], "n", lazy.layout.normalize()),

        # Bsp and Stack
        Key([mod, "shift"], "space", lazy.layout.toggle_split()),

        # MonadTall, MonadWide, Stack
        Key(
            [mod], "space",
            lazy.layout.flip(),
            lazy.layout.rotate(),
        ),

        # Floating
        Key([mod, "shift"], "i",
            lazy.window.toggle_minimize(),
            lazy.group.next_window(),
            lazy.window.bring_to_front(),
        ),
        Key([mod, "shift"], "o", Function.float_to_front()),
    ]
