from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile import qtile
from libqtile.utils import guess_terminal
from libqtile import hook

from settings.theme import load_theme
from settings.wallpaper import load_wallpaper
from settings.paths import qtile_path, widgets_path

from os import path
import subprocess

mod = "mod4"
terminal = guess_terminal()
colors = load_theme()
wallpaper = load_wallpaper()

#------ Keys ------#
#------ Essential keys ------#
essential_keys = [
    # Toggle between layouts
    Key(
        [mod], "Tab",
        lazy.next_layout(),
        desc="Change to next layout"
    ),
    Key(
        [mod, "shift"],
        "Tab", lazy.prev_layout(),
        desc="Change to previous layout"
    ),

    # Launch terminal and kill windows
    Key(
        [mod], "Return",
        lazy.spawn(terminal + " -e fish"),
        desc="Launch fish shell"
    ),
    Key(
        [mod, "shift"], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal (bash shell)"
    ),
    Key(
        [mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
    ),
    Key(
        [mod, "shift"], "w",
        lazy.spawn("xkill"),
        desc="Force to kill focused window"
    ),

    # Switch focus of monitors
    Key(
        [mod], "period",
        lazy.next_screen(),
        desc='Move focus to next monitor'
    ),
    Key(
        [mod], "comma",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'
    ),

    # Toggles
    Key(
        [mod], "f",
        lazy.hide_show_bar("top"),
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
    ),
    Key(
        [mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
    ),

    # Hide bar
    Key(
        [mod], "u",
        lazy.hide_show_bar("top"),
        desc='Hides bar'
    ),

    # Restart and shutdown qtile
    Key(
        [mod, "control"], "r",
        lazy.reload_config(),
        desc="Restart Qtile"
    ),
    Key(
        [mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
    ),

    # Opens Qtile configuration
    Key(
        [mod, "control"],
        "a",
        lazy.spawn("kitty --directory ~/.config/qtile -e nvim"),
        desc="Opens Qtile config",
    ),
]

#------ Hardware keys ------#
hardware_keys = [
    # Volume
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn(widgets_path + "/volume.sh down"),
        desc="Lower the volume"
    ),
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn(widgets_path + "/volume.sh up"),
        desc="Turn up the volume"
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn(widgets_path + "/volume.sh mute"),
        desc="Mute volume"
    ),

    # Brightness
    Key(
        [], "XF86MonBrightnessDown",
        lazy.spawn(widgets_path + "/brightness.sh down"),
        desc='Bright down'
    ),
    Key(
        [], "XF86MonBrightnessUp",
        lazy.spawn(widgets_path + "/brightness.sh up"),
        desc='Bright up'
    ),

    # Audio Buttons
    Key(
        [],
        "XF86AudioNext",
        lazy.spawn("playerctl next"),
        desc="Play next audio",
    ),
    Key(
        [],
        "XF86AudioPrev",
        lazy.spawn("playerctl previous"),
        desc="Play previous audio",
    ),
    Key([],
        "XF86AudioPlay",
        lazy.spawn("playerctl play-pause"),
        desc="Toggle play/pause audio"
    ),
]

#------ Layout keys ------#
# Function for BSP layout, it allows to resize a window without focusing another neighbor
def resize(qtile, direction):
    layout = qtile.current_layout
    child = layout.current
    parent = child.parent

    while parent:
        if child in parent.children:
            layout_all = False

            if (direction == "left" and parent.split_horizontal) or (
                direction == "up" and not parent.split_horizontal
            ):
                parent.split_ratio = max(5, parent.split_ratio - layout.grow_amount)
                layout_all = True
            elif (direction == "right" and parent.split_horizontal) or (
                direction == "down" and not parent.split_horizontal
            ):
                parent.split_ratio = min(95, parent.split_ratio + layout.grow_amount)
                layout_all = True

            if layout_all:
                layout.group.layout_all()
                break

        child = parent
        parent = child.parent

@lazy.function
def resize_left(qtile):
    resize(qtile, "left")

@lazy.function
def resize_right(qtile):
    resize(qtile, "right")

@lazy.function
def resize_up(qtile):
    resize(qtile, "up")

@lazy.function
def resize_down(qtile):
    resize(qtile, "down")

# Function to bring all floating windows to front
@lazy.function
def float_to_front(qtile):
    for group in qtile.groups:
        for window in group.windows:
            if window.floating:
                window.cmd_bring_to_front()

layout_keys = [
    # Switch between windows
    Key(
        [mod], "h",
        lazy.layout.left(),
        lazy.layout.next(),
        desc="Move focus to left"
    ),
    Key(
        [mod], "l",
        lazy.layout.right(),
        lazy.layout.previous(),
        desc="Move focus to right"
    ),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Switch windows positions
    Key(
        [mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        lazy.layout.swap_left(),
        lazy.layout.client_to_previous(),
        desc="Move window to the left"
    ),
    Key(
        [mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        lazy.layout.swap_right(),
        lazy.layout.client_to_next(),
        desc="Move window to the right"
    ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.section_down(),
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),
    Key(
        [mod, "shift"], "k",
        lazy.layout.section_up(),
        lazy.layout.shuffle_up(),
        desc="Move window up"
    ),

    # Bsp
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "control"], "j", resize_down),
    Key([mod, "control"], "k", resize_up),
    Key([mod, "control"], "h", resize_left),
    Key([mod, "control"], "l", resize_right),

    # MonadTall and MonadWide
    Key([mod], "i", lazy.layout.shrink()),
    Key([mod], "o", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.maximize()),
    Key([mod], "r", lazy.layout.reset()),

    # Stack
    Key([mod], "a", lazy.layout.add()),
    Key([mod], "d", lazy.layout.delete()),

    # Bsp, MonadTall, MonadWide
    Key([mod], "n", lazy.layout.normalize()),

    # Bsp and Stack
    Key([mod, "shift"], "space", lazy.layout.toggle_split()),

    # MonadTall, MonadWide, Stack
    Key(
        [mod], "space",
        lazy.layout.flip(),
        lazy.layout.rotate(),
    ),

    # Floating
    Key([mod, "shift"], "i",
        lazy.window.toggle_minimize(),
        lazy.group.next_window(),
        lazy.window.bring_to_front(),
    ),

    Key([mod, "shift"], "o", float_to_front),
]

#------ Extra keys ------#
def fix_cli_app(app):
    fix_environment = 'export -n LINES; export -n COLUMNS; sleep 0.1; source "$HOME/.config/lf/lf-icons.sh"; export EDITOR=nvim &&'
    return f'{terminal} --title {app} -e sh -c "{fix_environment} {app}"'

extra_keys = [
    # Screenshot dimensions
    Key(
        ["shift"], "Print",
        lazy.spawn(widgets_path + "/screenshot.sh gui"),
        desc="Takes screenshot of selected dimension"
    ),

    # Screenshots fullscreen
    Key(
        ["control"], "Print",
        lazy.spawn(widgets_path + "/screenshot.sh full-clip"),
        desc="Takes screenshot of full screen and stores it within clipboard"
    ),
    Key(
        [], "Print",
        lazy.spawn(widgets_path + "/screenshot.sh full"),
        desc="Takes screenshot of fullscreen and stores it within Pictures folder"
    ),

    # Browser
    Key(
        [mod], "b",
        lazy.spawn("brave"),
        desc="Starts brave browser"
    ),

    # LF
    Key(
        [mod], "p",
        lazy.spawn(fix_cli_app(widgets_path + "/lf.sh")),
        desc="Starts Lf"
    ),

    # PCManFM
    Key(
        [mod, "shift"], "p",
        lazy.spawn("pcmanfm"),
        desc="Starts pcmanfm"
    ),

    # Discord
    Key(
        [mod], "x",
        lazy.spawn("discord"),
        desc="Starts discord"
    ),
    # VS Code
    Key(
        [mod], "c",
        lazy.spawn("code"),
        desc="Starts vs-code"
    ),

    # Zoom
    Key(
        [mod], "z",
        lazy.spawn("zoom"),
        desc="Starts zoom"
    ),

    # Rofi (Applications)
    Key(
        [mod], "s",
        lazy.spawn("rofi -show drun"),
        desc="Starts rofi"
    ),

    # Rofi (Powermenu)
    Key(
        [mod], "q",
        lazy.spawn(widgets_path + "/powermenu.sh"),
        desc="Starts rofi powermenu"
    ),

    # Music player (ncmpcpp)
    Key(
        [mod], "e",
        lazy.spawn(fix_cli_app("ncmpcpp")),
        desc="Starts ncmpcpp"
    ),

    # Conky
    Key(
        [mod, "shift"], "c",
        lazy.spawn(widgets_path + "/conkytoggle.sh"),
        desc="Toggles conky"
    ),
]

#------ Loading keys ------#
keys = [
    *layout_keys,
    *essential_keys,
    *hardware_keys,
    *extra_keys,
]

#------ Groups ------#
groups_settings  = [
    {
        "name": "1",
        "key": "1",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "2",
        "key": "2",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "3",
        "key": "3",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "4",
        "key": "4",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "5",
        "key": "5",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "6",
        "key": "6",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "7",
        "key": "7",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "8",
        "key": "8",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
    {
        "name": "9",
        "key": "9",
        "label": "",
        "layout": "max",
        "matches": [],
        "spawn": [],
    },
]

groups = []

for workspace in groups_settings:
    matches = workspace["matches"] if "matches" in workspace else None
    layouts = workspace["layout"] if "layout" in workspace else None
    groups.append(
        Group(
            name=workspace["name"],
            layout=workspace["layout"],
            label=workspace["label"],
            matches=workspace["matches"],
            spawn=workspace["spawn"]
        )
    )

    keys.extend([
        # Switch to workspace N
        Key([mod], workspace["key"], lazy.group[workspace["name"]].toscreen(toggle=True)),
        # Send window and switch to workspace N
        Key([mod, "shift"], workspace["key"], lazy.window.togroup(workspace["name"], switch_group=True))
    ])

#------ Layouts ------#
layout_conf = {
    'border_focus': colors['color9'],
    'border_normal': colors['color1'],
    'border_width': 3,
    'margin': 10
}

layouts = [
    layout.Max(
        **layout_conf,
    ),
    layout.MonadTall(
        **layout_conf,
        change_ratio=0.01,
        max_ratio=0.75,
        min_ratio=0.25,
    ),
    layout.MonadWide(
        **layout_conf,
        change_ratio=0.01,
        max_ratio=0.75,
        min_ratio=0.25,
    ),
    layout.Bsp(
        **layout_conf,
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
    float_rules=
    [
       *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry        Match(wm_class='lxappearance'),
        Match(wm_class='Conky'),
        Match(wm_class='lxappearance'),
    ],
    border_focus=colors["color5"],
    border_normal=colors['color1'],
    border_width=3,
)

#------ Widgets ------#
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
        custom_command='paru -Qu',
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
            path.expanduser("~/.config/qtile/layout-icons")
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
        custom_icon_paths=[path.expanduser("~/.config/qtile/layout-icons")],
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

# ------ Screens ------#
def status_bar(widgets):
    return bar.Bar(widgets, 26, opacity=0.92, margin=[10,10,10,10])

screens = [
    Screen(
        wallpaper = wallpaper,
        wallpaper_mode = 'fill',
        top = status_bar(primary_widgets)
    )
]

def get_monitors():
    xr = subprocess.check_output('xrandr --query | grep " connected"', shell=True).decode().split('\n')
    monitors = len(xr) - 1 if len(xr) > 2 else len(xr)
    return monitors

monitors = get_monitors()

for i in range(1, monitors + 1):
    keys.extend([Key([mod, "mod1"], str(i), lazy.window.toscreen(i))])

if monitors > 1:
    for i in range(monitors - 1):
        screens.append(
            Screen(
                wallpaper = wallpaper,
                wallpaper_mode = 'fill',
                top=status_bar(secondary_widgets)
            )
        )

#------ Mouse ------#
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

#------ Autostart ------#
@hook.subscribe.startup_once
def startup_once():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True
auto_minimize = True
wmname = 'Qtile'
