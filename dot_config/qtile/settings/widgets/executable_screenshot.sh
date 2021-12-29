#!/bin/bash
function gui_screenshot {
    focusedwindow=$(xdotool getactivewindow)
    flameshot gui -g >/dev/null
    if [ "$focusedwindow" == "$(xdotool getactivewindow)" ]
    then
        xdotool windowfocus $focusedwindow
    fi
}

case $1 in
    full)
        bash -c "flameshot full -p ~/Pictures"
        ;;
    full-clip)
        bash -c "flameshot full -c"
        ;;
    gui)
        gui_screenshot
        ;;
esac
