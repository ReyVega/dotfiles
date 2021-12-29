from libqtile import bar, widget
from libqtile import qtile
from os import path
import subprocess

def base(fg='color1', bg='color1', colors=None):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator(colors):
    return widget.Sep(**base(colors=colors), linewidth=0, padding=14, size_percent=40)

def workspaces(colors):
    return [
        widget.GroupBox(
            **base(fg='color15', colors=colors),
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

        widget.Spacer(**base(colors=colors)),

        widget.WindowName(
            **base(fg='color9', colors=colors),
            width=bar.CALCULATED,
            empty_group_string="Desktop",
            fontsize=14,
            max_chars=45,
        ),
    ]

def primary_widgets(widgets_path, colors):
    return [
        *workspaces(colors),

        widget.Spacer(**base(colors=colors)),

        widget.CheckUpdates(
            **base(colors=colors),
            update_interval=1800,
            colour_have_updates=colors['color3'],
            colour_no_updates=colors['color3'],
            distro='Arch_paru',
            custom_command='paru -Qu',
            display_format='{updates}',
            no_update_string='0',
            fmt=' {}',
            execute='kitty -e paru',
        ),

        separator(colors),

        widget.GenPollText(
            **base(fg='color4', colors=colors),
            func=lambda: subprocess.check_output(widgets_path + "/brightness.sh").decode(),
            mouse_callbacks={
                'Button4': lambda:qtile.cmd_spawn(widgets_path + "/brightness.sh down"),
                'Button5': lambda:qtile.cmd_spawn(widgets_path + "/brightness.sh up"),
            },
            update_interval=0.2,
        ),

        separator(colors),

        widget.GenPollText(
            **base(fg='color5', colors=colors),
            func=lambda: subprocess.check_output(widgets_path + "/volume.sh").decode(),
            mouse_callbacks={
                'Button1': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh mute"),
                'Button4': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh down"),
                'Button5': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh up"),
                'Button3': lambda:qtile.cmd_spawn(widgets_path + "/volume.sh app"),
            },
            update_interval=0.2,
        ),

        separator(colors),

        widget.GenPollText(
            **base(fg='color10', colors=colors),
            func=lambda: subprocess.check_output(widgets_path + "/calendar.sh").decode(),
            update_interval=0.2,
        ),

        separator(colors),

        widget.GenPollText(
            **base(fg='color15', colors=colors),
            func=lambda: subprocess.check_output(widgets_path + "/battery.sh").decode(),
            update_interval=0.2,
        ),

        separator(colors),

        widget.CurrentLayoutIcon(
            **base(fg='color3', colors=colors),
            custom_icon_paths=[path.expanduser("~/.config/qtile/settings/layout-icons")],
            mouse_callbacks={
                'Button3': lambda:qtile.cmd_prev_layout()
            },
            padding=-6,
            scale=0.6,
        ),

        separator(colors),
    ]

def secondary_widgets(widgets_path, colors):
    return[
        *workspaces(colors),

        widget.Spacer(**base(colors=colors)),

        widget.GenPollText(
            **base(fg='color10', colors=colors),
            func=lambda: subprocess.check_output(widgets_path + "/calendar.sh").decode(),
            update_interval=0.2,
        ),

        separator(colors),

        widget.CurrentLayoutIcon(
            **base(fg='color3', colors=colors),
            custom_icon_paths=[path.expanduser("~/.config/qtile/settings/layout-icons")],
            mouse_callbacks={
                'Button3': lambda:qtile.cmd_prev_layout()
            },
            padding=-6,
            scale=0.6,
        ),

        separator(colors),
]


def init_primary_widgets(widgets_path, colors):
    return primary_widgets(widgets_path, colors)

def init_secondary_widgets(widgets_path, colors):
    return secondary_widgets(widgets_path, colors)

def widget_defaults():
    return {
        'font': 'Hack Nerd Font Bold',
        'fontsize': 14,
        'padding': 1,
    }
