from libqtile import widget
from libqtile import qtile
from .theme import colors
from .paths import widgets_path
from libqtile import bar
import subprocess
import os

def base(fg='color1', bg='color1'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=14, size_percent=40)

def workspaces():
    return [
        widget.GroupBox(
            **base(fg='color15'),
            fontsize=12,
            padding_x=7,
            disable_drag=True,
            rounded=True,
            active=colors['color17'],
            inactive=colors['color14'],
            highlight_method='text',
            block_highlight_text_color=colors['color10'],
            this_current_screen_border=colors['color9'],
            this_screen_border=colors['color9'],
            urgent_alert_method='text',
            urgent_border=colors['color6'],
            other_current_screen_border=colors['color9'],
            other_screen_border=colors['color9'],
        ),

        widget.Systray(
            background=colors['color1'],
            padding=10,
        ),

        widget.Spacer(**base()),

        widget.WindowName(
            **base(fg='color9'),
            width=bar.CALCULATED,
            empty_group_string="Desktop",
            fontsize=14,
            max_chars=45,
        ),
    ]


primary_widgets = [
    *workspaces(),

    widget.Spacer(**base()),

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

    widget.CurrentLayoutIcon(
        **base(fg='color3'),
        custom_icon_paths=[
            os.path.expanduser("~/.config/qtile/layout-icons")
        ],
        mouse_callbacks={
            'Button3': lambda:qtile.cmd_prev_layout()
        },
        padding=-6,
        scale=0.6,
    ),

    separator(),
 ]

secondary_widgets = [
    *workspaces(),

    widget.Spacer(**base()),

    widget.GenPollText(
        **base(fg='color10'),
        func=lambda: subprocess.check_output(widgets_path + "/calendar.sh").decode(),
        update_interval=0.2,
    ),

    separator(),

    widget.CurrentLayoutIcon(
        **base(fg='color3'),
        custom_icon_paths=[
            os.path.expanduser("~/.config/qtile/layout-icons")
        ],
        mouse_callbacks={
            'Button3': lambda:qtile.cmd_prev_layout()
        },
        padding=-6,
        scale=0.6,
    ),

    separator(),
]

widget_defaults = {
    'font': 'Hack Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}

extension_defaults = widget_defaults.copy()
