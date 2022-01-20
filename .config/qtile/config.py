from typing import List  # noqa: F401
from libqtile import hook
import importlib
import sys
import subprocess
from os import path

#-----------------------------------------------------------
#-- Configure imports
#-----------------------------------------------------------
def reload(module):
    if module in sys.modules:
        importlib.reload(sys.modules[module])


#-----------------------------------------------------------
#-- Reload theme and wallpaper
#-----------------------------------------------------------
reload("settings.theme")
reload("settings.wallpaper")


#-----------------------------------------------------------
#-- Import groups and groups bindings
#-----------------------------------------------------------
reload("settings.groups")
from settings.groups import groups, keys_group


#-----------------------------------------------------------
#-- Import layouts and floating windows rules
#-----------------------------------------------------------
reload("settings.layouts")
from settings.layouts import layouts, floating_layout


#-----------------------------------------------------------
#-- Import mouse
#-----------------------------------------------------------
reload("settings.mouse")
from settings.mouse import mouse


#-----------------------------------------------------------
#-- Import widgets default configuration
#-----------------------------------------------------------
reload("settings.widgets")
from settings.widgets import widget_defaults
extension_defaults = widget_defaults.copy()


#-----------------------------------------------------------
#-- Import screens and screens bindings
#-----------------------------------------------------------
reload("settings.widgets")
reload("settings.screens")
from settings.screens import screens, keys_screen


#-----------------------------------------------------------
#-- Import bindings
#-----------------------------------------------------------
reload("settings.bindings.custom_functions")
reload("settings.bindings.essential_keys")
reload("settings.bindings.hardware_keys")
reload("settings.bindings.layout_keys")
reload("settings.bindings.extra_keys")
from settings.bindings.essential_keys import essential_keys
from settings.bindings.hardware_keys import hardware_keys
from settings.bindings.layout_keys import layout_keys
from settings.bindings.extra_keys import extra_keys


#-----------------------------------------------------------
#-- Initialize bindings
#-----------------------------------------------------------
keys = []
keys.extend(keys_group)
keys.extend(essential_keys)
keys.extend(hardware_keys)
keys.extend(layout_keys)
keys.extend(extra_keys)
keys.extend(keys_screen)


#-----------------------------------------------------------
#-- Extra configuration
#-----------------------------------------------------------
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = True
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "Qtile"

#-----------------------------------------------------------
#-- Autostart
#-----------------------------------------------------------
@hook.subscribe.startup_once
def _():
    home = path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])
