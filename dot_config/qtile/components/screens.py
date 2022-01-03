from libqtile.config import Screen
from libqtile import bar
from libqtile.lazy import lazy
import subprocess

class Screens:

    def __init__(self, primary_widgets, secondary_widgets, wallpaper):
        self.primary_widgets = primary_widgets
        self.secondary_widgets = secondary_widgets
        self.wallpaper = wallpaper
        self.monitors = int(subprocess.check_output('xrandr -q | grep "Screen" | wc -l', shell=True).decode())

    def status_bar(self, widgets):
        return bar.Bar(widgets, 26, opacity=0.92, margin=[10,10,10,10])

    def get_screens(self):
        screens = [
            Screen(
                wallpaper = self.wallpaper,
                wallpaper_mode = 'fill',
                top = self.status_bar(self.primary_widgets)
            )
        ]

        if self.monitors > 1:
            for _ in range(self.monitors - 1):
                screens.append(
                    Screen(
                        wallpaper = self.wallpaper,
                        wallpaper_mode = 'fill',
                        top = self.status_bar(self.secondary_widgets)
                    )
                )

        return screens

    def get_keys(self):
        keys_screen = []
        mod = "mod4"

        for i in range(self.monitors):
            keys_screen.extend([([mod, "mod1"], str(i), lazy.window.toscreen(i))])

        return keys_screen
