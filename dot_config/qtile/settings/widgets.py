from libqtile import widget
from libqtile import qtile
from .theme import colors
from .paths import widgets_path
from os import path
import subprocess


def base(fg='dark', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=12)

def workspaces(): 
    return [
        widget.GroupBox(
            **base(fg='snowstorm1'),
            font='Hack Nerd Font',
            fontsize=20,
            padding_x=18,
            disable_drag=True,
            active=colors['snowstorm3'],
            inactive=colors['polar4'],
            highlight_method='block',
            this_current_screen_border=colors['frost3'],
            this_screen_border=colors['frost3'],
            urgent_alert_method='block',
            urgent_border=colors['aurora5'],
            other_current_screen_border=colors['frost3'],
            other_screen_border=colors['frost3'],
        ),
        widget.WindowName(**base(fg='frost3'), fontsize=14, padding=5),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    widget.GenPollText(
        **base(fg='aurora2'),
        func=lambda: subprocess.check_output(widgets_path + "/arch-updates.sh").decode(),
        mouse_callbacks={
            'Button1': lambda:qtile.cmd_spawn(widgets_path + "/arch-updates.sh upgrade"),
        },
        update_interval=0.1
    ),

    separator(),

    widget.GenPollText(
        **base(fg='aurora3'),
        func=lambda: subprocess.check_output(widgets_path + "/brightness.sh").decode(),
        mouse_callbacks={
            'Button4': lambda:qtile.cmd_spawn(widgets_path + "/brightness.sh down"),
            'Button5': lambda:qtile.cmd_spawn(widgets_path + "/brightness.sh up"),
        },
        update_interval=0.1,
    ),

    separator(),

    widget.GenPollText(
        **base(fg='aurora4'),
        func=lambda: subprocess.check_output(widgets_path + "/volume.sh").decode(),
        mouse_callbacks={
            'Button1': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh mute"),
            'Button4': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh down"),
            'Button5': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh up"),
        },
        update_interval=0.1,
    ),

    separator(),

    widget.CurrentLayout(
        **base(fg='aurora1'), 
        padding=1,
    ),

    widget.CurrentLayoutIcon(
        **base(fg='aurora2'), 
        scale=0.58,
    ),

    separator(),

    widget.GenPollText(
        **base(fg='frost4'),
        func=lambda: subprocess.check_output(widgets_path + "/calendar.sh").decode(),
        update_interval=0.1,
    ),
    
    widget.Systray(
        background=colors['dark'], 
        padding=5,
    ),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    widget.CurrentLayoutIcon(**base(bg='aurora1'), scale=0.65),

    widget.CurrentLayout(**base(bg='aurora1'), padding=5),

    widget.Clock(**base(bg='aurora2'), format='%d/%m/%Y - %H:%M '),
]

widget_defaults = {
    'font': 'Hack Nerd Font Bold',
    'fontsize': 14,
    'padding': 2,
}

extension_defaults = widget_defaults.copy()