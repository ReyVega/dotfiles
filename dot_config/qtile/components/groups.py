from libqtile.config import Group, Match, Key
from libqtile.lazy import lazy


class Groups:

    groups_settings  = [
        {
            "name": "1",
            "key": "1",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "2",
            "key": "2",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "3",
            "key": "3",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "4",
            "key": "4",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "5",
            "key": "5",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "6",
            "key": "6",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "7",
            "key": "7",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "8",
            "key": "8",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": "9",
            "key": "9",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
    ]


    def __init__(self):
        self.groups = []
        self.keys_group = []

        mod = "mod4"

        for item in self.groups_settings:
            self.groups.append(
                Group(
                    name=item["name"],
                    layout=item["layout"],
                    label=item["label"],
                    matches=item["matches"],
                    spawn=item["spawn"]
                )
            )
            self.keys_group.extend([
                # Switch among groups
                Key([mod], item["key"], lazy.group[item["name"]].toscreen(toggle=True)),
                # Send window and switch to group N
                Key([mod, "shift"], item["key"], lazy.window.togroup(item["name"], switch_group=True))
            ])

    def get_keys(self):
        return self.keys_group

    def get_groups(self):
        return self.groups
