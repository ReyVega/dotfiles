from libqtile.config import Screen
from libqtile import bar
from libqtile.config import Key
from libqtile.command import lazy
from .widgets import primary_widgets, secondary_widgets
from .wallpaper import wallpaper
from .keys import mod, keys
import subprocess

def status_bar(widgets):
    return bar.Bar(widgets, 26, opacity=0.92, margin=[10,10,10,10])

screens = [
    Screen(
        wallpaper = wallpaper,
        wallpaper_mode = 'fill',
        top = status_bar(primary_widgets)
    )
]

def get_monitors():
    xr = subprocess.check_output('xrandr --query | grep " connected"', shell=True).decode().split('\n')
    monitors = len(xr) - 1 if len(xr) > 2 else len(xr)
    return monitors

monitors = get_monitors()

for i in range(1, monitors + 1):
    keys.extend([Key([mod, "mod1"], str(i), lazy.window.toscreen(i))])

if monitors > 1:
    for i in range(1, monitors):
        screens.append(
            Screen(
                wallpaper = wallpaper,
                wallpaper_mode = 'fill',
                top=status_bar(secondary_widgets)
            )
        )
