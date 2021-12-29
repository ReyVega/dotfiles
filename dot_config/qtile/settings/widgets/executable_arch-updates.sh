#!/bin/bash
icon=""

function get_main_updates {
    checkupdates | wc -l
}

function get_aur_updates {
    paru -Qua | wc -l
}

function upgrade_packages {
    alacritty -e bash -c 'sudo paru -Sua && sudo pacman -Syu'
}

case $1 in
    upgrade)
        upgrade_packages
        ;;
    *)
        updates=$((`get_main_updates` + `get_aur_updates`))
        echo -n "$icon $updates"
        ;;
esac