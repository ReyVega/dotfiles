from libqtile import layout
from libqtile.config import Match

class Layouts:

    def __init__(self, colors):
        self.colors = colors
        self.layout_defaults = {
            'border_focus': colors['color9'],
            'border_normal': colors['color1'],
            'border_width': 3,
            'margin': 10
        }

    def get_layouts(self):
        return [
            layout.Max(
                **self.layout_defaults,
            ),
            layout.MonadTall(
                **self.layout_defaults,
                change_ratio=0.01,
                max_ratio=0.75,
                min_ratio=0.25,
            ),
            layout.MonadWide(
                **self.layout_defaults,
                change_ratio=0.01,
                max_ratio=0.75,
                min_ratio=0.25,
            ),
            layout.Bsp(
                **self.layout_defaults,
                fair=False,
                lower_right=False,
                grow_amount=1,
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
                active_bg=self.colors['color14'],
                inactive_bg=self.colors['color11'],
                active_fg=self.colors['color17'],
                inactive_fg=self.colors['color14'],
            ),
            layout.Stack(
                **self.layout_defaults,
                num_stacks=2,
            ),
            layout.Floating(
                **self.layout_defaults,
            ),
            # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
            # Try more layouts by unleashing below layouts.
            # layout.Matrix(),
            # layout.Tile(),
            # layout.VerticalTile(),
            # layout.RatioTile(),
            # layout.Zoomy(),
        ]

    def get_floating_rules(self):
        return layout.Floating(
            float_rules=
            [
               *layout.Floating.default_float_rules,
                Match(wm_class="confirmreset"),  # gitk
                Match(wm_class="makebranch"),  # gitk
                Match(wm_class="maketag"),  # gitk
                Match(wm_class="ssh-askpass"),  # ssh-askpass
                Match(title="branchdialog"),  # gitk
                Match(title="pinentry"),  # GPG key password entry
                Match(wm_class="Conky"),
                Match(wm_class="lxappearance"),
                Match(wm_class="mpv"),
            ],
            border_focus=self.colors["color5"],
            border_normal=self.colors['color1'],
            border_width=3,
            fullscreen_border_width=0,
        )
