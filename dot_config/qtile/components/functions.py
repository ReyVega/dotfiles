from libqtile.command import lazy
from libqtile.config import Screen


# Kill all windows
@lazy.function
def kill_all_windows(qtile):
    for window in qtile.current_group.windows:
        window.cmd_kill()


# Kill all windows except current
@lazy.function
def kill_all_windows_except_current(qtile):
    for window in qtile.current_group.windows:
        if window != qtile.current_window:
            window.cmd_kill()


# Bring all floating windows to front
@lazy.function
def float_to_front(qtile):
    for window in qtile.current_group.windows:
        if window.floating:
            window.cmd_bring_to_front()


# for BSP layout, it allows to resize a window without focusing another neighbor
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


# Focussing is based entirely on position and geometry,
# so is independent of screens, layouts and whether
# windows are floating or tiled. It can also move focus
# to and from empty screens.
def focus_window(qtile, dir, axis):
    win = None
    win_wide = None
    dist = 10000
    dist_wide = 10000
    cur = qtile.current_window
    if not cur:
        cur = qtile.current_screen

    if axis == 'x':
        dim = 'width'
        band_axis = 'y'
        band_dim = 'height'
        cur_pos = cur.x
        band_min = cur.y
        band_max = cur.y + cur.height
    else:
        dim = 'height'
        band_axis = 'x'
        band_dim = 'width'
        band_min = cur.x
        cur_pos = cur.y
        band_max = cur.x + cur.width

    cur_pos += getattr(cur, dim) / 2

    windows = [w for g in qtile.groups if g.screen for w in g.windows]
    windows.extend([s for s in qtile.screens if not s.group.windows])

    if cur in windows:
        windows.remove(cur)

    for w in windows:
        if isinstance(w, Screen) or not w.minimized:
            pos = getattr(w, axis) + getattr(w, dim) / 2
            gap = dir * (pos - cur_pos)
            if gap > 5:
                band_pos = getattr(w, band_axis) + getattr(w, band_dim) / 2
                if band_min < band_pos < band_max:
                    if gap < dist:
                        dist = gap
                        win = w
                else:
                    if gap < dist_wide:
                        dist_wide = gap
                        win_wide = w

    if not win:
        win = win_wide
    if win:
        qtile.focus_screen(win.group.screen.index)
        win.group.focus(win, True)
        if not isinstance(win, Screen):
            win.focus(False)


@lazy.function
def up(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, -1, 'y')
    else:
        qtile.current_layout.cmd_up()


@lazy.function
def down(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, 1, 'y')
    else:
        qtile.current_layout.cmd_down()


@lazy.function
def left(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, -1, 'x')
    elif layout_name == "stack":
        qtile.current_layout.cmd_previous()
    else:
        qtile.current_layout.cmd_left()


@lazy.function
def right(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, 1, 'x')
    elif layout_name == "stack":
        qtile.current_layout.cmd_next()
    else:
        qtile.current_layout.cmd_right()



# lazy.layout.left(),
# lazy.layout.previous(),
# lazy.layout.right(),
# lazy.layout.next(),
# lazy.layout.down(),
# lazy.layout.up(),

