from libqtile.config import Key, Group
from libqtile.config import Match
from libqtile.command import lazy
from .keys import mod, keys

workspaces  = [
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

for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    layouts = workspace["layout"] if "layout" in workspace else None
    groups.append(
        Group(
            name=workspace["name"],
            layout=workspace["layout"],
            label=workspace["label"],
            matches=workspace["matches"],
            spawn=workspace["spawn"]
        )
    )

    keys.extend([
        # Switch to workspace N
        Key([mod], workspace["key"], lazy.group[workspace["name"]].toscreen()),
        # Send window and switch to workspace N
        Key([mod, "shift"], workspace["key"], lazy.window.togroup(workspace["name"], switch_group=True))
    ])


