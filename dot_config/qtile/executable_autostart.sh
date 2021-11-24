#!/bin/sh

# Allow certain functionalities
lxsession &
# picom
picom --experimental-backends &
# Wallpaper feh
feh --bg-fill ~/.config/qtile/wallpaper.jpg
# Default brightness
brightnessctl -d 'amdgpu_bl0' set 80%
# Reset dunst notifications
killall dunst
# Manage DPMS with lightdm
light-locker --lock-on-lid --lock-after-screensaver=60 &
