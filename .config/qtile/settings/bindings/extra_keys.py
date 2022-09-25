from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
mod = "mod4"
terminal = guess_terminal()


#---------------------------------------------------------------
#-- Initialize extra bindings
#---------------------------------------------------------------
extra_keys = [
    # Screenshot dimensions
    Key(
        ["shift"], "Print",
        lazy.spawn("screenshot gui"),
        desc="Takes screenshot of selected dimension"
    ),

    # Screenshots fullscreen
    Key(
        ["control"], "Print",
        lazy.spawn("screenshot full-clip"),
        desc="Takes screenshot of full screen and stores it within clipboard"
    ),
    Key(
        [], "Print",
        lazy.spawn("screenshot full"),
        desc="Takes screenshot of fullscreen and stores it within Pictures folder"
    ),

    # Browser
    Key(
        [mod], "b",
        lazy.spawn("brave"),
        desc="Starts brave browser"
    ),

    # LF
    Key(
        [mod], "p",
        lazy.spawn(f"{terminal} -e lfrun"),
        desc="Starts Lf"
    ),

    # Rofi (Applications)
    Key(
        [mod], "s",
        lazy.spawn("rofi -show drun"),
        desc="Starts rofi apps"
    ),

    # Rofi (Windows)
    Key(
        [mod, "control"], "s",
        lazy.spawn("rofi -show window"),
        desc="Starts rofi windows"
    ),

    # Rofi (Powermenu)
    Key(
        [mod], "q",
        lazy.spawn("powermenu"),
        desc="Starts rofi powermenu"
    ),

    # Wi-fi
    Key(
        [mod, "shift"], "n",
        lazy.spawn(f"{terminal} -e nmtui"),
        desc="Starts nmtui"
    ),

    # Music player (ncmpcpp)
    Key(
        [mod], "e",
        lazy.spawn(f"{terminal} -e ncmpcpp"),
        desc="Starts ncmpcpp"
    ),

    # Conky
    Key(
        [mod, "shift"], "c",
        lazy.spawn("conkytoggle"),
        desc="conky"
    ),
]
