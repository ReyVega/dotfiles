from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal
from ..paths import widgets_path

mod = "mod4"
terminal = guess_terminal()

def fix_cli_app(app):
    fix_environment = 'export -n LINES; export -n COLUMNS; sleep 0.1 &&'
    return f'{terminal} --title {app} -e sh -c "{fix_environment} {app}"'

extra_keys = [
    # Screenshots selected dimensions
    Key(
        ["control", "shift"], "Print",
        lazy.spawn("scrot -s /tmp/screenshot.png -e 'xclip -selection c -t image/png < $f'"),
        desc="Takes screenshot of selected dimension and stores it within clipboard"
    ),

    Key(
        ["shift"], "Print",
        lazy.spawn("scrot -s /home/rey/Pictures/screenshot.png"),
        desc="Takes screenshot of selected dimension and stores it within Pictures folder"
    ),

    # Screenshots fullscreen
    Key(
        ["control"], "Print",
        lazy.spawn("scrot /tmp/screenshot.png -e 'xclip -selection c -t image/png < $f'"),
        desc="Takes screenshot of full screen and stores it within clipboard"
    ),

    Key(
        [], "Print",
        lazy.spawn("scrot /home/rey/Pictures/screenshot.png"),
        desc="Takes screenshot of fullscreen and stores it within Pictures folder"
    ),

    # Browser
    Key(
        [mod], "b",
        lazy.spawn("brave"),
        desc="Starts brave browser"
    ),

    # File Manager
    Key(
        [mod], "p",
        lazy.spawn("pcmanfm"),
        desc="Starts file manager"
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

    # VS Code
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

    # Music player (ncmpcpp)
    Key(
        [mod], "e",
        lazy.spawn(fix_cli_app("ncmpcpp")),
        desc="Starts ncmpcpp"
    ),
]
