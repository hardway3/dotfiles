#!/bin/bash

rofi_command="rofi -columns 3 -lines 1 -theme themes/layout-scrot.rasi"

# Each of the icon is a selectable element
options=$'\n\n'

chosen="$(echo "$options" | $rofi_command -font "Font Awesome 5 Pro Solid 50" -dmenu)"
case $chosen in
    ) # Scrot a rectangular area
        i3-scrot -s
        ;;
    ) # Scrot the whole screen
        sleep 1; i3-scrot -d
        ;;
    ) # Scrot the active window
        sleep 1; i3-scrot -w
        ;;
esac

