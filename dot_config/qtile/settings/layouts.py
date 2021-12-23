from libqtile import layout
from libqtile.config import Match
from .theme import colors

layout_conf = {
    'border_focus': colors['color9'],
    'border_normal': colors['color1'],
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
    layout.MonadWide(
        **layout_conf
    ),
    layout.Bsp(
        **layout_conf
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
        active_bg=colors['color14'],
        inactive_bg=colors['color11'],
        active_fg=colors['color17'],
        inactive_fg=colors['color14'],
    ),
    layout.Stack(
        **layout_conf,
        num_stacks=2,
    ),
    layout.Floating(
        **layout_conf,
    ),
    # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Matrix(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.RatioTile(),
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
        Match(wm_class="lxappearance"),
    ],
    border_focus=colors["color5"],
    border_width= 3,
)
