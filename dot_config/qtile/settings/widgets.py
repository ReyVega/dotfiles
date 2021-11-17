from libqtile import widget
from .theme import colors

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=14, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-4
    )


def workspaces(): 
    return [
        widget.GroupBox(
            **base(fg='light'),
            font='Hack Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    ]


primary_widgets = [
    *workspaces(),

    powerline('color4', 'dark'),
    
    widget.CheckUpdates(
        **base(bg='color4'),
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        fmt=' {}',
        update_interval=1800,
        custom_command='checkupdates',
        execute='alacritty -e sudo pacman -Syu'
    ),

    powerline('color3', 'color4'),

    widget.Backlight(
        **base(bg='color3'),
        backlight_name='amdgpu_bl0',
        fmt="盛 {}",
    ),

    powerline('color2', 'color3'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color1', 'color2'),

    widget.Clock(**base(bg='color1'), format=' %m-%d-%Y - %H:%M '),

    powerline('dark', 'color1'),

    widget.Systray(background=colors['dark'], padding=5),

    # powerline('color3', 'color4'),

    # icon(bg="color3", text=' '),  # Icon: nf-fa-feed
    
    # widget.Net(**base(bg='color3'), interface='kk'),

    # powerline('color2', 'color3'),

    # widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    # widget.CurrentLayout(**base(bg='color2'), padding=5),

    # powerline('color1', 'color2'),

    # icon(bg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    # widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    # powerline('dark', 'color1'),

    # widget.Systray(background=colors['dark'], padding=5),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color1', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    widget.CurrentLayout(**base(bg='color1'), padding=5),

    powerline('color2', 'color1'),

    widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color2'),
]

widget_defaults = {
    'font': 'Hack Nerd Font Bold',
    'fontsize': 14,
    'padding': 2,
}

extension_defaults = widget_defaults.copy()