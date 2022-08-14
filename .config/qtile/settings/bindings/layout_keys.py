from libqtile.config import Key
from libqtile.command import lazy
from .custom_functions import (
    left,
    right,
    down,
    up,
    resize_left,
    resize_right,
    resize_down,
    resize_up,
    float_to_front
)

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
mod = "mod4"


#---------------------------------------------------------------
#-- Initialize layout bindings
#---------------------------------------------------------------
layout_keys = [
    # Switch between windows
    Key([mod], "h", left, desc="Move focus to left"),
    Key([mod], "l", right, desc="Move focus to right"),
    Key([mod], "j", down, desc="Move focus down"),
    Key([mod], "k", up, desc="Move focus up"),

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
    Key([mod, "control"], "j", resize_down),
    Key([mod, "control"], "k", resize_up),
    Key([mod, "control"], "h", resize_left),
    Key([mod, "control"], "l", resize_right),

    # MonadTall, MonadWide, MonadThreeCol
    Key([mod], "i", lazy.layout.shrink()),
    Key([mod], "o", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.maximize()),
    Key([mod], "r", lazy.layout.reset()),

    # Stack
    Key([mod], "a", lazy.layout.add()),
    Key([mod], "d", lazy.layout.delete()),

    # Bsp, MonadTall, MonadWide, MonadThreeCol
    Key([mod], "n", lazy.layout.normalize()),

    # Bsp and Stack
    Key([mod, "shift"], "space", lazy.layout.toggle_split()),

    # MonadTall, MonadWide, Stack
    Key(
        [mod], "space",
        lazy.layout.flip(),
        lazy.layout.rotate(),
    ),

    # Minimize windows
    Key([mod, "shift"], "i",
        lazy.spawn("minimize -m"),
    ),

    Key([mod, "mod1"], "i",
        lazy.spawn("minimize -u name"),
    ),

    # Floating
    Key([mod, "shift"], "o", float_to_front),
]
