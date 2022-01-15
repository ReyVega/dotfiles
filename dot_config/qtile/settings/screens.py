from libqtile.config import Screen, Key
from libqtile import bar
from libqtile.lazy import lazy
import subprocess
from .wallpaper import wallpaper
from .widgets import primary_widgets, secondary_widgets


#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
monitors = int(subprocess.check_output('xrandr -q | grep " connected" | wc -l', shell=True))
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
        wallpaper = wallpaper,
        wallpaper_mode = 'fill',
        top = status_bar(primary_widgets(["0" + str(i) for i in range(1, 10)]))
    )
]


#---------------------------------------------------------------
#-- Define more screens depending on monitors
#---------------------------------------------------------------
if monitors > 1:
    for i in range(monitors - 1):
        screens.append(
            Screen(
                wallpaper = wallpaper,
                wallpaper_mode = 'fill',
                top = status_bar(secondary_widgets([str(i + 1) + str(j) for j in range(1, 10)]))
            )
        )

#---------------------------------------------------------------
#-- Fill keys_screen with screen bindings
#---------------------------------------------------------------
for i in range(monitors):
    # Move window to specific screen
    keys_screen.extend([Key([mod, "mod1"], str(i + 1), lazy.window.toscreen(i))])
    # Focus screens like if they were groups with 123456789
    keys_screen.extend([Key([mod, "control"], str(i + 1), lazy.to_screen(i))])

