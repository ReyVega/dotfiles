from libqtile import layout
from libqtile.config import Match
from .theme import colors

layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 2,
    'margin': 8
}

layouts = [
    layout.Max(**layout_conf),
    layout.MonadTall(**layout_conf),
    layout.Stack(num_stacks=2, **layout_conf),
    layout.RatioTile(**layout_conf),
    layout.Matrix(columns=2, **layout_conf),
    layout.TreeTab(**layout_conf),
    layout.Floating(**layout_conf),
    # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.MonadWide(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_focus=colors["color4"][0]
)