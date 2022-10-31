from typing import List  # noqa: F401
from libqtile import hook
import subprocess
from os import path


#-----------------------------------------------------------
#-- Import groups and groups bindings
#-----------------------------------------------------------
from settings.groups import groups, keys_group


#-----------------------------------------------------------
#-- Import layouts and floating windows rules
#-----------------------------------------------------------
from settings.layouts import layouts, floating_layout


#-----------------------------------------------------------
#-- Import mouse
#-----------------------------------------------------------
from settings.mouse import mouse


#-----------------------------------------------------------
#-- Import widgets default configuration
#-----------------------------------------------------------
from settings.widgets import widget_defaults, extension_defaults


#-----------------------------------------------------------
#-- Import screens and screens bindings
#-----------------------------------------------------------
from settings.screens import screens, keys_screen


#-----------------------------------------------------------
#-- Import bindings
#-----------------------------------------------------------
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
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "Qtile"


#-----------------------------------------------------------
#-- Autostart
#-----------------------------------------------------------
@hook.subscribe.startup_once
def _():
    home = path.expanduser("~/.config/qtile/autostart")
    subprocess.run([home])
