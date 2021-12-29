from libqtile import hook
from os import path
import subprocess
import sys
import importlib

#-----------------------------------------------------------
#-- Configure imports
#-----------------------------------------------------------
def reload(module):
    if module in sys.modules:
        importlib.reload(sys.modules[module])


#-----------------------------------------------------------
#-- Reload imports
#-----------------------------------------------------------
reload("components.keys")
reload("components.bindings.essential_keys")
reload("components.bindings.hardware_keys")
reload("components.bindings.layout_keys")
reload("components.bindings.extra_keys")
reload("components.groups")
reload("components.layouts")
reload("components.widgets")
reload("components.mouse")
reload("components.screens")


#-----------------------------------------------------------
#-- Import settings
#-----------------------------------------------------------
from settings.theme import load_theme
from settings.wallpaper import load_wallpaper
from settings.paths import qtile_path, widgets_path


#-----------------------------------------------------------
#-- Import components
#-----------------------------------------------------------
from components.keys import init_keys
from components.groups import groups, keys_group
from components.layouts import init_floating_layout, init_layouts
from components.widgets import init_primary_widgets, init_secondary_widgets, widget_defaults
from components.mouse import init_mouse
from components.screens import init_screens


#-----------------------------------------------------------
#-- Load colors and wallpaper
#-----------------------------------------------------------
colors = load_theme()
wallpaper = load_wallpaper()


#-----------------------------------------------------------
#-- Initialize keys
#-----------------------------------------------------------
keys = init_keys(widgets_path)


#-----------------------------------------------------------
#-- Initialize keys for groups
#-----------------------------------------------------------
keys.extend(keys_group)


#-----------------------------------------------------------
#-- Initialize widgets
#-----------------------------------------------------------
primary_widgets = init_primary_widgets(widgets_path, colors)
secondary_widgets = init_secondary_widgets(widgets_path, colors)


#-----------------------------------------------------------
#-- Initialize widget's defaults
#-----------------------------------------------------------
widget_defaults = widget_defaults()
extension_defaults = widget_defaults.copy()


#-----------------------------------------------------------
#-- Initialize layouts
#-----------------------------------------------------------
layouts = init_layouts(colors)
floating_layout = init_floating_layout(colors)


#-----------------------------------------------------------
#-- Initialize mouse
#-----------------------------------------------------------
mouse = init_mouse()


#-----------------------------------------------------------
#-- Initialize screens
#-----------------------------------------------------------
screens = init_screens(primary_widgets, secondary_widgets, wallpaper)


#-----------------------------------------------------------
#-- Autostart
#-----------------------------------------------------------
@hook.subscribe.startup_once
def startup_once():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])


#-----------------------------------------------------------
#-- More configurations
#-----------------------------------------------------------
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
