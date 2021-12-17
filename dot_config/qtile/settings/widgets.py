from libqtile import widget
from libqtile import qtile
from .theme import colors
from .paths import widgets_path
import subprocess

def base(fg='color1', bg='color1'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=12)

def workspaces():
    return [
        widget.GroupBox(
            **base(fg='color15'),
            font='Hack Nerd Font',
            fontsize=20,
            padding_x=18,
            disable_drag=True,
            active=colors['color17'],
            inactive=colors['color14'],
            highlight_method='block',
            this_current_screen_border=colors['color9'],
            this_screen_border=colors['color9'],
            urgent_alert_method='block',
            urgent_border=colors['color6'],
            other_current_screen_border=colors['color9'],
            other_screen_border=colors['color9'],
        ),
        widget.WindowName(**base(fg='color9'), fontsize=14, padding=5),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    widget.CheckUpdates(
        **base(),
        update_interval=1800,
        colour_have_updates=colors['color3'],
        colour_no_updates=colors['color3'],
        distro='Arch_paru',
        custom_command='checkupdates;paru -Qua',
        display_format='{updates}',
        no_update_string='0',
        fmt=' {}',
        execute='kitty -e paru',
    ),

    separator(),

    widget.GenPollText(
        **base(fg='color4'),
        func=lambda: subprocess.check_output(widgets_path + "/brightness.sh").decode(),
        mouse_callbacks={
            'Button4': lambda:qtile.cmd_spawn(widgets_path + "/brightness.sh down"),
            'Button5': lambda:qtile.cmd_spawn(widgets_path + "/brightness.sh up"),
        },
        update_interval=0.2,
    ),

    separator(),

    widget.GenPollText(
        **base(fg='color5'),
        func=lambda: subprocess.check_output(widgets_path + "/volume.sh").decode(),
        mouse_callbacks={
            'Button1': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh mute"),
            'Button4': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh down"),
            'Button5': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh up"),
            'Button3': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh app"),
        },
        update_interval=0.2,
    ),

    separator(),

    widget.CurrentLayout(
        **base(fg='color2'),
        mouse_callbacks={
            'Button3': lambda:qtile.cmd_prev_layout()
        },
        padding=1,
    ),

    widget.CurrentLayoutIcon(
        **base(fg='color3'),
        mouse_callbacks={
            'Button3': lambda:qtile.cmd_prev_layout()
        },
        scale=0.58,
    ),

    separator(),

    widget.GenPollText(
        **base(fg='color10'),
        func=lambda: subprocess.check_output(widgets_path + "/calendar.sh").decode(),
        update_interval=0.2,
    ),

    separator(),

    widget.GenPollText(
        **base(fg='color15'),
        func=lambda: subprocess.check_output(widgets_path + "/battery.sh").decode(),
        update_interval=0.2,
    ),
    separator(),
    widget.Systray(
        background=colors['color1'],
        padding=5,
    ),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    widget.Clock(**base(bg='color3'), format='%d/%m/%Y - %H:%M '),
]

widget_defaults = {
    'font': 'Hack Nerd Font Bold',
    'fontsize': 14,
    'padding': 2,
}

extension_defaults = widget_defaults.copy()
