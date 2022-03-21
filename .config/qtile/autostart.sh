#!/bin/bash

# Automatically setup dual setup when plugging/unplugging HDMI
monitor-setup &
# Allow certain functionalities
lxsession &
# picom
picom --experimental-backends -b
# Suspend laptop after certain time
xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 120 \
    'xrandr --output "eDP" --brightness 0' \
    'xrandr --output "eDP" --brightness 1' \
    --timer 300 \
    'xrandr --output "eDP" --brightness 1; betterlockscreen -l' \
    '' \
    --timer 900 \
    'systemctl suspend' \
    '' &
# Default brightness
brightnessctl -d 'amdgpu_bl0' set 80%
# Default volume
pactl -- set-sink-volume 0 50%
# Dunst notifications
killall dunst
dunst &
# Mpd
killall mpd
mpd &
mpDris2 &
# Internet
nm-applet &
