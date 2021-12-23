from libqtile.utils import guess_terminal
from .bindings.extra_keys import extra_keys
from .bindings.hardware_keys import hardware_keys
from .bindings.essential_keys import essential_keys
from .bindings.layout_keys import layout_keys

mod = "mod4"
terminal = guess_terminal()

keys = [
    *layout_keys,
    *essential_keys,
    *hardware_keys,
    *extra_keys,
]
