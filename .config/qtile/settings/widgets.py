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
            visible_groups=visible_groups
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

        widget.Spacer(**base()),

        separator(),

        widget.CheckUpdates(
            **base(),
            update_interval=1200,
            colour_have_updates=colors['color3'],
            colour_no_updates=colors['color3'],
            distro='Arch_paru',
            custom_command='arch-updates',
            display_format='{updates}',
            no_update_string='0',
            fmt=' {}',
            execute='kitty -e paru',
        ),

        separator(),

        widget.GenPollText(
            **base(fg='color4'),
            func=lambda: subprocess.check_output(["brightness"], encoding="utf-8"),
            mouse_callbacks={
                'Button4': lazy.spawn("brightness down"),
                'Button5': lazy.spawn("brightness up"),
            },
            update_interval=1,
        ),

        separator(),

        widget.GenPollText(
            **base(fg='color5'),
            func=lambda: subprocess.check_output(["volume"], encoding="utf-8"),
            mouse_callbacks={
                'Button1': lazy.spawn("volume mute"),
                'Button4': lazy.spawn("volume down"),
                'Button5': lazy.spawn("volume up"),
                'Button3': lazy.spawn("volume app"),
            },
            update_interval=1,
        ),

        separator(),

        widget.GenPollText(
            **base(fg='color10'),
            func=lambda: subprocess.check_output(["calendar"], encoding="utf-8"),
            update_interval=1,
        ),

        separator(),

        widget.GenPollText(
            **base(fg='color15'),
            func=lambda: subprocess.check_output(["battery"], encoding="utf-8"),
            update_interval=1,
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
        ),

        separator(),
    ]


#---------------------------------------------------------------
#-- Define secondary widgets
#---------------------------------------------------------------
def secondary_widgets(visible_groups):
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
            visible_groups=visible_groups
        ),

        widget.Spacer(**base()),

        widget.WindowName(
            **base(fg='color9'),
            width=bar.CALCULATED,
            empty_group_string="Desktop",
            fontsize=14,
            max_chars=45,
        ),

        widget.Spacer(**base()),

        separator(),

        widget.GenPollText(
            **base(fg='color5'),
            func=lambda: subprocess.check_output(["volume"], encoding="utf-8"),
            mouse_callbacks={
                'Button1': lazy.spawn("volume mute"),
                'Button4': lazy.spawn("volume down"),
                'Button5': lazy.spawn("volume up"),
                'Button3': lazy.spawn("volume app"),
            },
            update_interval=1,
        ),

        separator(),

        widget.GenPollText(
            **base(fg='color10'),
            func=lambda: subprocess.check_output(["calendar"], encoding="utf-8"),
            update_interval=1,
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
        ),

        separator(),
    ]


#---------------------------------------------------------------
#-- Define widgets defaults
#---------------------------------------------------------------
widget_defaults = dict(
    font='Hack Nerd Font Bold',
    fontsize=14,
    padding=1,
)
