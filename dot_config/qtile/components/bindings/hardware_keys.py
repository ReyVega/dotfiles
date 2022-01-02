from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"

def init_hardware_keys():
    return [
        # Volume
        Key(
            [], "XF86AudioLowerVolume",
            lazy.spawn("volume down"),
            desc="Lower the volume"
        ),
        Key(
            [], "XF86AudioRaiseVolume",
            lazy.spawn("volume up"),
            desc="Turn up the volume"
        ),
        Key(
            [], "XF86AudioMute",
            lazy.spawn("volume mute"),
            desc="Mute volume"
        ),

        # Brightness
        Key(
            [], "XF86MonBrightnessDown",
            lazy.spawn("brightness down"),
            desc='Bright down'
        ),
        Key(
            [], "XF86MonBrightnessUp",
            lazy.spawn("brightness up"),
            desc='Bright up'
        ),

        # Audio player
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
