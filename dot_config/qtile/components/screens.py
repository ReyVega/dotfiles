from libqtile.config import Screen, Key
from libqtile import bar
from libqtile.lazy import lazy

class Screens:

    def __init__(self, widgets, monitors, wallpaper):
        self.widgets = widgets
        self.wallpaper = wallpaper
        self.monitors = monitors

    def status_bar(self, widgets):
        return bar.Bar(widgets, 26, opacity=0.92, margin=[10,10,10,10])

    def get_screens(self):
        screens = [
            Screen(
                wallpaper = self.wallpaper,
                wallpaper_mode = 'fill',
                top = self.status_bar(self.widgets.get_primary_widgets(["0" + str(i) for i in range(1, 10)]))
            )
        ]

        if self.monitors > 1:
            for i in range(self.monitors - 1):
                screens.append(
                    Screen(
                        wallpaper = self.wallpaper,
                        wallpaper_mode = 'fill',
                        top = self.status_bar(self.widgets.get_secondary_widgets([str(i + 1) + str(j) for j in range(1, 10)]))
                    )
                )

        return screens

    def get_keys(self):
        keys_screen = []
        mod = "mod4"

        for i in range(self.monitors):
            # Move window to specific screen
            keys_screen.extend([Key([mod, "mod1"], str(i + 1), lazy.window.toscreen(i))])
            # Focus screens like if they were groups
            keys_screen.extend([Key([mod, "control"], str(i + 1), lazy.to_screen(i))])

        return keys_screen
