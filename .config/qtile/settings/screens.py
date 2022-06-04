from libqtile.config import Screen, Key
from libqtile import bar
from libqtile.lazy import lazy
from .widgets import primary_widgets, secondary_widgets
from .wallpaper import wallpaper

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
keys_screen = []
mod = "mod4"


#---------------------------------------------------------------
#-- Function which returns bar with widgets
#---------------------------------------------------------------
def status_bar(widgets):
    return bar.Bar(widgets, 26, opacity=0.92, margin=[10,10,10,10])


#---------------------------------------------------------------
#-- Define primary screen
#---------------------------------------------------------------
screens = [
    Screen(
        top = status_bar(primary_widgets(["0" + str(i) for i in range(1, 10)])),
        wallpaper = wallpaper,
        wallpaper_mode = "fill"
    )
]


#---------------------------------------------------------------
#-- Define more screens
#---------------------------------------------------------------
for i in range(1, 9):
    screens.append(
        Screen(
            top = status_bar(secondary_widgets([str(i) + str(j) for j in range(1, 10)])),
            wallpaper = wallpaper,
            wallpaper_mode = "fill"
        )
    )


#---------------------------------------------------------------
#-- Fill keys_screen with screen bindings
#---------------------------------------------------------------
for i in range(9):
    # Move window to specific screen
    keys_screen.extend([
        # Move window to specific screen and switch to screen
        Key(
            [mod, "mod1"],
            str(i + 1),
            lazy.window.toscreen(i),
            lazy.to_screen(i)
        ),
        # Focus screens like if they were groups with 123456789
        Key([mod, "control"], str(i + 1), lazy.to_screen(i))
    ])
