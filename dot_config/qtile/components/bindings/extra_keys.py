from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

def fix_cli_app(app):
    fix_environment = 'export -n LINES; export -n COLUMNS; sleep 0.1; source "$HOME/.config/lf/lf-icons.sh"; export EDITOR=nvim &&'
    return f'{terminal} --title {app} -e sh -c "{fix_environment} {app}"'

def init_extra_keys(widgets_path):
    return [
        # Screenshot dimensions
        Key(
            ["shift"], "Print",
            lazy.spawn(widgets_path + "/screenshot.sh gui"),
            desc="Takes screenshot of selected dimension"
        ),

        # Screenshots fullscreen
        Key(
            ["control"], "Print",
            lazy.spawn(widgets_path + "/screenshot.sh full-clip"),
            desc="Takes screenshot of full screen and stores it within clipboard"
        ),
        Key(
            [], "Print",
            lazy.spawn(widgets_path + "/screenshot.sh full"),
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
            lazy.spawn(fix_cli_app(widgets_path + "/lf.sh")),
            desc="Starts Lf"
        ),

        # PCManFM
        Key(
            [mod, "shift"], "p",
            lazy.spawn("pcmanfm"),
            desc="Starts pcmanfm"
        ),

        # Discord
        Key(
            [mod], "x",
            lazy.spawn("discord"),
            desc="Starts discord"
        ),

        # VS Code
        Key(
            [mod], "c",
            lazy.spawn("code"),
            desc="Starts vs-code"
        ),

        # Zoom
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
            desc="Starts rofi powermenu"
        ),

        # Wi-fi
        Key(
            [mod, "shift"], "n",
            lazy.spawn("kitty -e nmtui"),
            desc="Starts nmtui"
        ),

        # Music player (ncmpcpp)
        Key(
            [mod], "e",
            lazy.spawn(fix_cli_app("ncmpcpp")),
            desc="Starts ncmpcpp"
        ),

        # Conky
        Key(
            [mod, "shift"], "c",
            lazy.spawn(widgets_path + "/conkytoggle.sh"),
            desc="conky"
        ),
    ]
