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
reload("components.functions")
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


#-----------------------------------------------------------
#-- Import components
#-----------------------------------------------------------
from components.keys import init_keys
from components.groups import Groups
from components.layouts import Layouts
from components.widgets import Widgets
from components.mouse import Mouse
from components.screens import Screens


#-----------------------------------------------------------
#-- Get qtile config path
#-----------------------------------------------------------
qtile_path = path.join(path.expanduser('~'), ".config", "qtile")


#-----------------------------------------------------------
#-- Load colors and wallpaper
#-----------------------------------------------------------
colors = load_theme(qtile_path)
wallpaper = load_wallpaper(qtile_path)


#-----------------------------------------------------------
#-- Initialize keys
#-----------------------------------------------------------
keys = init_keys()


#-----------------------------------------------------------
#-- Initialize Groups
#-----------------------------------------------------------
init_groups = Groups()
groups = init_groups.get_groups()
keys.extend(init_groups.get_keys())


#-----------------------------------------------------------
#-- Initialize widgets
#-----------------------------------------------------------
init_widgets = Widgets(colors)
primary_widgets = init_widgets.get_primary_widgets()
secondary_widgets = init_widgets.get_secondary_widgets()


#-----------------------------------------------------------
#-- Initialize widget's defaults
#-----------------------------------------------------------
widget_defaults = init_widgets.get_widget_defaults()
extension_defaults = widget_defaults.copy()


#-----------------------------------------------------------
#-- Initialize layouts
#-----------------------------------------------------------
init_layouts = Layouts(colors)
layouts = init_layouts.get_layouts()
floating_layout = init_layouts.get_floating_rules()


#-----------------------------------------------------------
#-- Initialize mouse
#-----------------------------------------------------------
init_mouse = Mouse()
mouse = init_mouse.get_mouse()


#-----------------------------------------------------------
#-- Initialize screens
#-----------------------------------------------------------
init_screens = Screens(primary_widgets, secondary_widgets, wallpaper)
screens = init_screens.get_screens()
keys.extend(init_screens.get_keys())


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
