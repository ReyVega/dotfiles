from libqtile import layout
from libqtile.config import Match
from .theme import colors

layout_conf = {
    'border_focus': colors['frost3'],
    'border_normal': colors['dark'],
    'border_width': 3,
    'margin': 8
}

layouts = [
    layout.Max(
        **layout_conf,
    ),
    layout.MonadTall(
        **layout_conf,
    ),
    layout.TreeTab(
        sections=['Browser', 'Video', 'Programming'],
        section_fontsize=14,
        section_left=8,
        fontsize=14,
        vspace=5,
        section_top=10,
        section_padding=10,
        padding_x=-4,
        padding_y=5,
        panel_width=140,
        active_bg=colors['polar4'],
        inactive_bg=colors['polar1'],
        active_fg=colors['snowstorm3'],
        inactive_fg=colors['polar4'],
    ),
    layout.Stack(
        **layout_conf,
        num_stacks=2,
    ),
    layout.RatioTile(
        **layout_conf,
    ),
    layout.Floating(
        **layout_conf,
    ),
    # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Matrix(),
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
    border_focus=colors["aurora4"],
    border_width= 3,
)
