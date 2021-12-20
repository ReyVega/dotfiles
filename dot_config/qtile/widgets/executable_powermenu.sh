#!/bin/bash
dir="~/.config/qtile/powermenu"
rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown="";
reboot="";
suspend="";
logout="";
lock="";

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout\n$lock"

chosen="$(echo -e "$options" | $rofi_command -p "Select an option" -dmenu)"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are you sure? : "\
		-theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme $dir/message.rasi -e "Available Options  -  yes / y / no / n"
}

case $chosen in
    $shutdown)
        while true
        do
            ans=$(confirm_exit &)
            if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]
            then
			    systemctl poweroff
		    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]
            then
			    exit 0
            elif [[ $ans == "" ]]
            then
                exit 0
            else
                msg
            fi
        done
    ;;
    $reboot)
        while true
        do
            ans=$(confirm_exit &)
            if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]
            then
                systemctl reboot
            elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]
            then
                exit 0
            elif [[ $ans == "" ]]
            then
                exit 0
            else
                msg
            fi
        done
    ;;
    $suspend)
        while true
        do
            ans=$(confirm_exit &)
            if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]
            then
                systemctl suspend
            elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]
            then
                exit 0
            elif [[ $ans == "" ]]
            then
                exit 0
            else
                msg
            fi
        done
    ;;
    $logout)
        while true
        do
            ans=$(confirm_exit &)
            if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]
            then
                loginctl terminate-session ${XDG_SESSION_ID-}
            elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]
            then
                exit 0
            elif [[ $ans == "" ]]
            then
                exit 0
            else
                msg
            fi
        done
    ;;
    $lock)
        betterlockscreen -l blur
    ;;
esac

