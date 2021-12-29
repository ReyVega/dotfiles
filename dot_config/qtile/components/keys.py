from .bindings.essential_keys import init_essential_keys
from .bindings.hardware_keys import init_hardware_keys
from .bindings.layout_keys import init_layout_keys
from .bindings.extra_keys import init_extra_keys

def init_keys(widgets_path):
    return [
        *init_essential_keys(),
        *init_hardware_keys(widgets_path),
        *init_layout_keys(),
        *init_extra_keys(widgets_path),
    ]
