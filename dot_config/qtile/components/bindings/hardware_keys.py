from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"

def init_hardware_keys(widgets_path):
    return [
        # Volume
        Key(
            [], "XF86AudioLowerVolume",
            lazy.spawn(widgets_path + "/volume.sh down"),
            desc="Lower the volume"
        ),

        Key(
            [], "XF86AudioRaiseVolume",
            lazy.spawn(widgets_path + "/volume.sh up"),
            desc="Turn up the volume"
        ),

        Key(
            [], "XF86AudioMute",
            lazy.spawn(widgets_path + "/volume.sh mute"),
            desc="Mute volume"
        ),

        # Brightness
        Key(
            [], "XF86MonBrightnessDown",
            lazy.spawn(widgets_path + "/brightness.sh down"),
            desc='Bright down'
        ),

        Key(
            [], "XF86MonBrightnessUp",
            lazy.spawn(widgets_path + "/brightness.sh up"),
            desc='Bright up'
        ),

        Key(
            [],
            "XF86AudioNext",
            lazy.spawn("playerctl next"),
            desc="Play next audio",
        ),

        Key(
            [],
            "XF86AudioPrev",
            lazy.spawn("playerctl previous"),
            desc="Play previous audio",
        ),

        Key([],
            "XF86AudioPlay",
            lazy.spawn("playerctl play-pause"),
            desc="Toggle play/pause audio"
        ),
    ]
