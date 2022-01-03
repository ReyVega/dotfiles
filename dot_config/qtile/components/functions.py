from libqtile.command import lazy

class Function:

    # Kill all windows
    @staticmethod
    def kill_all_windows():
        @lazy.function
        def __inner(qtile):
            for window in qtile.current_group.windows:
                window.cmd_kill()
        return __inner


    # Kill all windows except current
    @staticmethod
    def kill_all_windows_except_current():
        @lazy.function
        def __inner(qtile):
            for window in qtile.current_group.windows:
                if window != qtile.current_window:
                    window.cmd_kill()
        return __inner


    # Bring all floating windows to front
    @staticmethod
    def float_to_front():
        @lazy.function
        def __inner(qtile):
            for window in qtile.current_group.windows:
                if window.floating:
                    window.cmd_bring_to_front()
        return __inner


    # Function for BSP layout, it allows to resize a window without focusing another neighbor
    @staticmethod
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


    @staticmethod
    def resize_left():
        @lazy.function
        def __inner(qtile):
            Function.resize(qtile, "left")
        return __inner

    @staticmethod
    def resize_right():
        @lazy.function
        def __inner(qtile):
            Function.resize(qtile, "right")
        return __inner


    @staticmethod
    def resize_up():
        @lazy.function
        def __inner(qtile):
            Function.resize(qtile, "up")
        return __inner


    @staticmethod
    def resize_down():
        @lazy.function
        def __inner(qtile):
            Function.resize(qtile, "down")
        return __inner
