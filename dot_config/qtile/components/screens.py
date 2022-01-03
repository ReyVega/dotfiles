from libqtile.config import Screen, Key
from libqtile import bar
from libqtile.lazy import lazy
from libqtile.log_utils import logger
import subprocess


class Screens:

    def __init__(self, primary_widgets, secondary_widgets, wallpaper):
        self.primary_widgets = primary_widgets
        self.secondary_widgets = secondary_widgets
        self.wallpaper = wallpaper
        self.monitors = int(subprocess.check_output('xrandr -q | grep "Screen" | wc -l', shell=True).decode())
        logger.warning(f"Number of monitors: {self.monitors}")

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

        # Move window to specific screen
        for i in range(self.monitors):
            keys_screen.extend([Key([mod, "mod1"], str(i + 1), lazy.window.toscreen(i))])

        return keys_screen
