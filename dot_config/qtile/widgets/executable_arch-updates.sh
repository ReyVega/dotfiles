#!/bin/bash
icon=""

function get_updates {
    checkupdates | wc -l
}

function upgrade_packages {
    alacritty -e sudo pacman -Syu && exit
}

case $1 in
    upgrade)
        upgrade_packages
        ;;
    *)
        updates=`get_updates`
        echo -n "$icon $updates"
        ;;
esac