#!/bin/sh

# Allow certain functionalities
lxsession &
# picom
picom --experimental-backends &
# Suspend laptop after certain time
xset dpms 60 60 60 # Time to blank screen
xidlehook --not-when-audio --not-when-fullscreen --timer 300 'systemctl suspend' '' & # Time to suspend system
# Wallpaper feh
wallpaper=cat ~/.config/qtile/wallpaper.json | jq -r '.wallpaper'
feh --bg-fill ~/.config/qtile/wallpapers/$wallpaper
# Default brightness
brightnessctl -d 'amdgpu_bl0' set 80%
# Reset dunst notifications
killall dunst
