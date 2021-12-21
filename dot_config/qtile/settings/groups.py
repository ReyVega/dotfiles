from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys

# Create groups
group_names = ["1","2","3","4","5","6","7","8","9"]
group_labels = ["", "", "", "", "", "", "", "", ""]
group_layouts = ["max","max","max","max","max","max","max","max","max"]

groups = [Group(name=group_names[i], label=group_labels[i], layout=group_layouts[i]) for i in range(len(group_names))]

for i in groups:
    keys.extend([
        # Switch to workspace N
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        # Send window and switch to workspace N
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True))
    ])
