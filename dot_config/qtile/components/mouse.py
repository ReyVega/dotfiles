from libqtile.config import Click, Drag
from libqtile.lazy import lazy

class Mouse():

    def __init__(self):
        self.mod = "mod4"

    def get_mouse(self):
        return [
            Drag([self.mod], "Button1", lazy.window.set_position_floating(),
             start=lazy.window.get_position()),
            Drag([self.mod], "Button3", lazy.window.set_size_floating(),
                start=lazy.window.get_size()),
            Click([self.mod], "Button2", lazy.window.bring_to_front())
        ]
