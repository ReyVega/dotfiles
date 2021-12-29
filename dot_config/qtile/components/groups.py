from libqtile.config import Group, Match, Key
from libqtile.lazy import lazy

mod = "mod4"

keys_group = []
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

groups = []

for item in groups_settings:
    groups.append(
        Group(
            name=item["name"],
            layout=item["layout"],
            label=item["label"],
            matches=item["matches"],
            spawn=item["spawn"]
        )
    )

    keys_group.extend([
        # Switch to item N
        Key([mod], item["key"], lazy.group[item["name"]].toscreen(toggle=True)),
        # Send window and switch to item N
        Key([mod, "shift"], item["key"], lazy.window.togroup(item["name"], switch_group=True))
    ])



