#!/bin/sh

# Allow certain functionalities
lxsession &
# Default volume and brightness
pulsemixer --set-volume 50
brightnessctl set 80%
# Reset dunst values
killall dunst
# systray picom
picom &
# systray wallpaper feh
feh --bg-fill ~/.config/qtile/wallpaper.jpg
# systray udiskie
udiskie -t &
# systray battery
cbatticon -u 5 &
#systrat volumeicon
volumeicon &
# systray nm-applet
nm-applet &
# manage close lid laptop
light-locker --lock-on-lid --lock-after-screensaver=180 --lock-on-suspend --no-idle-hint &
