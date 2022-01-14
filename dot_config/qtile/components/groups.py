from libqtile.config import Group, Match, Key
from libqtile.lazy import lazy
from libqtile.command import lazy

class Groups:

    def __init__(self, monitors):
        self.groups = []
        self.keys_group = []

        mod = "mod4"
        groups_settings = [
            {
                "name": "01",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "02",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "03",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "04",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "05",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "06",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "07",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "08",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
            {
                "name": "09",
                "label": "",
                "layout": "max",
                "matches": [],
                "spawn": [],
            },
        ]

        if monitors > 1:
            for i in range(monitors - 1):
                groups_settings.extend([
                    {
                        "name": str(i + 1) + "1",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "2",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "3",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "4",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "5",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "6",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "7",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "8",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    },
                    {
                        "name": str(i + 1) + "9",
                        "label": "",
                        "layout": "max",
                        "matches": [],
                        "spawn": [],
                    }
                ])

        for item in groups_settings:
            self.groups.append(
                Group(
                    name=item["name"],
                    layout=item["layout"],
                    label=item["label"],
                    matches=item["matches"],
                    spawn=item["spawn"]
                )
            )

        for i in range(1, 10):
            self.keys_group.extend([
                # Switch among groups
                Key([mod], str(i), lazy.function(self.go_to_group(str(i)))),
                # Send window and switch to group N
                Key([mod, "shift"], str(i), lazy.function(self.switch_to_group(str(i))))
            ])

    # Manage groups as independent workspaces
    def go_to_group(self, name):

        def __inner(qtile):
            current_screen = str(qtile.screens.index(qtile.current_screen))
            qtile.groups_map[current_screen + name].cmd_toscreen(toggle=False)

        return __inner

    # Switch groups within independent workspaces
    def switch_to_group(self, name):

        def __inner(qtile):
            current_screen = str(qtile.screens.index(qtile.current_screen))
            qtile.current_window.cmd_togroup(current_screen + name, switch_group=True)

        return __inner

    def get_keys(self):
        return self.keys_group

    def get_groups(self):
        return self.groups
