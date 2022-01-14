from libqtile import bar, widget
from libqtile.command import lazy
from os import path
import subprocess

class Widgets():

    def __init__(self, colors):
        self.colors = colors

    def base(self, fg='color1', bg='color1'):
        return {
            'foreground': self.colors[fg],
            'background': self.colors[bg]
        }

    def separator(self):
        return widget.Sep(**self.base(), linewidth=0, padding=14, size_percent=40)

    def workspaces(self, visible_groups):
        return [
            widget.GroupBox(
                **self.base(fg='color15'),
                fontsize=12,
                padding_x=7,
                disable_drag=True,
                rounded=True,
                active=self.colors['color17'],
                inactive=self.colors['color14'],
                highlight_method='text',
                block_highlight_text_color=self.colors['color10'],
                this_current_screen_border=self.colors['color9'],
                this_screen_border=self.colors['color9'],
                urgent_alert_method='text',
                urgent_border=self.colors['color6'],
                other_current_screen_border=self.colors['color9'],
                other_screen_border=self.colors['color9'],
                visible_groups=visible_groups
            )
        ]

    def get_primary_widgets(self, visible_groups):
        return [
            *self.workspaces(visible_groups),

            widget.Systray(
                background=self.colors['color1'],
                padding=10,
            ),

            widget.Spacer(**self.base()),

            widget.WindowName(
                **self.base(fg='color9'),
                width=bar.CALCULATED,
                empty_group_string="Desktop",
                fontsize=14,
                max_chars=45,
            ),

            widget.Spacer(**self.base()),

            self.separator(),

            widget.CheckUpdates(
                **self.base(),
                update_interval=1200,
                colour_have_updates=self.colors['color3'],
                colour_no_updates=self.colors['color3'],
                distro='Arch_paru',
                custom_command='arch-updates',
                display_format='{updates}',
                no_update_string='0',
                fmt=' {}',
                execute='kitty -e paru',
            ),

            self.separator(),

            widget.GenPollText(
                **self.base(fg='color4'),
                func=lambda: subprocess.check_output("brightness").decode(),
                mouse_callbacks={
                    'Button4': lazy.spawn("brightness down"),
                    'Button5': lazy.spawn("brightness up"),
                },
                update_interval=1.5,
            ),

            self.separator(),

            widget.GenPollText(
                **self.base(fg='color5'),
                func=lambda: subprocess.check_output("volume").decode(),
                mouse_callbacks={
                    'Button1': lazy.spawn("volume mute"),
                    'Button4': lazy.spawn("volume down"),
                    'Button5': lazy.spawn("volume up"),
                    'Button3': lazy.spawn("volume app"),
                },
                update_interval=1.5,
            ),

            self.separator(),

            widget.GenPollText(
                **self.base(fg='color10'),
                func=lambda: subprocess.check_output("calendar").decode(),
                update_interval=1.5,
            ),

            self.separator(),

            widget.GenPollText(
                **self.base(fg='color15'),
                func=lambda: subprocess.check_output("battery").decode(),
                update_interval=1.5,
            ),

            self.separator(),

            widget.CurrentLayoutIcon(
                **self.base(fg='color3'),
                custom_icon_paths=[path.expanduser("~/.config/qtile/settings/layout-icons")],
                mouse_callbacks={
                    'Button3': lazy.prev_layout()
                },
                padding=-6,
                scale=0.6,
            ),

            self.separator(),
        ]

    def get_secondary_widgets(self, visible_groups):
        return[
            *self.workspaces(visible_groups),

            widget.Spacer(**self.base()),

            widget.WindowName(
                **self.base(fg='color9'),
                width=bar.CALCULATED,
                empty_group_string="Desktop",
                fontsize=14,
                max_chars=45,
            ),

            widget.Spacer(**self.base()),

            self.separator(),

            widget.GenPollText(
                **self.base(fg='color5'),
                func=lambda: subprocess.check_output("volume").decode(),
                mouse_callbacks={
                    'Button1': lazy.spawn("volume mute"),
                    'Button4': lazy.spawn("volume down"),
                    'Button5': lazy.spawn("volume up"),
                    'Button3': lazy.spawn("volume app"),
                },
                update_interval=1.5,
            ),

            self.separator(),

            widget.GenPollText(
                **self.base(fg='color10'),
                func=lambda: subprocess.check_output("calendar").decode(),
                update_interval=1.5,
            ),

            self.separator(),

            widget.CurrentLayoutIcon(
                **self.base(fg='color3'),
                custom_icon_paths=[path.expanduser("~/.config/qtile/settings/layout-icons")],
                mouse_callbacks={
                    'Button3': lazy.prev_layout()
                },
                padding=-6,
                scale=0.6,
            ),

            self.separator(),
        ]

    def get_widget_defaults(self):
        return {
            'font': 'Hack Nerd Font Bold',
            'fontsize': 14,
            'padding': 1,
        }
