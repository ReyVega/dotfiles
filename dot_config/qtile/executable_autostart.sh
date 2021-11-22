#!/bin/sh

# Allow certain functionalities
lxsession &
# Default volume and brightness
pulsemixer --set-volume 50
brightnessctl -d 'amdgpu_bl0' set 80%
# Reset dunst values
killall dunst
# systray picom
picom &
# systray wallpaper feh
feh --bg-fill ~/.config/qtile/wallpaper.jpg
# systray battery
cbatticon -u 5 &
# systray nm-applet
nm-applet &
# manage DPMS with lightdm
light-locker --lock-on-lid --lock-after-screensaver=60 &
