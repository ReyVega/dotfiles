#!/bin/bash

# Variables
# us, es, latam
k_layout="latam"

# Automatically setup dual setup when plugging/unplugging HDMI
monitor-setup &

# Allow certain functionalities
lxsession &

# Keyboard layout
setxkbmap $k_layout

# picom
picom --experimental-backends -b

# Suspend laptop after certain time
xset -dpms
xset s off
xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 600 \
    'xrandr --output "eDP" --brightness 0' \
    'xrandr --output "eDP" --brightness 1' \
    --timer 300 \
    'xrandr --output "eDP" --brightness 1; betterlockscreen -l' \
    '' \
    --timer 900 \
    'systemctl suspend' \
    '' &

# Default brightness
brightnessctl s 80%

# Dunst notifications
killall dunst
dunst &

# Mpd
killall mpd
mpd &
mpDris2 &

# Internet
nm-applet &

# Disable beep bell
xset -b

# Arch updates daemon
updates-daemon &
