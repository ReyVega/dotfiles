from libqtile.config import Screen
from libqtile import bar
from libqtile.lazy import lazy
import subprocess

mod = "mod4"

keys_screen = []

def status_bar(widgets):
    return bar.Bar(widgets, 26, opacity=0.92, margin=[10,10,10,10])

def init_screens(primary_widgets, secondary_widgets, wallpaper):
    screens = [
        Screen(
            wallpaper = wallpaper,
            wallpaper_mode = 'fill',
            top = status_bar(primary_widgets)
        )
    ]

    xr = subprocess.check_output('xrandr --query | grep " connected"', shell=True).decode().split('\n')
    monitors = len(xr) - 1 if len(xr) > 2 else len(xr)

    if monitors > 1:
        for i in range(monitors - 1):
            screens.append(
                Screen(
                    wallpaper = wallpaper,
                    wallpaper_mode = 'fill',
                    top=status_bar(secondary_widgets)
                )
            )

    for i in range(monitors):
        keys_screen.extend([([mod, "mod1"], str(i), lazy.window.toscreen(i))])

    return screens
