from libqtile.command import lazy
from libqtile.config import Screen

#---------------------------------------------------------------
#-- Custom functions for bindings
#---------------------------------------------------------------

#---------------------------------------------------------------
#-- Kill all windows in current group
#---------------------------------------------------------------
@lazy.function
def kill_all_windows(qtile):
    for window in qtile.current_group.windows:
        window.kill()


#---------------------------------------------------------------
#-- Kill all windows in current group except current window
#---------------------------------------------------------------
@lazy.function
def kill_all_windows_except_current(qtile):
    for window in qtile.current_group.windows:
        if window != qtile.current_window:
            window.kill()


#---------------------------------------------------------------
#-- Bring to front all floating windows in current group
#---------------------------------------------------------------
@lazy.function
def float_to_front(qtile):
    for window in qtile.current_group.windows:
        if window.floating:
            window.bring_to_front()


#---------------------------------------------------------------
#-- Allow to resize windows in BSP layout
#---------------------------------------------------------------
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


#---------------------------------------------------------------
#-- Better windows focus in floating layout
#---------------------------------------------------------------
def focus_window(qtile, dir, axis):
    win = None
    win_wide = None
    dist = 10000
    dist_wide = 10000
    cur = qtile.current_window

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

    if cur in windows:
        windows.remove(cur)

    for w in windows:
        if not w.minimized:
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

    win.group.focus(win, True)


@lazy.function
def up(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, -1, 'y')
    else:
        qtile.current_layout.up()


@lazy.function
def down(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, 1, 'y')
    else:
        qtile.current_layout.down()


@lazy.function
def left(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, -1, 'x')
    elif layout_name == "stack":
        qtile.current_layout.previous()
    else:
        qtile.current_layout.left()


@lazy.function
def right(qtile):
    layout_name = qtile.current_layout.name

    if layout_name == "floating":
        focus_window(qtile, 1, 'x')
    elif layout_name == "stack":
        qtile.current_layout.next()
    else:
        qtile.current_layout.right()
