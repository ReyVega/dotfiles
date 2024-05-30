from libqtile.config import Key
from libqtile.lazy import lazy

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
mod = "mod4"


#---------------------------------------------------------------
#-- Initialize hardware bindings
#---------------------------------------------------------------
hardware_keys = [
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
