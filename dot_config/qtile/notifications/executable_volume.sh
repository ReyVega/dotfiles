#!/bin/bash
icon_path=/home/rey/.local/share/icons/Tela-dark/symbolic/status/
notify_id=5556
timeout=1500

function get_volume {
    pulsemixer --get-volume | awk '{print $1;}'
}

function get_bar {
    seq -s "─" 0 $(($1 / 4)) | sed 's/[0-9]//g'
}

function get_volume_icon {
    if [ $1 = 0 ]
    then
        echo -n "audio-volume-muted-symbolic.svg"
    elif [ $1 -lt 34 ]
    then
        echo -n "audio-volume-low-symbolic.svg"
    elif [ $1 -lt 67 ]
    then
        echo -n "audio-volume-medium-symbolic.svg"
    elif [ $1 -le 100 ]
    then
        echo -n "audio-volume-high-symbolic.svg"
    else
        echo -n "audio-volume-overamplified-symbolic.svg"
    fi
}

function volume_notification {
    volume=`get_volume`
    vol_icon=`get_volume_icon $volume`
    bar=`get_bar $volume`

    dunstify -t $timeout -r $notify_id -u normal "$bar  $volume %" -i "$icon_path$vol_icon"
}

function mute_notification {
    muted=$(pulsemixer --get-mute)

    if [ $muted = 1 ]
    then
        dunstify -t $timeout -r $notify_id -u normal "Muted" -i "${icon_path}audio-volume-muted-symbolic.svg"
    else
        volume=`get_volume`
        dunstify -t $timeout -r $notify_id -u normal "`get_bar $volume` $volume %" -i "${icon_path}`get_volume_icon $volume`"
    fi
}

case $1 in
    up)
        pulsemixer --max-volume 100 --change-volume +5
        volume_notification
        ;;
    down)
        pulsemixer --max-volume 100 --change-volume -5
        volume_notification
	    ;;
    mute)
        pulsemixer --toggle-mute
        mute_notification
        ;;
esac