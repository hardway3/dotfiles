#!/bin/bash

rofi_command="rofi -columns 5 -lines 1 -theme /home/hardway/.config/rofi/themes/powermenu.rasi"

# Each of the icon is a selectable element
options=$'\n\n\n\n'


chosen="$(echo "$options" | $rofi_command -width 30 -font "Droid Sans Mono for Powerline Nerd Font Complete Mono 40" -dmenu)"
case $chosen in
    ) # Lock the screen
        betterlockscreen -l dimblur
        ;;
    ) # Suspend
        amixer set Master mute
        betterlockscreen -s
        ;;
    ) # Shutdown the computer
        systemctl poweroff
        ;;
    ) # Reboot the computer
        systemctl reboot
        ;;
    ) # Log out of the current session
        i3-msg exit
        ;;
esac

