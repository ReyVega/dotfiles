from libqtile import bar, widget
from libqtile.command import lazy
from os import path
import subprocess
from .theme import colors

#---------------------------------------------------------------
#-- Function which returns widget's background and foreground
#---------------------------------------------------------------
def base(fg='color1', bg='color1'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


#---------------------------------------------------------------
#-- Function which returns a separator
#---------------------------------------------------------------
def separator():
    return widget.Sep(**base(), linewidth=0, padding=14, size_percent=40)


#---------------------------------------------------------------
#-- Define primary widgets
#---------------------------------------------------------------
def primary_widgets(visible_groups):
    return [
        widget.Sep(**base(), linewidth=0, padding=6, size_percent=40),

        widget.GroupBox(
            **base(fg='color15'),
            font="Hack Nerd Font Bold",
            fontsize=14,
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
            toggle=False,
            visible_groups=visible_groups
        ),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.Systray(
             padding=10,
             icon_size=16,
        ),

        widget.Spacer(),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.WindowName(
            **base(fg='color9'),
            width=bar.CALCULATED,
            empty_group_string="Desktop",
            fontsize=14,
            font="Hack Nerd Font Bold",
            max_chars=30,
        ),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.Spacer(),

        widget.Sep(linewidth=0, padding=14, size_percent=40),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.GenPollCommand(
            **base(fg='color3'),
            cmd="arch-updates",
            mouse_callbacks={
                'Button1': lazy.spawn("arch-updates action"),
            },
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color4'),
            cmd="brightness",
            mouse_callbacks={
                'Button4': lazy.spawn("brightness down"),
                'Button5': lazy.spawn("brightness up"),
            },
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color5'),
            cmd="volume",
            mouse_callbacks={
                'Button1': lazy.spawn("volume mute"),
                'Button4': lazy.spawn("volume down"),
                'Button5': lazy.spawn("volume up"),
                'Button3': lazy.spawn("volume app"),
            },
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color6'),
            cmd="hour",
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color10'),
            cmd="calendar",
            mouse_callbacks={
                'Button1': lazy.spawn("calendar curr"),
                'Button5': lazy.spawn("calendar next"),
                'Button4': lazy.spawn("calendar prev")
            },
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color15'),
            cmd="battery",
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.CurrentLayoutIcon(
            **base(fg='color3'),
            custom_icon_paths=[path.expanduser("~/.config/qtile/settings/layout_icons")],
            mouse_callbacks={
                'Button3': lazy.prev_layout()
            },
            padding=-6,
            scale=0.6,
            font="Hack Nerd Font Bold"
        ),
        separator()
    ]


#---------------------------------------------------------------
#-- Define secondary widgets
#---------------------------------------------------------------
def secondary_widgets(visible_groups):
    return [
        widget.Sep(**base(), linewidth=0, padding=6, size_percent=40),

        widget.GroupBox(
            **base(fg='color15'),
            font="Hack Nerd Font Bold",
            fontsize=14,
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
            toggle=False,
            visible_groups=visible_groups
        ),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.Spacer(),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.WindowName(
            **base(fg='color9'),
            width=bar.CALCULATED,
            empty_group_string="Desktop",
            font="Hack Nerd Font Bold",
            fontsize=14,
            max_chars=45,
        ),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.Spacer(),

        widget.Sep(linewidth=0, padding=14, size_percent=40),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            font="Hack Nerd Font Bold",
            fontsize=26,
        ),

        widget.GenPollCommand(
            **base(fg='color5'),
            cmd="volume",
            mouse_callbacks={
                'Button1': lazy.spawn("volume mute"),
                'Button4': lazy.spawn("volume down"),
                'Button5': lazy.spawn("volume up"),
                'Button3': lazy.spawn("volume app"),
            },
            update_interval=1,
            font="Hack Nerd Font Bold",
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color6'),
            cmd="hour",
            update_interval=1,
            font="Hack Nerd Font Bold"
        ),

        separator(),

        widget.GenPollCommand(
            **base(fg='color10'),
            cmd="calendar",
            update_interval=1,
            font="Hack Nerd Font Bold",
        ),

        separator(),

        widget.CurrentLayoutIcon(
            **base(fg='color3'),
            custom_icon_paths=[path.expanduser("~/.config/qtile/settings/layout_icons")],
            mouse_callbacks={
                'Button3': lazy.prev_layout()
            },
            padding=-6,
            scale=0.6,
            font="Hack Nerd Font Bold",
        ),

        widget.TextBox(
            text="",
            foreground=colors["color1"],
            padding=-1,
            fontsize=26,
            font="Hack Nerd Font Bold",
        ),
    ]


#---------------------------------------------------------------
#-- Define widgets defaults
#---------------------------------------------------------------
widget_defaults = dict(
    font="Hack Nerd Font",
    fontsize=14,
    padding=1,
)

extension_defaults = widget_defaults.copy()
