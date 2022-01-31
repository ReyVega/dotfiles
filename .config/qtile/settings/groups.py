from libqtile.config import Group, Match, Key
from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile import hook, qtile

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
groups = []
keys_group = []
mod = "mod4"


#---------------------------------------------------------------
#-- Define primary screen groups
#---------------------------------------------------------------
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


#---------------------------------------------------------------
#-- Initialize more groups for other monitors
#---------------------------------------------------------------
for i in range(1, 9):
    screen = str(i)
    groups_settings.extend([
        {
            "name": screen + "1",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "2",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "3",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "4",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "5",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "6",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "7",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "8",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        },
        {
            "name": screen + "9",
            "label": "",
            "layout": "max",
            "matches": [],
            "spawn": [],
        }
    ])


#---------------------------------------------------------------
#-- Fill groups array with groups
#---------------------------------------------------------------
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


#---------------------------------------------------------------
#-- Manage workspaces as independent with 123456789
#---------------------------------------------------------------
def go_to_group(name):

    def __inner(qtile):
        current_screen = str(qtile.screens.index(qtile.current_screen))
        qtile.groups_map[current_screen + name].cmd_toscreen(toggle=False)

    return __inner


#---------------------------------------------------------------
#-- Switch windows within independent workspaces with 123456789
#---------------------------------------------------------------
def switch_to_group(name):

    def __inner(qtile):
        current_screen = str(qtile.screens.index(qtile.current_screen))
        qtile.current_window.cmd_togroup(current_screen + name, switch_group=True)

    return __inner


#---------------------------------------------------------------
#-- Fill keys_group with bindings
#---------------------------------------------------------------
for i in range(1, 10):
    keys_group.extend([
        # Switch among groups
        Key([mod], str(i), lazy.function(go_to_group(str(i)))),
        # Send window and switch to group N
        Key([mod, "shift"], str(i), lazy.function(switch_to_group(str(i))))
    ])


#---------------------------------------------------------------
#-- Move between next/prev groups within independent workspaces
#---------------------------------------------------------------
def scroll_screen(direction):

    def _inner(qtile):
        current = qtile.groups.index(qtile.current_group)
        screen = qtile.screens.index(qtile.current_screen)

        destination = ((current - (9 * screen) + direction) % 9) + (9 * screen)
        qtile.groups[destination].cmd_toscreen()

    return _inner


#---------------------------------------------------------------
#-- Extend keys_group with scrolling bindings
#---------------------------------------------------------------
keys_group.extend([
    Key([mod], 'period', lazy.function(scroll_screen(1))),
    Key([mod], 'comma', lazy.function(scroll_screen(-1))),
])


#---------------------------------------------------------------
#-- Initialize groups in their repectives screens (workspaces)
#-- (On startup)
#---------------------------------------------------------------
@hook.subscribe.startup
def _():
    for i in range(len(qtile.screens)):
        qtile.groups_map[str(i) + "1"].cmd_toscreen(i, toggle=False)


#---------------------------------------------------------------
#-- Initialize groups in their respectives screens (workspaces)
#-- (When screens change on randr events)
#---------------------------------------------------------------
@hook.subscribe.screens_reconfigured
def _():
    for i in range(len(qtile.screens)):
        qtile.groups_map[str(i) + "1"].cmd_toscreen(i, toggle=False)
    # qtile.cmd_reload_config()
