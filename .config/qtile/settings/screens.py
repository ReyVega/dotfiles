from libqtile.config import Screen, Key
from libqtile import bar
from libqtile.command import lazy
from .widgets import primary_widgets, secondary_widgets
from .wallpaper import wallpaper
from .theme import colors

#---------------------------------------------------------------
#-- Initialize variables
#---------------------------------------------------------------
keys_screen = []
mod = "mod4"


#---------------------------------------------------------------
#-- Function which returns bar with widgets
#---------------------------------------------------------------
def status_bar(widgets):
    return bar.Bar(
        widgets,
        26,
        opacity=1,
        margin=[10, 10, 10, 10],
        background=colors["color_bar"]
    )


#---------------------------------------------------------------
#-- Define primary screen
#---------------------------------------------------------------
screens = [
    Screen(
        top=status_bar(primary_widgets(["0" + str(i) for i in range(1, 10)])),
        wallpaper=wallpaper,
        wallpaper_mode="fill"
    )
]


#---------------------------------------------------------------
#-- Define more screens
#---------------------------------------------------------------
for i in range(1, 9):
    screens.append(
        Screen(
            top=status_bar(secondary_widgets([str(i) + str(j) for j in range(1, 10)])),
            wallpaper=wallpaper,
            wallpaper_mode="fill"
        )
    )


#---------------------------------------------------------------------------
#-- Better cursor warp when changing screen focus (Better than cursor_warp)
#---------------------------------------------------------------------------
@lazy.function
def focus_screen(qtile, direction):
    screen = qtile.screens.index(qtile.current_screen)
    destination = (screen + direction) % len(qtile.screens)

    qtile.focus_screen(destination)
    qtile.warp_to_screen()
    qtile.current_group.focus(qtile.current_window)


@lazy.function
def focus_specific_screen(qtile, screen):
    qtile.focus_screen(screen)
    qtile.warp_to_screen()
    qtile.current_group.focus(qtile.current_window)


#-------------------------------------------------------------------------------
#-- Better cursor warp when moving windows to screens (Better than cursor_warp)
#-------------------------------------------------------------------------------
@lazy.function
def move_window_to_specific_screen(qtile, screen):
    group = qtile.screens[screen].group.name
    qtile.current_window.togroup(group)
    qtile.focus_screen(screen)
    qtile.warp_to_screen()
    qtile.current_group.focus(qtile.current_window)


#---------------------------------------------------------------
#-- Fill keys_screen with screen bindings
#---------------------------------------------------------------
keys_screen.extend([
    Key([mod, "shift"], "period", focus_screen(1)),
    Key([mod, "shift"], "comma", focus_screen(-1))
])

for i in range(9):
    # Move window to specific screen
    keys_screen.extend([
        # Focus screens like if they were groups with 123456789
        Key([mod, "control"], str(i + 1), focus_specific_screen(i)),

        # Move window to specific screen and switch to screen
        Key([mod, "mod1"], str(i + 1), move_window_to_specific_screen(i)),
    ])
