#!/bin/bash
icon="~/.config/qtile/icons/brightnesssettings.svg"
notify_id=5555
timeout=1500
icon_bar=""

function get_bar {
  seq -s "─" 0 $((brightness / 4 )) | sed 's/[0-9]//g'
}

function get_brightness {
  brightnessctl -d 'amdgpu_bl0' get
}

function send_notification {
  brightness=`get_brightness`
  brightness=$((brightness * 100 / 255))

  # Send the notification
  dunstify -t $timeout -r $notify_id -u normal "`get_bar $brightness`  $brightness %" -i "$icon"
}

case $1 in
  up)
    # Increase the backlight by 10%
    brightnessctl -d 'amdgpu_bl0' set +10%
    send_notification
    ;;
  down)
    # Decrease the backlight by 10%
    brightnessctl -d 'amdgpu_bl0' set 10%-
    send_notification
    ;;
  *)
    brightness=`get_brightness`
    brightness=$((brightness * 100 / 255))
    echo -n "$icon_bar $brightness%"
    ;;
esac