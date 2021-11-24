#!/bin/bash
battery="BAT0"
battery_path="/sys/class/power_supply/$battery"

function get_battery_level {
    if [ -d $battery_path ]
    then
        level=$(cat $battery_path/capacity)
        status=$(cat $battery_path/status)

        case $status in
            "Full") status_icon="" ;;
            "Discharging") 
                case $level in
                    100) status_icon="" ;;
                    9?) status_icon="" ;;
                    8?) status_icon="" ;;
                    7?) status_icon="" ;;
                    6?) status_icon="" ;;
                    5?) status_icon="" ;;
                    4?) status_icon="" ;;
                    3?) status_icon="" ;;
                    2?) status_icon="" ;;
                    1?) status_icon="" ;;
                    ?) status_icon="" ;;
                esac
                ;;
            "Charging") 
                case $level in
                    100) status_icon="" ;;
                    9?) status_icon="" ;;
                    8?) status_icon="" ;;
                    7?) status_icon="" ;;
                    6?) status_icon="" ;;
                    5?) status_icon="" ;;
                    4?) status_icon="" ;;
                    3?) status_icon="" ;;
                    2?) status_icon="" ;;
                    1?) status_icon="" ;;
                    ?) status_icon="" ;;
                esac
                ;;
            "Not charging") status_icon="" ;;
            "Unknown") status_icon="" ;;
        esac

        echo -n "$status_icon $level%"
    else
        echo -n "Battery was not found"
    fi
}

case $1 in
    *)
        get_battery_level
        ;;
esac