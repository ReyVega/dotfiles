#!/bin/bash

# Automatically setup dual setup when plugging/unplugging HDMI
monitor-setup &
# Allow certain functionalities
lxsession &
# picom
picom --experimental-backends &
# Suspend laptop after certain time
xset dpms 120 120 120 # Time to blank screen
xidlehook --not-when-audio --not-when-fullscreen --timer 300 'systemctl suspend' '' & # Time to suspend system
# Default brightness
brightnessctl -d 'amdgpu_bl0' set 80%
# Default volume
pulsemixer --set-volume 50
# Dunst notifications
killall dunst
dunst &
# Mpd
killall mpd
mpd &
mpDris2 &
